#Getting started with NativeLibraryUtilities
When getting started with using the library, it is recommended to have a good knowledge of P/Invoke, and already have your P/Invoke declarations made.
This will make understanding some of the differences much easier. For instance, we are going to start with the following class and function declaration.

[!code-csharp[Simple](delegate.cs#L1-L5)]

This class declares a single function `Add2Numbers` that takes 2 integers, and returns an integer. The declaration is specified in a library called 
`MyLibrary.dll`. The main issue with this function are that it has no way to detect between 32 and 64 bit CLR runtimes, or different OS.
The 64 vs 32 bit issue can be fixed wih some initialization code, however the OS issue is much harder to fix, and is almost impossible to fix
in .NET Core.

To start porting this to NativeLibraryUtilities, we first need to get our native delaration worked out. Unlike P/Invoke, we need both
a delegate type, and a delegate instance for our code to work properly. For our delegate type, we normally name that the same name
as the native function name, suffixed with `Delegate`. So our native delegate declaration would be 

[!code-csharp[Simple](delegate.cs#L7-L7)]

After this, our native delegate instance can be created with the following code.

[!code-csharp[Simple](delegate.cs#L9-L9)]

Putting this together, we get the following declaration. Note that it is very important this class is ~~NOT~~~ static, so reasons later in this tutorial.
To make it so this class cannot be instanciated, add a private constructor.

[!code-csharp[Simple](delegate.cs#L11-L15)]

Note however that this is not complete. Nowhere in our declaration have we provided a library name to look at, and in fact our delegate instance is null right now.
There are a few ways this can be done, however we are going to go over doing the initialization code in the static constructor for the class. To create a static
constructor, add the following to your class. This adds a [NativeLibraryLoader](xref:NativeLibraryUtilities.NativeLibraryLoader) object to the class, and initializes
it. This is what we will eventually use to load our delegates.

[!code-csharp[Simple](delegate.cs#L17-L21)]

Once you are here, you need to determine how you are going to load the native library. There are 3 supported options
* Load from path: Use this when the native libraries are located on disk, and their locations are known.
* Load from resources in assembly: Use this when your native libraries are stored as a resource in an assembly. The loader will automatically
extract the file to the TEMP folder on your system
* Load from resources in reflected assembly: This is a special case of the resources version. This one is used when you want too specify multiple assemblies to hold
the native libraries, and don't want to require those assemblies to all be required. We will not be going over this case, as it is more difficult to use. However this is the case
all RobotDotNet projects use. 

Programmatically, we support 9 different OS platforms, with 2 more (Linux aarch64 and Windows Arm) possibly on the way. The list of these platforms can be found at the
[OsType](xref:NativeLibraryUtilities.OsType) enum documentation page. Before we can load any library, we have to specify where to load the libraries from for each specific OS.
To do this, use the [AddLibraryLocation](xref:NativeLibraryUtilities.NativeLibraryLoader.AddLibraryLocation) method. For example, to add a 64 bit Windows library and a
32 bit linux library to the loader, use the following declaration, inside of the static constructor below the NativeLoader initialization.

[!code-csharp[Simple](delegate.cs#L23-L24)]

The enum can be changed to change where the resource is located at. The path can either be a full path from the root of the drive, a relative path, or if the file is an embedded
resource, it must be the full path of the resource. Note we do not currently support loading some libraries from embedded and some from already on the file system, however
this functionality might be added later.

Once you have this, you are ready to load the library. This is where the differences come in between the resource loading and loading the file from on disk.
To load the files from on disk, use the following function. This will cause the files to be loaded from disk:

[!code-csharp[Simple](delegate.cs#L26-L26)]

To load from the embedded resource, the parameter to the function just needs to be false, or the the default. So the following will load from an embedded resource:

[!code-csharp[Simple](delegate.cs#L27-L27)]

Once we have the library loaded, all that is left to do is load our native symbols into the delegate we created earlier. This can be done manually for every delegate
with a call to [NativeDelegateInitializer.SetupNativeDelegate](xref:NativeLibraryUtilities.NativeDelegateInitializer.SetupNativeDelegate(NativeLibraryUtilities.ILibraryInformation,System.String,System.Type)). This works for a small amount
of delegates, however for a large number of delegates this is not sustainable. To solve this, we can use the [NativeDelegate](xref:NativeLibraryUtilities.NativeDelegateAttribute) attribute
to all of our delegate instances. This delegate is either parameterless, or takes in a string parameter. If no parameter is passed in, the name of the delegate instance
is used for the native function name. If the parameter is used, that string is used for the name of the native function.
For instance, the following 2 calls will connect to the same native library function:

[!code-csharp[Simple](delegate.cs#L29-L30)]

To load all delegates with the attribute placed on them, use the 
[NativeDelegateInitializer.SetupNativeDelegates](xref:NativeLibraryUtilities.NativeDelegateInitializer.SetupNativeDelegates``1(NativeLibraryUtilities.ILibraryInformation))
method. This will load all the native delegates with attributes from the passed in generic type. 

Putting this all together, the following code is enough to get our libraries and symbols loaded. 

[!code-csharp[Simple](delegate.cs#L32-L50)]
