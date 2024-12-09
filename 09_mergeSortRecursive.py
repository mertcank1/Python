# -*- coding: utf-8 -*-
"""
@author: CS115
"""

def merge(left, right, compare):
     """Assumes left and right are sorted lists and
     compare defines an ordering on the elements.
     Returns a new sorted (by compare) list containing the
     same elements as (left + right) would contain."""
    
     result = []
     i,j = 0, 0
     while i < len(left) and j < len(right):
         if compare(left[i], right[j]):
             result.append(left[i])
             i += 1
         else:
             result.append(right[j])
             j += 1
     while (i < len(left)):
         result.append(left[i])
         i += 1
     while (j < len(right)):
         result.append(right[j])
         j += 1
     return result

def mergeSort(L, compare = lambda x,y:x < y):
     """Assumes L is a list, compare defines an ordering
     on elements of L
     Returns a new sorted list containing the same elements as L"""
     if len(L) < 2:
         return L[:]
     else:
         middle = len(L)//2
         left = mergeSort(L[:middle], compare)
         right = mergeSort(L[middle:], compare)
         return merge(left, right, compare)

L = [2,1,4,5,3]
print(mergeSort(L))

L = [2,1,4,5,3]
print(mergeSort(L,lambda x,y:x > y))