# -*- coding: utf-8 -*-
"""检查环境.py —— 开课前在每台学生电脑上跑一遍，确认环境能用。

用法（VS Code 里按 F5，或命令行）：
    python 检查环境.py
全部通过会显示「环境 OK」，缺什么会提示装什么。
"""
import sys

print('=' * 50)
print('产品C 研学数据分析环境检查')
print('=' * 50)
print('Python 版本：', sys.version.split()[0])
if sys.version_info < (3, 10):
    print('[警告] Python 版本太旧，建议安装 Python 3.13')
    sys.exit(1)

# VS Code 检测（仅提示，不影响 Python 数据分析）
import shutil
import subprocess
if shutil.which('code'):
    try:
        r = subprocess.run(['code', '--version'], capture_output=True,
                           text=True, timeout=15)
        ver = r.stdout.splitlines()[0] if (r.returncode == 0 and r.stdout) else '未知'
        print('VS Code：', ver, ' OK')
    except Exception:
        print('VS Code：已安装（版本未知）')
else:
    print('VS Code：未检测到（不影响数据分析，可先上课）')

problems = []

for name in ['pandas', 'numpy', 'matplotlib']:
    try:
        mod = __import__(name)
        print(f'{name}:', mod.__version__, ' OK')
    except ImportError:
        print(f'{name}: 未安装 ✗')
        problems.append(name)

if problems:
    print('\n缺少的库：', ' '.join(problems))
    print('解决方法：双击「安装包\\一键安装_离线.bat」（离线，推荐），或「一键安装.bat」（联网）。')
    sys.exit(1)

# 冒烟测试：真的画一张图试试，光装好还不够
try:
    import pandas as pd
    import matplotlib
    matplotlib.use('Agg')          # 不弹窗，只存文件
    import matplotlib.pyplot as plt
    plt.rcParams['font.sans-serif'] = ['SimHei', 'Microsoft YaHei',
                                       'PingFang SC', 'Hiragino Sans GB',
                                       'Arial Unicode MS']
    df = pd.DataFrame({'x': [1, 2, 3], 'y': [2, 4, 6]})
    plt.figure()
    plt.plot(df['x'], df['y'])
    plt.title('环境自检图')
    plt.savefig('环境自检.png', dpi=80)
    print('\n画图冒烟测试：通过（已生成 环境自检.png）')
except Exception as e:
    print('\n画图冒烟测试失败：', repr(e))
    sys.exit(1)

print('\n环境 OK，可以上课了。')
