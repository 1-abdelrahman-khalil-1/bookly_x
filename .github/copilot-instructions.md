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
**Internationalization**: slang_flutter (English & Arabic)

## Contextual Naming (Required)

- All screen/widget/provider names must reflect their module context (`client`, `staff`, or `common`).
- Use contextual names for files and symbols together (example: `client_bookings_screen.dart` + `ClientBookingsScreen`).
- Provider variables must be contextual too.
- Avoid adding generic names inside role-specific modules.

## Strict Rules — NEVER Violate

1. **No hardcoded text** — use `tr.someKey`
2. **No hardcoded colors** — use `AppColors.primary`, etc.
3. **No inline TextStyle** — use style atoms
4. **No raw AppBar** — always `CustomAppbar(title: tr.yourTitle)`
5. **No raw CachedNetworkImage** — use `CustomCachedNetworkImage`
6. **No flutter_bloc/Cubit** — Riverpod only
7. **No `showDialog()`/`showModalBottomSheet()` directly in widgets** — use `context.showCustomDialog(content:)`, `context.showBottomSheet(bottomSheetBody:)`
8. **Dialog Pattern** — When creating a dialog widget, implement a static `showDialog` method:
   ```dart
   static void showDialog(BuildContext context, {required VoidCallback onConfirm, required VoidCallback onCancel}) {
     context.showCustomDialog(
       content: CancelBookingDialog(onConfirm: onConfirm, onCancel: onCancel),
     );
   }
   ```

---

## AI Agent Behavior Rules

- Always check for existing widgets before creating new ones.
- Prefer reusing components from `core/widgets` and feature widgets.
- Avoid generating duplicate UI components.
- Follow the project architecture strictly.
- Ensure code matches the design system tokens.

## Widget Reuse Priority

1. `lib/app/core/widgets`
2. `lib/app/features/**/widgets`
3. Flutter built-in widgets
4. pub.dev packages
5. Create a new widget (only if necessary)

## AI Code Generation Guidelines

- Prefer clarity over unnecessary abstraction.
- Follow existing patterns in the codebase.
- Do not invent new architectural patterns.
- Maintain consistency with the project's design system.

---

## Widget Extraction Decision Rules

- If the build method remains readable and small, keep the UI inside the build method.
- If a section improves readability, reusability, or performance when separated, extract it into a widget.
- If the UI section is reused, create a separate widget.
- If the UI section is complex or affects rebuild scope, extract it into a widget.
- The AI agent must decide whether to keep code inline, create a private widget, or create a separate widget file.

Avoid generating excessive private widgets unless there is a clear benefit.

## Performance Guidelines

- Use `const` constructors whenever possible.
- Avoid rebuilding large widget trees unnecessarily.
- Use providers efficiently to limit rebuild scope.

---

## Project Structure

```
lib/
├── app/
│   ├── core/                    # Core application utilities
│   │   ├── api_helper/         # Dio, interceptors, endpoints
│   │   ├── constants/          # App constants and keys
│   │   ├── data/               # Preferences (user, lang, routing, etc.)
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

### Core Widgets (`lib/app/core/widgets/`)

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
```

**Adding New Translations**:

1. Add key-value to both `en.json` and `ar.json` manually.
2. Run: `dart run slang`
3. Use via `tr.yourNewKey`

**IMPORTANT**: Never hardcode user-facing text. Always use translations via `tr.*`. Do NOT use `dart run tr.dart`.

## State Management

**Framework**: Riverpod (flutter_riverpod)

### Provider Naming Convention

- FutureProvider → `<feature>NameFutureProvider`
- StateProvider → `selected<Thing>Provider`
- StateNotifier → `<feature>NameNotifier`

### Core Principles

1. **`FutureProvider`** — for async data fetching. Handles loading/error/data states automatically.
2. **`FutureProvider.family`** — for async data that depends on a parameter (e.g. filtered lists).
3. **`StateProvider`** — for simple mutable state (tab index, selected category ID, toggles).
4. **`StateNotifier` + `InternetErrorHandlerMixin`** — for complex multi-step or mutation flows.
5. **`ref.watchWhen()`** — the preferred UI entry point for `FutureProvider`. Automatically shows shimmer on loading, `NoInternetScreen` or `ServerErrorScreen` on error.

### Rules

- **ALWAYS** write a per-section shimmer widget (e.g. `OffersShimmer`, `ProvidersShimmer`).
- **ALWAYS** pass the shimmer to `ref.watchWhen(loading: () => const XShimmer())`.
- **NEVER** use `flutter_bloc` or `Cubit` — the project is fully Riverpod.
- **NEVER** use global `CircularProgressIndicator` for a section that has its own data — use a shimmer.

