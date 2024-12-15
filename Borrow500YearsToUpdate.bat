@echo off
set pausedays=null


::默认中文
call :CN
call :main






:CN
set title=               向     天     再     借     5     0     0     年
set intd=一个绝对无副作用的Windows更新禁止工具
set enternum=请输入序号
set fh=1.向天再借500年(182625天后更新，即500年)
set set=2.自定义暂停更新时长
set abt=4.关于
set entday=请输入需要暂停的天数
set noable=请输入有效编号
set fgx=______________________________________________________________________
set abttit=关于
set fns=已完成操作，感谢使用！按任意键弹出设置窗口，并在弹出的窗口最下方的“暂停更新”选择框中选择最长的可暂停时间
goto:eof




:main
cls
::显示内容
echo %title%
echo %intd%
echo %fgx%
echo %fh%
echo %set%
echo 3.语言切换/Language switching/言語の切り替え
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
echo 语言切换/Language switching/言語の切り替え
echo %fgx%
echo 1.简体中文
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