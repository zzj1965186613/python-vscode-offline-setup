#!/bin/bash
# 产品C 研学 数据分析环境 一键安装（macOS 离线）
cd "$(dirname "$0")"

if command -v python3 >/dev/null 2>&1; then
  PY=python3
elif [ -x "/usr/local/bin/python3" ]; then
  PY=/usr/local/bin/python3
else
  echo "[错误] 没找到 python3。请先双击安装 python-3.13.9-macos11.pkg，再运行本脚本。"
  read -r -p "按回车退出..." _
  exit 1
fi

$PY -c 'import sys; sys.exit(0 if sys.version_info[:2] == (3, 13) else 1)'
if [ $? -ne 0 ]; then
  echo "[错误] 当前 python3 不是 3.13 版本（离线包只支持 3.13）。"
  echo "请先双击安装 python-3.13.9-macos11.pkg，再运行本脚本。"
  read -r -p "按回车退出..." _
  exit 1
fi

ARCH=$(uname -m)
if [ "$ARCH" = "arm64" ]; then
  WHEELS="wheels_mac_arm64"
elif [ "$ARCH" = "x86_64" ]; then
  WHEELS="wheels_mac_x86_64"
else
  echo "[错误] 无法识别电脑芯片：$ARCH"
  read -r -p "按回车退出..." _
  exit 1
fi

echo "当前 Python：$($PY --version)，芯片：$ARCH"
echo "正在从离线包安装（不联网）..."
$PY -m pip install --no-index --find-links="$WHEELS" pandas numpy matplotlib

if [ $? -ne 0 ]; then
  echo "[错误] 安装失败。请把报错截图发给老师。"
  read -r -p "按回车退出..." _
  exit 1
fi

echo "安装完成。请运行 检查环境.py 验证。"
read -r -p "按回车退出..." _
