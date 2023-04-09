.PHONY: all engine-ios engine-ios-sim

all:
	@echo "Use \"engine-ios\" or \"engine-ios-sim\" parameters"

engine-ios:
	@cd ./engine && make ios

engine-ios-sim:
	@cd ./engine && make ios-sim
