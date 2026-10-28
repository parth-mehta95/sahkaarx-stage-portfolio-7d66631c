# Pull Request: Calculator Enhancements & Collaborative Workflow

- **PR Title**: `feat(calculator): Add multiplication, division, power operations, and input validation`
- **Source Branch**: `feature/calculator-enhancements`
- **Target Branch**: `main`
- **Status**: Merged (Resolved Merge Conflict)
- **Author**: Challenger / Collaborator

---

## 1. Description & Motivation

This pull request extends the base calculator module developed for the Week-01 collaborative version control practice. The goal is to provide advanced arithmetic features, enforce strict operand type validation, and demonstrate a production-ready pull request lifecycle including conflict simulation, peer review feedback handling, and manual resolution.

---

## 2. Key Changes Introduced

| File | Change Type | Summary of Changes |
| :--- | :--- | :--- |
| `calculator.py` | Modified | Added `multiply`, `divide`, `power`, and `calculate_percentage` functions. Integrated input validation helper `_validate_numeric_operands`. |
| `test_calculator.py` | Added | Full unit test suite covering valid calculations, type errors, zero-division exceptions, and edge cases. |
| `CONFLICT_RESOLUTION.md` | Added | Full audit trail and explanation of the simulated merge conflict and its manual resolution. |

---

## 3. Reviewer Feedback & Resolution

During code review on the pull request, team members provided the following comments:

### Reviewer Feedback 1
> **Comment**: "Ensure `divide` and `calculate_percentage` raise an explicit `ZeroDivisionError` with informative error messages rather than silently failing or causing unexpected floating-point values."
>
> **Resolution**: Implemented explicit checks `if b == 0: raise ZeroDivisionError("Cannot divide by zero.")` and test assertions in `test_calculator.py`.

### Reviewer Feedback 2
> **Comment**: "Upstream `main` was updated with type annotations on `add` and `subtract`. Rebase or merge `main` into your feature branch to resolve the conflict before merging."
>
> **Resolution**: Fetched `main`, triggered the merge, manually reconciled the conflict markers (combining upstream type annotations with feature branch type validation), validated tests, and committed the resolution.

---

## 4. Conflict Resolution Summary

- **Conflict File**: `practice/week-01-practice-pull-request-and-conflict-resolution-wo/calculator.py`
- **Conflict Cause**: Both `main` and `feature/calculator-enhancements` modified the signature and body of `add` and added new functions in the same region.
- **Resolution Strategy**: Reconciled both changes manually by preserving the type hints from `main` and incorporating the operand validation logic from `feature/calculator-enhancements`.

---

## 5. Verification & Testing

- [x] Ran unit tests with all test cases passing (`python test_calculator.py`).
- [x] Tested boundary conditions (division by zero, negative inputs, floating point precision).
- [x] Clean commit history verified with descriptive Conventional Commit messages.

---

## 6. PR Checklist

- [x] Created and checked out feature branch `feature/calculator-enhancements`.
- [x] Committed changes with clear, descriptive commit messages.
- [x] Pushed branch to remote repository.
- [x] Simulated upstream conflicting commit on `main`.
- [x] Resolved merge conflicts manually without loss of logic.
- [x] Maintained a clean commit history and merged into `main`.
