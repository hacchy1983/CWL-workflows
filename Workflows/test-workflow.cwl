#!/usr/bin/env cwl-runner

class: Workflow
id: test-workflow
label: test-workflow
cwlVersion: v1.0

$namespaces:
  edam: 'http://edamontology.org/'

inputs:
  fq1:
    type: File
    format: edam:format_1930
    doc: FastQ file from next-generation sequencers

  fq2:
    type: File
    format: edam:format_1930
    doc: FastQ file from next-generation sequencers

  fadir:
    type: Directory
    doc: directory containing FastA file and index

  ref:
    type: string
    doc: name of reference (e.g., hs37d5)
    
steps:
  qc1:
    label: qc1
    doc: Quality control for fastq file (fq1) before trimming
    run: ../Tools/fastqc.cwl
    in:
      fastq: fq1
    out: [qc]

  qc2:
    label: qc2
    doc: Quality control for fastq file (fq2) before trimming
    run: ../Tools/fastqc.cwl
    in:
      fastq: fq2
    out: [qc]

  trimPE:
    label: trimPE
    doc: adaptor trimming
    run: ../Tools/trimmomaticPE.cwl
    in:
      fq1: fq1
      fq2: fq2
    out: [trimFq1P, trimFq2P]

  qc1P:
    label: qc1P
    doc: Quality control for fastq file (fq1) after trimming
    run: ../Tools/fastqc.cwl
    in:
      fastq: trimPE/trimFq1P
    out: [qc]

  qc2P:
    label: qc2P
    doc: Quality control for fastq file (fq2) after trimming
    run: ../Tools/fastqc.cwl
    in:
      fastq: trimPE/trimFq2P
    out: [qc]

  map:
    label: map
    doc: Mapping onto a reference genome
    run: ../Tools/bwa-mem-PE.cwl
    in:
      fadir: fadir
      ref: ref
      fq1: trimPE/trimFq1P
      fq2: trimPE/trimFq2P
    out: [sam]

  sam2bam:
    label: sam2bam
    doc: Convert SAM to BAM
    run: ../Tools/samtools-sam2bam.cwl
    in:
      sam: map/sam
    out: [bam]

  sort:
    label: sort
    doc: Sort BAM
    run: ../Tools/samtools-sort.cwl
    in:
      bam: sam2bam/bam
    out: [sorted-bam]
    
outputs:
  oqc1:
    type: File
    outputSource: qc1/qc
  oqc2:
    type: File
    outputSource: qc2/qc
  oqc1P:
    type: File
    outputSource: qc1P/qc
  oqc2P:
    type: File
    outputSource: qc2P/qc
  sam:
    type: File
    outputSource: map/sam
  bam:
    type: File
    outputSource: sam2bam/bam
  osort:
    type: File
    outputSource: sort/sorted-bam
