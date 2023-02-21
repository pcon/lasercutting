use </home/pcon/devel/game_organizer/colors.scad>

PART_HEIGHT = 3;
BASE_HEIGHT = 6.35;
BASE_WIDTH = 304.8;

color(colors()[0])
cube([BASE_WIDTH, BASE_WIDTH, BASE_HEIGHT]);

A_CODE = 97;
parts_count = 8;

for (i = [0 : parts_count - 1]) {
    letter = chr(A_CODE + i);
    filename = str("parts/part_", letter, ".svg");
    
    translate([0, 0, BASE_HEIGHT + PART_HEIGHT * i])
    color(colors()[i + 1])
    linear_extrude(PART_HEIGHT)
    import(filename);
    
    engrave_filename = str("parts/part_", letter, "_engrave.svg");
    translate([0, 0, BASE_HEIGHT + PART_HEIGHT * (i + 1)])
    color("Black")
    linear_extrude(0.01)
    import(engrave_filename);
}