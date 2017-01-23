#Configuring a Client
Configuring NetworkTables as a client is the most common use case, as often times the roboRIO is the server.

## roboRIO as the server
When you have a roboRIO as the server, such as when using any version of WPILib on the roboRIO, connecting as a client is easy.
Run the following commands to initialize the code
```
NetworkTable.SetClientMode();
// Replace 9999 with team
NetworkTable.SetTeam(9999);
NetworkTable.Initialize();
```

This will set up as a client to connect to a roboRIO with team number 9999. Internally, this will try multiple different IP's to try 
and connect to the roboRIO, and should work with all the known field configurations.

## What next
Once you have the client configured, you are ready to connect to a table. See [getting a table](gettingtable.md) to get any random table,
or see [connecting to SmartDashboard](smartdashboard.md) to connect to the SmartDashboard table and get the same data that would be sent to
SmartDashboard.