## API & Network

**HTTP Client**: Dio 5.4.0
**Configuration**: `lib/app/core/api_helper/`
**Error Handling**: Use `NoInternetScreen` for connection errors, `ServerErrorScreen` for server errors.

## Code Style & Conventions

- Use snake_case for file names
- Match class name to file name
- Always use `Form` widget with `GlobalKey<FormState>`, validate before submission.

---

## FIGMA TO FLUTTER CONVERSION GUIDE

### Step 1: Analyze the Figma Design

Identify layout structure, design tokens, core components (`CustomTextFormField`, `CustomButton`), and interactions.

### Step 2: Map Figma Properties to Flutter

| Figma Property                 | Flutter Equivalent                                       |
| ------------------------------ | -------------------------------------------------------- |
| **Frame/Auto Layout → Column** | `Column(children: [...])`                                |
| **Frame/Auto Layout → Row**    | `Row(children: [...])`                                   |
| **Spacing / Padding**          | `16.h`, `16.w` or `Padding(padding: EdgeInsets.all(16))` |
| **Text → Font size 20, Bold**  | `style: context.bold20Black`                             |

Map ALL colors in Figma directly to `AppColors` constants. If the exact color doesn't exist, use the closest match or add it to `AppColors`. DO NOT use explicit color hex codes inline. Map text to auto-generated style atoms. Ensure all images are translated correctly to `CustomCachedNetworkImage` (non-raw network images).

### Bottom Sheets & Dialogs

- Remember: Do NOT use raw `showDialog` or `showModalBottomSheet`. Use `context.showCustomDialog` and `context.showBottomSheet`.

### Validation Checklist

- [ ] All colors use `AppColors` constants (no `Color(0xFFXXXXXX)` hardcoded values!)
- [ ] All text styles use style atoms (`context.bold20Primary`, etc.)
- [ ] All user-facing text uses translations (`tr.*`)
- [ ] Uses existing custom core widgets (`CustomButton`, `CustomCachedNetworkImage`, etc)
- [ ] Layout matches Figma natively using standard layouts and spacing extensions
- [ ] Riverpod is correctly implemented with loading and error boundaries
- [ ] All forms validate

---

## Common Commands

```bash
# Generate code (routes, riverpod providers, translations)
dart run build_runner build --delete-conflicting-outputs

# Generate style atoms (after modifying AppColors)
dart run generate_styles.dart

# Generate translations (after modifying en.json/ar.json)
dart run slang
```

---

## Important Notes

1. **Never hardcode text** - Always use `tr.*` for translations
2. **Never hardcode colors** - Always use `AppColors.*` constants. **CRITICAL**: Do NOT use inline color values like `Color(0xFF648DDB)` or `.copyWith(color: Color(0xFF989898))`.
3. **Never edit `style_atoms.dart`** - It's auto-generated; edit `generate_styles.dart` instead.
4. **Use existing widgets** - Check `lib/app/core/widgets/` before creating new ones.
5. **State management** — Use Riverpod exclusively (`FutureProvider`, `StateProvider`, `StateNotifier`).
6. **Use const constructors** - For better performance.
7. **Font size handling** - Use predefined style atoms. DO NOT use `.copyWith(fontSize: X)`.
8. **Never add height to text styles** - DO NOT use `.copyWith(height: X)` or `TextStyle(height: X)` as it causes text overflow issues.
9. **Never hardcode font family** - DO NOT use `TextStyle(fontFamily: 'FontName')`.
10. **Use project utilities** - For dialogs use `context.showCustomDialog()`, for bottom sheets use `context.showBottomSheet()`, for snackbars use predefined messages.
11. **Use DateTime extensions** - Always use `date_time_extensions.dart`.
12. **Use Enums** - Whenever you have a type or status field, ALWAYS create an `Enum` for it. Do not use Strings or Integers.
13. **Use MyIcons** - Always use icons from `MyIcons` class (e.g., `MyIcons.calendarBold`). Do not use `Icons` class unless necessary.
14. **Models placement** - Feature-specific model classes MUST live in `lib/app/features/<role>/<feature>/data/models/`. NEVER define model classes inline.
15. **Use CustomCachedNetworkImage** - Always use `CustomCachedNetworkImage`. Never use raw `CachedNetworkImage`.
16. **Manual translations** - When adding new translation keys, add them mutually to both `en.json` and `ar.json`, then run `dart run slang`.
