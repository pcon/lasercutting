include <../libs/lasercut/lasercut.scad>
use <../libs/colors.scad>

thickness = 3;
width = 183;
depth = 122;
hole_size = 4.25;
hole_offset_y = 9;
hole_offset_x = 4.25;

hole_right = width - hole_offset_x - hole_size;
hole_left = hole_offset_x + hole_size;
hole_bottom = hole_offset_y;
hole_top = depth - hole_offset_y;

hole_bottom_left = [hole_size, hole_left, hole_bottom];
hole_bottom_right = [hole_size, hole_right, hole_bottom];
hole_top_left = [hole_size, hole_left, hole_top];
hole_top_right = [hole_size, hole_right, hole_top];

module bottom_panel() {
    cutout_connector_width = 26;
    cutout_connector_depth = 19;
    cutout_connector_bottom = 74;
    cutout_connector_left = width - cutout_connector_width;

    cutout_connector = [
        cutout_connector_left,
        cutout_connector_bottom,
        cutout_connector_width,
        cutout_connector_depth
    ];
    lasercutoutSquare(
        thickness=thickness,
        x=width,
        y=depth,
        circles_remove = [
            hole_bottom_left,
            hole_bottom_right,
            hole_top_left,
            hole_top_right
        ],
        cutouts = [
            cutout_connector
        ]
    );
}

module midplate() {
    cutout_midplate_width = 117;
    cutout_midplate_depth = 83;
    cutout_midplate_bottom = 21;
    cutout_midplate_left = width - cutout_midplate_width;
    
    cutout_midplate = [
        cutout_midplate_left,
        cutout_midplate_bottom,
        cutout_midplate_width,
        cutout_midplate_depth
    ];
    
    lasercutoutSquare(
        thickness=thickness,
        x=width,
        y=depth,
        circles_remove = [
            hole_bottom_left,
            hole_bottom_right,
            hole_top_left,
            hole_top_right
        ],
        cutouts = [
            cutout_midplate
        ]
    );
}

module topplate() {
    lasercutoutSquare(
        thickness=thickness,
        x=width,
        y=depth,
        circles_remove = [
            hole_bottom_left,
            hole_bottom_right,
            hole_top_left,
            hole_top_right
        ]
    );
}

color(colors()[0]) bottom_panel();
color(colors()[5])translate([0, 0, thickness]) midplate();
//color(colors()[10])translate([0, 0, thickness * 2]) midplate();