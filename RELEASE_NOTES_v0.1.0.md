# CESM.run Toolkit v0.1.0

Initial Linux x86_64 binary release.

## Assets

- `cesmrun-linux-x86_64`
- `SHA256SUMS`

## Verify

```bash
sha256sum -c SHA256SUMS
./cesmrun-linux-x86_64 --version
./cesmrun-linux-x86_64 --help
```

## Highlights

- `cesmrun doctor` checks CESM build environments and writes
  `$HOME/.cime/cesm.env.sh`.
- `cesmrun install` can build OpenMPI, LAPACK/BLAS, parallel HDF5, NetCDF-C,
  and NetCDF-Fortran from bundled source archives.
- `cesmrun configure-cesm1` generates CESM1 machine/compiler XML.
- `cesmrun configure-cesm2` updates CIME machine/compiler/batch XML.

