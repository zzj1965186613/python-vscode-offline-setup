@echo off
chcp 65001 >nul
echo ==========================================
echo   产品C 研学 数据分析环境 一键安装（离线）
echo ==========================================
echo 前提：把整个「安装包」文件夹拷到学生电脑后，再双击本文件。
echo       学生电脑必须先装好本文件夹里的 python-3.13.9-amd64.exe。
where python >nul 2>nul
if errorlevel 1 (
    echo [错误] 没找到 python。
    echo 请先双击本文件夹里的 python-3.13.9-amd64.exe 安装，
    echo 注意务必勾选 Add Python to PATH。
    pause
    exit /b 1
)
if not exist "%~dp0wheels" (
    echo [错误] 没找到 wheels 文件夹。请保持它和本 bat 在同一个文件夹里。
    pause
    exit /b 1
)
python --version
echo 正在从离线包安装（不联网）...
python -m pip install --no-index --find-links="%~dp0wheels" pandas numpy matplotlib
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
