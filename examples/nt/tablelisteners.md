#Working with Table Listeners
Table listeners allow asynchronous checking of keys and connections throughout the entire NetworkTable. There are 2 types of table listeners.
The first, and primary type, are key listeners. These listen for any change in the value or type of a specified key. The other type is
connection listeners. These listen for a connection to the server as a client, or a connection from any client as a server.

##Key Listeners
In your code, you will most likely deal with key listeners the most. These allow you to listen for changes in any key in the table.
Just like working with values, everything involving key listeners uses the [ITable](xref:NetworkTables.Tables.ITable) interface.
There are multiple types of table listeners, ranging from entire tables to specific keys.

###Key Listener Callback types
 All the listeners in .NET NetworkTables can either support a delegate based listener or an interface based listener. For these, the methodality is the same, so unless
there are specific differences, these docs are going to show the delegate based listeners. For the interface based listeners, they will
all use the [ITableListener](xref:NetworkTables.Tables.ITableListener) interface. For delegate based listeners, the callback will recieve a 
[String](xref:System.String), an [ITable](xref:NetworkTables.Tables.ITable), a [Value](xref:NetworkTables.Value), and [NotifyFlags](xref:NetworkTables.NotifyFlags).
The string will always be the key that is being changed. This key is relative to the table which the listener was created from, which is the table passed back through
the ITable parameter. The Value is the new value of the key, and the flags are the specific flags that caused this event to fire. Both the delegate and
interface callbacks use these same 4 parameters.

###Whole Table Key Listeners
Often times, a user wants to check for any key changing in the table. To do this, the easist solution is to use the 
[AddTableListener(Action, Bool)](xref:NetworkTables.Tables.ITable.AddTableListener(System.Action{NetworkTables.Tables.ITable,System.String,NetworkTables.Value,NetworkTables.NotifyFlags},System.Boolean))
method. By default, this will fire the listener whenever a key is changed from a remote client. The bool parameter defaults to false, where if it is true
it fires the listener immediately for every key that exists in the table. 

