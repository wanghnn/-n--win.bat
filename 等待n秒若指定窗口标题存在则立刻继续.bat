@echo off

rem ���޸Ļ���������myreturnvalue
rem 
rem ===========����================
rem ����һ���ȴ�������
rem �����������ڱ����е��ַ��� (�����ִ�Сд)
rem ���������Ƿ���ʾ��Ϣ��Ϊnoecho����ʾ��

set myseconds=%~1
set mywindowtitle=%~2
set /a myloopsnum=myseconds
set myecho=%~3

rem ===========ѭ����ֱ������ָ�����ڣ���ʱʱ�䵽��================

if not "%myecho%" == "noecho" (
	echo.
	echo   �ȴ�%myseconds%�룬��ָ�����ڱ��⡰%mywindowtitle%�����ڣ������̼�����
	echo.
)

set myreturnvalue=

:myloop

set myfound=
tasklist /v /fo csv | find /i "%mywindowtitle%">nul 2>nul && set myfound=found
rem echo %errorlevel%
rem if not ERRORLEVEL 1 set myfound=found

if "%myfound%" == "found" goto:myend1

rem cscript //nologo "%~dp0��ͣn����.vbs"  100

set /a myloopsnum-=1
if %myloopsnum% LEQ 0 goto:myend2

goto:myloop


:myend1

if not "%myecho%" == "noecho" (
	echo.
	echo   �ҵ��˴��ڱ��� ��%mywindowtitle%����
	echo.
	)
	
set myreturnvalue=1
goto :eof

:myend2

if not "%myecho%" == "noecho" (
	echo.
	echo   ��ʱʱ�䵽�ˣ�δ�ҵ����ڱ��� ��%mywindowtitle%����
	echo.
	)
	
set myreturnvalue=2
goto :eof
