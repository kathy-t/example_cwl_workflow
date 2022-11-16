class: Workflow
cwlVersion: v1.0

requirements:
 - class: ScatterFeatureRequirement
 - class: DockerRequirement
   dockerPull: java:7

inputs:
  pattern: string
  infiles: File[]

outputs:
  outfile:
    type: File
    outputSource: wc/outfile

steps:
  grep:
    run: grep.cwl
    in:
      pattern: pattern
      infile: infiles
    scatter: infile
    out: [outfile]

  wc:
    run: wc.cwl
    in:
      infiles: grep/outfile
    out: [outfile]
