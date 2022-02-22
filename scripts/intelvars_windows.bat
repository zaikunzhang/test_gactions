mklink /D "C:\Program Files (x86)\Microsoft Visual Studio\2019" "C:\Program Files\Microsoft Visual Studio\2022"
mklink /D "C:\Program Files (x86)\Microsoft Visual Studio\2020" "C:\Program Files\Microsoft Visual Studio\2022"
mklink /D "C:\Program Files (x86)\Microsoft Visual Studio\2021" "C:\Program Files\Microsoft Visual Studio\2022"

for /f "tokens=* usebackq" %%f in (`dir /b "C:\Program Files (x86)\Intel\oneAPI\compiler\" ^| findstr /V latest ^| sort`) do @set "LATEST_VERSION=%%f"
@call "C:\Program Files (x86)\Intel\oneAPI\compiler\%LATEST_VERSION%\env\vars.bat"

echo %LATEST_VERSION%
where ifort.exe
where ifx.exe

setx "ONEAPI_ROOT" "C:\Program Files (x86)\Intel\oneAPI" /M
echo "ONEAPI_ROOT=C:\Program Files (x86)\Intel\oneAPI" >> %GITHUB_ENV%
echo "ONEAPI_VER=%LATEST_VERSION%" >> %GITHUB_ENV%
echo "PATH=%PATH%;C:\Program Files (x86)\Intel\oneAPI\compiler\%LATEST_VERSION%\windows\bin\intel64;C:\Program Files (x86)\Intel\oneAPI\compiler\%LATEST_VERSION%\windows\bin" >> %GITHUB_ENV%
echo "IFORT_COMPILER21=C:\Program Files (x86)\Intel\oneAPI\compiler\%LATEST_VERSION%\windows" >> %GITHUB_ENV%
mklink "C:\Windows\ifort.exe" "C:\Program Files (x86)\Intel\oneAPI\compiler\%LATEST_VERSION%\windows\bin\intel64\ifort.exe"
mklink "C:\Windows\ifx.exe" "C:\Program Files (x86)\Intel\oneAPI\compiler\%LATEST_VERSION%\windows\bin\ifx.exe"
