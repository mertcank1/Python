# -*- coding: utf-8 -*-
"""
@author: CS115
"""

def binary_search(L, e):
    first = 0
    last = len(L)-1
 
    while first <= last:
        mid = (first + last)//2
        if e < L[mid]:
            last = mid -1
        elif e > L[mid]:
            first = mid + 1
        else:
            return mid
    return -1

myList = [5,7,2,6,3]
myList.sort()
print('sorted list:',myList)

sVal = 6
inList = binary_search(myList, sVal)
if inList != -1:
    print(sVal, 'exists in list at position: ', inList)
else:
    print(sVal,'not in list')

sVal = 8
inList = binary_search(myList, sVal)
if inList != -1:
    print(sVal, 'exists in list at position: ', inList)
else:
    print(sVal,'not in list')