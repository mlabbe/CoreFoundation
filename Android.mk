LOCAL_PATH := $(call my-dir)

ICUROOT := /Users/mlabbe/Documents/code/vendors/platform_external_icu4c

include $(CLEAR_VARS)

LOCAL_MODULE := corefoundationlite

# Support includes in format <CoreFoundation/CFBase.h>
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

# removed files: 
# CFBundle.c -- also removed in Linux
# CFBundle_Resources.c  
# CFMachPort.c 
# CFMessagePort.c 
# CFPlugin.c
# CFPlugin_Factory.c
# CFPlugIn_Instance.c 
# CFPlugIn_PlugIn.c 
# CFRunloop.c
# CFSocket.c 
# CFUserNotification.c

LOCAL_SRC_FILES := \
CFApplicationPreferences.c \
CFArray.c \
CFBag.c \
CFBase.c \
CFBasicHash.c \
CFBigNumber.c \
CFBinaryHeap.c \
CFBinaryPList.c \
CFBitVector.c \
CFBuiltinConverters.c \
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
CFNumber.c \
CFNumberFormatter.c \
CFOldStylePList.c \
CFPlatform.c \
CFPlatformConverters.c \
CFPreferences.c \
CFPropertyList.c \
CFRuntime.c \
CFSet.c \
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

LOCAL_CFLAGS = -x c -fblocks -std=gnu99 -Wno-trigraphs -fexceptions -DCF_BUILDING_CF=1 -DDISABLE_GCD -include CoreFoundation_Prefix.h -nostdlibinc -I$(LOCAL_PATH)/../libBlocksRuntime  -I $(ICUROOT)/i18n -I $(ICUROOT)/common $(LOCAL_EXPORT_CFLAGS)

#note: not all flags from MakefileLinux have been ported over.
LOCAL_LDFLAGS = -fpic 

include $(JNIPATH)/clang-extras.mk

include $(BUILD_STATIC_LIBRARY)
