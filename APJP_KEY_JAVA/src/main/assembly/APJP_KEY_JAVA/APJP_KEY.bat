@echo off
set a=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
setlocal EnableDelayedExpansion
set count=0
:: The maximum length of APJP_KEY is 16
set salt=0
:::number
::set /p salt=Enter a salt value(Integer ^<=16): 
::if !salt! gtr 16 goto number
set /a length=15 + !salt!
:loop
set /a count+=1
set /a rand=%Random%%%61
set buffer=!buffer!!a:~%rand%,1!
if !count! leq !length! goto loop
echo APJP_KEY=!buffer!
<nul set /p ".=!buffer!" | clip
echo APJP_KEY had been saved in clipboard^^!
echo The maximum RC4 key length is 128 bits.
set /p question=Do you want to save APJP_KEY into APJP_KEY.txt? [Y/n] 
if /i "!question!" == "n" goto eof
if /i "!question!" == "N" goto eof
if /i "!question!" == "no" goto eof
if /i "!question!" == "No" goto eof
if /i "!question!" == "NO" goto eof
::echo # The length of APJP_KEY is !length! > APJP_KEY.txt
<nul set /p ".=APJP_KEY=!buffer!" >> APJP_KEY.txt
echo.>> APJP_KEY.txt
:eof
endlocal