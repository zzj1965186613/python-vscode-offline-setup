#!/bin/bash
# VS Code 扩展离线安装（macOS）
cd "$(dirname "$0")"
CODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
if [ ! -x "$CODE" ]; then
  echo "[错误] 没找到 VS Code。请先把 VSCode-darwin-universal.zip 解压，"
  echo "把 Visual Studio Code.app 拖进「应用程序」文件夹，再运行本脚本。"
  read -r -p "按回车退出..." _
  exit 1
fi
echo "正在安装 Python 扩展..."
"$CODE" --install-extension "vscode-extensions/ms-python.python.vsix" --force
echo "正在安装 Pylance..."
"$CODE" --install-extension "vscode-extensions/ms-python.vscode-pylance.vsix" --force
echo "正在安装中文语言包..."
"$CODE" --install-extension "vscode-extensions/vscode-language-pack-zh-hans.vsix" --force
echo "安装完成。重启 VS Code，右下角选择 Change Language and Restart 切换中文。"
read -r -p "按回车退出..." _
