// May need to adjust location of <lasercut.scad> 
use <../libs/lasercut/lasercut.scad>	;
$fn=60;
projection(cut = false)

lasercutout(thickness = 3, 
          points = [[0, 0], [183, 0], [183, 122], [0, 122], [0, 0]]
        , circles_remove = [[4.25, 8.5, 9], [4.25, 174.5, 9], [4.25, 8.5, 113], [4.25, 174.5, 113]]
        , cutouts = [[157, 74, 26, 19]]
        ) 

lasercutout(thickness = 3, 
          points = [[0, 0], [183, 0], [183, 122], [0, 122], [0, 0]]
        , circles_remove = [[4.25, 8.5, 9], [4.25, 174.5, 9], [4.25, 8.5, 113], [4.25, 174.5, 113]]
        , cutouts = [[66, 21, 117, 83]]
        ) 

;
