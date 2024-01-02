# -*- coding: utf-8 -*-
"""
@author: CS115
"""

def max_length( lst, n ):
    if n == 1:
        return lst[n - 1]
    else:
        max_prev = max_length( lst, n - 1 )
        if len(lst[n - 1]) > len(max_prev):
            return lst[n - 1]
        else:
            return max_prev

words = ['apple','car','house','helicopter','at','chair','door']
longest = max_length( words, len(words) )
print('Longest word:',longest)