@echo off
setlocal

REM git repo
set REPO_URL=https://github.com/kamal-hamza/nvim.git

REM dest folder
set DEST_DIR=%USERPROFILE%\AppData\Local\nvim

REM Function to check if a command exists
call :check_command fzf
set fzf_installed=%errorlevel%

call :check_command node
set node_installed=%errorlevel%

call :check_command npm
set npm_installed=%errorlevel%

call :check_command pip
set pip_installed=%errorlevel%

call :check_command grep
set grep_installed=%errorlevel%

REM Optional: Install missing tools (if user wants)
if %fzf_installed% NEQ 0 (
    set missing_tools=1
)
if %node_installed% NEQ 0 (
    set missing_tools=1
)
if %npm_installed% NEQ 0 (
    set missing_tools=1
)
if %pip_installed% NEQ 0 (
    set missing_tools=1
)
if %grep_installed% NEQ 0 (
    set missing_tools=1
)

if defined missing_tools (
    set /p answer=Some tools are missing. Do you want to install them? (y/n): 
    set answer=%answer:~0,1%
    set answer=%answer: =%
    if /i "%answer%" == "y" (
        echo Installing missing tools...

        REM Install fzf if missing
        if %fzf_installed% NEQ 0 (
            echo Installing fzf...
            if exist "%ProgramFiles%\Git\cmd\git.exe" (
                REM Git for Windows, check if it's installed
                echo fzf installation can be done via Git Bash
            ) else (
                echo fzf can be installed via a package manager like 'winget' or 'chocolatey'
            )
        )

        REM Install node if missing
        if %node_installed% NEQ 0 (
            echo Installing node...
            winget install OpenJS.NodeJS
        )

        REM Install npm if missing
        if %npm_installed% NEQ 0 (
            echo Installing npm...
            winget install npm
        )

        REM Install pip if missing
        if %pip_installed% NEQ 0 (
            echo Installing pip...
            python -m ensurepip --upgrade
        )

        REM Install grep if missing
        if %grep_installed% NEQ 0 (
            echo Installing grep...
            REM Grep is available with Git Bash or can be installed via other package managers like winget or chocolatey
        )

        echo Missing tools installed successfully!
    ) else (
        echo Installation skipped.
    )
)

echo Cloning repository...
git clone %REPO_URL% %DEST_DIR%
cd %DEST_DIR%

REM Optional: Remove unnecessary files
del /f /q .git
del /f /q README.MD
del /f /q LICENSE
del /f /q install.sh
del /f /q install.bat

echo Setup complete!
exit /b

REM Function to check if a command exists
:check_command
where %1 >nul 2>nul
exit /b %errorlevel%
