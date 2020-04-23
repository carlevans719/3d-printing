$fa = 1;
$fs = 0.1;

panel_height = 45;
panel_length = 120;
panel_depth = 4;

wall_thickness = 3;

module tray () {
    difference() {
        cube([
            panel_height + (wall_thickness * 2),
            panel_length,
            panel_depth + (wall_thickness * 2)
        ]);

        translate([wall_thickness, -0.001, wall_thickness])
            cube([
                panel_height,
                panel_length + 0.002,
                panel_depth
            ]);

        translate([wall_thickness * 1.75, -0.001, wall_thickness])
            cube([
                panel_height - (wall_thickness * 1.5),
                panel_length + 0.002,
                panel_depth + (wall_thickness * 2)
            ]);
    }
}

module _wedge () {
    rotate([0, 0, 15])
        cube([10, 10, wall_thickness], center=true);

    translate([-2.5, 0, 0])
        rotate([0, 0, -15])
        cube([10, 10, wall_thickness], center=true);
}

module wedge () {
    difference() {
        _wedge();

        translate([0, -6, 0])
            cube([20, 5, wall_thickness + 0.002], center=true);

        translate([0, 7.25, 0])
            cube([20, 5, wall_thickness + 0.002], center=true);
    }
}


difference() {
    tray();

    translate([12.5, 4.5, (wall_thickness / 2) - 0.001])
        rotate([0, 0, 180])
        scale([1, 1, 1.1])
        wedge();

    translate([35, 4.5, (wall_thickness / 2) - 0.001])
        rotate([0, 0, 180])
        scale([1, 1, 1.1])
        wedge();
}

translate([12.5, panel_length + 4.5, wall_thickness / 2])
    rotate([0, 0, 180])
    wedge();

translate([35, panel_length + 4.5, wall_thickness / 2])
    rotate([0, 0, 180])
    wedge();

