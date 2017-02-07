#Introduction to NativeLibraryUtilities
NativeLibraryUtilities is our library for working with all the native libraries that are required to run WPILib, with multiple ways to handle
loading based on different OS's and different hardware platforms. Even though it was built for working with WPILib, the uses extend long beyond
just our libraries, and can actually be used for many other purposes, such as cross platform game libraries.

##High Level Overview
The entire library is delegate based. 

##Differences from P/Invoke
P/Invoke is the normal way for interfacing with native libraries. In a normal Windows only workflow, this actually works fairly well.
However, when attempting to move cross platform, the limitations of P/Invoke become much harder. For instance, both the 
name and location of the native library must be known at runtime. This can actually cause problems, such as wanting to extract
the native library to a temp directory depending on which OS is found at runtime. In addition, because of this, if a function
exists in differently name libraries based on different OS's, P/Invoke does not have a good way of determining this.

NativeLibraryUtilities works differently. Instead of requiring the library name at compile time, it uses lower level OS functions
to load the library and the functions. This is actually internally how P/Invoke works. By using the lower level functionality,
we can bypass these restrictions. This means the library name does not need to be known at compile time, and can actually be determined
programmatically at runtime. Technically this also means that the native function name does not have to be known at compile time either, 
and they could be generated at runtime as well. 

One thing that is not possible in NativeLibraryUtilities is function overloading. This is because overloading is not supported by
.NET delgates. Instead, 2 different function names must be used. However, since most of the time P/Invoke is used for C libraries,
where overloading is not supported anyway, this is usually not an issue.