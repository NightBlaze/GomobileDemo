.PHONY: all ios ios-sim ios-bind bind clear

BIND_PACKAGES=./
GOMOBILE_FLAGS=

IOS_API=-iosversion 14.0
OUT_IOS=../ios/GomobileDemo/Frameworks/Engine.xcframework

TARGET=
OUT=
OUT_ASSETS=
TARGET_VER=

all:
	@echo "Use \"ios\" or \"ios-sim\" parameters"

ios: TARGET=ios
ios: ios-bind

ios-sim: TARGET=iossimulator
ios-sim: ios-bind

ios-bind: OUT=$(OUT_IOS)
ios-bind: TARGET_VER=$(IOS_API)
ios-bind: bind

bind: clear
bind:
	@echo "Building..."
	gomobile bind -target $(TARGET) $(TARGET_VER) -o=$(OUT) $(GOMOBILE_FLAGS) $(BIND_PACKAGES)
	@echo "Done!"

clear:
	@echo "Clearing..."
	@rm -drf $(OUT)
