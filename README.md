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

# Visualize test-workflow.cwl
(Visualize at 2018-12-12 using CWL Viewer https://view.commonwl.org)
![test-workflow.cwl](https://github.com/hacchy1983/CWL-workflows/blob/images/graph.png "test-workflow.cwl")
