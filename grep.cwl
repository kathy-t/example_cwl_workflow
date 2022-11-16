#!/usr/bin/env cwl-runner
class: CommandLineTool
cwlVersion: v1.0

inputs:
  pattern:
    type: string
    inputBinding: {position: 0}
  infile:
    type: File
    inputBinding: {position: 1}

outputs:
  outfile:
    type: stdout

baseCommand: grep
