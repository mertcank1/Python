# -*- coding: utf-8 -*-
"""
@author: CS115
"""
from Car import *

c1 = Car( '06-AB-1234', 'Renault', 'Megane', 2018, 120300)
c2 = Car( '34-DE-9876', 'Renault', 'Megane', 2015, 71000)
c3 = Car( '07-DE-4563', 'Toyota', 'Carolla', 2010, 45000)
c4 = Car( '09-XY-2145', 'Volkswagen', 'Passat', 2013, 89600)

#add cars to list
car_list = [c1,c2,c3,c4]
#print('List of cars:',car_list)

#input a plate num and display if a car matches
pNo = input('Enter plate number to search: ')
found = False
for car in car_list:
    if car.getplateNo() == pNo:
        print(car)
        found = True

if not found:
    print('No matching car')

#display the cars produced after 2014
print('Cars 2014 model or later: ')
for car in car_list:
    if car.getyear() >2014:
        print(car)

#display average price of all cars in the list
sum_p = 0
for car in car_list:
    sum_p += car.getprice()

average = sum_p / len(car_list)
print(f'Average price of cars: {average:.2f}')