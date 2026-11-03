@echo off
chcp 65001 >nul
echo ==========================================
echo   产品C 研学 数据分析环境 一键安装（联网）
echo ==========================================
where python >nul 2>nul
if errorlevel 1 (
    echo [错误] 没找到 python。
    echo 先安装 Python 3.13（勾选 Add Python to PATH），再双击本文件。
    pause
    exit /b 1
)
python --version
echo 正在安装 pandas numpy matplotlib（清华镜像）...
python -m pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple
python -m pip install pandas numpy matplotlib -i https://pypi.tuna.tsinghua.edu.cn/simple
echo.
echo 安装完成。请运行「检查环境.py」验证。
pause
