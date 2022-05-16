@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
cd %~dp0\runfile
echo "%CD%"
if not exist "%CD%\backup\" (
    md backup
    LGPO.exe /b %CD%\backup /q
    echo :
    echo 已備份設定
    GOTO _DONE
) else (
    GOTO _EXIST
)
:_EXIST
echo backup already exist
@set /p var=請問要覆蓋備份嗎(Y/N):
@set result=false
IF %var% == Y set result=true
IF %var% == y set result=true
IF %result% == true (
    rmdir backup /s /Q
    md backup
    LGPO.exe /b %CD%\backup /q
    echo:
    echo 已覆蓋備份
) else (
    echo 維持原來備份
)
:_DONE
echo:
echo 已備分GCB設定
pause