#!/usr/bin/env cwl-runner

class: CommandLineTool
id: samtools-sam2bam-1.9--h8ee4bcc_1
label: samtools-sam2bam-1.9--h8ee4bcc_1
cwlVersion: v1.0

$namespaces:
  edam: 'http://edamontology.org/'

hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/samtools:1.9--h8ee4bcc_1'

requirements:
  - class: InlineJavascriptRequirement
  - class: ShellCommandRequirement

baseCommand: [ samtools, sort ]

inputs:
  - id: bam
    type: File
    format: edam:format_2572
    inputBinding:
      position: 1
    doc: BAM alignment file 
    
outputs:
  - id: sorted-bam
    type: stdout
    format: edam:format_2572

stdout: output.sort.bam
      
arguments: []

