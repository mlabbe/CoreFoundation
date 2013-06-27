LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := corefoundationlite

# Support includes in format <CoreFoundation/CFBase.h>
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := \
CFArray.c \
CFApplicationPreferences.c \
CFBag.c \
CFBase.c \
CFBasicHash.c \
CFBigNumber.c \
CFBinaryHeap.c \
CFBinaryPList.c \
CFBitVector.c \
CFBuiltinConverters.c \
CFBundle.c \
CFBundle_Resources.c \
CFBurstTrie.c \
CFCalendar.c \
CFCharacterSet.c \
CFConcreteStreams.c \
CFData.c \
CFDate.c \
CFDateFormatter.c \
CFDictionary.c \
CFError.c \
CFFileUtilities.c \
CFICUConverters.c \
CFLocale.c \
CFLocaleIdentifier.c \
CFLocaleKeys.c \
CFMachPort.c \
CFMessagePort.c \
CFNumber.c \
CFNumberFormatter.c \
CFOldStylePList.c \
CFPlatform.c \
CFPlatformConverters.c \
CFPlugIn.c \
CFPlugIn_Factory.c \
CFPlugIn_Instance.c \
CFPlugIn_PlugIn.c \
CFPreferences.c \
CFPropertyList.c \
CFRunLoop.c \
CFRuntime.c \
CFSet.c \
CFSocket.c \
CFSocketStream.c \
CFSortFunctions.c \
CFStorage.c \
CFStream.c \
CFString.c \
CFStringEncodingConverter.c \
CFStringEncodingDatabase.c \
CFStringEncodings.c \
CFStringScanner.c \
CFStringUtilities.c \
CFSystemDirectories.c \
CFTimeZone.c \
CFTree.c \
CFURL.c \
CFURLAccess.c \
CFUUID.c \
CFUniChar.c \
CFUnicodeDecomposition.c \
CFUnicodePrecomposition.c \
CFUserNotification.c \
CFUtilities.c \
CFVersion.c \
CFWindowsUtilities.c \
CFXMLInputStream.c \
CFXMLNode.c \
CFXMLParser.c \
CFXMLPreferencesDomain.c \
CFXMLTree.c 

# todo: remove Linux case
LOCAL_EXPORT_CFLAGS := -DDEPLOYMENT_TARGET_LINUX -DDEPLOYMENT_TARGET_ANDROID

LOCAL_CFLAGS = -x c -fblocks -std=gnu99 -Wno-trigraphs -fexceptions -DCF_BUILDING_CF=1 -DDISABLE_GCD -include CoreFoundation_Prefix.h -nostdlibinc $(LOCAL_EXPORT_CFLAGS)

#note: not all flags from MakefileLinux have been ported over.
LOCAL_LDFLAGS = -fpic 

include $(BUILD_STATIC_LIBRARY)
