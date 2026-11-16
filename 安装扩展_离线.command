#!/bin/bash
# VS Code 扩展离线安装（macOS）：Python / Pylance / 中文语言包 / Jupyter
# 若提示 permission denied：先在该文件夹终端里执行 chmod +x 安装扩展_离线.command
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
echo "正在安装 Jupyter（在 VS Code 里运行 .ipynb 必需）..."
"$CODE" --install-extension "vscode-extensions/ms-toolsai.jupyter.vsix" --force
echo "安装完成。重启 VS Code，右下角选择 Change Language and Restart 切换中文。"
echo "提示：装完 Jupyter 后重新打开 .ipynb，右上角「选择内核」选 Python 3.13.x。"
read -r -p "按回车退出..." _
