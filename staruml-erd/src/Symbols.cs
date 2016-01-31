
namespace Erd
{
    /// <summary>
    /// Set of string literals used in the program
    /// </summary>
    internal static class Symbols
    {
        // Application related strings
        internal const string APP_NAME = "WhiteStarUML";

        // Addin related strings
        internal const string ADDIN_TEMPLATE_DIR = "templates";
        internal const string ADDIN_TEMPLATE_FILE = "erd_gen_templates.stg";
        internal const string ADDIN_PROG_ID = "Erd.ErdAddIn";

        // Profile
        internal const string ERD_PROFILE_NAME = "ERD";
        internal const string ERD_DIAGRAM_TYPE = "ER(IE) Diagram";
        internal const string ERD_STEREOTYPE_TABLE = "table";
        internal const string ERD_STEREOTYPE_COLUMN = "column";
        internal const string ERD_STEREOTYPE_PRIMARY_KEY = "PK";
        internal const string ERD_STEREOTYPE_FOREIGN_KEY = "FK";
        internal const string ERD_STEREOTYPE_FOREIGN_KEY_REF = "Ref";
        internal const string ERD_STEREOTYPE_NULL_OPTION = "NullOption";
        internal const string ERD_STEREOTYPE_NULL = "NULL";
        internal const string ERD_STEREOTYPE_NOT_NULL = "NOT NULL";
        internal const string ERD_STEREOTYPE_IDENTITY = "IDENTITY";

        // Options
        internal const string OPTION_SCHEMA = APP_NAME + ".Erd";

        // Messages
        internal const string MSG_GENERATION_SUCCEEDED = "File generation succeded";
        internal const string MSG_GENERATION_FAILED = "File generation failed";
        internal const string MSG_GENERATION_SUCCEEDED_LONG = "SQL tables for selected diagram were successfully generated.";
        internal const string MSG_PARSING_SUCCEEDED = "File parsing succeded";
        internal const string MSG_PARSING_SUCCEEDED_LONG = "SQL tables for selected diagram were successfully parsed.";

        // Queries
        internal const string QUERY_REVERSE_PROFILE_LOAD = "To reverse engineer an SQL file, Data Modeling Profile is needed.\n"
            + "Do you want to include Data Modeling Profile to the current project?";

        // Regular expression patterns
        internal const string REGEX_PATTERN_VALID_NAME = @"^\S(.*\S)?$"; // Name enclosing characters must not be white spaces

        // Errors
        internal const string ERR_PROFILE_NOT_DEFINED = "Data Modeling Profile is not installed in system.\n"
            + "Install ERD Profile to reverse engineer SQL files.";

        internal const string ERR_PROFILE_NOT_INCLUDED = "Data Modeling Profile is not included";
        internal const string ERR_DIRECTORY_NOT_VALID = "Provide existing directory";
        internal const string ERR_FILENAME_NOT_VALID = "Provide a valid file name";
        internal const string ERR_DIAGRAM_NAME_NOT_VALID = "Provide a valid diagram name";
        internal const string ERR_DIAGRAM_NOT_SELECTED = "Select an ERD diagram";
        internal const string ERR_NO_ERD_DATA = "Selected diagram does not contain valid ERD data.";
        internal const string ERR_INVALID_OPERATION = "The program may be in inconsistent state. Please restart the application.";
        internal const string ERR_PACKAGE_NOT_SELECTED = "Select a package";

        /// <summary>
        /// StringTemplate related template attributes
        /// </summary>
        internal static class TemplateParam
        {
            internal const string DATE = "date";
            internal const string CREATE_TABLE_STMT = "create_table_stmt";
            internal const string TABLE_NAME = "name";

            internal const string TABLE_ATTRIBUTE = "table_attribute";
            internal const string TABLE_ATTRIBUTE_NAME = "name";
            internal const string TABLE_ATTRIBUTE_TYPE = "type";
            internal const string TABLE_ATTRIBUTE_NOT_NULL = "not_null_state";
            internal const string TABLE_ATTRIBUTE_IDENTITY = "identity_state";
            internal const string TABLE_ATTRIBUTE_PRIMARY_KEY = "primary_key";

            internal const string TABLE_ATTRIBUTE_FOREIGN_KEY = "foreign_key";
            internal const string TABLE_ATTRIBUTE_FOREIGN_KEY_DEF = "foreign_key_def";
            internal const string TABLE_ATTRIBUTE_FOREIGN_KEY_REF = "foreign_key_ref";
            internal const string TABLE_ATTRIBUTE_FOREIGN_TABLE_REF = "foreign_table_ref";
            internal const string TABLE_ATTRIBUTE_FOREIGN_TABLE_NAME = "table_name";
        }
        
    }
}