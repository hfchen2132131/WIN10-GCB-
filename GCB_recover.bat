@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
cd %~dp0\runfile
LGPO.exe /g %CD%\backup /q
echo:
echo �w�q�ƥ���_�]�w
pause