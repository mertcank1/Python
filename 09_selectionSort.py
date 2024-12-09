# -*- coding: utf-8 -*-
"""
@author: CS115
"""

def selectionSort(L):
    suffixStart = 0
    while suffixStart != len(L):
        for i in range(suffixStart, len(L)):
            if L[i] > L[suffixStart]:
                L[suffixStart], L[i] = L[i], L[suffixStart]
        suffixStart += 1

myList = [5,7,2,6,3]
print('unsorted list:',myList)
selectionSort(myList)
print('sorted list:',myList)

    