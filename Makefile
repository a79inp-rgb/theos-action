DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = asdhackPUBG
AbdurhmanPUBG_FILES = Tweak.xm
AbdurhmanPUBG_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

