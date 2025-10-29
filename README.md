# Groozil Customer App

A modern, feature-rich Flutter mobile application for customers to browse and purchase products from the Groozil e-commerce platform. Built with Clean Architecture principles and state-of-the-art Flutter packages.

## 📱 Overview

Groozil is a customer-facing mobile application that provides a seamless shopping experience with multilingual support (Arabic/English), secure authentication, and a modern, responsive UI design.

## ✨ Features

### Authentication & Onboarding
- **Onboarding Flow**: Interactive 4-screen onboarding with modern white card design
- **Multiple Auth Methods**: 
  - Phone number authentication with OTP
  - Email authentication with OTP
  - Social login (Google & Apple)
- **Profile Completion**: Collect user details after authentication
- **Secure Storage**: Token management with flutter_secure_storage

### UI/UX Design
- **Modern Design Pattern**: Split-screen layout with logo on background + elevated white card
- **Responsive Design**: flutter_screenutil integration for all screen sizes
- **Multilingual Support**: Arabic and English with easy_localization
- **Custom Theme**: Cairo font family with light/dark mode support
- **Consistent Styling**: Reusable widgets and theme extensions

## 🏗️ Architecture

The project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                    # Core utilities and shared functionality
│   ├── constants/          # App-wide constants
│   ├── di/                 # Dependency injection setup
│   ├── errors/             # Error handling
│   ├── extensions/         # Dart extensions
│   │   └── type_checkers.dart  # Null-safe type checking extensions
│   ├── network/            # Network layer (Dio, interceptors)
│   ├── routing/            # Navigation and routing
│   ├── services/           # Core services
│   ├── usecases/           # Base use case classes
│   └── utils/              # Utility classes
│       ├── data_checker.dart   # Static validation utilities
│       └── parser.dart         # Safe parsing utilities
├── features/               # Feature modules
│   ├── auth/              # Authentication feature
│   │   ├── data/          # Data sources, models, repositories
│   │   ├── domain/        # Entities, repositories, use cases
│   │   └── presentation/  # Screens, widgets, state management
│   └── onboarding/        # Onboarding feature
│       ├── data/
│       ├── domain/
│       └── presentation/
├── shared/                 # Shared UI components
│   ├── providers/         # Riverpod providers
│   ├── screens/           # Shared screens
│   ├── theme/             # App theming
│   └── widgets/           # Reusable widgets
│       └── app_image.dart # Universal image widget (network/asset/file/SVG)
├── generated/             # Generated code (localization)
├── app.dart              # App widget
└── main.dart             # Entry point
```

## 🛠️ Tech Stack

### Core
- **Flutter SDK**: Latest stable version
- **Dart**: Null-safety enabled

### State Management
- **Riverpod**: Modern reactive state management

### Network & Storage
- **Dio**: HTTP client with interceptors
- **flutter_secure_storage**: Secure token storage
- **cached_network_image**: Image caching

### UI & Styling
- **flutter_screenutil**: Responsive design (.w, .h extensions)
- **flutter_svg**: SVG image support
- **shimmer**: Loading placeholders
- **pinput**: OTP input fields

### Localization
- **easy_localization**: Internationalization (ar/en)

### Code Generation
- **freezed**: Immutable models
- **json_serializable**: JSON serialization
- **build_runner**: Code generation

## 📦 Key Utilities

### Type Checkers (`lib/core/extensions/type_checkers.dart`)
Null-safe extension methods for common types:

```dart
String? name = null;
name.isNullOrEmpty; // true
name.hasValue; // false

int? age = 25;
age.isPositive; // true

