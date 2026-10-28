"""
Calculator Module for Week-01 Practice Workflow
Demonstrates collaborative development, feature branching, and manual merge conflict resolution.

Resolution Summary:
- Resolved conflict between `main` (type hints, subtraction, division)
  and `feature/calculator-enhancements` (type validation, multiplication, power).
- Combined both sets of enhancements cleanly into a robust, tested mathematical module.
"""

from typing import Union

Number = Union[int, float]


def _validate_numeric_operands(*args: Number) -> None:
    """Validate that all provided operands are int or float instances."""
    for val in args:
        if not isinstance(val, (int, float)):
            raise TypeError(f"Operand {val!r} is not a valid number (expected int or float).")


def add(a: Number, b: Number) -> Number:
    """
    Add two numbers with type validation and type annotations.
    (Manually resolved: integrated type annotations from main with validation from feature branch).
    """
    _validate_numeric_operands(a, b)
    return a + b


def subtract(a: Number, b: Number) -> Number:
    """
    Subtract b from a with input validation.
    """
    _validate_numeric_operands(a, b)
    return a - b


def multiply(a: Number, b: Number) -> Number:
    """
    Multiply two numbers with input validation.
    """
    _validate_numeric_operands(a, b)
    return a * b


def divide(a: Number, b: Number) -> float:
    """
    Divide a by b with input validation and zero-division protection.
    """
    _validate_numeric_operands(a, b)
    if b == 0:
        raise ZeroDivisionError("Cannot divide by zero.")
    return a / b


def power(base: Number, exponent: Number) -> Number:
    """
    Calculate base raised to the power of exponent.
    """
    _validate_numeric_operands(base, exponent)
    return base ** exponent


def calculate_percentage(part: Number, total: Number) -> float:
    """
    Calculate what percentage 'part' is of 'total'.
    """
    _validate_numeric_operands(part, total)
    if total == 0:
        raise ZeroDivisionError("Total cannot be zero when calculating percentage.")
    return (part / total) * 100.0


if __name__ == "__main__":
    print("=== Calculator Practice Module Demonstration ===")
    print(f"add(12, 8)                = {add(12, 8)}")
    print(f"subtract(20, 5)           = {subtract(20, 5)}")
    print(f"multiply(6, 7)            = {multiply(6, 7)}")
    print(f"divide(50, 4)             = {divide(50, 4)}")
    print(f"power(2, 8)               = {power(2, 8)}")
    print(f"calculate_percentage(25, 200) = {calculate_percentage(25, 200)}%")
    print("All sample operations completed successfully.")
