# CESM.run Toolkit v0.9.0

This release packages the current CESM.run Toolkit binary for Linux x86_64.

## Highlights

- Expanded `doctor` system checks, including `xmllint`, Perl modules, batch
  systems, BLAS/LAPACK, CMake, MPI, NetCDF-C, and NetCDF-Fortran.
- Added install support for OpenMPI, CMake, LAPACK/BLAS, parallel HDF5,
  NetCDF-C, and NetCDF-Fortran from bundled source archives.
- Improved `$HOME/.cime/cesm.env.sh` generation for installed environments.
- Added CESM1 and CESM2 configuration generation, including machine,
  compiler, batch, PE layout, and CESM compatibility patches.
- Improved CESM2 CIME XML ordering and Python shebang compatibility on systems
  that provide `python3` but not `python`.
- Added signed license activation, status, machine-id, and flexible duration
  support.

## Install

```bash
curl -L -o cesmrun-linux-x86_64 \
  https://github.com/Mrxun-JN/cesmrun-release/releases/download/v0.9.0/cesmrun-linux-x86_64
curl -L -o SHA256SUMS \
  https://github.com/Mrxun-JN/cesmrun-release/releases/download/v0.9.0/SHA256SUMS
sha256sum -c SHA256SUMS
chmod +x cesmrun-linux-x86_64
./cesmrun-linux-x86_64 --version
```

## Notes

- This release targets Linux x86_64.
- Cluster tools such as compilers, MPI wrappers, `module`, schedulers, and
  system package managers are not bundled.
- For offline dependency builds, provide source archives with
  `--package-dir /path/to/cesmrun_package` or set `CESMRUN_PACKAGE_DIR`.
