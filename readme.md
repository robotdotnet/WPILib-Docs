# WPILib-Docs

This repo hosts the source code for the RobotDotNet WPILib Documentation. The code is generated from here and hosted from the gihub docs page.


## Building

In order to build the docs, you must have the following repos cloned, with the following folder structure
```
root
|___NetworkTables
|___WPILib-Docs
|___CameraServer
|___FRC-OpenCvSharp
|___WPILib
```

You also must have docfx installed somewhere in your path

Once you have this, nativate to the WPILib-Docs folder, and run `docfx --serve`. This will generate the documentation and serve
it to your localhost.