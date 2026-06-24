# CESM.run Toolkit v0.1.0

This is the first public binary release of CESM.run Toolkit for Linux x86_64
clusters.

## Release Assets

- `cesmrun-linux-x86_64`
- `SHA256SUMS`

The binary bundles the CESM.run Toolkit application runtime. Users do not need
to create a Python environment before running it.

## Install

```bash
curl -L -o cesmrun-linux-x86_64 \
  https://github.com/Mrxun-JN/cesmrun-release/releases/download/v0.1.0/cesmrun-linux-x86_64
curl -L -o SHA256SUMS \
  https://github.com/Mrxun-JN/cesmrun-release/releases/download/v0.1.0/SHA256SUMS
sha256sum -c SHA256SUMS
chmod +x cesmrun-linux-x86_64
./cesmrun-linux-x86_64 --version
```

Expected checksum:

```text
4e0e64380db344b425c7cb352dc6f0ee3e862c9d7c41adc7ca6ebd51bd0c2ad6  cesmrun-linux-x86_64
```

## Highlights

- Added `doctor` environment checks for CESM build prerequisites.
- Added module-aware detection for NetCDF, MPI, compilers, CMake, Perl modules,
  BLAS/LAPACK, and batch systems.
- Added reusable environment export to `$HOME/.cime/cesm.env.sh`.
- Added `install` workflow for OpenMPI, LAPACK/BLAS, parallel HDF5, NetCDF-C,
  and NetCDF-Fortran from bundled source archives.
- Added CESM1 machine/compiler XML generation.
- Added CESM2 CIME machine/compiler/batch XML generation.
- Distributed as a Linux x86_64 executable.

## Basic Usage

```bash
./cesmrun-linux-x86_64 doctor
./cesmrun-linux-x86_64 install --prefix $HOME/opt/cesm-libs --dry-run
./cesmrun-linux-x86_64 configure-cesm1 --cesm1-dir /path/to/cesm1 --dry-run
./cesmrun-linux-x86_64 configure-cesm2 --cesm2-dir /path/to/cesm2 --dry-run
```

## Notes

- This release targets Linux x86_64.
- Cluster tools such as compilers, MPI wrappers, `module`, schedulers, and
  system package managers are not bundled.
- For offline dependency builds, provide source archives with
  `--package-dir /path/to/cesmrun_package` or set `CESMRUN_PACKAGE_DIR`.
- `doctor` may write `$HOME/.cime/cesm.env.sh`; source that file when you want
  to reuse the detected environment.
