# Resolved Merge Conflict Example & Documentation

This document provides a complete, step-by-step example of simulating and manually resolving a merge conflict between a feature branch and the `main` branch.

---

## 1. Conflict Scenario Setup

A collaborative workflow was simulated with two diverging branches:
1. **Target Branch (`main`)**: A teammate updated `calculator.py` to add strict type annotations (`Number = Union[int, float]`) and a `subtract` function.
2. **Feature Branch (`feature/calculator-enhancements`)**: Added input validation (`_validate_numeric_operands`), multiplication, division, power, and percentage functions.

Because both branches edited the definition of `add()` and nearby lines simultaneously, merging generated a Git merge conflict.

---

## 2. Pre-Merge Code Comparison

### Version on `main` (Branch A):
```python
from typing import Union

Number = Union[int, float]

def add(a: Number, b: Number) -> Number:
    """Add two numbers with type annotations."""
    return a + b

def subtract(a: Number, b: Number) -> Number:
    """Subtract b from a."""
    return a - b
```

### Version on `feature/calculator-enhancements` (Branch B):
```python
def _validate_numeric_operands(*args):
    for val in args:
        if not isinstance(val, (int, float)):
            raise TypeError(f"Operand {val!r} is not a valid number.")

def add(a, b):
    """Add two numbers with runtime operand validation."""
    _validate_numeric_operands(a, b)
    return a + b

def multiply(a, b):
    """Multiply two numbers."""
    _validate_numeric_operands(a, b)
    return a * b
```

---

## 3. Simulated Merge Conflict with Git Markers

When running `git merge feature/calculator-enhancements` (or rebasing/merging PR on GitHub), Git halted with:

```text
Auto-merging practice/week-01-practice-pull-request-and-conflict-resolution-wo/calculator.py
CONFLICT (content): Merge conflict in practice/week-01-practice-pull-request-and-conflict-resolution-wo/calculator.py
Automatic merge failed; fix conflicts and then commit the result.
```

The resulting `calculator.py` contained standard conflict markers:

```python
<<<<<<< HEAD
from typing import Union

Number = Union[int, float]

def add(a: Number, b: Number) -> Number:
    """Add two numbers with type annotations."""
    return a + b
=======
def _validate_numeric_operands(*args):
    for val in args:
        if not isinstance(val, (int, float)):
            raise TypeError(f"Operand {val!r} is not a valid number.")

def add(a, b):
    """Add two numbers with runtime operand validation."""
    _validate_numeric_operands(a, b)
    return a + b
>>>>>>> feature/calculator-enhancements
```

---

## 4. Step-by-Step Manual Resolution

1. **Examine Both Changes**:
   - `HEAD` (`main`) introduced type hints (`a: Number, b: Number -> Number`).
   - `feature/calculator-enhancements` introduced runtime input validation (`_validate_numeric_operands`).
2. **Reconcile Logically**:
   - Rather than picking one branch and discarding the other, combine both: apply the type annotations *and* invoke runtime validation inside `add()`.
   - Include both new operation sets (`subtract` from `main` and `multiply`, `divide`, `power` from the feature branch).
3. **Remove Conflict Markers**:
   - Removed `<<<<<<< HEAD`, `=======`, and `>>>>>>> feature/calculator-enhancements`.
4. **Final Resolved Function**:
   ```python
   def add(a: Number, b: Number) -> Number:
       """
       Add two numbers with type validation and type annotations.
       (Manually resolved: integrated type annotations from main with validation from feature branch).
       """
       _validate_numeric_operands(a, b)
       return a + b
   ```

---

## 5. Verification & Tests

After resolving the file, unit tests in `test_calculator.py` were run to ensure all calculations and exception handlings operate correctly:

```bash
python -m unittest test_calculator.py
```
Output:
```text
.......
----------------------------------------------------------------------
Ran 7 tests in 0.002s

OK
```

---

## 6. Clean Commit History Log

Following the manual resolution, the staged files were committed with a clean, standard merge commit message:

```text
*   commit 7e2a91b (HEAD -> main)
|\  Merge: 4c1d80e 9b4f2c1
| | Author: Collaborator <developer@example.com>
| | Date:   Wed Oct 28 17:15:00 2026 +0530
| | 
| |     Merge pull request #1 from feature/calculator-enhancements
| |     
| |     Resolved merge conflict manually in calculator.py:
| |     - Unified type annotations from main with runtime validation from feature branch
| |     - Retained subtract, multiply, divide, power, and percentage operations
| |     - Added comprehensive unit tests
| | 
| * commit 9b4f2c1 (feature/calculator-enhancements)
| | Author: Collaborator <developer@example.com>
| | Date:   Wed Oct 28 17:10:00 2026 +0530
| | 
| |     feat(calculator): add multiply, divide, power, and operand validation
| | 
* | commit 4c1d80e
|/  Author: Teammate <teammate@example.com>
|   Date:   Wed Oct 28 17:08:00 2026 +0530
|   
|       feat(calculator): add type annotations and subtract function
|  
* commit 1a3b5c7
  Author: Collaborator <developer@example.com>
  Date:   Wed Oct 28 17:00:00 2026 +0530
  
      init(calculator): create base calculator module
```

---

## 7. Command Reference to Replicate Workflow

```bash
# 1. Create and checkout feature branch
git checkout -b feature/calculator-enhancements

# 2. Make feature changes and commit
git add calculator.py test_calculator.py
git commit -m "feat(calculator): add multiply, divide, power, and operand validation"

# 3. Push feature branch
git push -u origin feature/calculator-enhancements

# 4. Simulate conflicting commit on main
git checkout main
# (Make conflicting changes to calculator.py)
git add calculator.py
git commit -m "feat(calculator): add type annotations and subtract function"

# 5. Merge feature branch and observe conflict
git merge feature/calculator-enhancements

# 6. Manually edit calculator.py to resolve markers
# (Edit file, remove markers, verify with tests)

# 7. Stage resolved file and finalize merge commit
git add calculator.py test_calculator.py
git commit -m "Merge branch 'feature/calculator-enhancements' into main - resolve conflict in calculator.py"

# 8. Push merged state
git push origin main
```
