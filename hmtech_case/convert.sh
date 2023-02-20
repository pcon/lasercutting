#!/bin/bash

# Taken in part from convert-2d.sh in https://github.com/bmsleight/lasercut

SCAD_FILE="hmtech_case.scad"
EXT="svg"

SCAD_FILE_WO_EXT=${SCAD_FILE%.*}
SCAD_2D_FILE="${SCAD_FILE_WO_EXT}_2d.scad"
OUTPUT_FILE="assets/${SCAD_FILE_WO_EXT}.${EXT}"

openscad $SCAD_FILE -D generate=1 --export-format csg -o /dev/null 2>&1 | \
        sed -e 's/ECHO: \"\[LC\] //' \
        -e 's/"$//' \
        -e '$a\;' \
        -e  '/WARNING/d' \
        -e '/Using default value/d' \
        -e '/^+/d' > $SCAD_2D_FILE

sed -i '1 i\
// May need to adjust location of <lasercut.scad> \
use <../libs/lasercut/lasercut.scad>	;\
\$fn=60;\
projection(cut = false)\
' $SCAD_2D_FILE


openscad $SCAD_2D_FILE -o $OUTPUT_FILE

echo "Output files: $OUTPUT_FILE"