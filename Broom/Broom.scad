$fa = 1;
$fs = 0.1;

include <roundedcube.scad>;
include <threads.scad>;

union() {
    difference () {
        roundedcube([45, 100, 5], false, 1.5, "zmax");

        union() {
            translate([(45/2) - (5/2), 13.5 - (5/2), -0.001])
                cylinder(r=5, h=5.002);

            translate([(45/2) - (5/2), 100 - 13.5 - (5/2), -0.001])
                cylinder(r=5, h=5.002);
        }
    }

    translate([30, 50, 30]) {
        rotate ([0, 30, 0]) {
            difference () {
                cylinder(r=14.5, h=50, center=true);
                metric_thread(diameter=24, length=45.001, pitch=3, internal=true);
            }
        }
    }
    
    translate([22.5, 50, 0.1])
        cylinder(r=19, h=16);
}

translate([0, -20, 0]) {
    metric_thread(diameter=24, length=45, pitch=3);
    translate([0, 0, 40]) {
        cylinder(r=10.5, h=30);
    }
}