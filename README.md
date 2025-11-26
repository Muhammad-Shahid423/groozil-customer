# Groozil Customer App

A modern, feature-rich Flutter mobile application for customers to browse and purchase products from the Groozil e-commerce platform. Built with Clean Architecture principles and state-of-the-art Flutter packages.

## 📱 Overview

Groozil is a customer-facing mobile application that provides a seamless shopping experience with multilingual support (Arabic/English), secure authentication, modern UI/UX design inspired by leading food delivery apps, and intuitive address management with Google Maps integration.

## ✨ Features

### Authentication & Onboarding
- **Onboarding Flow**: Interactive 4-screen onboarding with modern white card design
- **Multiple Auth Methods**: 
  - Phone number authentication with OTP
  - Email authentication with OTP
  - Social login (Google & Apple)
- **Profile Completion**: Collect user details after authentication
- **Secure Storage**: Token management with flutter_secure_storage

### Address Management 🆕
- **Professional UX Flow**: Map-first address selection
- **Interactive Map Picker**: 
  - Fullscreen Google Maps with center pin
  - Real-time geocoding on map movement
  - Location search with autocomplete
  - "Use Current Location" FAB
  - Bottom sheet showing address details
- **Address Details Form**:
  - Location summary card with "Change" button
  - Smart form prefilling from map selection
  - Support for Home/Work/Office/Other labels
  - Building, floor, apartment details
  - Additional directions field
- **Address Management**:
  - View all saved addresses
  - Set default address
  - Edit existing addresses
  - Delete addresses
  - Address selection from bottom sheet

### Product Browsing
- **Home Screen**: Featured products, categories, special offers
- **Featured Products Screen**: Grid view of all featured products
- **Product Details**: Full product information with images
- **Wishlist**: Save favorite products for later
- **Search & Filter**: Find products easily

### Shopping Experience
- **Product Cards**: Consistent design with images, prices, and quick actions
- **Add to Cart**: Quick add from any screen
- **Wishlist Toggle**: Heart icon to save favorites
- **Grid/List Views**: Flexible product display

### UI/UX Design
- **Modern Design Pattern**: Split-screen layout with logo on background + elevated white card
- **Responsive Design**: flutter_screenutil integration for all screen sizes
- **Multilingual Support**: Arabic and English with easy_localization
- **Custom Theme**: Cairo font family with light/dark mode support
- **Consistent Styling**: Reusable widgets and theme extensions
- **Professional Navigation**: Bottom navigation with shell routing
- **Loading States**: Shimmer effects for better UX

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
│   │   ├── map_service.dart    # Google Maps & geocoding utilities
│   │   └── storage/            # Storage services
│   ├── usecases/           # Base use case classes
│   └── utils/              # Utility classes
│       ├── data_checker.dart   # Static validation utilities
│       └── parser.dart         # Safe parsing utilities
├── features/               # Feature modules
│   ├── auth/              # Authentication feature
│   │   ├── data/          # Data sources, models, repositories
│   │   ├── domain/        # Entities, repositories, use cases
│   │   └── presentation/  # Screens, widgets, state management
│   ├── address/           # Address management feature 🆕
│   │   ├── data/          # Address data layer
│   │   ├── domain/        # Address entities & use cases
│   │   └── presentation/  # Address screens & widgets
│   │       ├── screens/
│   │       │   ├── addresses_screen.dart           # List all addresses
│   │       │   ├── add_edit_address_screen.dart    # Add/Edit with form
│   │       │   └── map_location_picker_screen.dart # Interactive map picker
│   │       └── widgets/
│   │           ├── address_bottom_sheet.dart       # Address selection
│   │           ├── address_card.dart               # Address display card
│   │           └── address_item.dart               # List item
│   ├── home/              # Home screen with featured products
│   │   └── presentation/
│   │       └── screens/
│   │           └── featured_products_screen.dart   # All featured products 🆕
│   ├── wishlist/          # Wishlist feature
│   ├── product_details/   # Product details
│   └── onboarding/        # Onboarding feature
│       ├── data/
│       ├── domain/
│       └── presentation/
├── shared/                 # Shared UI components
│   ├── providers/         # Riverpod providers
│   ├── screens/           # Shared screens
│   ├── theme/             # App theming
│   └── widgets/           # Reusable widgets
│       ├── app_image.dart # Universal image widget (network/asset/file/SVG)
│       └── product/       # Product-related widgets
│           └── product_card.dart  # Reusable product card
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

### Maps & Location 🆕
- **google_maps_flutter**: Interactive Google Maps
- **geolocator**: Location services & permissions
- **geocoding**: Reverse geocoding (coordinates to address)

