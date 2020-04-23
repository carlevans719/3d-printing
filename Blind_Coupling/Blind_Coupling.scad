$fa = 1;
$fs = 0.2;

hex_nut_width = 5.8; // x
hex_nut_length = 3.34877095; // y
hex_nut_height = 10; // z

module hex_nut(width=hex_nut_width, length=hex_nut_length, height=hex_nut_height, ) {

    cube([width, length, height], center=true);

    rotate([0, 0, 180 / 3])
        cube([width, length, height], center=true);

    rotate([0, 0, (180 / 3) * 2])
        cube([width, length, height], center=true);
}

module coupling(radius=hex_nut_width, height=hex_nut_height) {
    difference() {
        cylinder(r=radius * 2, h=(height * 1.5) - 0.001, center=true);

        scale([0.95, 0.95, 1.1])
            translate([0, 0, height * 0.25])
            hex_nut();
        
        cylinder(r=radius * 0.125, h=height * 2, center=true);

    translate([0, 0, 5])
        rotate([0, 90, 0])
        cylinder(r=0.5, h=hex_nut_width * 5, center=true);

    translate([0, 0, 5])
        rotate([180 / 3, 90, 0])
        cylinder(r=0.5, h=hex_nut_width * 5, center=true);

    translate([0, 0, 5])
        rotate([(180 / 3) * 2, 90, 0])
        cylinder(r=0.5, h=hex_nut_width * 5, center=true);
    }
}

coupling();
