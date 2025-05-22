include environments.mk
include builds.mk

lint:
	dart fix --apply
	dart format .
	flutter analyze

cocoa:
	rm -rf ios/Podfile.lock
	cd ios && pod repo update
	cd ios && pod install

runner:
	dart run build_runner build
