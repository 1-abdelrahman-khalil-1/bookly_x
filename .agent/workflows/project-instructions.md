---
description: Comprehensive project instructions and Figma-to-Flutter conversion guide
---

# Bookly X Client - Project Instructions

## Project Overview

**Name**: bookly_x_client  
**Type**: Flutter Mobile Application  
**SDK Version**: ^3.5.0  
**State Management**: Riverpod (flutter_riverpod)
**Routing**: auto_route  
**Dependency Injection**: GetIt  
**Internationalization**: slang_flutter (English & Arabic)

## Project Structure

```
lib/
├── app/
│   ├── core/                    # Core application utilities
│   │   ├── api_helper/         # Dio, interceptors, endpoints
│   │   ├── constants/          # App constants and keys
│   │   ├── data/               # Preferences (user, lang, routing, etc.)
│   │   ├── di/                 # Dependency injection (GetIt service locator)
│   │   ├── enums/              # Application enums
│   │   ├── extensions/         # Context & utility extensions
│   │   ├── models/             # Shared models
│   │   ├── screens_not_related/# Error screens (no internet, server error)
│   │   ├── services/           # Core services
│   │   ├── styles/             # Box decorations, text field borders
│   │   ├── themes/             # AppColors, AppTheme
│   │   ├── utils/              # Utility functions
│   │   └── widgets/            # Reusable widgets
│   └── features/               # Feature modules
│       ├── client/
│       ├── common/             # Shared features (auth, forget password, etc.)
│       └── staff/
├── generated/                   # Auto-generated files
│   ├── assets.dart             # Asset references
│   ├── style_atoms.dart        # Text style atoms
│   └── translations.g.dart     # Translations
├── router/                      # Auto-route configuration
├── main.dart
└── bookly_x_client_app.dart
```

## Design System

### Colors (`lib/app/core/themes/app_colors.dart`)

The project uses a comprehensive color palette defined in `AppColors`:

**Primary Colors**:

- `primary`: #0E7BF8 (Blue)
- `primaryHover`: #FCEFF6
- `primaryLight`: #FF9868
- `primaryLightHover`: #DEE4F2
- `primaryLightActive`: #FFEEE6
- `primary2`: #2856AD

**Semantic Colors**:

