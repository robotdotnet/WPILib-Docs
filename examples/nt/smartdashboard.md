# Connecting to SmartDashboard
When using the SmartDashboard, it uses its own table in the network table. To get a reference to the table, use
```
var table = NetworkTable.GetTable("SmartDashboard");
```
This will get you an [ITable](xref:NetworkTables.Tables.ITable) object that points to the "SmartDashboard" table.
Once you have this, you can use any of the normal SmartDashboard methods to access data on the table. See 
[Using an ITable](usingtable.md) for more information on how to use the [ITable](xref:NetworkTables.Tables.ITable) object.