#Using an ITable object
NetworkTables works using the [ITable](xref:NetworkTables.Tables.ITable) interface. See the [ITable API Docs](xref:NetworkTables.Tables.ITable)
for all functionality, but here are some higher level examples on how to use them. See [getting a table](gettingtable.md) for instructions on actually getting a table.

##Accessing a value
NetworkTables can store the following types of data:
* [Bool](xref:System.Boolean)
* [Double](xref:System.Double)
* [String](xref:System.String)
* [IList](xref:System.Collections.Generic.IList`1)<[Bool](xref:System.Boolean)>
* [IList](xref:System.Collections.Generic.IList`1)<[Double](xref:System.Double)>
* [IList](xref:System.Collections.Generic.IList`1)<[String](xref:System.String)>
* [IList](xref:System.Collections.Generic.IList`1)<[Byte](xref:System.Byte)> (Use for Raw Values)

For any of these, use either the Put### functions to put the data, or the Get### functions to get the data. 
You can also use the [PutValue](xref:NetworkTables.Tables.ITable.PutValue(System.String,NetworkTables.Value)) and 
[GetValue](xref:NetworkTables.Tables.ITable.GetValue(System.String)) methods to directly get the [Value](xref:NetworkTables.Value) 
representation of the object.

##Persisting a key between restarts
NetworkTables supports making any key persistent between boots. This operation can be performed either on the server, or
on any client. To set a key to persistent, call the [SetPersistent](xref:NetworkTables.Tables.ITable.SetPersistent(System.String)) method
for the specific key. To stop a key from being persistent, call [ClearPersistent](xref:NetworkTables.Tables.ITable.ClearPersistent(System.String)).
To check if a key is persistent, call [IsPersistent](xref:NetworkTables.Tables.ITable.IsPersistent(System.String)).

##Deleting a key
Key deletion is also supported. However note that this feature only works when all clients and the server are based on the NT 3.0 protocol.
All versions of NetworkTables after and including the 2016 season support this feature, so most likely this will work for your purpose.
To delete a key, call [DeleteKey](xref:NetworkTables.Tables.ITable.DeleteKey(System.String)).

##Ensuring a key exists in the table
Often times, for configuration values you want the value to be persistent, but also want to ensure a safe default value is used if
the persistent values fail to load. In addition, you might want to ensure the values are in the table just to ensure that they can be modified
from the dashboard. To enable this, there is a set of functions called SetDefault###. These functions take in a key and a value.
If the key already exists in the table, nothing happens, so no data is overwritten. If the key does not exist, the value passed in will be
entered into the table. 

##Working with SubTables
As mentioned in the [getting a table](gettingtable.md) doc, subtables can exist in the table. To get a list of all subtables, you can call
[GetSubTables](xref:NetworkTables.Tables.ITable.GetSubTables). You can also check for the existance of an individual subtable with a call to
[ContainsSubTable](xref:NetworkTables.Tables.ITable.ContainsSubTable(System.String)). Using [GetSubTable](xref:NetworkTables.Tables.ITable.GetSubTable(System.String))
you can get an [ITable](xref:NetworkTables.Tables.ITable) object to the specified subtable, after which all the other operations in this doc can be performed.

##Listing all keys
A call to [GetKeys](xref:NetworkTables.Tables.ITable.GetKeys) will get a list of all keys that exist either in the current table, or in any subtables of the
current table. If you want to filter the keys by type in the table, call [GetKeys(NtType)](xref:NetworkTables.Tables.ITable.GetKeys(NetworkTables.NtType)) with
the types as a bitmask of the types you want to get from the query. 

##Working with Table Listeners
Table listeners are an advanced subject, and can be found on their own [TableListner](tablelisteners.md) documentation page.