- `secondary`, `secondaryLight`, `secondaryDark`
- `textMain` (#12161C), `textSub` (#8E8E8E), `textPlaceholder` (#C1C2C3)
- `danger` (#E92727), `dangerLight`
- `success` (#10B981), `successLight`
- `warning` (#F88F2D), `warningLight`

**Additional Colors**: 50+ named colors (alizarinCrimson, azureRadiance, dodgerBlue, etc.)

### Typography (`lib/generated/style_atoms.dart`)

The project uses **auto-generated text styles** via `generate_styles.dart`. DO NOT edit `style_atoms.dart` directly.

**Font Family**: Inter (weights: 300, 400, 500, 600, 700)

**Style Atoms System**:

```dart
// Weight atoms (on BuildContext)
context.light, context.regular, context.medium, context.semiBold, context.bold

// Size atoms (on TextStyle)
.px8, .px11, .px12, .px14, .px16, .px18, .px20, .px22, .px24, .px26, .px28, .px30, .px32, .px36, .px40

// Color atoms (on TextStyle)
.primary, .textMain, .textSub, .danger, .success, .warning, .white, .black, etc.

// Pre-combined atoms (BuildContext)
context.regular14TextSub
context.bold20Black
context.medium16Primary
// ... and many more combinations
```

**Usage Example**:

```dart
Text('Hello', style: context.bold20Primary)
Text('Subtitle', style: context.regular14TextSub)
Text('Custom', style: context.semiBold18.danger)
```

### Widgets

**Core Reusable Widgets** in `lib/app/core/widgets/`:

- `CustomTextFormField` - Standard text input with title, hint, prefix/suffix icons
- `CustomPasswordTextFormField` - Password field with visibility toggle
- `CustomButton` - Primary button component
- `CustomSizedBox` - Extension for spacing (e.g., `16.h`, `8.w`)
- `CustomAppBar` - Standard app bar
- `CustomDropList` - Dropdown selector
- `CustomDatePickerField` - Date picker
- `CustomPhoneNumber` - Phone number input
- `CustomRatingBar` - Star rating widget
- `CustomSearch` - Search field
- `AnimatedSnackbar` - Custom snackbar

**Button widgets** in `lib/app/core/widgets/buttons/`:

- `custom_button.dart`
- `custom_ink_well.dart`
- And others

### Spacing

Use the `CustomSizedBox` extension for consistent spacing:

```dart
8.h    // 8px vertical space
16.h   // 16px vertical space
24.h   // 24px vertical space
8.w    // 8px horizontal space
```

## Internationalization (i18n)

**Translation System**: slang_flutter

**Translation Files**:

- `assets/translations/en.json`
- `assets/translations/ar.json`

**Generated Code**: `lib/generated/translations.g.dart`

**Usage**:

```dart
import 'package:bookly_x_client/generated/translations.g.dart';

Text(tr.welcome)
Text(tr.enter)
Text(tr.password)
Text(tr.confirmPassword)
```

**Adding New Translations**:

Use the convenience script (handles both JSON files + runs slang automatically):

```bash
dart run tr.dart myNewKey        # adds a single key
dart run tr.dart key1; dart run tr.dart key2   # multiple keys separately
```

Or manually:

1. Add key-value to both `en.json` and `ar.json`
2. Run: `dart run slang`
3. Use via `tr.yourNewKey`

**IMPORTANT**: Never hardcode user-facing text. Always use translations via `tr.*`.

## Dependency Injection

**Framework**: GetIt 8.0.2

**Service Locator**: `lib/app/core/di/service_locator.dart`

**Setup**: The service locator is initialized in `main.dart` during the `boot()` function.

**Usage**:

```dart
import 'package:bookly_x_client/app/core/di/service_locator.dart';

// Access registered dependencies
final cubit = getIt<MainCubit>();

// Use with BlocProvider.value for singletons
BlocProvider.value(
  value: getIt<MainCubit>(),
  child: ...,
)
```

**Registering Dependencies**:

Add new dependencies to `setupServiceLocator()` in `service_locator.dart`:

```dart
void setupServiceLocator() {
  // Lazy singleton - created on first use, lives for app lifecycle
  getIt.registerLazySingleton<MainCubit>(() => MainCubit());

  // Factory - creates new instance every time
  getIt.registerFactory<SomeService>(() => SomeService());

  // Singleton - created immediately
  getIt.registerSingleton<ApiClient>(ApiClient());
}
```

**Patterns**:

- Use `registerLazySingleton` for cubits/blocs that should persist across screens
- Use `registerFactory` for services/repositories that should be created fresh each time
- Use `registerSingleton` for services that need immediate initialization
- Access dependencies via `getIt<Type>()`
- When using with BlocProvider, use `BlocProvider.value(value: getIt<Cubit>())` for singletons

## State Management

**Framework**: Riverpod (flutter_riverpod)

### Core Principles

1. **`FutureProvider`** — for async data fetching. Handles loading/error/data states automatically.
2. **`FutureProvider.family`** — for async data that depends on a parameter (e.g. filtered lists).
3. **`StateProvider`** — for simple mutable state (tab index, selected category ID, toggles).
4. **`StateNotifier` + `InternetErrorHandlerMixin`** — for complex multi-step or mutation flows.
5. **`ref.watchWhen()`** — the preferred UI entry point for `FutureProvider`. Automatically shows shimmer on loading, `NoInternetScreen` or `ServerErrorScreen` on error.

### ref.watchWhen() Extension

Defined in `lib/app/core/screens_not_related/future_provider_screen.dart`. Wraps `watch(provider).when(...)` with automatic error routing:

```dart
ref.watchWhen(
  provider: offersFutureProvider,
  loading: () => const OffersShimmer(),   // custom shimmer per section
  data: (offers) => OffersList(offers: offers),
)
```

### Provider Patterns

```dart
// Async data (auto-cached, refreshable with ref.invalidate)
final offersFutureProvider = FutureProvider<List<OfferModel>>((ref) async {
  return repo.getOffers();
});

// Async data with a parameter (e.g. filtered by category)
final providersFutureProvider =
    FutureProvider.family<List<ProviderModel>, String>((ref, categoryId) async {
  return repo.getProviders(categoryId: categoryId);
});

// Simple mutable state
final selectedCategoryProvider = StateProvider<String>((ref) => '1');
final selectedTabProvider = StateProvider<int>((ref) => 0);
```

### UI Pattern — ConsumerWidget

```dart
class MyScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read simple state
    final selectedCategory = ref.watch(selectedCategoryProvider);

    // Watch async data with shimmer + error handling
    return ref.watchWhen(
      provider: providersFutureProvider(selectedCategory),
      loading: () => const ProvidersShimmer(),
      data: (providers) => ProvidersList(providers: providers),
    );
  }
}
```

### Pull-to-Refresh

Invalidate the provider to re-fetch:

```dart
RefreshIndicator(
  onRefresh: () async {
    ref.invalidate(offersFutureProvider);
    ref.invalidate(providersFutureProvider(ref.read(selectedCategoryProvider)));
  },
  child: ...,
)
```

### StateNotifier (for complex mutation flows)

For flows with multiple steps or optimistic updates, use `StateNotifier<GeneralState<T>>` + `InternetErrorHandlerMixin`:

```dart
class MyNotifier extends StateNotifier<GeneralState<MyModel>>
    with InternetErrorHandlerMixin<MyModel> {
  MyNotifier() : super(GeneralState.loading());

  Future<void> doSomething() => execute(() => repo.doSomething());
}

final myProvider =
    StateNotifierProvider<MyNotifier, GeneralState<MyModel>>(
  (_) => MyNotifier(),
);
```

### Rules

- **ALWAYS** write a per-section shimmer widget (e.g. `OffersShimmer`, `ProvidersShimmer`).
- **ALWAYS** pass the shimmer to `ref.watchWhen(loading: () => const XShimmer())`.
- **NEVER** use `flutter_bloc` or `Cubit` — the project is fully Riverpod.
- **NEVER** use global `CircularProgressIndicator` for a section that has its own data — use a shimmer.
- **Error handling**: `ref.watchWhen` automatically handles `NoInternetConnection` → `NoInternetScreen` and other errors → `ServerErrorScreen`.

## Routing

**Framework**: auto_route 10.2.0

**Router Configuration**: `lib/router/`

**Navigation**:

```dart
context.router.push(ScreenRoute())
context.router.pop()
```

## API & Network

**HTTP Client**: Dio 5.4.0

**Configuration**: `lib/app/core/api_helper/`

- `dio_client.dart` - Dio instance setup
- `endpoints.dart` - API endpoints
- `handle_errors_response.dart` - Error handling
- `logout_interceptor.dart` - Auto logout on 401

**Error Handling**:

- Use `NoInternetScreen` for connection errors
- Use `ServerErrorScreen` for server errors
- Follow global error handling pattern from HomeScreen

## Code Style & Conventions

### File Naming

- Use snake_case for file names: `set_new_password_section.dart`
- Match class name to file name

### Code Organization

1. Imports (package imports first, then relative imports)
2. Class definition
3. Constructor
4. Properties
5. Lifecycle methods
6. Build method
7. Helper methods

### Widget Structure

```dart
class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.param});

  final String param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: tr.title),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tr.heading, style: context.bold20Black),
            8.h,
            Text(tr.subtitle, style: context.regular16TextSub),
            // ... more widgets
          ],
        ),
      ),
    );
  }
}
```

### Forms

- Always use `Form` widget with `GlobalKey<FormState>`
- Validate before submission
- Use `CustomTextFormField` for consistency
- Handle loading states (disable buttons during submission)

---

## FIGMA TO FLUTTER CONVERSION GUIDE

### Step 1: Analyze the Figma Design

Before writing any code:

1. **Identify the layout structure**:
   - Is it a Column, Row, Stack, or ListView?
   - What are the spacing values?
   - Are there scrollable sections?

2. **Extract design tokens**:
   - **Colors**: Map to `AppColors` constants
   - **Typography**: Map to style atoms (e.g., `context.bold20Primary`)
   - **Spacing**: Use `8.h`, `16.h`, `24.h` etc.
   - **Border radius**: Note values for `BorderRadius.circular(...)`

3. **Identify components**:
   - Can you use existing widgets (`CustomTextFormField`, `CustomButton`)?
   - Do you need to create new reusable components?

4. **Check for interactions**:
   - Buttons → `CustomButton` with `onPress`
   - Text fields → `CustomTextFormField`
   - Dropdowns → `CustomDropList`
   - Date pickers → `CustomDatePickerField`

### Step 2: Map Figma Properties to Flutter

| Figma Property                         | Flutter Equivalent                                                               |
| -------------------------------------- | -------------------------------------------------------------------------------- |
| **Frame/Auto Layout → Column**         | `Column(children: [...])`                                                        |
| **Frame/Auto Layout → Row**            | `Row(children: [...])`                                                           |
| **Spacing (vertical)**                 | `16.h` (use CustomSizedBox)                                                      |
| **Spacing (horizontal)**               | `16.w`                                                                           |
| **Padding**                            | `Padding(padding: EdgeInsets.all(16))`                                           |
| **Fill color**                         | `Container(color: AppColors.primary)` or `decoration: BoxDecoration(color: ...)` |
| **Border**                             | `decoration: BoxDecoration(border: Border.all(color: AppColors.textBorders))`    |
| **Border radius**                      | `borderRadius: BorderRadius.circular(8)`                                         |
| **Shadow**                             | `boxShadow: [BoxShadow(...)]`                                                    |
| **Text → Font size 20, Bold**          | `style: context.bold20Black`                                                     |
| **Text → Font size 14, Regular, Gray** | `style: context.regular14TextSub`                                                |

### Step 3: Color Mapping

When you see a color in Figma:

1. **Check if it exists in `AppColors`**:
   - Primary blue → `AppColors.primary`
   - Main text → `AppColors.textMain`
   - Subtitle/gray text → `AppColors.textSub`
   - Placeholder text → `AppColors.textPlaceholder`
   - Borders → `AppColors.textBorders`
   - Danger/error → `AppColors.danger`
   - Success → `AppColors.success`
   - Warning → `AppColors.warning`

2. **If color doesn't exist**:
   - Add it to `lib/app/core/themes/app_colors.dart`
   - Run `dart run generate_styles.dart` to update style atoms
   - Then use the new color

### Step 4: Typography Mapping

For each text element in Figma:

1. **Identify**: Font weight, size, and color
2. **Map to style atoms**:
   - **Weight**: light, regular, medium, semiBold, bold
   - **Size**: 8, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 36, 40
   - **Color**: primary, textMain, textSub, danger, success, warning, white, black, etc.

3. **Use pre-combined atoms when available**:

   ```dart
   // Instead of: context.bold.px20.black
   // Use: context.bold20Black
   ```

4. **For custom combinations**:
   ```dart
   Text('Warning', style: context.semiBold16.warning)
   ```

### Step 5: Component Conversion

#### Text Input Fields

**Figma**: Text input with label, placeholder, optional icon

**Flutter**:

```dart
CustomTextFormField(
  title: tr.email,
  hint: tr.enterYourEmail,
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  validator: (value) => value?.isEmpty ?? true ? tr.fieldRequired : null,
)
```

#### Buttons

**Figma**: Primary button with text

**Flutter**:

```dart
CustomButton(
  title: tr.submit,
  onPress: () {
    // Handle press
  },
)
```

#### Cards/Containers

**Figma**: Container with background, border, shadow

**Flutter**:

```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: AppColors.textBorders),
    boxShadow: [
      BoxShadow(
        color: AppColors.boxShadow.withOpacity(0.1),
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Column(
    children: [
      // Content
    ],
  ),
)
```

### Step 6: Layout Structure

#### Column Layout

**Figma**: Vertical auto-layout

**Flutter**:

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start, // align-items
  mainAxisAlignment: MainAxisAlignment.start,    // justify-content
  children: [
    Text(tr.title, style: context.bold20Black),
    8.h,  // Spacing
    Text(tr.subtitle, style: context.regular14TextSub),
    16.h,
    CustomTextFormField(title: tr.name),
  ],
)
```

#### Row Layout

**Figma**: Horizontal auto-layout

**Flutter**:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(tr.label, style: context.regular14TextMain),
    Icon(Icons.arrow_forward, color: AppColors.primary),
  ],
)
```

#### Scrollable Content

**Figma**: Frame with scrolling

**Flutter**:

```dart
SingleChildScrollView(
  child: Column(
    children: [
      // Content
    ],
  ),
)

// Or for lists:
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(...);
  },
)
```

### Step 7: Spacing & Padding

**Extract spacing from Figma**:

- Auto-layout gap/spacing → Use `8.h`, `16.h`, `24.h` between children
- Padding → Use `EdgeInsets.all(16)` or `EdgeInsets.symmetric(horizontal: 16, vertical: 8)`

**Standard spacing values** in this project:

- 8px - Small gaps
- 16px - Medium gaps, default padding
- 24px - Large gaps
- 32px+ - Extra large sections

### Step 8: Handle Special Cases

#### Images

```dart
// SVG images
SvgPicture.asset(
  'assets/svg/logo.svg',
  width: 100,
  height: 100,
  colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
)

// Network images — ALWAYS use CustomCachedNetworkImage, never raw CachedNetworkImage
CustomCachedNetworkImage(
  imgUrl: imageUrl,
  width: 100,
  height: 100,
)
```

#### Icons

```dart
// Material icons
Icon(Icons.check_circle, color: AppColors.success, size: 24)

// Font Awesome (if needed)
FaIcon(FontAwesomeIcons.heart, color: AppColors.danger)
```

#### Bottom Sheets

```dart
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (context) => Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Content
      ],
    ),
  ),
)
```

### Step 9: Complete Example

**Figma Design**: Login screen with logo, title, subtitle, email field, password field, button

**Flutter Implementation**:

```dart
import 'package:bookly_x_client/app/core/widgets/custom_text_form_field.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo
                      Center(
                        child: SvgPicture.asset(
                          'assets/svg/logo.svg',
                          height: 80,
                        ),
                      ),
                      32.h,

                      // Title
                      Text(tr.welcomeBack, style: context.bold24Black),
                      8.h,

                      // Subtitle
                      Text(
                        tr.pleaseSignInToContinue,
                        style: context.regular16TextSub,
                      ),
                      24.h,

                      // Email field
                      CustomTextFormField(
                        title: tr.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      16.h,

                      // Password field
                      CustomPasswordTextFormField(
                        title: tr.password,
                      ),
                    ],
                  ),
                ),
              ),

              // Submit button
              CustomButton(
                title: tr.signIn,
                onPress: () {
                  // Handle login
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Step 10: Validation Checklist

Before finalizing your Figma-to-Flutter conversion:

- [ ] All colors use `AppColors` constants (no `Color(0xFFXXXXXX)` hardcoded values!)
- [ ] All text styles use style atoms (`context.bold20Primary`, etc.)
- [ ] All spacing uses `CustomSizedBox` extensions (`8.h`, `16.w`)
- [ ] All user-facing text uses translations (`tr.*`)
- [ ] All text inputs use `CustomTextFormField` or variants
- [ ] All buttons use `CustomButton` or similar
- [ ] All network images use `CustomCachedNetworkImage` (not raw `CachedNetworkImage`)
- [ ] Models are placed in `data/models/` inside the feature folder — never inline inside widget files
- [ ] Layout matches Figma design (spacing, alignment, sizing)
- [ ] Responsive to different screen sizes (use `MediaQuery` if needed)
- [ ] Scrollable sections use `SingleChildScrollView` or `ListView`
- [ ] Forms have proper validation
- [ ] Loading states are handled
- [ ] Error states are handled

---

## Common Commands

```bash
# Generate code (routes, riverpod providers, translations)
dart run build_runner build --delete-conflicting-outputs

# Watch for changes (auto-regenerate)
dart run build_runner watch --delete-conflicting-outputs

# Generate style atoms (after modifying AppColors)
dart run generate_styles.dart

# Generate translations (after modifying en.json/ar.json)
dart run slang

# Run app
flutter run

# Build APK
flutter build apk

# Run tests
flutter test
```

---

## Important Notes

1. **Never hardcode text** - Always use `tr.*` for translations
2. **Never hardcode colors** - Always use `AppColors.*` constants. **CRITICAL**: Do NOT use inline color values like `Color(0xFF648DDB)` or `.copyWith(color: Color(0xFF989898))`. If you need a specific color, search AppColors for the closest match first. If no match exists, add it to AppColors, then use the constant.
3. **Never edit `style_atoms.dart`** - It's auto-generated; edit `generate_styles.dart` instead
4. **Use existing widgets** - Check `lib/app/core/widgets/` before creating new ones
5. **State management** — Use Riverpod exclusively (`FutureProvider`, `StateProvider`, `StateNotifier`). Do NOT use `flutter_bloc` or `Cubit`.
6. **Handle async states** - Use `RequestStatus` enum for loading/success/failure per section
7. **Validate forms** - Always validate user input before submission
8. **Use const constructors** - For better performance
9. **Follow naming conventions** - snake_case for files, PascalCase for classes
10. **Keep widgets small** - Extract into smaller widgets for readability
11. **Font size handling** - If a specific font size style doesn't exist (e.g., `regular10White`), use the next available size instead (e.g., `regular11White`). DO NOT use `.copyWith(fontSize: X)` - always use predefined style atoms.
12. **Never add height to text styles** - DO NOT use `.copyWith(height: X)` or `TextStyle(height: X)` as it causes text overflow issues. Style atoms already have proper line heights.
13. **Never hardcode font family** - DO NOT use `TextStyle(fontFamily: 'FontName')`. Always use style atoms from `context.*` which already include the correct font family (Inter).
14. **Use project utilities** - For dialogs use `context.showCustomDialog(content: ...)`, for bottom sheets use `context.showBottomSheet(bottomSheetBody: ...)`, for snackbars use functions from `show_message.dart` (`setSuccessfullyMessage()`, `setErrorMessage()`, `setWarningMessage()`). DO NOT use raw `showDialog()`, `showModalBottomSheet()`, or `ScaffoldMessenger`.
15. **Use DateTime extensions** - Always use `date_time_extensions.dart` for date formatting. Use `.formattedDate`, `.formattedTime`, `.isToday`, `.isYesterday`, `.isOlder` for consistent date display across the app.

16. **Use Enums** - Whenever you have a type or status field (e.g., `NotificationType`, `BookingStatus`), ALWAYS create an `Enum` for it. Do not use Strings or Integers.
17. **Use MyIcons** - Always use icons from `MyIcons` class (e.g., `MyIcons.calendarBold`). Do not use `Icons` class unless absolutely necessary and `MyIcons` does not have an equivalent.
18. **Models placement** - Feature-specific model classes MUST live in `lib/app/features/<role>/<feature>/data/models/`. NEVER define model classes inline inside widget or screen files.
19. **Use CustomCachedNetworkImage** - Always use `CustomCachedNetworkImage` from `lib/app/core/widgets/images/` for network images. Never use raw `CachedNetworkImage`.
20. **Use tr.dart for translations** - When adding new translation keys, prefer `dart run tr.dart <camelCaseKey>` — it auto-translates into both `en.json` and `ar.json` and runs `slang` for you. Run each key as a separate command.
