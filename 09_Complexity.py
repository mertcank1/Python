# -*- coding: utf-8 -*-
"""
@author: CS115
"""

def f(i):
    """Assumes i is an int and i >= 0"""
    answer = 1
    while i >= 1:
        answer *= i
        i -= 1
    return answer