### UI & Styling
- **flutter_screenutil**: Responsive design (.w, .h extensions)
- **flutter_svg**: SVG image support
- **shimmer**: Loading placeholders
- **pinput**: OTP input fields
- **go_router**: Declarative routing with deep linking

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

### Home & Products
- **Home Screen**: Featured products carousel, categories, special offers
- **Featured Products Screen**: Grid view of all featured products with "View All" navigation
- **Product Details**: Full product information, images, add to cart, wishlist
- **Wishlist Screen**: Grid view of saved favorite products

### Address Management 🆕
1. **Address Bottom Sheet**: Quick address selection from home/checkout
   - Small preview map
   - "Locate Me" button - opens map picker with current location
   - "New Address" button - opens map picker for location selection
   - List of saved addresses with edit/delete options
   - Set default address

2. **Map Location Picker Screen**: Professional map-first selection (Talabat/Keeta style)
   - Fullscreen Google Maps
   - Fixed center pin (map moves underneath)
   - Real-time address geocoding on camera movement
   - Search bar with location autocomplete (up to 5 results)
   - "Use Current Location" FAB on right side
   - Bottom address card showing:
     - Location icon
     - Address title (street/building name)
     - Address subtitle (district, city)
     - "Confirm Location" button
   - Returns: `{latitude, longitude, shortAddress, fullAddress}`

3. **Add/Edit Address Screen**: Detailed address form
   - Location summary card at top:
     - Location icon + address preview
     - "Change" button to reopen map picker
   - Form fields:
     - Label selector (Home/Work/Office/Hotel/Other)
     - Street (auto-filled from map)
     - District (auto-filled from map)
     - City (auto-filled from map)
     - Building name/number (required)
     - Floor number (optional)
     - Apartment number (required)
     - Additional directions (optional)
     - "Set as Default" checkbox
   - Save button
   - Smart initialization:
     - Edit mode: prefills all fields
     - From map picker: prefills location fields
     - New address: uses current location

4. **Addresses Screen**: Manage all saved addresses
   - List view of all addresses
   - Each address shows: label, full address, default badge
   - Edit/Delete actions
   - Add new address button

### Navigation
- **Bottom Navigation Bar**: Home, Shop, Orders, Profile
- **Shell Routing**: Persistent bottom bar across main screens
- **Deep Linking Support**: Handle external links

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

**Important - Location Permissions**: After cloning or modifying location permission settings:
1. Uninstall any existing app from device/simulator
2. Run `flutter clean`
3. Reinstall with `flutter run`

iOS caches permission settings, so changes to `Info.plist` won't take effect without a fresh install.

## 🔧 Configuration

### Google Maps Setup (iOS & Android)
1. **Get API Keys**: Create project in [Google Cloud Console](https://console.cloud.google.com/)
2. **Enable APIs**: Maps SDK for Android, Maps SDK for iOS, Places API, Geocoding API
3. **Android Configuration**:
   - Add key to `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_API_KEY_HERE"/>
   ```
4. **iOS Configuration**:
   - Add key to `ios/Runner/AppDelegate.swift`:
   ```swift
   GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
   ```

### Firebase Setup
1. Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
2. Configure Firebase project for:
   - Authentication (Phone, Email, Google, Apple)
   - Cloud Firestore
   - Cloud Messaging (push notifications)
   - Analytics

### Environment Variables
The app uses different environments (dev/staging/prod) with separate API endpoints and configurations.

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

## � Recent Updates

### Address Management System (Latest)
Complete redesign of address selection flow to match professional food delivery apps (Talabat/Keeta):
- ✅ Map-first selection with center pin and real-time geocoding
- ✅ Search bar with location autocomplete
- ✅ Professional UI with bottom address confirmation card
- ✅ Smart address form with location summary
- ✅ Fixed iOS location permission issues
- ✅ Enhanced address bottom sheet with new flow

See `ADDRESS_UX_REFACTOR_SUMMARY.md` and `LOCATION_PERMISSION_FIX.md` for detailed documentation.

### Featured Products Screen (Latest)
- ✅ New dedicated screen for viewing all featured products
- ✅ Grid layout matching wishlist screen design
- ✅ "View All" navigation from home featured section
- ✅ Loading, error, and empty states

See `FEATURED_PRODUCTS_SCREEN.md` for implementation details.

### Wishlist Feature
- ✅ Complete wishlist implementation with local storage
- ✅ Add/remove products from wishlist
- ✅ Dedicated wishlist screen with grid view
- ✅ Heart icon toggle on product cards

See `WISHLIST_IMPLEMENTATION.md` for full documentation.

## �📄 License

This project is proprietary and confidential.

## 👥 Contact

For questions or support, please contact the development team.

---

**Built with ❤️ using Flutter**