If more advanced functionality is needed, the
[AddTableListenerEx(Action, NotifyFlags)](xref:NetworkTables.Tables.ITable.AddTableListenerEx(System.Action{NetworkTables.Tables.ITable,System.String,NetworkTables.Value,NetworkTables.NotifyFlags},NetworkTables.NotifyFlags))
method can be used. This will allow you to specify exactly when and how you want to be notifed of changes to a value. Note see the 
[Notify Flags](#using-the-notifyflags-parameter) section for more information.

###Key Based Table Key Listeners
In addition to the entire table, changes can also be listened for on a specific key. This is identical to whole table case, except the first parameter passed into the method is
the key to listen for. The 2 methods to use are [AddTableListener(String, Action, Bool)](xref:NetworkTables.Tables.ITable.AddTableListener(System.String,System.Action{NetworkTables.Tables.ITable,System.String,NetworkTables.Value,NetworkTables.NotifyFlags},System.Boolean))
and [AddTableListenerEx(String, Action, NotifyFlags)](xref:NetworkTables.Tables.ITable.AddTableListenerEx(System.String,System.Action{NetworkTables.Tables.ITable,System.String,NetworkTables.Value,NetworkTables.NotifyFlags},NetworkTables.NotifyFlags))

###Subtable Listeners
In addition to listening for either the entire table, or a specific key, entire subtables can be listened to. To do this, the 
[AddSubTableTableListener(Action, Bool)](xref:NetworkTables.Tables.ITable.AddSubTableListener(System.Action{NetworkTables.Tables.ITable,System.String,NetworkTables.Value,NetworkTables.NotifyFlags},System.Boolean))
method can be used. Note that the ITable interface does not provide the extended version of this method.

###Deleting a listener
A listener can be removed by calling either the [RemoveTableListener(Action)](xref:NetworkTables.Tables.ITable.RemoveTableListener(System.Action{NetworkTables.Tables.ITable,System.String,NetworkTables.Value,NetworkTables.NotifyFlags}))
method or the [RemoveTableListener(ITableListener)](xref:NetworkTables.Tables.ITable.RemoveTableListener(NetworkTables.Tables.ITableListener))
method, depending on which type of listener you had created initially. You will need to pass the actual instance to be removed.

###Listeners between NetworkTables shutdown and restart
If you use the [NetworkTables Shutdown](xref:NetworkTables.NetworkTable.Shutdown) method, all existing ITable objects will be invalidated. Because of this, all
listeners are invalidated as well. So if you need to restart the table, you will need to recreate all tables, and all table listeners. 

###Using the NotifyFlags parameter
Using the extended table listener methods (the ones that are suffixed with "ex") you are able to specify much more control on when you want to
receive notifications. These all use the [NotifyFlags](xref:NetworkTables.NotifyFlags) enum, where each value is a flag that can be bitwise or'd together.
For example, to create a flag that will fire on new keys, local updates, and remote updates, use the following code.
```
var flags = NotifyFlags.NotifyNew | NotifyFlags.NotifyLocal | NotifyFlags.NotifyUpdate;
```

Below is a list of all the flags and what they do:
* [NotifyNone](xref:NetworkTables.NotifyFlags.NotifyNone): This flag is the default flag if you never want a notification. Combining this with any other
flag will ignore this flag.
* [NotifyNew](xref:NetworkTables.NotifyFlags.NotifyNew): Setting this flag will cause a notification to update on any new key, whether created locally or remotely.
* [NotifyUpdate](xref:NetworkTables.NotifyFlags.NotifyUpdate): This setting will cause an update any time a value is updated from a remote connection. Note that by default
this will NOT trigger on a local change. To enable that, use the [NotifyLocal](xref:NetworkTables.NotifyFlags.NotifyLocal) flag in addition to the update flag.
* [NotifyLocal](xref:NetworkTables.NotifyFlags.NotifyLocal): By default, updates only trigger notification when they come from a remote connection. Adding this flag
causes notifications to trigger on local connections as well. Note if this is done incorrectly, you can trigger an infinite loop if you update the key from inside
the listener.
* [NotifyDelete](xref:NetworkTables.NotifyFlags.NotifyDelete): This will cause an event to occur whenever a key is deleted.
* [NotifyImmediate](xref:NetworkTables.NotifyFlags.NotifyImmediate): This will cause the event to be fired immediately upon creation if the specified request
has existing keys.
* [NotifyFlagsChanged](xref:NetworkTables.NotifyFlags.NotifyFlagsChanged): This will fire any time the flags of a key (e.g. Persistent) are changed.

When using a listener method that takes a bool parameter, if the parameter is false, the [NotifyNew](xref:NetworkTables.NotifyFlags.NotifyNew) and
[NotifyUpdate](xref:NetworkTables.NotifyFlags.NotifyUpdate) flags are set. If the bool parameter is true, the [NotifyImmediate](xref:NetworkTables.NotifyFlags.NotifyImmediate)
flag is added to the Update and New flags. The bool parameter overloads will never set the [NotifyLocal](xref:NetworkTables.NotifyFlags.NotifyLocal) flag, so
if you need local notifications you will need to use the extended overloads.

##Connection Listeners
In addition to being able to listen for changes in keys, NetworkTables also supports listening for changes in connections. On a client,
this will be listening for changes in it's connection status to the server, as each client has no way of determining the other clients connected
to the server. On the server, this listens for any client connecting or disconnecting. Unlike keys, connection listeners use their own 
[IRemote](xref:NetworkTables.Tables.IRemote) interface. Note that the [NetworkTable](xref:NetworkTables.NetworkTable) returned via
[NetworkTable.GetTable](xref:NetworkTables.NetworkTable.GetTable(System.String)) implements this interface. [NetworkTable](xref:NetworkTables.NetworkTable) also has a
static version of all the connection listener methods that can check globally for connection changed, rather than being locked down to a specific
interface.

###Delegate vs Interface callbacks
Unlike key listeners, there are some minor differences between using the [IRemoteConnectionListener](xref:NetworkTables.Tables.IRemoteConnectionListener) interface
and using the delegate based callback. When using the delegate based callback, you will receive an [IRemote](xref:NetworkTables.Tables.IRemote) object, a 
[ConnectionInfo](xref:NetworkTables.ConnectionInfo) struct, and a [Bool](xref:System.Boolean). The IRemote object will be the IRemote the listener was created from,
the ConnectionInfo struct will contain information such as the IP Address and name of the remote, and the bool will be true if the remote is connecting, and false
if the remote had disconnected. When using an [IRemoteConnectionListener](xref:NetworkTables.Tables.IRemoteConnectionListener) based callback, there are actually 2
methods that need to be implemented. There is one method that gets fired on connection, and one method that gets fired on disconnection. Both of these methods give
an [IRemote](xref:NetworkTables.Tables.IRemote) and a [ConnectionInfo](xref:NetworkTables.ConnectionInfo), so the only difference between the 2 callback types is 
the delegate based callback has a bool to show connection or disconnection, whereas the interface based callback has 2 separate methods to show this. These docs
are going to show links to creating and removing delegate based callbacks, however the methods are very similar for interface based callbacks, whose docs
can be found in the API documentation for [IRemote](xref:NetworkTables.Tables.IRemote).

###Creating a connection listener
To create a connection listener, use the 
[AddConnectionListener](xref:NetworkTables.Tables.IRemote.AddConnectionListener(System.Action{NetworkTables.Tables.IRemote,NetworkTables.ConnectionInfo,System.Boolean},System.Boolean))
method. This takes in the callback to be used, and a bool parameter. If the parameter is true, the callback will be fired for every connected remote immediately.

###Deleting a connection listener
To delete a connection listener, use the [RemoveConnectionListener](xref:NetworkTables.Tables.IRemote.RemoveConnectionListener(System.Action{NetworkTables.Tables.IRemote,NetworkTables.ConnectionInfo,System.Boolean}))
method. You will need to pass in the instance that was originally used to create the listener.

###Using the static connection listeners.
Sometimes you need a connection listener that isn't dependnent on a specific [IRemote](xref:NetworkTables.Tables.IRemote) object. To do this, the 
[NetworkTable](xref:NetworkTables.NetworkTable) class contains static version of both 
[AddGlobalConnectionListener](xref:NetworkTables.NetworkTable.AddGlobalConnectionListener(System.Action{NetworkTables.Tables.IRemote,NetworkTables.ConnectionInfo,System.Boolean},System.Boolean))
and [RemoveGlobalConnectionListener](xref:NetworkTables.NetworkTable.RemoveGlobalConnectionListener(System.Action{NetworkTables.Tables.IRemote,NetworkTables.ConnectionInfo,System.Boolean})).
Use these to create connection listeners that are not dependent on a specific table object.
