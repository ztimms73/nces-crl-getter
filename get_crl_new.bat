@echo off
chcp 65001 >nul

echo Please wait..

set CURDIR=%~dp0
rem set PX_USER=--proxy-user=
rem set PX_PASS=--proxy-password=
rem set http_proxy=http://10.1.0.50:3128
rem set https_proxy=http://10.1.0.50:3128

del %TEMP%\*.crl >NUL: 2>&1

"%CURDIR%wget" --no-check-certificate -q -T 30 -O %TEMP%\kuc2.crl %PX_USER% %PX_PASS% http://crs.nces.by/files/sertifikaty/kuc2.crl
if ERRORLEVEL 1 goto label_1
"%CURDIR%AvCmUt4.exe" -C %TEMP%\kuc2.crl >NUL

:label_1
"%CURDIR%wget" --no-check-certificate -q -T 30 -O %TEMP%\kuc.crl %PX_USER% %PX_PASS% http://crs.nces.by/files/sertifikaty/kuc.crl
if ERRORLEVEL 1 goto label_2
"%CURDIR%AvCmUt4.exe" -C %TEMP%\kuc.crl >NUL

:label_2
"%CURDIR%wget" --no-check-certificate -q -T 30 -O %TEMP%\ruc3.crl %PX_USER% %PX_PASS% http://crs.nces.by/files/sertifikaty/ruc3.crl
if ERRORLEVEL 1 goto label_3
"%CURDIR%AvCmUt4.exe" -C %TEMP%\ruc3.crl >NUL

:label_3
"%CURDIR%wget" --no-check-certificate -q -T 30 -O %TEMP%\ruc.crl %PX_USER% %PX_PASS% http://crs.nces.by/files/sertifikaty/ruc.crl
if ERRORLEVEL 1 goto label_4
"%CURDIR%AvCmUt4.exe" -C %TEMP%\ruc.crl >NUL

:label_4
"%CURDIR%wget" --no-check-certificate -q -T 30 -O %TEMP%\cas_ruc3.crl %PX_USER% %PX_PASS% http://crs.nces.by/files/sertifikaty/cas_ruc3.crl
if ERRORLEVEL 1 goto label_5
"%CURDIR%AvCmUt4.exe" -C %TEMP%\cas_ruc3.crl >NUL

:label_5
"%CURDIR%wget" --no-check-certificate -q -T 30 -O %TEMP%\cas_ruc.crl %PX_USER% %PX_PASS% http://crs.nces.by/files/sertifikaty/cas_ruc.crl
if ERRORLEVEL 1 goto end
"%CURDIR%AvCmUt4.exe" -C %TEMP%\cas_ruc.crl >NUL

:end

:: del c:%HOMEPATH%\Desktop\AvCmUt4.log

rem AvCmUt4.exe -C %TEMP%\kuc2.crl >NUL
rem AvCmUt4.exe -C %TEMP%\kuc.crl >NUL
rem AvCmUt4.exe -C %TEMP%\ruc3.crl >NUL
rem AvCmUt4.exe -C %TEMP%\ruc.crl >NUL
rem AvCmUt4.exe -C %TEMP%\cas_ruc3.crl >NUL
rem AvCmUt4.exe -C %TEMP%\cas_ruc.crl >NUL

rem "c:\Program Files\Avest\AvPCM_NCES\MngCert.exe" kuc2.crl /importcrl /silentrun
rem "c:\Program Files\Avest\AvPCM_NCES\MngCert.exe" kuc.crl /importcrl /silentrun
rem "c:\Program Files\Avest\AvPCM_NCES\MngCert.exe" ruc3.crl /importcrl /silentrun
rem "c:\Program Files\Avest\AvPCM_NCES\MngCert.exe" ruc.crl /importcrl /silentrun
rem "c:\Program Files\Avest\AvPCM_NCES\MngCert.exe" cas_ruc3.crl /importcrl /silentrun
rem "c:\Program Files\Avest\AvPCM_NCES\MngCert.exe" cas_ruc.crl /importcrl /silentrun