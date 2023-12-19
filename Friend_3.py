# -*- coding: utf-8 -*-
"""
@author: CS115
"""

class Friend( object ):
    def __init__( self, name, phone, year ):
        self.__fname = name
        self.__fphone = phone
        self.__year = 0
        self.set_year( year )
        
    def get_fname(self):
        return self.__fname
    
    def set_fname( self, new_name ):
        self.__fname = new_name
    
    def get_fphone(self):
        return self.__fphone
    
    def set_fphone( self, new_phone ):
        self.__fphone = new_phone    
    
    def get_year(self):
        return self.__year
    
    def set_year( self, new_year ):
        if new_year > 1900:
            self.__year = new_year
        
    def __str__(self):
        return f'Name: {self.__fname} Phone: {self.__fphone} Friend Since: {self.__year}'
    
    def __repr__(self):
        return f'Name: {self.__fname} Phone: {self.__fphone} Friend Since: {self.__year}'
        
f1 = Friend('Jane Doe','555-1234',2015)
f2 = Friend('John Smith','555-9876',2017)

print(f1)
print(f2)

f1.set_year( 2020 )
print(f1)

f2.set_year( -2020 )
print(f2)