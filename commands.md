# 1. Get dependencies
flutter pub get

# 2. Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Generate translations
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart

# 4. Run app
flutter run

# 5. Run tests
flutter test

# 6. Build APK (Android)
flutter build apk --release

# 7. Build IPA (iOS)
flutter build ios --release

# 8. Analyze code
flutter analyze

# 9. Format code
flutter format lib/