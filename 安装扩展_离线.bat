@echo off
chcp 65001 >nul
echo ==========================================
echo   VS Code 扩展离线安装（Python / Pylance / 中文语言包）
echo ==========================================
where code >nul 2>nul
if errorlevel 1 (
    echo [错误] 没找到 code 命令。
    echo 请先安装本文件夹里的 VSCodeUserSetup-x64-1.144.1.exe（安装时勾选
    echo Add to PATH），或把 VS Code 的 bin 目录加入 PATH 后重试。
    pause
    exit /b 1
)
echo 正在安装 Python 扩展...
call code --install-extension "%~dp0vscode-extensions\ms-python.python.vsix" --force
echo 正在安装 Pylance...
call code --install-extension "%~dp0vscode-extensions\ms-python.vscode-pylance.vsix" --force
echo 正在安装中文语言包...
call code --install-extension "%~dp0vscode-extensions\vscode-language-pack-zh-hans.vsix" --force
echo.
echo 安装完成。重启 VS Code 后，右下角弹窗选择
echo 「Change Language and Restart」即可切换中文界面。
pause
