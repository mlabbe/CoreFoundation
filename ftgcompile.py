#!/usr/bin/env python


import sys
import os.path
sys.path.append( os.path.normpath( os.environ['FROGLIBS'] + '/src/tools/pylib') )

import os
import buildhelp
from buildhelp import BuildLib, BuildCLI

#
# Main program
#

def build_darwin( libname, builder ):
    pass


def build_linux( libname, builder ):
    pass


def build_windows( libname, builder ):
    pass

def build_android( libname, builder ):
    builder.verify_environment()
    builder.set_rootdir( os.environ['FROGLIBS'] + '/vendors/%s' % libname )

    builder.set_arch_environment()
    builder.ndk_optional_clean( check_errorlevel=True )
    builder.ndk_set_alt_toolchain( 'clang3.1' )
    builder.ndk_build()
    

if __name__ == '__main__':

    libname = 'CoreFoundation'
    cli = BuildCLI( sys.argv, libname )
    builder = BuildLib( cli )

    try:
        if cli.get_target_platform() == 'Darwin':
            pass # not needed

        elif cli.get_target_platform() == 'Linux':
            pass # todo: write this

        elif cli.get_target_platform() == 'Windows':
            pass # not implemented

        elif cli.get_target_platform() == 'Android':
            build_android(libname, builder)

    except buildhelp.BuildError as e:
        print "Failed building %s: %s" % (libname, e)
        sys.exit(1)


    print "Success."
    sys.exit(0)
    
