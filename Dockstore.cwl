cwlVersion: v1.0
class: Workflow
description: "A docker container and tool for running clustalw2. Note that when you use Dockstore to create the input parameter file, not all parameters are required. You may remove from the input parameter file any parameters which are not required, unless you would like to use them. Note that not all combinations of parameters have been tested."

dct:creator:
  foaf:name: Gary Luu
  foaf:mbox: "gary.luu@oicr.on.ca"
inputs:
  inp: File
  ex: string

outputs:
  classout:
    type: File
    outputSource: compile/classfile

steps:
  untar:
    run: tar-param.cwl
    in:
      tarfile: inp
      extractfile: ex
    out: [example_out]

  compile:
    run: arguments.cwl
    in:
      src: untar/example_out
    out: [classfile]
