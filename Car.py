# -*- coding: utf-8 -*-
"""
@author: CS115
"""

class Car:
    
    def __init__(self, pNo, brand, model, year, cPrice):
        self.__price = cPrice
        self.__plateNo = pNo
        self.__brand = brand
        self.__model= model
        self.__year = year
    
    def getplateNo(self):
        return self.__plateNo
    
    def setplateNo(self, pNo):
        self.__plateNo = pNo
    
    def getbrand(self):
        return self.__brand
    
    def setbrand(self, brand):
        self.__brand = brand
    
    def getmodel(self):
        return self.__model
    
    def setmodel(self, model):
        self.__model = model
        
    def getprice(self):
        return self.__price
    
    def setprice(self, cPrice):
        self.__price = cPrice
        
    def getyear(self):
        return self.__year
    
    def setyear(self, year):
        self.__year = year
    def __lt__(self, other):
        return self.__price < other.__price
#    def __str__(self):
#        return self.__plateNo+' '+self.__brand+' '+self.__model+' '+str(self.__year)+' '+str(self.__price)
#    
    def __repr__(self):
        return self.__plateNo+' '+self.__brand+' '+self.__model+' '+str(self.__year)+' '+str(self.__price)
        
    
        