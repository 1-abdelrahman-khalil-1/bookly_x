---
name: review
description: "Perform a production-grade senior code review on a specific feature or the whole project"
argument-hint: "feature or whole project"
agent: "agent"
---

# Production-Grade Code Review Workflow

## Overview

When this workflow is triggered, perform a full production-grade senior code review.
Assume the code will be deployed to production and must scale.

## Steps

### 1. Identify Files to Review

First, examine the user's provided argument to determine the scope of the review:

- If the user specified a specific feature, restrict your review to the Dart files within `lib/app/features/<feature>/` (and any related core/common files explicitly affected).
- If the user specified "whole project" or didn't specify a scope, review all Dart files in `lib/` (excluding `lib/generated/`).

// turbo

- Find the relevant Dart files based on the scope:
  ```bash
  # Example for specific feature:
  find lib/app/features/<feature> -type f -name "*.dart" | sort
  # Example for whole project:
  find lib -type f -name "*.dart" | grep -v generated | sort
  ```
- Check if a previous review state exists in `.agent/review_state.md`.
  - If it exists, read it and compare against the current file list.
  - **Only review NEW or MODIFIED files** (check modification times or git diff).
  - Skip files already confirmed in the previous review state.
- If no review state exists, review **all** in-scope files.

### 2. Review Each File

For every file under review, perform the following **deep analysis** (not superficial):

#### 2.1 Business Logic Correctness

- Verify the logic matches the intended behavior.
- Check for off-by-one errors, null safety issues, and incorrect conditionals.

#### 2.2 Edge Case Handling

- Check for empty lists, null values, empty strings.
- Verify boundary conditions (pagination limits, max/min values).
- Check for race conditions in async code.

#### 2.3 Architectural Structure & Separation of Concerns

- Verify features follow the standard structure:
  ```
  lib/app/features/{feature}/
    data/
      models/
      repositories/
    presentation/
      screens/
      controllers/
  ```
- Ensure UI code doesn't contain business logic.
- Ensure repositories don't contain UI logic.
- Verify controllers use `InternetErrorHandlerMixin` properly.

#### 2.4 SOLID Principles Compliance

- **S**: Each class should have a single responsibility.
- **O**: Code should be open for extension, closed for modification.
- **L**: Subclasses should be substitutable for their base classes.
- **I**: Prefer focused interfaces over fat ones.
- **D**: Depend on abstractions, not concretions.

#### 2.5 Performance Bottlenecks

- Check for unnecessary rebuilds (missing `const`, watching too many providers).
- Check for expensive operations in `build()` methods.
- Verify proper use of `ListView.builder` over `ListView` for long lists.
- Check for memory leaks (un-disposed controllers, streams).

#### 2.6 Memory & Resource Management

- Verify `TextEditingController`, `ScrollController`, `AnimationController` are disposed.
- Check for proper Stream subscription cleanup.
- Verify no strong reference cycles.

#### 2.7 Security Vulnerabilities

- Check for hardcoded tokens, API keys, or secrets.
- Verify sensitive data is not logged in production.
- Check for proper input sanitization.

#### 2.8 Scalability Risks

- Check if code handles growing data gracefully (pagination, lazy loading).
- Verify provider scoping (avoid global providers that should be scoped).
- Check for proper error recovery mechanisms.

#### 2.9 Testability Gaps

- Verify dependencies are injectable (not hard-coded).
- Check if business logic is testable independently.
- Verify controllers can be tested without UI.

#### 2.10 Code Readability & Maintainability

- Check naming conventions (snake_case files, PascalCase classes).
- Verify proper use of project conventions:
  - `AppColors` instead of hardcoded colors.
  - Style atoms (`context.bold20Black`) instead of inline TextStyle.
  - `tr.*` for all user-facing strings.
  - `MyIcons` instead of raw `Icons` class.
  - `CustomCachedNetworkImage` instead of raw `CachedNetworkImage`.
  - `CustomButton`/`CustomTextFormField` instead of raw Material widgets.
  - Context extensions for dialogs/bottom sheets/snackbars.
#### 2.11 Flutter Rendering Performance

Check for common Flutter performance issues:

- Widgets missing `const` constructors where possible
- Large widgets causing unnecessary rebuilds
- `Consumer` / `ref.watch` usage causing wide rebuild scope
- Expensive calculations inside `build()`
- Large widget trees inside frequently rebuilding widgets
- Unnecessary `setState` or provider updates
- Rebuilding lists instead of using `ListView.builder`
- Using `Column` with large lists instead of lazy lists
- Missing `RepaintBoundary` in heavy UI areas
- Nested `SingleChildScrollView` issues
#### 2.12 Code Smell Detection

Identify unnecessary or problematic code patterns:

- Dead code
- Unused variables
- Unused imports
- Overly complex widgets
- Duplicate widgets
- Over-abstraction
- Unnecessary private widgets
- Providers that can be simplified
#### 2.13 Flutter Memory Issues

Check for memory-related problems:

- Controllers not disposed
- Streams not closed
- AnimationControllers without vsync handling
- Image caching misuse
- Listeners not removed
### 3. Classify & Report Issues

For **each issue** found, classify it and provide:

| Field        | Description                               |
| ------------ | ----------------------------------------- |
| **Severity** | `🔴 Critical` / `🟠 Major` / `🟡 Minor`   |
| **File**     | File path and line number(s)              |
| **Problem**  | Clear description of what's wrong         |
| **Impact**   | Real-world consequence if not fixed       |
| **Fix**      | Concrete fix with refactored code example |

**Severity Definitions**:

- **🔴 Critical**: Causes crashes, data loss, security breaches, or significant UX failures. Must fix before deploy.
- **🟠 Major**: Leads to bugs under specific conditions, poor performance, or architectural debt. Should fix before deploy.
- **🟡 Minor**: Style violations, minor inefficiencies, or code smell. Fix when convenient.

### 4. Generate Review Report

Create an artifact file at the artifact directory with the review results:

The report should include:

- **Summary**: Total files reviewed, issues by severity count.
- **Issues Table**: All issues grouped by severity.
- **Files Confirmed**: List of reviewed files with status (✅ Clean / ⚠️ Has Issues).

### 5. Update Review State

After the review, create or update `.agent/review_state.md` with:

```markdown
# Review State

## Last Review Date

{current date/time}

## Reviewed Files

| File                 | Status                | Last Reviewed |
| -------------------- | --------------------- | ------------- |
| lib/app/core/...     | ✅ Clean              | {date}        |
| lib/app/features/... | ⚠️ Has Issues (fixed) | {date}        |
```

This file is used for **incremental reviews**: on subsequent `/review` calls, only new or modified files will be reviewed.

### 6. Summary Output

End with a brief summary to the user:

- How many files were reviewed
- How many issues were found per severity
- Top 3 most critical issues (if any)
- Overall code health assessment (1-10 scale)

---

## Important Review Principles

- **Do NOT give generic comments.** Be specific with file paths, line numbers, and code snippets.
- **Think like a senior engineer** responsible for approving production deployment.
- **Focus on real impact**, not theoretical purity.
- **Acknowledge good patterns** when you see them — the review should be balanced.
- **Prioritize**: Fix critical issues first, then major, then minor.
