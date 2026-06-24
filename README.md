# CESM.run Toolkit

CESM.run Toolkit is distributed here as a prebuilt Linux command line binary.

Chinese documentation: [README_zh.md](README_zh.md)

## Download

Current release asset:

```text
cesmrun-linux-x86_64
```

Supported target:

- Linux x86_64

The binary bundles the Python runtime needed by CESM.run Toolkit. Users do not
need to create a Python environment before running it.

## Install

Download from GitHub Releases:

```bash
bash install.sh
```

Or install manually:

```bash
curl -L -o cesmrun \
  https://github.com/Mrxun-JN/cesmrun-release/releases/download/v0.1.0/cesmrun-linux-x86_64
chmod +x cesmrun
./cesmrun --version
```

If the cluster cannot access GitHub, download `cesmrun-linux-x86_64` on another
machine, upload it to the cluster, and run:

```bash
chmod +x cesmrun-linux-x86_64
./cesmrun-linux-x86_64 --help
```

## Verify

After downloading the release assets, verify the checksum:

```bash
sha256sum -c SHA256SUMS
```

Expected checksum:

```text
cd30c2034263c7b1949ec75798a15a50561b5ac23e00a808d64eea0a6b910b16  cesmrun-linux-x86_64
```

## Basic Usage

```bash
./cesmrun-linux-x86_64 --version
./cesmrun-linux-x86_64 doctor
./cesmrun-linux-x86_64 install --prefix $HOME/opt/cesm-libs --dry-run
./cesmrun-linux-x86_64 configure-cesm1 --cesm1-dir /path/to/cesm1 --dry-run
./cesmrun-linux-x86_64 configure-cesm2 --cesm2-dir /path/to/cesm2 --dry-run
```

`doctor`, `--help`, and `--version` are free. Installation and configuration
commands require a signed license:

```bash
./cesmrun-linux-x86_64 license activate /path/to/license.cesmrun
./cesmrun-linux-x86_64 license status
```

`doctor` writes reusable CESM environment information to:

```bash
$HOME/.cime/cesm.env.sh
```

Load it later with:

```bash
source $HOME/.cime/cesm.env.sh
```

## External Tools

The binary contains the CESM.run Toolkit application runtime, but it does not
bundle cluster software that must come from the target system, such as:

- compilers and MPI wrappers
- `make`, `cmake`, `perl`, `git`, `svn`
- `module`
- Slurm, PBS, or LSF commands
- NetCDF/HDF5 tools when using an existing system environment

The `doctor` command checks these tools and reports what is missing.

## Offline Dependency Package

For `install`, source archives for OpenMPI, LAPACK, HDF5, NetCDF, and related
libraries can be provided through a local package directory:

```bash
./cesmrun-linux-x86_64 install \
  --prefix $HOME/opt/cesm-libs \
  --package-dir /path/to/cesmrun_package
```

You can also set:

```bash
export CESMRUN_PACKAGE_DIR=/path/to/cesmrun_package
```

## License

See [LICENSE](LICENSE). Do not reverse engineer, deobfuscate, redistribute, or
resell the binary without permission.
