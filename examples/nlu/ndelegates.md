#Working with Native Delegates
The [NativeDelegate](xref:NativeLibraryUtilities.NativeDelegate) attribute is what is used to define any functions to attempt to load.
The attribute needs to be assigned to a delegate variable. The native function name will either be the name of the delegate,
or the attribute can take a string parameter that will be used for the native function name. 

##Creating your Native Delegates
The recommended way to create the native delegates is with an internal class containing both the initialization code, and the
delegate functions to be called. Instructions for creating the initialization code can be found at [Loading the Library]



[!code-csharp[Simple](delegate.cs#L1-L5)]