# TEST OF MAX SELECTION EXCERCISE


import unittest
from excercise_1_max_selection import get_max

def get_max(numbers:list) -> int:
    pass
    if numbers is None or len(numbers) == 0:
        return None
    result = numbers[0]
    for i in numbers:
        if i > result:
            result = i
    return result




# AUTOMATED TEST, DO NOT MODIFY
class TestStringMethods(unittest.TestCase):
    def test_basic_test_cases(self):
        self.assertEqual(get_max([1,2,3,4,5,6]), 6)
        self.assertEqual(get_max([1,2,6,9,5,5]), 9)
        self.assertEqual(get_max([-1,-2,-6,-9,-5,-5]), -1)

    def test_basic_test_cases_with_none(self):
        self.assertEqual(get_max([]), None)
        self.assertEqual(get_max(None), None)


if __name__ == '__main__':
    unittest.main()