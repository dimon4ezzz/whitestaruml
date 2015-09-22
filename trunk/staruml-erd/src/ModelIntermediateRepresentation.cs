using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Erd
{
    namespace ModelIntermediateRepresentation
    {
        /// <summary>
        /// Intermediate (abstract) representation of ERD table
        /// </summary>
        class Table
        {
            internal Table()
            { }

            internal Table(string name)
            {
                TableName = name;
                Attribues = new List<TableAttribute>();
            }

            internal string TableName { get; set; }
            internal List<TableAttribute> Attribues { get; set; }
        }

        /// <summary>
        /// Intermediate (abstract) representation of ERD table attribute
        /// </summary>
        class TableAttribute
        {
            internal string Name { get; set; }
            internal string Type { get; set; }
            internal bool NotNull { get; set; }
            internal bool Identity { get; set; }
            internal bool PrimaryKey { get; set; }
            internal bool ForeignKey { get; set; }
            internal string ForeignKeyRef { get; set; }
            internal string ForeignTableRef { get; set; }
        }
    }

}
