# -*- coding: utf-8 -*-
"""
@author: CS115
"""

class Friend( object ):
    def __init__( self, name, phone, year ):
    	self.fname = name
    	self.fphone = phone
    	self.year = year

    def __str__(self):
        return f'Name: {self.fname} Phone: {self.fphone} Friend Since: {self.year}'
    
    def __repr__(self):
        return f'Name: {self.fname} Phone: {self.fphone} Friend Since: {self.year}'
        
f1 = Friend('Jane Doe','555-1234',2015)
f2 = Friend('John Smith','555-9876',2017)

print(f1)
print(f2)
