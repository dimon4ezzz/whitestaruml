using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using IR = Erd.ModelIntermediateRepresentation;

/// <summary>
/// Implements semantics for SqlDdlReader to create IR representation of SQL tables
/// </summary>
public partial class SqlDdlReaderParser
{
    /// <summary>
    /// Top level parsing function
    /// </summary>
    /// <returns>List of tables in IR format</returns>
    internal List<IR.Table> Process()
    {
        create_tables();
        return m_tables;
    }

    /// <summary>
    /// Creates new IR table representation
    /// </summary>
    /// <param name="name">table name</param>
    private void CreateTable(string name)
    {
        m_tables.Add(new IR.Table(name));
    }

    /// <summary>
    /// Returns object representing table currently being parsed
    /// </summary>
    /// <returns>Current table</returns>
    private IR.Table CurrentTable()
    {
        return m_tables.Last();
    }

    /// <summary>
    /// Finds table with given name
    /// </summary>
    /// <param name="tableName">Table name</param>
    /// <returns>Found table or null</returns>
    private IR.Table FindTable(string tableName)
    {
        foreach (var table in m_tables)
            if (table.TableName == tableName)
                return table;

        return null;
    }

    /// <summary>
    /// Creates new IR table attribute representation
    /// </summary>
    private void CreateAttribute()
    {
        IR.TableAttribute newAttr = new IR.TableAttribute();
        CurrentTable().Attribues.Add(newAttr);
    }

    /// <summary>
    /// Returns object representing table attribute currently being parsed
    /// </summary>
    /// <returns>Current attribute</returns>
    private IR.TableAttribute CurrentAttribute()
    {
        return CurrentTable().Attribues.Last();
    }


    /// <summary>
    /// Finds attribute of specified table
    /// </summary>
    /// <param name="attrName">Attribute name</param>
    /// <param name="table">Table object</param>
    /// <returns>Attribute object of null if not found</returns>
    private IR.TableAttribute FindAttribute(string attrName, IR.Table table)
    {
        foreach (var attr in table.Attribues)
            if (attr.Name == attrName)
                return attr;

        return null;
    }

    /// <summary>
    ///  Finds attribute of current table
    /// </summary>
    /// <param name="attrName">Attribute name</param>
    /// <returns>Attribute object of null if not found</returns>
    private IR.TableAttribute FindAttribute(string attrName)
    {
        return FindAttribute(attrName, CurrentTable());
    }

    /// <summary>
    /// Marks given attribute of current table as primary key
    /// </summary>
    /// <param name="attrName">Attribute name</param>
    private void SetPrimaryKey(string attrName)
    {
        IR.TableAttribute attr = FindAttribute(attrName);

        if (attr != null)
            attr.PrimaryKey = true;
    }

    /// <summary>
    /// Marks current attribute as foreign key
    /// </summary>
    /// <param name="tableRef">Referred table</param>
    /// <param name="keyRef">Reffered key</param>
    private void SetForeignKey(string tableRef, string keyRef)
    {
        SetForeignKey(CurrentAttribute(), tableRef, keyRef);
    }

    /// <summary>
    /// Marks attribute given by name as foreign key
    /// </summary>
    /// <param name="attrName">Attribute name</param>
    /// <param name="tableRef">Referred table</param>
    /// <param name="keyRef">Reffered key</param>
    private void SetForeignKey(string attrName, string tableRef, string keyRef)
    {
        SetForeignKey(CurrentTable(), attrName, tableRef, keyRef);
    }

    /// <summary>
    /// Marks attribute given by name of specified table as foreign key
    /// </summary>
    /// <param name="tableName">Table name</param>
    /// <param name="attrName">Attribute name</param>
    /// <param name="tableRef">Referred table</param>
    /// <param name="keyRef">Reffered key</param>
    private void SetForeignKey(string tableName, string attrName, string tableRef, string keyRef)
    {
        IR.Table table = FindTable(tableName);
        if (table != null)
            SetForeignKey(table, attrName, tableRef, keyRef);
 
    }

    /// <summary>
    /// Marks attribute given by name of specified table as foreign key
    /// </summary>
    /// <param name="table">Table IR object</param>
    /// <param name="attrName">Attribute name</param>
    /// <param name="tableRef">Referred table</param>
    /// <param name="keyRef">Reffered key</param>
    private void SetForeignKey(IR.Table table, string attrName, string tableRef, string keyRef)
    {
        if (table != null)
        {
            IR.TableAttribute attr = FindAttribute(attrName, table);
            if (attr != null)
                SetForeignKey(attr, tableRef, keyRef);
        }
    }

    /// <summary>
    /// Marks attribute as foreign key
    /// </summary>
    /// <param name="attr">Attribute IR object</param>
    /// <param name="tableRef">Referred table</param>
    /// <param name="keyRef">effered key</param>
    private void SetForeignKey(IR.TableAttribute attr, string tableRef, string keyRef)
    {
        if (attr != null)
        {
            attr.ForeignKey = true;
            attr.ForeignTableRef = tableRef;
            attr.ForeignKeyRef = keyRef;
        }
    }




    /// <summary>
    /// List of tables being built
    /// </summary>
    private List<IR.Table> m_tables = new List<IR.Table>();

}

