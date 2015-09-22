using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WhiteStarUML;

namespace Erd
{
    using IR = ModelIntermediateRepresentation;

    class UMLFactoryHandler
    {
        private UMLFactoryHandler()
        {
            m_UMLFactory = ErdAddIn.StarUMLApp.UMLFactory;
        }

        internal void AddErdDiagram(IUMLPackage parentPackage, string diagramName, List<IR.Table> tables)
        {
            // For perfomance reasons informs the main program that a sequence of models is created 
            ErdAddIn.StarUMLApp.BeginGroupAction();

            //IUMLFactory factory = ErdAddIn.StarUMLApp.UMLFactory;
            /*IUMLClassDiagram erdDiagram = factory.CreateClassDiagram(parentPackage);
            erdDiagram.Name = diagramName;
            IExtensibleModel extensibleModel = erdDiagram as IExtensibleModel;
            if (extensibleModel != null)
                extensibleModel.SetStereotype(Symbols.ERD_DIAGRAM_TYPE);*/

            //IUMLClassDiagram erdDiagram = parentPackage.GetOwnedDiagramAt(1) as IUMLClassDiagram;
            IUMLClassDiagram erdDiagram = m_UMLFactory.CreateExtendedClassDiagram(parentPackage, Symbols.ERD_PROFILE_NAME, Symbols.ERD_DIAGRAM_TYPE);
            erdDiagram.Name = diagramName;

            ResetLocationFactors();
            foreach (var table in tables)
            {
                AddErdTable(parentPackage, erdDiagram, table);
            }

            // End of creation of a sequence of models
            ErdAddIn.StarUMLApp.EndGroupAction();

            /*IUMLClass dummyClass = factory.CreateClass(parentPackage);
            dummyClass.SetStereotype2(Symbols.ERD_PROFILE_NAME,Symbols.ERD_STEREOTYPE_TABLE);
            string dcs = dummyClass.StereotypeName;
            IUMLClassDiagramView diagramView = erdDiagram.DiagramView as IUMLClassDiagramView;
            IUMLClassView newView = diagramView.CreateViewOf(dummyClass, 50, 50) as IUMLClassView;*/

            //IUMLClassDiagram erdDiagram2 = factory.CreateExtendedClassDiagram(parentPackage, Symbols.ERD_PROFILE_NAME, Symbols.ERD_DIAGRAM_TYPE);

        }

        internal void AddErdTable(IUMLPackage parentPackage, IUMLClassDiagram parentDiagram, IR.Table tableData)
        {
            IUMLClass newTable = m_UMLFactory.CreateClass(parentPackage);
            newTable.Name = tableData.TableName;
            newTable.SetStereotype2(Symbols.ERD_PROFILE_NAME, Symbols.ERD_STEREOTYPE_TABLE);

            UpdateLocationFactors();
            IUMLClassDiagramView diagramView = parentDiagram.DiagramView as IUMLClassDiagramView;
            IUMLClassView newView = diagramView.CreateViewOf(newTable, m_xPos, m_yPos) as IUMLClassView;
            newView.Update();
            UpdateYGrow(newView.Height);

            foreach (var irAttr in tableData.Attribues)
                AddErdTableAttribute(parentPackage, newTable, parentDiagram.Name, irAttr);

        }

        private void AddErdTableAttribute(IUMLPackage parentPackage, IUMLClass parentTable, string diagramName, IR.TableAttribute irAttr)
        {
            // Attribute creation + basic properties
            IUMLAttribute attr = m_UMLFactory.CreateAttribute(parentTable);
            attr.Name = irAttr.Name;
            attr.TypeExpression = irAttr.Type;
            attr.SetStereotype2(Symbols.ERD_PROFILE_NAME, Symbols.ERD_STEREOTYPE_COLUMN);

            
            // Setting optional properties

            if (irAttr.PrimaryKey)
            {
                attr.SetTaggedValueAsBoolean(Symbols.ERD_PROFILE_NAME, Symbols.ERD_STEREOTYPE_COLUMN, Symbols.ERD_STEREOTYPE_PRIMARY_KEY, true);
            }

            string nullStatus;
            if (irAttr.Identity)
                nullStatus = Symbols.ERD_STEREOTYPE_IDENTITY;
            else if (irAttr.NotNull || irAttr.PrimaryKey)
                nullStatus = Symbols.ERD_STEREOTYPE_NOT_NULL;
            else
                nullStatus = Symbols.ERD_STEREOTYPE_NULL;

            attr.SetTaggedValueAsEnum(Symbols.ERD_PROFILE_NAME, Symbols.ERD_STEREOTYPE_COLUMN,
                    Symbols.ERD_STEREOTYPE_NULL_OPTION, nullStatus);
           

            if (irAttr.ForeignKey)
            {
                attr.SetTaggedValueAsBoolean(Symbols.ERD_PROFILE_NAME, Symbols.ERD_STEREOTYPE_COLUMN, Symbols.ERD_STEREOTYPE_FOREIGN_KEY, true);
                string relativePath = irAttr.ForeignTableRef + "::" + irAttr.ForeignKeyRef;
                IExtensibleModel refModel = parentPackage.FindByRelativePathname(relativePath) as IExtensibleModel;
                if (refModel != null)
                {
                    attr.SetTaggedValueAsReference(Symbols.ERD_PROFILE_NAME, Symbols.ERD_STEREOTYPE_COLUMN, Symbols.ERD_STEREOTYPE_FOREIGN_KEY_REF, refModel);
                }
            }
        }

        private const int LocationXSetFactor = 250;
        private const int LocationXSetInit = -200;
        private const int MaxXLocationSetFactor = 3 * LocationXSetFactor;
        private const int LocationYSetFactor = 150;
        private const int LocationYSetInit = -100;

        private int m_xPos = LocationXSetInit;
        private int m_yPos = LocationYSetInit + LocationYSetFactor;
        private int m_yGrow = 0;

        private void ResetLocationFactors()
        {
            m_xPos = LocationXSetInit;
            m_yPos = LocationYSetInit + LocationYSetFactor;
        }

        private void UpdateYGrow(int newViewHeight)
        {
            if (newViewHeight > m_yGrow)
                m_yGrow = newViewHeight;
        }

        private void UpdateLocationFactors()
        {
            if (m_xPos < MaxXLocationSetFactor)
                m_xPos += LocationXSetFactor;
            else
            {
                m_xPos = LocationXSetFactor + LocationXSetInit;
                m_yPos += m_yGrow + LocationYSetFactor;
                m_yGrow = 0;
            }
        }


        /// <summary>
        /// Singleton object ensuring access to class instance
        /// </summary>
        static internal UMLFactoryHandler Instance
        {
            get
            {
                if (s_Instance == null)
                    s_Instance = new UMLFactoryHandler();
                return s_Instance;
            }
        }

        IUMLFactory m_UMLFactory;

        static private UMLFactoryHandler s_Instance = null;

    }
}
