// Add to your existing RobotInit method
public override void RobotInit()
{
  CameraServer.Instance.StartAutomaticCapture();
}

// Add additional includes
using CSCore;
using OpenCvSharp;
using System.Threading;

// Add to your existing RobotInit method
public override void RobotInit()
{
    Thread cameraThread = new Thread(() =>
    {
        // Get the USB Camera from the camera server
        UsbCamera camera = CameraServer.Instance.StartAutomaticCapture();
        camera.SetResolution(640, 480);

        // Get a CvSink. This will capture Mats from the Camera
        CvSink cvSink = CameraServer.Instance.GetVideo();
        // Setup a CvSource. This will send images back to the dashboard
        CvSource outputStream = CameraServer.Instance.PutVideo("Rectangle", 640, 480);

        // Mats are very expensive. Let's reuse this Mat.
        Mat mat = new Mat();

        while (true)
        {
            // Tell the CvSink to grab a frame from the camera and put it
            // in the source mat.  If there is an error notify the output.
            if (cvSink.GrabFrame(mat) == 0) {
                // Send the output the error.
                outputStream.NotifyError(cvSink.GetError());
                // skip the rest of the current iteration
                continue;
            }
            // Put a rectangle on the image
            Cv2.Rectangle(mat, new Point(100, 100), new Point(400, 400),
                    new Scalar(255, 255, 255), 5);
            // Give the output stream a new image to display
            outputStream.PutFrame(mat);
        }
    });
    cameraThread.IsBackground = true;
    cameraThread.Start();
}

// Add additional includes
using CSCore;
using OpenCvSharp;
using System.Threading;

// Add to your existing RobotInit method
public override void RobotInit()
{
    Thread cameraThread = new Thread(() =>
    {
        // Get the Axis Camera from the camera server
        AxisCamera camera = CameraServer.Instance.AddAxisCamera("axis-camera.local");
        camera.SetResolution(640, 480);

        // Get a CvSink. This will capture Mats from the Camera
        CvSink cvSink = CameraServer.Instance.GetVideo();
        // Setup a CvSource. This will send images back to the dashboard
        CvSource outputStream = CameraServer.Instance.PutVideo("Rectangle", 640, 480);

        // Mats are very expensive. Let's reuse this Mat.
        Mat mat = new Mat();

        while (true)
        {
            // Tell the CvSink to grab a frame from the camera and put it
            // in the source mat.  If there is an error notify the output.
            if (cvSink.GrabFrame(mat) == 0) {
                // Send the output the error.
                outputStream.NotifyError(cvSink.GetError());
                // skip the rest of the current iteration
                continue;
            }
            // Put a rectangle on the image
            Cv2.Rectangle(mat, new Point(100, 100), new Point(400, 400),
                    new Scalar(255, 255, 255), 5);
            // Give the output stream a new image to display
            outputStream.PutFrame(mat);
        }
    });
    cameraThread.IsBackground = true;
    cameraThread.Start();
}