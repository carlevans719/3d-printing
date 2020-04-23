$fa = 1;
$fs = 0.1;

difference() {
    cube([30, 30, 2], center=true);

    cylinder(r=9.8/2, h=2.002, center= true);
}

translate([-13, 0, 12.5])
    rotate([0, 90, 0])
    cube([25, 30, 4], center=true);

translate([13, 0, 12.5])
    rotate([0, 90, 0])
    cube([25, 30, 4], center=true);

translate([0, -13, 12.5])
    rotate([90, 0, 0])
    cube([30, 25, 4], center=true);

difference() {
    translate([0, 13, 12.5])
        rotate([90, 0, 0])
        cube([30, 25, 4], center=true);

    translate([0, 13, 25])
        rotate([90, 0, 0])
        cylinder(r=2, h=4.002, center=true);
}