# Python + VS Code 离线环境安装包（Windows / macOS）

为学生批量装数据分析环境准备的**全离线安装包**：Python、VS Code、pandas / numpy / matplotlib、
**Jupyter（Notebook 上课形式）** 和 VS Code 扩展都已提前下载好，全程不需要联网，
特别适合网络不稳定的教室或酒店环境。

## 快速开始

1. 到本仓库 [Releases](https://github.com/zzj1965186613/python-vscode-offline-setup/releases)
   页面下载对应平台的 zip：

   | 文件 | 平台 | 大小 |
   |---|---|---|
   | `env-prep-win64.zip` | Windows（64 位） | 约 440 MB |
   | `env-prep-mac.zip` | macOS（苹果芯片 / Intel） | 约 930 MB |

   下载直链（永远指向最新版）：
   - <https://github.com/zzj1965186613/python-vscode-offline-setup/releases/latest/download/env-prep-win64.zip>
   - <https://github.com/zzj1965186613/python-vscode-offline-setup/releases/latest/download/env-prep-mac.zip>

   文件名保持纯 ASCII，避免不同系统解压时中文名乱码；解压后是一个「环境准备」文件夹。

2. 解压后按 `离线安装说明.md` 的步骤操作即可，学生电脑全程不联网。
   核心流程只有三步：装 Python → 双击一键安装脚本（自动从离线包装库）→ 运行 `检查环境.py` 看到「环境 OK」。
   想在 **VS Code 里跑 `.ipynb`** 的，再双击一次 `安装扩展_离线.bat / .command`，把 Jupyter 扩展也装上（见下）。

## 仓库里有什么

| 文件 | 说明 |
|---|---|
| `检查环境.py` | 环境自检脚本：Python 版本、库版本（含 Jupyter）、画图冒烟测试，全绿显示「环境 OK」 |
| `一键安装.bat` | Windows 联网安装路线（走清华镜像，网络好时可选） |
| `一键安装_离线.bat` | Windows 离线装库：pandas / numpy / matplotlib / Jupyter |
| `安装扩展_离线.bat` | Windows 离线装 VS Code 扩展（Python、Pylance、中文语言包、**Jupyter**） |
| `一键安装_离线.command` | macOS 离线装库（自动识别苹果芯片 / Intel 芯片，自动挑 3.13 解释器） |
| `安装扩展_离线.command` | macOS 离线装 VS Code 扩展（同上四个） |
| `离线安装说明.md` | 完整使用说明（老师准备、学生安装步骤、Notebook 用法、常见坑） |

## Notebook 上课形式

离线包已内置 Jupyter，装完即可用，两种方式：

- **VS Code 里开 `.ipynb`**：直接打开 ipynb 文件，选内核 `Python 3.13` 即可。
  VS Code 本身**不自带** Jupyter，需要第四个离线 vsix（`ms-toolsai.jupyter`）——
  `安装扩展_离线.bat / .command` 已经把它列进安装清单，装完重启 VS Code 就能点 ▶ 运行，全程不联网。
- **浏览器 JupyterLab**：终端运行 `jupyter lab`，自动打开浏览器。

Python 安装程序、VS Code 安装程序、离线 wheel 库等大文件放在 Release 的 zip 里
（GitHub 单文件 100 MB 限制，Release 附件没有这个问题）。

## 版本约定

- Python **3.13.9**（Windows 64 位安装包 + macOS 通用安装包）
- 数据分析库：**numpy 2.3.4 / pandas 3.1.0 / matplotlib 3.10.7**
- Jupyter：**jupyterlab 4.6.6 / notebook 7.6.5 / ipykernel 7.4.0**
- VS Code **1.144.1**

离线 wheel 包按 Python 3.13 构建，学生必须装包内的 Python 版本——统一版本是
离线方案能成立的命门。想更新版本时，在联网电脑上用
[离线安装说明.md](离线安装说明.md) 第六节的 `pip download` 命令重新生成。

## 目录结构（zip 解压后）

```
环境准备/
├── 检查环境.py
├── 一键安装.bat              # Windows 联网路线（可选）
├── 离线安装说明.md
└── 安装包/
    ├── python-3.13.9-...     # Python 安装程序
    ├── VSCode...             # VS Code 安装程序
    ├── wheels.../            # 离线库（按平台）
    ├── vscode-extensions/    # 扩展离线包（两平台共用）
    ├── 一键安装_离线.bat / .command
    └── 安装扩展_离线.bat / .command
```

## 常见问题

见 [离线安装说明.md](离线安装说明.md) 第八节，覆盖了 8 类常见坑：
PATH 没勾、Python 版本对不上、中文方框、调试器选择、语言包不生效、mac 旧版 Python、
`jupyter lab` 找不到命令、浏览器没自动弹出。
