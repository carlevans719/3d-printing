$fa = 1;
$fs = 0.1;

panel_height = 45;
panel_length = 120;
panel_depth = 2;

wall_thickness = 2;

// 21.5 gap
// 18.5 / 2

module tray () {
    cube([
        panel_height + (wall_thickness * 2),
        panel_length,
        panel_depth
    ]);
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
        scale([1.05, 1.05, 1.1])
        wedge();

    translate([35, 4.5, (wall_thickness / 2) - 0.001])
        rotate([0, 0, 180])
        scale([1, 1, 1.1])
        wedge();

    translate([((panel_height + (wall_thickness * 2)) / 2) - (21.5/2), panel_length - 20, 0])
        cylinder(r=3.3/2, h=10, center=true);
    translate([((panel_height + (wall_thickness * 2)) / 2) + (21.5/2), panel_length - 20, 0])
        cylinder(r=3.3/2, h=10, center=true);
}

//translate([12.5, panel_length + 4.5, wall_thickness / 2])
//    rotate([0, 0, 180])
//    wedge();

//translate([35, panel_length + 4.5, wall_thickness / 2])
//    rotate([0, 0, 180])
//    wedge();

