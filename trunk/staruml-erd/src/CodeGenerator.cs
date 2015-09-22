using System;
using System.Collections.Generic;
using Antlr4.StringTemplate;

namespace Erd
{
    using IR = ModelIntermediateRepresentation;

    /// <summary>
    /// Implements code generation routines
    /// </summary>
    class CodeGenerator 
    {

        internal string FileName { get; set; }
        internal string FileDir { get; set; }


        /// <summary>
        /// Top level generation routine
        /// </summary>
        /// <param name="diagram">ERD diagram</param>
        /// <returns>True if operation succeded</returns>
        internal bool GenerateCode(WhiteStarUML.IUMLClassDiagram diagram)
        {
            // Get IR data from diagram
            List<IR.Table> tables = ProjectManagerHandler.Instance.GetErdTables(diagram);

            if (tables.Count == 0)
            {
                return false;
            }
            else
            {
                SetTemplateGroup(); // Repeated for template debugging
                GenerateDiagram(tables);
                return true;
            }
        }

        /// <summary>
        /// Generates code and saves it in a file for given table list
        /// </summary>
        /// <param name="tables">List of tables in intermediate representation</param>
        internal void GenerateDiagram(List<IR.Table> tables)
        {
            // Prepare diagram template
            Template diag = m_templateGroup.GetInstanceOf("erd_diagram");
            diag.Add(Symbols.TemplateParam.DATE, DateTime.Now.ToString());

            // Generate tables
            GenerateTables(diag, tables);

            // Save rendered diagram
            string renderedDiagram = diag.Render();
            string outputFile = System.IO.Path.Combine(FileDir, FileName);
            System.IO.File.WriteAllText(outputFile, renderedDiagram);
        }

        /// <summary>
        /// Generates content of given diagram template
        /// </summary>
        /// <param name="parentDiagram">Diagram template</param>
        /// <param name="tables">List of tables in intermediate representation</param>
        internal void GenerateTables(Template parentDiagram, List<IR.Table> tables)
        {
            foreach (IR.Table table in tables)
            {
                // Create table
                Template createTableStmt = m_templateGroup.GetInstanceOf(Symbols.TemplateParam.CREATE_TABLE_STMT);
                createTableStmt.Add(Symbols.TemplateParam.TABLE_NAME, table.TableName);

                // Process attributes
                GenerateTableAttributes(createTableStmt, parentDiagram, table.Attribues);

                // Add tables to diagram
                parentDiagram.Add(Symbols.TemplateParam.CREATE_TABLE_STMT, createTableStmt);
            }
        }

        /// <summary>
        ///  Generates attribues of given table template
        /// </summary>
        /// <param name="parentTable">Table template</param>
        /// <param name="parentDiagram">Diagram template</param>
        /// <param name="tableAttrs">>List of attributes in intermediate representation</param>
        internal void GenerateTableAttributes(Template parentTable, Template parentDiagram, List<IR.TableAttribute> tableAttrs)
        {
            foreach (IR.TableAttribute attr in tableAttrs)
            {
                // Create attribute
                Template tableAttr = m_templateGroup.GetInstanceOf(Symbols.TemplateParam.TABLE_ATTRIBUTE);
                tableAttr.Add(Symbols.TemplateParam.TABLE_ATTRIBUTE_NAME, attr.Name);
                tableAttr.Add(Symbols.TemplateParam.TABLE_ATTRIBUTE_TYPE, attr.Type);
                tableAttr.Add(Symbols.TemplateParam.TABLE_ATTRIBUTE_NOT_NULL, attr.NotNull);
                tableAttr.Add(Symbols.TemplateParam.TABLE_ATTRIBUTE_IDENTITY, attr.Identity);

                if (attr.PrimaryKey)
                    parentTable.Add(Symbols.TemplateParam.TABLE_ATTRIBUTE_PRIMARY_KEY, attr.Name);

                // Special handling of foreign key
                if (attr.ForeignKey)
                {
                    Template foreignKeyDef = m_templateGroup.GetInstanceOf(Symbols.TemplateParam.TABLE_ATTRIBUTE_FOREIGN_KEY_DEF);
                    foreignKeyDef.Add(Symbols.TemplateParam.TABLE_ATTRIBUTE_FOREIGN_KEY, attr.Name);
                    foreignKeyDef.Add(Symbols.TemplateParam.TABLE_ATTRIBUTE_FOREIGN_KEY_REF, attr.ForeignKeyRef);
                    foreignKeyDef.Add(Symbols.TemplateParam.TABLE_ATTRIBUTE_FOREIGN_TABLE_REF, attr.ForeignTableRef);
                    foreignKeyDef.Add(Symbols.TemplateParam.TABLE_ATTRIBUTE_FOREIGN_TABLE_NAME, parentTable.GetAttribute("name"));
                    
                    // Foreign key definition is handled directly by top diagram template
                    parentDiagram.Add(Symbols.TemplateParam.TABLE_ATTRIBUTE_FOREIGN_KEY_DEF, foreignKeyDef); 

                }

                parentTable.Add(Symbols.TemplateParam.TABLE_ATTRIBUTE, tableAttr);
            }
        }


 
        private CodeGenerator()
        {
            SetTemplateGroup();
        }

        /// <summary>
        /// Initial reading of template content
        /// </summary>
        private void SetTemplateGroup()
        {
            string assemblyPath = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            string templatePath = System.IO.Path.Combine(assemblyPath, Symbols.ADDIN_TEMPLATE_DIR, Symbols.ADDIN_TEMPLATE_FILE);
            m_templateGroup = new TemplateGroupFile(templatePath);
        }

        /// <summary>
        /// StringTemplate template group
        /// </summary>
        private TemplateGroup m_templateGroup;

        /// <summary>
        /// Singleton object ensuring access to class instance
        /// </summary>
        static internal CodeGenerator Instance
        {
            get
            {
                if (s_Instance == null)
                    s_Instance = new CodeGenerator();
                return s_Instance;
            }
        }

        
        /// <summary>
        /// Class singleton
        /// </summary>
        static private CodeGenerator s_Instance = null;


    }

}
