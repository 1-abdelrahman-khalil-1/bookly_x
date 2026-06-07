---
description: 
---

```markdown
# Production-Grade Code Review Workflow

## Overview
When this workflow is triggered, perform a full production-grade senior code review.
Assume the code will be deployed to production and must scale.

## Steps

### 0. Static Analysis Pre-Check (Mandatory)
- Before doing any manual or cognitive review, run the static analysis tool:
  ```bash
  flutter analyze

```

* If there are any compilation errors or high-severity linter warnings, **STOP IMMEDIATELY**. Report the analysis errors to the user and refuse to proceed with the review until the code compiles cleanly.

### 1. Identify Files to Review (Incremental Logic)

* Check if a previous review state exists in `.agent/review_state.md`.
* **If it exists:** Find only the newly created or modified files using Git (do not rely on file timestamps):
```bash
git status --porcelain | grep -E '\.dart$' | grep -v 'generated'

```


Or compare against the main branch:
```bash
git diff --name-only main | grep -E '\.dart$' | grep -v 'generated'

```


Only review **NEW or MODIFIED** files since the last state.
* **If no review state exists or Git is unavailable:** Fallback to listing all Dart files in `lib/` (excluding generated files):
```bash
find lib -type f -name "*.dart" | grep -v generated | sort

```



### 2. Review Each File

For every file under review, perform a **deep, non-superficial senior analysis** across these dimensions:

#### 2.1 Business Logic & Edge Cases

* Verify the logic matches the intended production behavior.
* Check for off-by-one errors, null safety issues, empty lists/strings, and race conditions in async/await calls.

#### 2.2 Architectural Structure & Module Alignment

* Verify features strictly follow the multi-module project structure:
```text
lib/app/features/{client|staff|common}/{feature_name}/
   data/
     models/
     repositories/
   presentation/
     screens/
     controllers/

```


* Ensure UI code contains ZERO business logic, repositories contain ZERO UI logic, and controllers utilize `InternetErrorHandlerMixin` for mutations.

#### 2.3 Riverpod & Performance Bottlenecks

* Check for unnecessary widget rebuilds (missing `const` keywords, watching massive global providers when scoped providers or `.select()` should be used).
* Ensure `ref.watchWhen` is utilized for UI consumption of state.
* Verify proper use of lazy loaders like `ListView.builder` over standard `ListView` for dynamic datasets.

#### 2.4 Memory & Resource Management

* Ensure all `TextEditingController`, `ScrollController`, `AnimationController`, and `StreamSubscription` instances are explicitly disposed of.
* Check for potential strong reference cycles or memory leaks.

#### 2.5 Project Formatting Conventions

* **No hardcoded text** → Must use `tr.*` (slang).
* **No hardcoded colors** → Must use `AppColors.*`.
* **No inline TextStyle** → Must use context style atoms (e.g., `context.bold20Primary`).
* **No raw Material Widgets** → Use `CustomAppBar`, `CustomCachedNetworkImage`, `CustomButton`, and `CustomTextFormField`.
* **Dialogs** → Ensure any dialog implements the mandatory static `showDialog(BuildContext context, ...)` pattern using `context.showCustomDialog`.

### 3. Classify & Report Issues (Batching Safeguard)

*Note: If the number of modified files exceeds 5, do NOT output the detailed tables inside the chat interface to avoid output token truncation. Instead, write the full report directly to an artifact file (e.g., `.agent/reviews/review_{timestamp}.md`) and provide a high-level summary in the chat.*

For each issue found, classify it into this structural format:

| Field | Description |
| --- | --- |
| **Severity** | `🔴 Critical` (Crashes/Security/UX Failure) / `🟠 Major` (Perf/Architectural Debt) / `🟡 Minor` (Style/Smells) |
| **File** | File path and exact line number(s) |
| **Problem** | Clear, production-focused description of what is wrong |
| **Impact** | Real-world engineering or user consequence if left unfixed |
| **Fix** | Concrete code block showing the exact refactored fix |

### 4. Generate Review Report

Create or append the results inside an artifact file in the workspace directory. The report must include:

1. **Summary Table**: Total files reviewed, issues count grouped by severity.
2. **Issues Table**: All issues ordered from `🔴 Critical` down to `🟡 Minor`.
3. **Files Confirmed**: A mapping of reviewed files with status (`✅ Clean` / `⚠️ Has Issues`).

### 5. Update Review State

After finishing, update `.agent/review_state.md` with the current date/time and the updated matrix of reviewed files to ensure the next execution is incremental.

### 6. Summary Output (Chat Response)

End your execution with a brief, high-level summary to the developer:

* Total files scanned.
* Issues count per severity.
* Top 3 most urgent items to fix.
* Overall code health assessment score on a 1-10 scale.

```

```