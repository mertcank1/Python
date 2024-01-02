# -*- coding: utf-8 -*-
"""
@author: CS115
"""

def palindrome(s):
    s = s.lower()
    if(len(s) <= 1):
        return True
    else:
        if(s[0] != s[-1]):
            return False
        else:
            return palindrome(s[1:-1])
        
s1 = 'MadamImAdam'
s2 = 'hello there'

r1 = palindrome(s1)
r2 = palindrome(s2)

print(s1,'is a palindrome',r1)
print(s2,'is a palindrome',r2)