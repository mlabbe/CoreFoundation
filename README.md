# CoreFoundation Lite #

There are a handful of CoreFoundation Lite repos on Github and sprinkled around the Internet.  They are all out of date as of this writing.  Some of them claim compatibility with various operating systems through small patches.

This repo's initial author aims to provide Linux and Android compatibility, starting from a base of CF-744.18 (as shipped with OS X 10.8.3)

Contributions that bring up CFLite functionality on other platforms are welcome.


## Compiling code on Linux ##

README_CFLITE, as provided by Apple, contains the Linux build instructions.  If you have installed the dependencies, this is what the compile steps look like:

    sudo make -f MakefileLinux install
    cd ./Examples
    clang plconvert.c -o plconvert -lCoreFoundation -DDEPLOYMENT_TARGET_LINUX=1

## Android NDK Support ##

Absolutely no Java bindings are provided.  This code has been tested with the Android NDK, r8.  It compiles using the experimental Clang compiler, a requirement because Apple's [block extension](http://developer.apple.com/library/ios/#documentation/cocoa/Conceptual/Blocks/Articles/00_Introduction.html) is required.

CoreFoundation Lite for Android has two dependencies:

 - libBlocksRuntime, ported to Android.  Pull from [this github repo](https://github.com/StorypandaEnterprises/libBlocksRuntime)
 - icu4c, ported to Android. Pull from [this github repo](https://github.com/android/platform_external_icu4c)

### Building libBlocksRuntime

Add the libBlocksRuntime directory to your include search list in your Android.mk.  Example:

    LOCAL_CFLAGS += -I./libBlocksRuntime

Add `libblocksruntime` to your `LOCAL_STATIC_LIBRARIES`.  Example:

    LOCAL_STATIC_LIBRARIES += libblocksruntime

### Building icu4c

The Github repo described above builds icu4c's libraries as shared libraries.  CoreFoundation Lite expects static libraries.

Edit `icu4c/common/Android.mk` and `icu4c/common/i18n/Android.mk` files, swapping out the shared calls with static calls.  Example:

    #include $(BUILD_SHARED_LIBRARY)
    include $(BUILD_STATIC_LIBRARY)

Add the following directories to your search path:

    LOCAL_CFLAGS += ./icu4c/i18n ./icu4c/common

Add `libicui18n` and `libicuuc` to your `LOCAL_STATIC_LIBRARIES`.  Example:

    LOCAL_STATIC_LIBRARIES += libicui18n libicuuc

### Finally, building CoreFoundation for Android

Corefoundation references include files as follows:

    #include <CoreFoundation/CFBase.h>

If the library has been cloned to `android-project/jni/CoreFoundation`, you must add `android-project/jni` to the list of include directories.  Example:

    LOCAL_CFLAGS += ./ ./CoreFoundation

In addition to the include directories, add the following CFLAGS:

    LOCAL_CFLAGS += -fblocks -DDEPLOYMENT_TARGET_LINUX -DDEPLOYMENT_TARGET_ANDROID

Add `corefoundationlite` to the `LOCAL_STATIC_LIBRARIES` list.  Example:

    LOCAL_STATIC_LIBRARIES += corefoundationlite

Required settings in `Application.mk`.

 - `APP_ABI` must omit mips for now.  Mips in unsupported.
 - `NDK_TOOLCHAIN_VERSION` must equal `clang3.1`.

You are now ready to incorporate CoreFoundation Lite code in your Android project.

# What is needed / Known Issues #

 1. A series of automated CFLite test cases that run on all platforms.
 2. A developer to port this back to OS X, ensuring that nothing was broken along the way.
 3. A maintainer who will update the core repo, merging in Apple's changes as new versions are released along the way.
 4. While armeabi, armeabi-v7a and x86 are supported, the mips ABI is not supported in CoreFoundation.  Patches are welcome.
