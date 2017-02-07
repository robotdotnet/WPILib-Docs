internal class NativeFunctions
{
    [DllImport("MyLibrary.dll")]
    internal static extern int Add2Numbers(int x, int y);
}

internal delegate int Add2NumbersDelegate(int x, int y);

internal static Add2NumbersDelegate Add2Numbers;

internal class NativeFunctions
{
    internal delegate int Add2NumbersDelegate(int x, int y);
    internal static Add2NumbersDelegate Add2Numbers;
}

internal static NativeLibraryLoader NativeLoader { get; }
static NativeFunctions()
{
    NativeLoader = new NativeLibraryLoader();
}

NativeLoader.AddLibraryLocation(OsType.Windows64, "myLibrary.dll");
NativeLoader.AddLibraryLocation(OsType.Linux32, "libMyLibrary.so");

NativeLoader.LoadNativeLibrary<NativeFunctions>(true);
NativeLoader.LoadNativeLibrary<NativeFunctions>();

[NativeDelegate("Add2Numbers")] internal static Add2NumbersDelegate Foo;
[NativeDelegate] internal static Add2NumbersDelegate Add2Numbers;

internal class NativeFunctions
{
    private NativeFunctions() { } // Private constructor to disallow initialization

    internal static NativeLibraryLoader NativeLoader { get; }
    static NativeFunctions()
    {
        NativeLoader = new NativeLibraryLoader();
        NativeLoader.AddLibraryLocation(OsType.Windows64, "myLibrary.dll");
        NativeLoader.AddLibraryLocation(OsType.Linux32, "libMyLibrary.so");

        NativeLoader.LoadNativeLibrary<NativeFunctions>(true);

        NativeDelegateInitializer.SetupNativeDelegates<NativeFunctions>(NativeLoader);
    }

    internal delegate int Add2NumbersDelegate(int x, int y);
    [NativeDelegate] internal static Add2NumbersDelegate Add2Numbers;
}

[NativeDelegate]
internal AddNumberDelegate AddNumber;

[UnmanagedFunctionPointer(CallingConvention.Cdecl)]
internal delegate int AddNumberDelegate(int x, int y);
[NativeDelegate]
internal AddNumberDelegate AddNumber;

[NativeDelegate("AddNumber")]
internal AddNumberDelegate AddNumberFoo;