# Playground

We have setup a completely in-browser playground for exploring the algorithm and examples [here](https://anonymous-fse2022.github.io/anonymous-fse2022/playground/lab?path=decoder.ipynb).

# Virtual Machine
To reproduce the experiments, download the vagrant box file located [here](https://doi.org/10.5281/zenodo.6461698). 

VM specs are:
* CPU: 8 cores
* RAM: 15 GB 
* Swap: 1 GB
* Disk: 96 GB

## VM File structure:

* **afl**: Contains all afl experiments, including both waypoints and dumb mode.
* **pfuzzer**: Contains all pfuzzer experiment files.
* **decoder**: Contains decoder experiment files for subjects ini, csv, json, tinyc, and mjs.
* **ppdecoder**: Contains decoder experiment files for pyparser subjects.
* **results**: Stores experiment results for all runs for decoder, pfuzzer, and afl.

## Launching the VM:

In the same directory where you downloaded the box file and the Makefile. Run the following command:
```bash
make box-add
```

The command will take some time to complete. Next, connect to the new virtual machine:
```bash
make box-connect2
```

## Running experiments:

After strating the vitual machine and once you are in the home directory, you can start executing the experiments.

* To run decoder experiments on pyparser subjects for one hour, run:
```bash
make run_ppdecoder RUNTIME=1
```

* To run decoder experiments on C subjects, 10 runs, with each run lasting 1 hour:
```bash
make decoder RUNTIME=1 R=10
```

* To run pfuzzer experiments on C subjects, 10 runs, with each run lasting 1 hour:
```bash
make pfuzzer RUNTIME=1 R=10
```

* To run AFL with Waypoints, 10 runs, with each run lasting 1 hour:
```bash
make afl-wp RUNTIME=1 R=10
```

* To run plain uninstrumented AFL, 10 runs, with each run lasting 1 hour:
```bash
make afl-dm RUNTIME=1 R=10
```

* To extract and display evaluation results table, run:
```bash
python3 show_table_*.py
```

* Table numbers correspond to table numbers in the paper. For example to show replication results in Table 2, run:
```bash
python3 show_table_2.py
```


**Note**: Running all the experiments may take 3 to 4 days. Therefore, it can be useful to run experiments in steps, as shown by the commands above.

**Note**: Running one run experiment for one hour will take roughly 2 hours to complete. The user needs to account for the additional execution time of evaluation and compilation scripts.

