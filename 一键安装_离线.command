#!/bin/bash
# 产品C 研学 数据分析环境 一键安装（macOS 离线）
cd "$(dirname "$0")"

# 找一个真的是 3.13 的 python3：装了 Homebrew 的电脑上，裸 python3 可能还是 3.12
PY=""
for CAND in python3.13 \
            /Library/Frameworks/Python.framework/Versions/3.13/bin/python3 \
            /opt/homebrew/bin/python3.13 \
            /usr/local/bin/python3.13 \
            python3 \
            /usr/local/bin/python3 \
            /opt/homebrew/bin/python3; do
  P=$(command -v "$CAND" 2>/dev/null)
  [ -n "$P" ] || continue
  if "$P" -c 'import sys; sys.exit(0 if sys.version_info[:2] == (3, 13) else 1)' >/dev/null 2>&1; then
    PY="$P"
    break
  fi
done
if [ -z "$PY" ]; then
  echo "[错误] 没找到 Python 3.13（离线包只支持 3.13）。"
  echo "请先双击安装 python-3.13.9-macos11.pkg，再运行本脚本。"
  echo "若电脑上装了多个 Python，可先执行："
  echo "  /Library/Frameworks/Python.framework/Versions/3.13/bin/python3 --version"
  echo "确认 3.13 装好了再重试。"
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

echo "当前 Python：$("$PY" --version)，芯片：$ARCH"
echo "正在从离线包安装（不联网）..."
"$PY" -m pip install --no-index --find-links="$WHEELS" pandas numpy matplotlib jupyterlab notebook ipykernel

if [ $? -ne 0 ]; then
  echo "[错误] 安装失败。请把报错截图发给老师。"
  echo "如果报 Permission denied（系统目录没写权限），打开终端进入本文件夹执行："
  echo "  sudo \"$PY\" -m pip install --no-index --find-links=\"$WHEELS\" pandas numpy matplotlib jupyterlab notebook ipykernel"
  read -r -p "按回车退出..." _
  exit 1
fi

echo "安装完成。请运行 检查环境.py 验证。"
read -r -p "按回车退出..." _
