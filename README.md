# Analog IP design example: 8-bit Resistive ladder DAC ![](../../workflows/cace/badge.svg)

## Important note:

This project has been moved to [github/efabless](https://github.com/efabless/sky130_ef_ip__rdac3v_8bit).  This local repository has been archived, and continued development will be done under the Efabless github location.

This is a simple 8-bit DAC demonstrating the use
of the CACE system. It requires [CACE](https://github.com/efabless/cace) to run the testbenches.

- [Documentation](docs/sky130_ef_ip__rdac3v_8bit.md)
- [Characterization](docs/sky130_ef_ip__rdac3v_8bit_schematic.md)

## Clone the Repository

Make sure to clone the repository with submodules:

```
git clone https://github.com/RTimothyEdwards/sky130_ef_ip__rdac3v_8bit.git --recurse-submodules
```

If you forgot to clone with submodules, you can run the following instead:

```
git submodule update --init --recursive
```

## Repository Structure

Schematics for this DAC are done in xschem and can be found in the `xschem/` directory. Layouts for this RDAC are done in magic and can be found in the `mag/` directory.

The CACE specification is in `cace/sky130_ef_ip__rdac3v_8bit.yaml`. Testbench schematics are in the `cace/templates/` directory. Note that testbenches are editable in xschem, and netlists can be generated, but netlists contain variables that must be substituted by CACE and cannot simulate prior to variable substitution by CACE.

## Run CACE

After you have installed CACE and all dependencies, invoking the characterization of this project is as easy as running:

```console
cace
```

This will use the "best" netlist available. Since a layout is provided, the netlist source will be "rcx" (R-C-extracted). To perform characterization on a different netlist, pass the `--source` argument to cace. For help on arguments, run `cace --help`.

After characterization is completed, you will find the simulation files, log files and reports under `run/TIMESTAMP/`, where TIMESTAMP is the time and date when cace was started.

## Continuous Integration

This project also demonstrates how CACE can be used for continuous integration. Under `.github/workflows/` you will find the `cace.yml` GitHub action. It makes use of the composite action [cace-action](https://github.com/efabless/cace-action).

First, the environment is set up and CACE is started. Then the `run/` directory is uploaded so that it can be viewed later. Finally, the summary is added to the step overview.

Take a look at the latest runs under [actions](https://github.com/RTimothyEdwards/sky130_ef_ip__rdac3v_8bit/actions). If you are logged in to GitHub, you can also click on a run and view the summary.
