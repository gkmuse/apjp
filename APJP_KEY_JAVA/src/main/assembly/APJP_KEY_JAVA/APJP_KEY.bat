@echo off
set a=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
setlocal EnableDelayedExpansion
set count=0
:: The default length of APJP_KEY is 16
set salt=0
:number
set /p salt=Enter a salt value(Integer ^<=10): 
if !salt! gtr 10 goto number
set /a length=15 + !salt!
:loop
set /a count+=1
set /a rand=%Random%%%61
set buffer=!buffer!!a:~%rand%,1!
if !count! leq !length! goto loop
echo APJP_KEY = !buffer!
set /a length+=1
echo The length of APJP_KEY is !length!
set /p question=Do you want to save APJP_KEY into APJP_KEY.txt? [Y/n] 
if /i "!question!" == "n" goto eof
if /i "!question!" == "N" goto eof
if /i "!question!" == "no" goto eof
if /i "!question!" == "No" goto eof
if /i "!question!" == "NO" goto eof
echo # The length of APJP_KEY is !length! > APJP_KEY.txt
echo APJP_KEY = !buffer! >> APJP_KEY.txt
:eof
endlocal