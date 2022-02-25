The notebook can be viewed [here](https://nbviewer.org/github/anonymous-icst-2022/anonymous-icst-2022/blob/main/Decoder.ipynb).

This is the replication package of Decoder experiments.
Decoder is a black-box fuzzer that generates syntactically valid program inputs using failure feedback.

In this experiment, we test and compare two fuzzers: Decoder and pfuzzer. Both fuzzers are run on 5 target programs.

## Virtual Machine
To reproduce the experiments, download the box file located [here](https://figshare.com/s/1aed02f8caf73072873f). 

VM specs are:
* CPU: 2 cores minimum.
* RAM: 4 GB 
* Swap: 1 GB

To startup the VM, go into the directory where bfuzzer.box and Makefile are stored. Run the following command:

    make box-add

Connect to VM via:

    make box-connect2

To run all experiments 10 times, do:

    make run_all

To run pfuzzer one time for 1 hour do:

    make run_pfuzzer

To run bfuzzer one time for 1 hour do:

    make run_bfuzzer

Evaluation results for pfuzzer can be found under the folder: `chains/src/pfuzzer/samples`

Evaluation results for bfuzzer can be found under the folder: `chains/src/bfuzzer/examples`

For example, evaluation results for bfuzzer experiment on mjs can be found under the folder: `chains/src/bfuzzer/examples/mjs`

Bfuzzer results include:
`inputs.json`: Generated inputs in json format.
`inputs.txt`: generated inputs in chronological order.
`times.txt`: Cummulative time, where each time stamp corresponds to an input generation.
`coverage.txt`: Cummulative branch coverage, each coverage number corresponds to the cummulative coverage at a given input.
`coverage.html`: Total coverage achieved.

## Jupyter Notebook
Another way to run the experiment is through the Jupyter notebook file `PBFuzzer.ipynb`
Once in the VM home directory, run the following command to start Jupyter notebook:

    ./startjupyter.sh &

To reproduce the coverage graphs, make sure you have packages `setuptools` and `plotnine` installed. If not, then install them first:

    pip3 install --upgrade setuptools
    pip3 install plotnine
