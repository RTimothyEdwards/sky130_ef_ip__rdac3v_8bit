# Analog IP design example: 8-bit Resistive ladder DAC

This is a simple 8-bit DAC demonstrating the use
of the CACE system. It requires [CACE](https://github.com/efabless/cace) to run the testbenches.

Schematics for this DAC are done in xschem and can be found in the `xschem/` directory. Layouts for this RDAC are done in magic and can be found in the `mag/` directory.

The CACE specification is in `cace/sky130_ef_ip__rdac3v_8bit.yaml`. Testbench schematics are in the `cace/templates/` directory. Note that testbenches are editable in xschem, and netlists can be generated, but netlists contain variables that must be substituted by CACE and cannot simulate prior to variable substitution by CACE.

To run CACE in GUI mode:

```console
cace-gui cace/sky130_ef_ip__rdac3v_8bit.yaml
```

CACE can also be run from the command line, for example as:

```console
cace cace/sky130_ef_ip__rdac3v_8bit.yaml --source schematic --parameter=<parameter_name>
```