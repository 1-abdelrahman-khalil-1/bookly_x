# Bookly X Client — Project Instructions

# SYSTEM INITIALIZATION & IDENTITY
You are the dedicated autonomous AI Agent for the "Bookly X" Flutter production app. You must ingest, memorize, and strictly enforce the following execution rules for every single response, code generation, and plan. Deviating from these rules will break the production architecture.

## Project Overview

**Name**: bookly_x
**Type**: Flutter Mobile Application
**SDK/Runtime Version**: ^3.5.0
**State Management**: Riverpod — (FutureProvider + StateNotifier + StateProvider + watchWhen pattern)
**Routing**: auto_route
**Internationalization**: slang_flutter
**HTTP Client**: Dio (via DioClient wrapper)

---

## ⚠️ AI Agent Behavior Rules — NEVER Violate

- Ask before assuming anything unclear
- Always search before creating (widgets, models, enums)
- Detect patterns from codebase first — never invent
- Follow architecture strictly, but create a new screen folder when a screen is split into its own feature surface
- When asked to create a new standalone screen, create a new feature folder under `lib/app/features/<module>/<feature_name>/`
- If the new screen is a details/child flow of an existing feature (for example: booking details), place it inside the existing feature instead of creating another feature root
- Reuse existing widgets before creating new ones
- Do NOT introduce new state management or architecture
- Follow design system strictly (colors, typography, spacing)

---

## Widget / Component Reuse Priority

1. Core widgets — `lib/app/core/widgets`
2. Feature widgets — `lib/app/features/**/widgets`
3. Flutter widgets
4. pub.dev packages
5. Create new widget (only if necessary)

When a screen becomes complex, move it into its own folder under `presentation/screens/<screen_name>/` and extract repeated pieces into sibling widget files under that screen folder.

---

## Strict Rules — NEVER Violate

1. No hardcoded text → use `tr.*`

2. No hardcoded colors → use `AppColors.*`

3. No inline TextStyle → use `context.*` style atoms

4. No raw AppBar → use `CustomAppBar`

5. No raw CachedNetworkImage → use `CustomCachedNetworkImage`

6. No flutter_bloc / Cubit → Riverpod only

7. No `showDialog()` / `showModalBottomSheet()` → use:
   - `context.showCustomDialog`
   - `context.showBottomSheet`

8. **Dialog Pattern (Mandatory)**
   When creating any dialog widget, implement a static `showDialog` method:

```dart
static void showDialog(
  BuildContext context, {
  required VoidCallback onConfirm,
  required VoidCallback onCancel,
}) {
  context.showCustomDialog(
    content: CancelBookingDialog(
      onConfirm: onConfirm,
      onCancel: onCancel,
    ),
  );
}
```

9. No inline models → models must be in `data/models/`
10. No `.copyWith(fontSize / color / height)`
11. No direct Navigator → use `context.push / context.pop`
12. Always use `MyIcons` instead of `Icons`
13. Always use spacing extensions (`.h`, `.w`)
14. Before passing props to a core widget, inspect its default parameters and omit any argument that matches the default value

---

## ❌ Anti-Patterns — Never Do This

- ❌ CircularProgressIndicator instead of shimmer
- ❌ API call inside UI
- ❌ Navigator.push / pop
- ❌ hardcoded strings or colors
- ❌ inline models
- ❌ duplicate widgets
- ❌ raw TextStyle
- ❌ Expanded with width.infinity

---

## Architecture

```id="arch01"
lib/
├── app/
│   ├── core/
│   │   ├── api_helper/
│   │   ├── constants/
│   │   ├── data/
│   │   ├── enums/
│   │   ├── extensions/
│   │   ├── models/
│   │   ├── screens_not_related/
│   │   ├── services/
│   │   ├── styles/
│   │   ├── themes/
│   │   ├── utils/
│   │   └── widgets/
│   └── features/
│       ├── client/
│       ├── common/
│       └── staff/
├── generated/
├── router/
└── main.dart
```

---

## Contextual Naming (Required)

- Use module prefix:
  - client\_
  - staff\_
  - common\_

Example:

- `client_bookings_screen.dart`
- `ClientBookingsScreen`
- `clientBookingsProvider`

---

## Design System

### Colors

- Source: `AppColors`
- Never use hex values

---

### Typography

- Use:
  - context.bold20Primary
  - context.regular14TextSub

❌ Forbidden:

