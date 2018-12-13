#!/usr/bin/env cwl-runner

class: CommandLineTool
id: bwa-mem-PE-0.7.15--1
label: bwa-mem-PE-0.7.15--1
cwlVersion: v1.0

$namespaces:
  edam: 'http://edamontology.org/'

hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/bwa:0.7.15--1'

requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    coresMin: 4

baseCommand: [ bwa, mem ]

inputs:
  - id: fadir
    type: Directory
    doc: directory containing FastA file and index
  - id: ref
    type: string
    doc: name of reference (e.g., hs37d5)
  - id: fq1
    type: File
    format: edam:format_1930
    inputBinding:
      position: 6
    doc: FastQ file from next-generation sequencers
  - id: fq2
    type: File
    format: edam:format_1930
    inputBinding:
      position: 7
    doc: FastQ file from next-generation sequencers

outputs:
  - id: sam
    type: stdout
    format: edam:format_2573

stdout: output.sam

arguments:
  - position: 1
    prefix: -t
    valueFrom: "4"
  - position: 2
    prefix: -K
    valueFrom: "100000000"
  - position: 3
    valueFrom: "-Y"
  - position: 4
    valueFrom: "-p"
  - position: 5
    valueFrom: $(inputs.fadir.path)/$(inputs.ref).fa
