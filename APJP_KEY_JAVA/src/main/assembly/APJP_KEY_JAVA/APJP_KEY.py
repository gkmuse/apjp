#!/usr/bin/env python
# encoding : utf-8

from random import random

a = list("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
buffer = ''

while True:
    try:
        salt = input("Input a salt value(Integer <= 10): ")
        if int(salt) <= 10:
            length = 16 + int(salt)
            break
    except NameError:
        print("Your input is String. Please input Number.")
    except SyntaxError:
        length = 16
        break

for i in range(0, length):
    buffer += a[int(random()*len(a))]

output = 'APJP_KEY = ' + buffer
print output
print "The length of APJP_KEY is %s" % length

question = raw_input("Do you want to save APJP_KEY into APJP_KEY.txt? [Y/n] ")
if question == 'n':
    SystemExit
elif question == 'N':
    SystemExit
elif question == 'no':
    SystemExit
elif question == 'No':
    SystemExit
elif question == 'NO':
    SystemExit
else:
    open('APJP_KEY.txt', 'w').write("# The length of APJP_KEY is %s\n" % length + output)
