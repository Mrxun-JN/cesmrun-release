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
cd30c2034263c7b1949ec75798a15a50561b5ac23e00a808d64eea0a6b910b16  cesmrun-linux-x86_64
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
- Added signed license activation and status commands.
- Distributed as a Linux x86_64 executable.

## Basic Usage

```bash
./cesmrun-linux-x86_64 doctor
./cesmrun-linux-x86_64 install --prefix $HOME/opt/cesm-libs --dry-run
./cesmrun-linux-x86_64 configure-cesm1 --cesm1-dir /path/to/cesm1 --dry-run
./cesmrun-linux-x86_64 configure-cesm2 --cesm2-dir /path/to/cesm2 --dry-run
```

License commands:

```bash
./cesmrun-linux-x86_64 license activate /path/to/license.cesmrun
./cesmrun-linux-x86_64 license status
./cesmrun-linux-x86_64 license machine-id
```

## Notes

- This release targets Linux x86_64.
- Cluster tools such as compilers, MPI wrappers, `module`, schedulers, and
  system package managers are not bundled.
- For offline dependency builds, provide source archives with
  `--package-dir /path/to/cesmrun_package` or set `CESMRUN_PACKAGE_DIR`.
- `doctor` may write `$HOME/.cime/cesm.env.sh`; source that file when you want
  to reuse the detected environment.
