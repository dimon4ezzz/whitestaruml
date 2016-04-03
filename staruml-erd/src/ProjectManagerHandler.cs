using System.Collections.Generic;
using WhiteStarUML;


namespace Erd
{
    using IR = ModelIntermediateRepresentation;

    /// <summary>
    /// Encapsulation of StarUML routines available through IProjectManager interface
    /// </summary>
    class ProjectManagerHandler
    {
        private ProjectManagerHandler()
        {
            m_StarUMLProjectManager = ErdAddIn.StarUMLApp.ProjectManager;
        }

        /// <summary>
        /// Top level project 
        /// </summary>
        internal IUMLPackage TopProject
        {
            get { return m_StarUMLProjectManager.Project; }
        }


        /// <summary>
        /// Collect child packages of given package
        /// Uses top project node if no parent is given (is null) 
        /// </summary>
        /// <param name="parent">Parent package or top project package if null</param>
        /// <returns>List of owned packages</returns>
        internal List<IUMLPackage> GetOwnedPackages(IUMLPackage parent = null)
        {
            List<IUMLPackage> result = new List<IUMLPackage>();

            if (parent == null) // If no parent given start from the top project node
                parent = TopProject;

            for (int i = 0; i < parent.GetOwnedElementCount(); i++)
            {
                // Collect only IUMLPackage elements
                IUMLPackage package = parent.GetOwnedElementAt(i) as IUMLPackage;
                if (package != null)
                    result.Add(package);
            }

            return result;

        }

        /// <summary>
        /// Return diagrams owned by given package
        /// </summary>
        /// <param name="parent">Parent package</param>
        /// <returns>List of diagrams</returns>
        internal List<IUMLClassDiagram> GetOwnedErdDiagrams(IUMLPackage parent)
        {
            List<IUMLClassDiagram> result = new List<IUMLClassDiagram>();

            for (int i = 0; i < parent.GetOwnedDiagramCount(); i++)
            {
                // Collect only IUMLPackage elements
                IDiagram diagram = parent.GetOwnedDiagramAt(i);
                IUMLClassDiagram classDiagram = diagram as IUMLClassDiagram;
                if (classDiagram != null)
                {
                    result.Add(classDiagram);
                }
            }

            return result;
        }

        /// <summary>
        /// Gets a list of IR nodes representing ERD tables
        /// </summary>
        /// <param name="diagram">ERD Diagram to get data from</param>
        /// <returns>List of created IR nodes</returns>
        internal List<IR.Table> GetErdTables(IUMLClassDiagram diagram)
        {
            List<IR.Table> result = new List<IR.Table>();

            IDiagramView diagramView = diagram.DiagramView;
            if (diagramView != null)
            {
                int nbOfElems = diagramView.GetOwnedViewCount();
                for (int i = 0; i < nbOfElems; i++)
                {
                    try
                    {
                        IUMLClass umlClass = null;
                        IView view = diagramView.GetOwnedViewAt(i);
                        if (view != null)
                            umlClass = view.Model as IUMLClass;

                        if (umlClass != null)
                        {
                            // Collect only ERD tables
                            if (
                                (umlClass.StereotypeProfile == Symbols.ERD_PROFILE_NAME)
                                && (umlClass.StereotypeName == Symbols.ERD_STEREOTYPE_TABLE)
                                )
                            {
                                IR.Table irTable = new IR.Table();
                                irTable.TableName = umlClass.Name;
                                irTable.Attribues = BuildIRTableAttributes(umlClass);
                                result.Add(irTable);
                            }
                        }
                    }
                    catch (System.Exception) { } // Ignore offending model elements
                }
            }

            return result;
        }



        /// <summary>
        /// Gets a list of IR nodes representing ERD table attributes
        /// </summary>
        /// <param name="parentTable"> parent IUMLClass table</param>
        /// <returns>list of created IR table attributes</returns>
        private List<IR.TableAttribute> BuildIRTableAttributes(IUMLClass parentTable)
        {
            List<IR.TableAttribute> irAttrs = new List<IR.TableAttribute>();

            for (int i = 0; i < parentTable.GetAttributeCount(); i++)
            {
                IR.TableAttribute irAttr = BuildIRTableAttribute(parentTable.GetAttributeAt(i));
                irAttrs.Add(irAttr);
            }

            return irAttrs;
        }

        /// <summary>
        /// Creates IR representation for given IUMLAttribute attribute
        /// </summary>
        /// <param name="attr">original IUMLAttribute attribute</param>
        /// <returns>Created IR attribute representation</returns>
        private IR.TableAttribute BuildIRTableAttribute(IUMLAttribute attr)
        {
            IR.TableAttribute irAttr = new IR.TableAttribute();

            irAttr.Name = attr.Name;
            irAttr.Type = attr.TypeExpression;

            irAttr.PrimaryKey = attr.GetTaggedValueAsBoolean(Symbols.ERD_PROFILE_NAME, Symbols.ERD_STEREOTYPE_COLUMN, Symbols.ERD_STEREOTYPE_PRIMARY_KEY);

            string nullOption = attr.GetTaggedValueAsEnum(Symbols.ERD_PROFILE_NAME, Symbols.ERD_STEREOTYPE_COLUMN, Symbols.ERD_STEREOTYPE_NULL_OPTION);
            irAttr.NotNull = (nullOption == Symbols.ERD_STEREOTYPE_NOT_NULL);
            irAttr.Identity = (nullOption == Symbols.ERD_STEREOTYPE_IDENTITY);

            irAttr.ForeignKey = attr.GetTaggedValueAsBoolean(Symbols.ERD_PROFILE_NAME, Symbols.ERD_STEREOTYPE_COLUMN, Symbols.ERD_STEREOTYPE_FOREIGN_KEY);
            if (irAttr.ForeignKey)
            {
                IExtensibleModel refModel = attr.GetTaggedValueAsReference(Symbols.ERD_PROFILE_NAME, Symbols.ERD_STEREOTYPE_COLUMN, Symbols.ERD_STEREOTYPE_FOREIGN_KEY_REF);
                if (refModel != null)
                {
                    irAttr.ForeignKeyRef = refModel.Name;
                    string[] splittedPathName = refModel.Pathname.Split(new string[] { "::" }, System.StringSplitOptions.None);
                    irAttr.ForeignTableRef = splittedPathName[splittedPathName.Length - 2];
                }
            }
            return irAttr;
        }


        /// <summary>
        /// Handle to Project Manager interface
        /// </summary>
        private IProjectManager m_StarUMLProjectManager = null;


        /// <summary>
        /// Singleton object ensuring access to class instance
        /// </summary>
        static internal ProjectManagerHandler Instance
        {
            get
            {
                if (s_Instance == null)
                    s_Instance = new ProjectManagerHandler();
                return s_Instance;
            }
        }

        static private ProjectManagerHandler s_Instance = null;




    }
}
