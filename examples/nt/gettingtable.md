# Getting a table
NetworkTables works as table of keys. Individual table objects can be accesed by their paths, and tables can have both subtables and values.
In order to get access to these tables, the static [GetTable](xref:NetworkTables.NetworkTable.GetTable(System.String)) method should be used. 
This function returns an [ITable](xref:NetworkTables.Tables.ITable) object that can be used for putting keys and values into the table.

By default, all characters are separated by the `/` character. So if you wanted a table called bar, which was a subtable of foo, you would call
`var barfoo = NetworkTable.GetTable("foo/bar");`. That would get you access to the bar table. You could also get access to the table by 
creating a table for foo (`var foo = NetworkTable.GetTable("foo"))`, and then getting the bar subtable on foo with the 
[GetSubTable](xref:NetworkTables.Tables.ITable.GetSubTable(System.String)) method, with bar as the parameter (`var barfoo = foo.GetSubTable("bar");`).

If you want to interface with the WPILib SmartDashboard class, or the SmartDashboard client itself, there is a special table that is used.
See the [SmartDashboard](smartdashboard.md) page for instructions on how to access this specific table.

For instructions on using the returned [ITable](xref:NetworkTables.Tables.ITable) object, see our [Using an ITable](usingtable.md) page.