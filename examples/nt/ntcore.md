#The NtCore class
The [NetworkTable](xref:NetworkTables.NetworkTable) class is a high level abstraction over the entire NetworkTable. All other functionality supported by
NetworkTables can be found in the [NtCore](xref:NetworkTables.NtCore) class. This class contains some additional functionalities that are not supported
by the NetworkTable abstraction. 

##How Keys Work
When using the NtCore functionality, all keys passed in need to have their full path passed in. For instance, if you had a subtable in the `SmartDashboard`
table called `CustomData` with a key called `MyData`, this key would be accessed by `/SmartDashboard/CustomData/MyData`. All tables and keys when created
by the NetworkTable class are separated by the `/` character.

##Additional Features
There are a few additional features that can only be found in the NtCore class.
* **Changing the type of a key:** By default, once a key has been created, it's type cannot be updated. However, when using the SetEntry### methods
in NtCore, there is a bool paramter. If this parameter is set to true, it will override the existing type in the table. Note if there are any
NetworkTables 2.0 clients connected, or if connected to a NetworkTables 2.0 server, this functionality will not work.
