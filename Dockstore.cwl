cwlVersion: v1.0
class: Workflow

dct:creator:
  foaf:name: Gary Luu 2
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
