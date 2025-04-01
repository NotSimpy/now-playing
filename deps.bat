@echo off

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed. Installing Python...
    :: Download and install Python (32-bit version)
    set "PYTHON_INSTALLER=python-installer.exe"
    
    :: Download the 32-bit Python installer
    powershell -Command "Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.9.10/python-3.9.10.exe -OutFile %PYTHON_INSTALLER%"

    :: Run the installer with options to add Python to PATH and install pip
    start /wait %PYTHON_INSTALLER% /quiet InstallAllUsers=1 PrependPath=1

    :: Clean up the installer file
    del %PYTHON_INSTALLER%

    :: Check if Python installation was successful
    python --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo Python installation failed. Please install Python manually from https://www.python.org.
        pause
        exit /b
    )
    echo Python installed successfully.
)

:: Install required Python dependencies directly
echo Installing dependencies...
pip install winsdk asyncio tk

echo Dependencies installed successfully.
pause
