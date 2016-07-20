LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -fvisibility=hidden -DDEBUG
LOCAL_MODULE    := android-ndk-profiler
LOCAL_SRC_FILES := gnu_mcount.S prof.c read_maps.c
include $(BUILD_STATIC_LIBRARY)

####################################

include $(CLEAR_VARS)

LOCAL_MODULE := gprof_test.out
LOCAL_LDLIBS := -llog
LOCAL_SRC_FILES := main.c

LOCAL_C_INCLUDES :=

LOCAL_LDFLAGS := -O0 -pg -g -llog  -fPIC -pie

LOCAL_STATIC_LIBRARIES := android-ndk-profiler


LOCAL_CFLAGS := -fvisibility=hidden -DDEBUG \
				-O0 -pg -g -Wall -std=gnu99 \
				-fno-omit-frame-pointer

include $(BUILD_EXECUTABLE)
