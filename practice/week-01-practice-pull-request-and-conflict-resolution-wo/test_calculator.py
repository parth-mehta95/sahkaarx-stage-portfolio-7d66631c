"""
Unit Tests for Calculator Module
Verifies that all operations work correctly following manual merge conflict resolution.
"""

import unittest
from calculator import (
    add,
    subtract,
    multiply,
    divide,
    power,
    calculate_percentage,
)


class TestCalculatorOperations(unittest.TestCase):
    """Test suite for calculator functions."""

    def test_add(self):
        self.assertEqual(add(10, 5), 15)
        self.assertEqual(add(-3, 3), 0)
        self.assertAlmostEqual(add(2.5, 3.1), 5.6)

    def test_add_type_error(self):
        with self.assertRaises(TypeError):
            add("10", 5)  # type: ignore

    def test_subtract(self):
        self.assertEqual(subtract(10, 4), 6)
        self.assertEqual(subtract(3, 7), -4)

    def test_multiply(self):
        self.assertEqual(multiply(6, 7), 42)
        self.assertEqual(multiply(-2, 5), -10)
        self.assertEqual(multiply(0, 100), 0)

    def test_divide(self):
        self.assertEqual(divide(10, 2), 5.0)
        self.assertAlmostEqual(divide(1, 3), 0.3333333333333333)

    def test_divide_by_zero(self):
        with self.assertRaises(ZeroDivisionError):
            divide(10, 0)

    def test_power(self):
        self.assertEqual(power(2, 3), 8)
        self.assertEqual(power(5, 0), 1)

    def test_calculate_percentage(self):
        self.assertEqual(calculate_percentage(50, 200), 25.0)
        self.assertEqual(calculate_percentage(0, 50), 0.0)

    def test_calculate_percentage_zero_total(self):
        with self.assertRaises(ZeroDivisionError):
            calculate_percentage(10, 0)


if __name__ == "__main__":
    unittest.main()
