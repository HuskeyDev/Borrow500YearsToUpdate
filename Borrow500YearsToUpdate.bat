@echo off
set pausedays=null


::Ĭ������
call :CN
call :main






:CN
set title=               ��     ��     ��     ��     5     0     0     ��
set intd=һ�������޸����õ�Windows���½�ֹ����
set enternum=���������
set fh=1.�����ٽ�500��(182625�����£���500��)
set set=2.�Զ�����ͣ����ʱ��
set abt=4.����
set entday=��������Ҫ��ͣ������
set noable=��������Ч���
set fgx=______________________________________________________________________
set abttit=����
set fns=����ɲ�������лʹ�ã���������������ô��ڣ����ڵ����Ĵ������·��ġ���ͣ���¡�ѡ�����ѡ����Ŀ���ͣʱ��
goto:eof




:main
cls
::��ʾ����
echo %title%
echo %intd%
echo %fgx%
echo %fh%
echo %set%
echo 3.�����л�/Language switching/���Z���Ф��椨
echo %abt%
echo %enternum%
set /p input=
if "%input%"=="1" (
call :500
)^
else if "%input%"=="2" (
call :zdy
)^
else if "%input%"=="3" (
call :swtlang
)^
else if "%input%"=="4" (
call :about
)^
else (
echo %noable%
pause
call :main
)
goto:eof




:500
set pausedays=182625
call :enter
goto:eof




:zdy
echo %entday%
set /p input=
set pausedays=%input%
call :enter
goto:eof


:swtlang
cls
echo �����л�/Language switching/���Z���Ф��椨
echo %fgx%
echo 1.��������
echo %enternum%
set /p input=

if "%input%"=="1" (
call :CN
)^
else if "%input%"=="2" (
pause
)^
else (
echo %noable%
pause
call :swtlang
)

call :main
goto:eof





:about
cls
echo %abttit%
echo %fgx%
pause
call :main
goto:eof


:enter
echo %fgx%
echo on
echo reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v FlightSettingsMaxPauseDays /t reg_dword /%pausedays% /f
@echo off
echo %fgx%
echo %fns%
pause
start ms-settings:windowsupdate-options
goto:eof