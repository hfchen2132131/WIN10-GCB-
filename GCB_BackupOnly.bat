@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
cd %~dp0\runfile
echo "%CD%"
if not exist "%CD%\backup\" (
    md backup
    LGPO.exe /b %CD%\backup /q
    echo :
    echo �w�ƥ��]�w
    GOTO _DONE
) else (
    GOTO _EXIST
)
:_EXIST
echo backup already exist
@set /p var=�аݭn�л\�ƥ���(Y/N):
@set result=false
IF %var% == Y set result=true
IF %var% == y set result=true
IF %result% == true (
    rmdir backup /s /Q
    md backup
    LGPO.exe /b %CD%\backup /q
    echo:
    echo �w�л\�ƥ�
) else (
    echo ������ӳƥ�
)
:_DONE
echo:
echo �w�Ƥ�GCB�]�w
pause