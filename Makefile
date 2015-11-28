.SILENT:
.PHONY: all check_bii configure-release configure-debug configure-coverage build test clean
default: all

all: test

bii:
	bii init -L

find: bii
	bii find

configure-release: find
	bii cpp:configure -DCMAKE_BUILD_TYPE=RELEASE

configure-debug: find
	bii cpp:configure -DCMAKE_BUILD_TYPE=DEBUG

configure-coverage: find
	bii cpp:configure -DCMAKE_BUILD_TYPE=DEBUG -DFRACKPARITY_COVERAGE=ON

build: configure-release
	bii build

test: configure-debug
	bii test

coverage: configure-coverage
	bii build --target coverage -- -s

clean: bii
	bii clean
