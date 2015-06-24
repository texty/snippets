#!/bin/bash
# batch convert svg to png and make an animated gif 
# use from dir with alphab. sorted svg "frames"
# requires Imagemagic and Inkscape installed

for f in *.svg
do
    inkscape -w 350 -D $f  --export-png="$f.png"  # w - width of image, -D - export only drawing zone
done

convert -delay 20 -loop 0 -dither None  "*.png"  -layers OptimizeFrame animated.gif   # loop 0 - loop infinitely
#convert -delay 5 -loop 0 -dither None -colors 80 "*.png" -fuzz "40%" -layers OptimizeFrame output.gif
#convert -loop 1 *.png output.gif
