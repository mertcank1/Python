# -*- coding: utf-8 -*-
"""
@author: CS115
"""
from random import randrange
def generate_list(n):
    my_list = []
    for i in range(1,n+1):
        my_list.append(randrange(1,101))
    return my_list

def double_list(my_list):
    for i in range(len(my_list)):
        my_list[i] = my_list[i] * 2 

def double_value(x):
    x = x / 2;
    print(x)
    
list_one = generate_list(5)
print(list_one)

double_list(list_one)
print(list_one)

double_value(list_one[0])
print(list_one)

