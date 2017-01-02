# OpenCV and CameraServer
One of the coolest new features for 2017 is the addition of OpenCV and the new CameraServer to WPILib. Unlike NiVision, which was never enabled in RobotDotNet, OpenCV and CameraServer have been fully enabled.

## CameraServer
CameraServer is the new library for handling USB and Ethernet cameras, along with streaming video from these devices, along with OpenCV, to other devices. All code can be found in the [CSCore namespace](xref:CSCore). 
However in most instances, you should just be able to use [the WPILib CameraServer class](xref:WPILib.CameraServer), which handles most of the configuration of these settings for you. 

## OpenCV
The OpenCV library we use is a fork of [OpenCvSharp](https://github.com/shimat/opencvsharp). It has been modified to work with the WPILib build system, but still handles all of the OpenCV operations you have come to expect.
See the OpenCV API documentation for more information, and you should be able to look at most OpenCV documentation online for help as well.

## Creating a USB Camera Stream
The [CameraServer](xref:WPILib.CameraServer) class can be used to easliy start streaming a USB Camera to either the LabVIEW dashboard, SmartDashboard, DotNetDash, or any web browser. 

[!code-csharp[Simple](OpenCvSamples.cs#L1-L5)]

## Performing OpenCV operations on a USB Camera
OpenCV images can be grabbed directly from the USB Camera, and then the final output from OpenCV can be streamed back to the dashboard. The following example shows
how to get an OpenCV image, draw an annotated rectangle on the image, and then send it back to the dashboard. Note that the sample runs this in a separate thread, as
attempting to run this in a main robot loop would cause heavy control lag.

[!code-csharp[Advanced](OpenCvSamples.cs#L7-L48)]

Note the above example can also be used with an Axis ethernet camera, using the sample code below.

[!code-csharp[AdvancedAxis](OpenCvSamples.cs#L50-L91)]