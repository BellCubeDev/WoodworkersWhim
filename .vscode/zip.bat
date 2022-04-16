@echo off
ECHO [33mNOTICE: 7-zip MUST be installed to use this batch program!
ECHO [0m
ECHO Deleting any previous outputs...
:: I call a new instance of CMD because I was experiencing oddities using either rd or del in a Batch script.
:: It would always throw "Access is denied"
ECHO.
ECHO Zipping first folder...
ECHO.
ECHO [33m
cd "%~1"
cmd /c "del /q ^"%~2^" "
7z a -aoa -spe -tzip "%~2" -ir!*
ECHO [0m
ECHO.
ECHO Zipping second folder...
ECHO.
ECHO [33m
cd "%~3"
cmd /c "del /q ^"%~4^" "
7z a -aoa -spe -tzip "%~4" -ir!*
ECHO [0m
ECHO.
ECHO Zipping third folder...
ECHO.
ECHO [33m
cd "%~5"
cmd /c "del /q ^"%~6^" "
7z a -aoa -spe -tzip "%~6" -ir!*
ECHO [0m
SetLocal EnableDelayedExpansion
set count=3
FOR /F %%a IN ('copy /Z "%~dpf0" nul') DO set "carret=%%a"
FOR /L %%S IN (%count%, -1, 1) DO (
    if %%S EQU 1 (set /p = B Exiting in %%S second. !carret!<nul) else (set /p = B Exiting in %%S seconds.!carret!<nul)
    Timeout 1 /NOBREAK 1> nul 2>&1
)
EndLocal
echo  B Exiting...                                              
exit 0