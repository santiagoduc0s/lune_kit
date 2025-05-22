build-ios-prod:
	make prod
	flutter build ios --release --flavor production --target lib/main_production.dart --dart-define-from-file env.json

build-ios-prod-ipa:
	make prod
	flutter build ipa --obfuscate --split-debug-info  --release --flavor production --target lib/main_production.dart --dart-define-from-file env.json

build-android-prod:
	make prod
	flutter build appbundle --flavor production --target lib/main_production.dart --dart-define-from-file env.json