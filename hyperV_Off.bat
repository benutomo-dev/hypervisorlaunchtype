@echo off

net session >NUL 2>NUL
IF %ERRORLEVEL% NEQ 0 (
	ECHO �Ǘ��Ҍ����Ŏ��s���Ă��������B
	timeout /t 5
	exit /b
)

ECHO Hyper-V�𖳌��ɂ��܂��B
REM bcdedit /enum | find "hy"
bcdedit /set hypervisorlaunchtype off

IF %ERRORLEVEL% NEQ 0 (
	ECHO �ݒ�Ɏ��s���܂����B
	timeout /t 5
	exit /b
)

set mode=n
set /p mode=�V�����ݒ�͍ċN����ɗL���ƂȂ�܂��B���ċN�����܂����H[y/n] (default - %mode%)?:

IF %mode% == y (
	shutdown -r -t 0
)
