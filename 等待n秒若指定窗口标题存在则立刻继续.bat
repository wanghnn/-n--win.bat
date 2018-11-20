@echo off

rem 会修改环境变量：myreturnvalue
rem 
rem ===========参数================
rem 参数一：等待的秒数
rem 参数二：窗口标题中的字符串 (不区分大小写)
rem 参数三：是否显示信息（为noecho则不显示）

set myseconds=%~1
set mywindowtitle=%~2
set /a myloopsnum=myseconds
set myecho=%~3

rem ===========循环：直到出现指定窗口，或超时时间到了================

if not "%myecho%" == "noecho" (
	echo.
	echo   等待%myseconds%秒，若指定窗口标题“%mywindowtitle%”存在，则立刻继续。
	echo.
)

set myreturnvalue=

:myloop

set myfound=
tasklist /v /fo csv | find /i "%mywindowtitle%">nul 2>nul && set myfound=found
rem echo %errorlevel%
rem if not ERRORLEVEL 1 set myfound=found

if "%myfound%" == "found" goto:myend1

rem cscript //nologo "%~dp0暂停n毫秒.vbs"  100

set /a myloopsnum-=1
if %myloopsnum% LEQ 0 goto:myend2

goto:myloop


:myend1

if not "%myecho%" == "noecho" (
	echo.
	echo   找到了窗口标题 “%mywindowtitle%”。
	echo.
	)
	
set myreturnvalue=1
goto :eof

:myend2

if not "%myecho%" == "noecho" (
	echo.
	echo   超时时间到了，未找到窗口标题 “%mywindowtitle%”。
	echo.
	)
	
set myreturnvalue=2
goto :eof
