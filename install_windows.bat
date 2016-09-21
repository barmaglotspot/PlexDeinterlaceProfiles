:: Copy *.xml profiles to Plex Media Server Profiles folder
:: Run as Administrator

ECHO OFF
CLS

PUSHD "%~dp0"

IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT)
IF EXIST "%PROGRAMFILES%" (GOTO 32BIT) ELSE (GOTO UNKNOWN)

:32BIT
XCOPY "%cd%\*.xml" "%PROGRAMFILES%\Plex\Plex Media Server\Resources\Profiles\" /Y /Q
GOTO ERRORCHECK

:64BIT
XCOPY "%cd%\*.xml" "%PROGRAMFILES(X86)%\Plex\Plex Media Server\Resources\Profiles\" /Y /Q
GOTO ERRORCHECK

:ERRORCHECK
IF ERRORLEVEL 4 ( ECHO ERROR: Try running as Administrator )
GOTO END

:UNKNOWN:
ECHO ERROR: Unknown OS
GOTO END

:END
PAUSE
