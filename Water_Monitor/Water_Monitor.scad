$fa = 1;
$fs = 0.1;

sensor_width = 22.5;
sensor_height = 1.75;
sensor_sink_length = 30;
sensor_cutout_diameter = 4.5;
sensor_cutout_radius = sensor_cutout_diameter / 2;
sensor_cutout_offset = 8 + sensor_cutout_radius;

latch_hole_height = 3;

box_inner_width = 23.5;
box_inner_length = 60 + sensor_sink_length;
box_inner_height = 15 + (latch_hole_height * 2);
box_thickness = 5;

latch_hole_width = box_thickness / 2;
latch_hole_length = box_inner_length / 4;

screw_housing_radius = 3;

module sensor_cutout() {
    cylinder(r=sensor_cutout_radius, h=box_inner_height / 4);
}

module sensor_slot() {
    cube([sensor_width, box_thickness + 0.002, sensor_height + 0.5]);
}

module latch() {
    translate([0, 0, -0.175])
        rotate([0.5, 0, 0])
        cube([latch_hole_width, latch_hole_length, latch_hole_height]);

    translate([0, latch_hole_length, 0.001])
        rotate([90, 0, 0])
        cube([latch_hole_width, latch_hole_height * 2, latch_hole_height]);

    translate([0, 0, 0.001])
        cube([latch_hole_width, latch_hole_height, latch_hole_height]);
}

module box_shell_bottom() {
    difference() {
        // outer
        cube([
            box_inner_width + (box_thickness * 2),
            box_inner_length + (box_thickness * 2),
            box_inner_height + box_thickness
        ]);

        // inner
        translate([box_thickness, box_thickness, box_thickness])
            cube([box_inner_width, box_inner_length, box_inner_height + 0.001]);

        // slot
            translate([box_thickness + ((box_inner_width - sensor_width) / 2), -0.001, box_thickness + 1.5])
            sensor_slot();
        rotate([5, 0, 0])
            translate([box_thickness + ((box_inner_width - sensor_width) / 2), 0.5, box_thickness + 1.5])
            scale([1, 1.5, 1])
            sensor_slot();

        // latch hole
        translate([
            (box_thickness - latch_hole_width) + 0.001, 
            box_thickness + (box_inner_length / 8), 
            (box_inner_height + box_thickness) - (latch_hole_height * 2)
        ])
            latch();

        translate([
            box_thickness + (box_inner_width - 0.001), 
            box_thickness + (box_inner_length / 8), 
            (box_inner_height + box_thickness) - (latch_hole_height * 2)
        ])
            latch();
                    
        translate([
            (box_thickness - latch_hole_width) + 0.001, 
            box_thickness + ((box_inner_length / 8) * 5), 
            (box_inner_height + box_thickness) - (latch_hole_height * 2)
        ])
            latch();

        translate([
            box_thickness + (box_inner_width - 0.001),
            box_thickness + ((box_inner_length / 8) * 5),
            (box_inner_height + box_thickness) - (latch_hole_height * 2)
        ])
            latch();

        // antenna
        translate([box_thickness + ((box_inner_width / 4) * 3) + 1, box_thickness + box_inner_length + box_thickness + 0.001, box_thickness + 5])
            rotate([90, 0, 0])
            cylinder(r=1, h=box_thickness + 0.002);
    }
}

module box_bottom() {
    box_shell_bottom();

    // sensor cutout A
    translate([box_thickness, sensor_cutout_offset + box_thickness, box_thickness])
        sensor_cutout();

    // sensor cutout B
    translate([box_inner_width + box_thickness, sensor_cutout_offset + box_thickness, box_thickness])
        sensor_cutout();

    // sensor cutout C
    translate([box_thickness, (box_thickness + box_inner_length) - sensor_cutout_offset, box_thickness])
        sensor_cutout();

    // sensor cutout D
    translate([box_inner_width + box_thickness, (box_thickness + box_inner_length) - sensor_cutout_offset, box_thickness])
        sensor_cutout();

    // screw housing
    translate([(box_thickness + (box_inner_width / 2)), box_thickness + box_inner_length, box_thickness])
        cylinder(r=screw_housing_radius, h=box_inner_height);
}

//box_bottom();

module box_top() {
    cube([box_inner_width + (box_thickness * 2), box_inner_length + (box_thickness * 2), box_thickness + 0.001]);

    translate([box_thickness, box_thickness, box_thickness])
        difference() {
            cube([box_inner_width, box_inner_length - ((box_inner_length / 8) + (latch_hole_height * 2.5)), latch_hole_height * 2]);

            translate([box_inner_width / 2, box_inner_length - ((box_inner_length / 8) + (latch_hole_height * 2.5)), 0])
                cylinder(r=screw_housing_radius + 1, h=(latch_hole_height * 2) + 0.001);
        }

    translate([box_thickness - latch_hole_width, box_thickness + (box_inner_length / 8) + (latch_hole_height), box_thickness + (latch_hole_height * 1.5)])
        rotate([0, 90, 0])
        cylinder(r=latch_hole_height / 2, h=latch_hole_width + 0.001);

    translate([box_thickness - latch_hole_width, box_thickness + ((box_inner_length / 8) * 5) + (latch_hole_height), box_thickness + (latch_hole_height * 1.5)])
        rotate([0, 90, 0])
        cylinder(r=latch_hole_height / 2, h=latch_hole_width + 0.001);

    translate([(box_thickness + box_inner_width), box_thickness + (box_inner_length / 8) + (latch_hole_height), box_thickness + (latch_hole_height * 1.5)])
        rotate([0, 90, 0])
        cylinder(r=latch_hole_height / 2, h=latch_hole_width + 0.001);

    translate([(box_thickness + box_inner_width), box_thickness + ((box_inner_length / 8) * 5) + (latch_hole_height), box_thickness + (latch_hole_height * 1.5)])
        rotate([0, 90, 0])
        cylinder(r=latch_hole_height / 2, h=latch_hole_width + 0.001);
}

//translate([box_thickness + box_thickness + box_inner_width + 10, (box_inner_length / 8) + (latch_hole_height * 2), 0])
box_top();

