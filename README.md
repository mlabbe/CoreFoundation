# CoreFoundation Lite #

There are a handful of CoreFoundation Lite repos on Github and sprinkled around the Internet.  They are all out of date as of this writing.  Some of them claim compatibility with various operating systems through small patches.

This repo's initial author aims to provide Linux and Android compatibility, starting from a base of CF-744.18 (as shipped with OS X 10.8.3)

Contributions that bring up CFLite functionality on other platforms are welcome.

**See also:**  README_CFLITE, as provided by Apple.  It contains build instructions.

## Compiling code on Linux ##

    sudo make -f MakefileLinux install
    cd ./Examples
    clang plconvert.c -o plconvert -lCoreFoundation -DDEPLOYMENT_TARGET_LINUX=1

## Needed ##

 1. A series of automated CFLite test cases that run on all platforms.
 2. A developer to port this back to OS X, ensuring that nothing was broken along the way.
 3. Android support (coming).
 4. A maintainer who will update the core repo, merging in Apple's changes as new versions are released along the way.


