#!/bin/bash

rootdir="$(git rev-parse --show-toplevel)"

for project in $(find "$rootdir" -maxdepth 1 -type d -name 'wi-se-*'); do
  mkdir -p "$project/schematic"
  projname="$(basename "$project")"
  python3 "$rootdir/tools/kicad-boardview/pcbnew2boardview.py" "$project/$projname.kicad_pcb" "$project/schematic/$projname.brd"
done

