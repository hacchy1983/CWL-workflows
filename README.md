# CWL-workflows
Workflows written in common workflow language (CWL)


# Run a workflow
(Plesae see how to install cwltool: https://github.com/common-workflow-language/cwltool)

To run a workflow named test-workflow.cwl, type as follows:

```
cwltool Workflows/test-workflow.cwl Jobs/small.ERR034597.test-workflow.yml
```

## When you use toil

```
virtualenv -p python2 env2
. env2/bin/activate
pip install toil[cwl]
toil-cwl-runner Workflows/test-workflow.cwl Jobs/small.ERR034597.test-workflow.yml
```

# Functional equivalence (FE) of genome sequencing analysis pipelines
I will write CWL workflows that are consistent with the FE standard described in [PMID: 30279509](https://www.ncbi.nlm.nih.gov/pubmed/30279509)

For example, I use bwa-mem (v0.7.15-r1140) with the parameters “-K 100000000 -p -Y”.


# Visualize test-workflow.cwl
(Visualize at 2018-12-12 using CWL Viewer https://view.commonwl.org)

[![test-workflow.cwl](https://github.com/hacchy1983/CWL-workflows/blob/images/graph.png "test-workflow.cwl")](https://view.commonwl.org/workflows/github.com/hacchy1983/CWL-workflows/blob/master/Workflows/test-workflow.cwl)
