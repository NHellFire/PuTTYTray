@echo off
cd /D %~dp0
perl mkfiles.pl
cd windows
CALL "%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\Common7\Tools\vsvars32.bat"
git describe --tags > git_version.txt
set /p VERSION=<git_version.txt
del /q git_version.txt
set NOSIGN=1
build-release %VERSION%
