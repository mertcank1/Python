# -*- coding: utf-8 -*-
"""
@author: CS115
"""

def binarySearch(arr, sVal, startInd, endInd):
    if(startInd > endInd):
        return -1
    else:
        mid = (startInd + endInd)//2
        if(arr[mid] == sVal):
            return mid
        
        elif(arr[mid] > sVal):
            return binarySearch(arr, sVal, startInd, mid-1)
        else:
            return binarySearch(arr, sVal, mid+1, endInd)

myArr = [5,7,9,12,15]
searchValue = 7
result = binarySearch(myArr, searchValue, 0, len(myArr)-1)
if result == -1:
    print(searchValue,'does not exist in list')
else:
    print(searchValue,'exists at index',result)
searchValue = 18
result = binarySearch(myArr, searchValue, 0, len(myArr)-1)
if result == -1:
    print('Search value not found')
else:
    print(searchValue,'does not exist in list')