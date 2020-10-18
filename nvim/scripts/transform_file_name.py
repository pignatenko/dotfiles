#!/usr/bin/env python3

import sys
from string import Template
from pathlib import Path

USAGE = 'transform_file_name.js <file_path> <template>'


if len(sys.argv) != 3:
    print(USAGE)
    sys.exit(1)

template = Template(sys.argv[2])
filepath = Path(sys.argv[1])

template_args = {
    "drive": filepath.drive,
    "root": filepath.root,
    "anchor": filepath.anchor,
    "parents": filepath.parents,
    "parent": filepath.parent,
    "name": filepath.name,
    "suffix": filepath.suffix,
    "suffixes": filepath.suffixes,
    "stem": filepath.stem
}

print(template.safe_substitute(**template_args))