- TextStyle()
- copyWith()

---

### Spacing

- 8.h / 16.h
- 8.w

### Fixed Sets

- Use enums for repeated fixed values like weekday chips, status groups, and other small option sets instead of literal lists.

---

### Icons

- Use `MyIcons`

---

## Core Widgets Reference

| Need        | Widget                   | Path         | Purpose |
| ----------- | ------------------------ | ------------ | ------- |
| Text Input  | CustomTextFormField      | core/widgets | forms   |
| Button      | CustomButton             | core/widgets | actions |
| AppBar      | CustomAppBar             | core/widgets | header  |
| Image       | CustomCachedNetworkImage | core/widgets | images  |
| Dropdown    | CustomDropList           | core/widgets | select  |
| Date Picker | CustomDatePickerField    | core/widgets | date    |

---

## Discovered Core Abstractions

### GeneralState<T>

Handles:

- loading
- success
- error
- data

---

### InternetErrorHandlerMixin<T>

Provides:

- execute()
- executeVoid()

Handles:

- errors
- loading
- success messages

---

## State Management Patterns

### Data Fetching

```dart
final providersFutureProvider = FutureProvider<List<ProviderModel>>((ref) async {
  return service.getProviders();
});
```

---

### Mutation Pattern

```dart
class BookingNotifier extends StateNotifier<GeneralState<void>>
    with InternetErrorHandlerMixin<void> {

  Future<bool> cancel(String id) {
    return executeVoid(() async {
      await service.cancelBooking(id);

      setSuccessfullyMessage(tr.bookingCancelledSuccefully);
    });
  }
}
```

---

### Pagination

- PagedNotifier
- PagedState
- MySQL pagination

---

### UI Consumption

```dart
ref.watchWhen(
  provider: providersFutureProvider,
  loading: () => const ProvidersShimmer(),
  data: (data) => ProvidersList(data),
);
```

---

## Controller Pattern

- Controller = logic
- UI = rendering only
- Service = API

---

## Usage Patterns

### Button Action

```dart
onPressed: () async {
  final success = await ref.read(controller.notifier).submit();

  if (success && context.mounted) {
    context.pop();
  }
}
```

---

### Cache Invalidation

```dart
ref.invalidate(provider);
```

---

### Loading

- Always shimmer
- Never CircularProgressIndicator

---

## Success Messages Rule (Critical)

- ❌ Forbidden:

```dart
setSuccessfullyMessage(tr.success);
```

- ✅ Required:

```dart
setSuccessfullyMessage(tr.bookingCancelledSuccefully);
setSuccessfullyMessage(tr.profileUpdatedSuccessfully);
setSuccessfullyMessage(tr.passwordChangedSuccessfully);
```

👉 Each action MUST have a specific success message.

---

## API / Service Layer

- DioClient
- Endpoints
- HandleErrorsResponse
- Always upload images/files as binary (`multipart/form-data`) using `profile_image` or `image` fields, as public URLs are no longer supported.

---

## Routing

```dart
context.push(Route());
context.pop();
```

---

## Performance Rules

- const everywhere possible
- avoid rebuilds
- check mounted after await

---

## Commands

```bash
dart run build_runner build --delete-conflicting-outputs
dart run slang
dart run generate_styles.dart
```

---

## Checklist

- [ ] no hardcoded text
- [ ] no inline colors
- [ ] shimmer exists
- [ ] correct success message
- [ ] widget reuse respected

---

## Pre-Check

- **Never state that a task/implementation is finished without running `flutter analyze` and ensuring there are zero errors.**

```bash
flutter analyze
```

---

## Generic Tabbed List Pattern

When implementing any screen that shows one list split by tabs (status, category, stage, or type), follow this pattern instead of building each tab manually:

- Use `DefaultTabController` + `TabBar` + `TabBarView` for the top-level segmentation.
- Create a reusable `<Feature>NameListWidget` that receives:
  - the source items list
  - the active filter values (e.g. enum values)
  - callbacks for row actions
- Render list items inside the reusable widget using `ListView.separated`.
- In each `TabBarView` child, call the same reusable list widget with different filter values (for example: pending/open/closed).
- Keep business actions and dialogs in the parent screen and pass callbacks down to the reusable list widget.
- Prefer enum-driven filters over hardcoded string checks.

This keeps tab implementations consistent, reduces duplication, and ensures every tabbed list screen follows the same scalable structure.
