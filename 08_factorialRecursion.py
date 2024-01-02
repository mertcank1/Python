# -*- coding: utf-8 -*-
"""
@author: CS115
"""

def factorial(n):
    if(n == 1 or n == 0):
        return 1
    else:
        return n * factorial(n - 1)

val = 5
fact = factorial(5)
print('The factorial of',str(val),'is',fact)