.PHONY: run_debug run_publish

run_debug:
	@flutter run -d chrome -t lib/main.dart

run_publish:
	@flutter pub publish 