List<String>? items = [];
items.isNullOrEmpty; // true
```

### Data Checker (`lib/core/utils/data_checker.dart`)
Static validation utilities:

```dart
DataChecker.isEmpty(value);
DataChecker.isEmail("test@example.com");
DataChecker.isPhone("+966501234567");
DataChecker.isUrl("https://example.com");
DataChecker.isPast(DateTime.now().subtract(Duration(days: 1)));
```

### Parser (`lib/core/utils/parser.dart`)
Safe parsing and conversion:

```dart
Parser.toInt("123"); // 123
Parser.toDouble("45.67"); // 45.67
Parser.toBool("true"); // true
Parser.toCurrency(1234.56); // "1,234.56"
Parser.formatPhoneNumber("+966501234567"); // "+966 50 123 4567"
```

### AppImage Widget (`lib/shared/widgets/app_image.dart`)
Universal image widget supporting:
- Network images (raster & SVG)
- Asset images (raster & SVG)
- File images
- Automatic fallback and error handling
- Shimmer loading effect
- Responsive dimensions with flutter_screenutil

```dart
AppImage.network(
  url: imageUrl,
  width: 200,
  height: 200,
  fit: BoxFit.cover,
);

AppImage.svg(
  assetPath: AppAssets.icons.appIcon,
  width: 48,
  height: 48,
);
```

## 🎨 Design System

### Color Palette
Defined in `lib/shared/theme/app_colors.dart` with light/dark mode support

### Typography
Cairo font family with weights: Light, Regular, Medium, SemiBold, Bold

### Spacing & Dimensions
Consistent spacing system using responsive units (.w, .h)

### Common UI Patterns
- **White Card Design**: Elevated bottom card with rounded top corners
- **SafeArea Management**: Selective top/bottom safe area handling
- **Split Layouts**: Flexible ratio-based screen divisions (40/60, 30/70, etc.)

## 📱 Screens

### Onboarding
- 4-page interactive onboarding
- PageView with dot indicators
- 60/40 split (content/actions)
- White elevated card for navigation buttons

### Authentication
1. **Auth Options Screen**: Choose login method (phone/email/social)
2. **Phone Login Screen**: Enter phone number with country code
3. **Email Login Screen**: Enter email address
4. **OTP Verification Screen**: 6-digit OTP input with resend timer
5. **Complete Profile Screen**: Collect user details (name + phone/email)

All auth screens follow consistent design:
- Logo + app name on background (top section)
- White rounded card with form/content (bottom section)
- No traditional app bar
- Responsive flex ratios

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable)
- Dart SDK
- iOS development: Xcode, CocoaPods
- Android development: Android Studio, Android SDK

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/Muhammad-Shahid423/groozil-customer.git
cd groozil_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run code generation**
```bash
dart run build_runner build --delete-conflicting-outputs
```

4. **Run the app**
```bash
# Development mode
flutter run

# With hot reload
flutter run --hot

# Release mode
flutter run --release
```

### iOS Setup
```bash
cd ios
pod install
cd ..
```

## 📝 Code Generation

The project uses code generation for:
- Freezed models
- JSON serialization
- Localization keys

**Generate code:**
```bash
dart run build_runner build --delete-conflicting-outputs
```

**Watch mode (auto-generate on file changes):**
```bash
dart run build_runner watch --delete-conflicting-outputs
```

## 🌐 Localization

Translations are stored in `assets/translations/`:
- `en.json` - English
- `ar.json` - Arabic

Generated keys are in `lib/generated/locale_keys.g.dart`

**Usage:**
```dart
Text(LocaleKeys.onboarding_title_1.tr())
```

## 📂 Assets

### Images
- `assets/images/` - PNG/JPG images (onboarding, placeholders, backgrounds)

### Icons
- `assets/icons/` - App icon and custom icons

### SVGs
- `assets/svgs/` - SVG icons (Google, Apple, etc.)

### Fonts
- `assets/fonts/` - Cairo font family (5 weights)

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## 🔧 Configuration Files

- `pubspec.yaml` - Dependencies and assets
- `analysis_options.yaml` - Linting rules
- `devtools_options.yaml` - DevTools settings

## 📄 License

This project is proprietary and confidential.

## 👥 Contact

For questions or support, please contact the development team.

---

**Built with ❤️ using Flutter**
