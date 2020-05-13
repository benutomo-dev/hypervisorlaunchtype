@echo off

net session >NUL 2>NUL
IF %ERRORLEVEL% NEQ 0 (
	ECHO 管理者権限で実行してください。
	timeout /t 5
	exit /b
)

ECHO Hyper-Vを有効にします。
REM bcdedit /enum | find "hy"
bcdedit /set hypervisorlaunchtype auto

IF %ERRORLEVEL% NEQ 0 (
	ECHO 設定に失敗しました。
	timeout /t 5
	exit /b
)

set mode=n
set /p mode=新しい設定は再起動後に有効となります。今再起動しますか？[y/n] (default - %mode%)?:

IF %mode% == y (
	shutdown -r -t 0
)
