# CESM.run Toolkit

本仓库用于发布 CESM.run Toolkit 的 Linux 命令行二进制文件。

英文说明见 [README.md](README.md)。

## 下载

当前 release 附件：

```text
cesmrun-linux-x86_64
```

适用目标：

- Linux x86_64

该二进制文件已经包含 CESM.run Toolkit 需要的 Python 运行时。用户运行前不需要
再创建 Python 环境。

## 安装

从 GitHub Releases 下载：

```bash
bash install.sh
```

或者手动安装：

```bash
curl -L -o cesmrun \
  https://github.com/Mrxun-JN/cesmrun-release/releases/download/v0.9.0/cesmrun-linux-x86_64
chmod +x cesmrun
./cesmrun --version
```

如果集群不能访问 GitHub，可以先在其它机器下载 `cesmrun-linux-x86_64`，上传到
集群后运行：

```bash
chmod +x cesmrun-linux-x86_64
./cesmrun-linux-x86_64 --help
```

## 校验

下载 release 附件后，可以校验文件完整性：

```bash
sha256sum -c SHA256SUMS
```

期望校验值：

```text
021eddcacbf968bf849219d390d009f8533375051caecfb9aa5d1ff29e9719f7  cesmrun-linux-x86_64
```

## 基本用法

```bash
./cesmrun-linux-x86_64 --version
./cesmrun-linux-x86_64 doctor
./cesmrun-linux-x86_64 install --prefix $HOME/opt/cesm-libs --dry-run
./cesmrun-linux-x86_64 configure-cesm1 --cesm1-dir /path/to/cesm1 --dry-run
./cesmrun-linux-x86_64 configure-cesm2 --cesm2-dir /path/to/cesm2 --dry-run
```

`doctor`、`--help` 和 `--version` 免费使用。安装和配置命令需要签名 license：

```bash
./cesmrun-linux-x86_64 license activate /path/to/license.cesmrun
./cesmrun-linux-x86_64 license status
```

`doctor` 会把可复用的 CESM 环境信息写入：

```bash
$HOME/.cime/cesm.env.sh
```

后续可以加载：

```bash
source $HOME/.cime/cesm.env.sh
```

## 外部系统工具

二进制文件包含 CESM.run Toolkit 应用运行时，但不会打包目标集群上必须由系统
提供的软件，例如：

- 编译器和 MPI wrapper
- `make`、`cmake`、`perl`、`git`、`svn`
- `module`
- Slurm、PBS 或 LSF 命令
- 使用系统环境时所需的 NetCDF/HDF5 工具

`doctor` 命令会检查这些工具，并报告缺失项。

## 离线依赖包

`install` 所需的 OpenMPI、LAPACK、HDF5、NetCDF 等源码包可以通过本地软件包
目录提供：

```bash
./cesmrun-linux-x86_64 install \
  --prefix $HOME/opt/cesm-libs \
  --package-dir /path/to/cesmrun_package
```

也可以设置：

```bash
export CESMRUN_PACKAGE_DIR=/path/to/cesmrun_package
```

## 许可

使用条款见 [LICENSE](LICENSE)。未经许可，不得逆向、反混淆、重新分发或转售
该二进制文件。
