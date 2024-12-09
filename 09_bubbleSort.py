# -*- coding: utf-8 -*-
"""
@author: CS115
"""

def bubbleSort (data):
    issorted = False
    j = 0
    while(j < len(data)-1 and not issorted):
        issorted = True
        for k in range(len(data)-1 - j):
                 if data[k] < data[k+1]:
                     issorted = False
                     temp = data[k]
                     data[k] = data[k+1]
                     data[k+1] = temp
        j = j + 1


myList = [5,7,2,6,3]
print('unsorted list:',myList)
bubbleSort(myList)
print('sorted list:',myList)