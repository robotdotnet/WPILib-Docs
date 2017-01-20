# Troubleshooting
If you run into issues, try some of the following steps

## Deploy fails with NullReferenceException, or deploy fails telling you could not find native files
New to 2017, there is a content library that gets installed whenever a robot project is created. However, we have noticed that rarely, this package does not
install correctly, and causes the deploy to break. We are working on a better error message, but the solution to fix this issue is to force a reinstall
of the WPILibNativeLibraries package. To do this, in Visual Studi, go to Tools -> Nuget Package Manager -> Package Manager Console. Then in that console,
run `Update-Package –reinstall FRC.WPILibNativeLibraries`. This should force a reinstall, add a folder called wpinative into your solution, and then the builds
should work again.
