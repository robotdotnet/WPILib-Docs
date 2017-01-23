# Installing NetworkTables
NetworkTables is fully supported in .NET, and is probably our most popular package, as it can be used on desktops, coprocessors
and the roboRIO. In order to support as many platforms as possible, we provide 2 different packages. 

The `FRC.NetworkTables` project is a reimplementation of the [ntcore](https://github.com/wpilibsuite/ntcore) library entirely in C#.
This enables use on systems without the capability for native libraries, such as Android, UWP and iOS. The restrictions is the library
requries either .NET 4.6 or .NET Standard 1.3 at a minimum, so it is difficult to use on older systems. We recommend this library
for any coprocessor or desktop application

The `FRC.NetworkTables.Core` project is a wrapper around the [ntcore](https://github.com/wpilibsuite/ntcore) native library. This has
the advantage of being much more extensively tested, and with all the communication done in C++ can be faster too. Because we don't
need much C#, we can provide a library that works for lower versions of .NET. This library works with .NET 4.0 or higher, or 
.NET Standard 1.5, which helps working with older projects. However, this requires native libraries to be built for your target platform.
We provide the `FRC.NetworkTables.Core.DesktopLibraries` package, which contains native libraries for Windows, macOS, and Linux. 

## Installing FRC.NetworkTables (Recommended for Coprocessors)
To install `FRC.NetworkTables`, the only thing that needs to be installed is the [NuGet package](https://www.nuget.org/packages/FRC.NetworkTables). This
will install all required dependencies, and is the only thing that needs to be installed.

## Installing FRC.NetworkTables.Core
For the `FRC.NetworkTables.Core` library, start with the [core](https://www.nuget.org/packages/FRC.NetworkTables.Core) package on NuGet.
From this point, if the system you want to run is either Windows, macOS, or Linux, you can install the
[DesktopLibraries](https://www.nuget.org/packages/FRC.NetworkTables.Core.DesktopLibraries) package, which contains all needed references.
If your platform in not on that list. You will need to natively compile the [ntcore](https://github.com/wpilibsuite/ntcore) library for your
target platform. To then use that build, use the following console arguement when starting up your application.
```
yourapp.exe -ntcore:/Path/To/Native/Library/Here
```
Make sure to include the final library executable name in your path.

## Use on the roboRIO
When used with WPILib, the extension automatically installs and uses `FRC.NetworkTables.Core`. The native libraries for the roboRIO are automatically
deployed to the roboRIO on code deploy, and the code is automatically setup as a server, so there is no extra needed setup when using WPILib.

## Using the library
Once you have the library installed, see either [Configuring a server](configserver.md) or [Configuring a client](configclient.md) 
for instructions on how to use it. Note that in most cases you will be configuring a client, as the server is usually the roboRIO.