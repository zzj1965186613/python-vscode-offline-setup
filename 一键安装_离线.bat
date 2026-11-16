@echo off
chcp 65001 >nul
echo ==========================================
echo   产品C 研学 数据分析环境 一键安装（离线）
echo ==========================================
echo 前提：把整个「安装包」文件夹拷到学生电脑后，再双击本文件。
echo       学生电脑必须先装好本文件夹里的 python-3.13.9-amd64.exe。

rem ---- 找 Python 3.13：先看官方安装包的固定路径，避开 Microsoft Store 的占位符 ----
set "PY="
if exist "%LOCALAPPDATA%\Programs\Python\Python313\python.exe" set PY="%LOCALAPPDATA%\Programs\Python\Python313\python.exe"
if not defined PY if exist "C:\Python313\python.exe" set PY="C:\Python313\python.exe"
if not defined PY if exist "%ProgramFiles%\Python313\python.exe" set PY="%ProgramFiles%\Python313\python.exe"
if not defined PY (
    rem PATH 里的 python 可能是商店占位符，必须真的能跑且真的是 3.13 才用
    python -c "import sys; sys.exit(0 if sys.version_info[:2]==(3,13) else 1)" >nul 2>nul
    if not errorlevel 1 set PY=python
)
if not defined PY (
    echo [错误] 没找到能用的 Python 3.13。
    echo   请先双击本文件夹里的 python-3.13.9-amd64.exe 安装，
    echo   注意务必勾选 Add Python to PATH；
    echo   若已经装过，可能是被「Microsoft Store 的 python 占位符」挡住了：
    echo   设置 → 应用 → 高级应用设置 → 应用执行别名 → 关掉 python.exe 和 python3.exe，
    echo   然后重新双击本文件。
    pause
    exit /b 1
)
if not exist "%~dp0wheels" (
    echo [错误] 没找到 wheels 文件夹。请保持它和本 bat 在同一个文件夹里。
    pause
    exit /b 1
)
echo 使用的 Python：
%PY% --version
echo 正在从离线包安装（不联网）...
%PY% -m pip install --no-index --find-links="%~dp0wheels" pandas numpy matplotlib jupyterlab notebook ipykernel
if errorlevel 1 (
    echo.
    echo [错误] 安装失败。常见原因：Python 版本不是 3.13
    echo （离线包只支持 3.13，请安装本文件夹里的 Python 安装包）。
    pause
    exit /b 1
)
echo.
echo 安装完成。请运行「检查环境.py」验证。
pause
