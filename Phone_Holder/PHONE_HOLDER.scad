$fa = 1;
$fs = 0.1;

phone_width=73.6;
phone_thickness=13.8;
holder_height=50;
base_height=27;
wall_thickness=5;
charger_width=15;
charger_thickness=7;

module holder() {
    difference() {
        cube([
            phone_width + (wall_thickness * 2),
            phone_thickness + (wall_thickness * 2),
            holder_height + base_height + wall_thickness
        ], center=true);

        translate([0, 0, wall_thickness + (base_height / 2) + 0.001])
            cube([
                phone_width,
                phone_thickness,
                holder_height
            ], center=true);

        translate([0, -1 * ((phone_thickness / 2) + (wall_thickness / 2)), (base_height / 2) + wall_thickness + 0.001])
            cube([
                phone_width - (wall_thickness * 2),
                wall_thickness + 0.002,
                holder_height + 0.001
            ], center=true);
    }
}

difference() {
    holder();

    translate([0, 0, -1 * ((base_height / 2) + wall_thickness)])
        cube([charger_width, charger_thickness, base_height + 10.002], center=true);

    translate([0, (phone_thickness/2), -1 * base_height])
        cube([charger_width, (phone_thickness / 2) + wall_thickness + 0.002, 30], center=true);
}

translate([0, 0, -1 * (base_height + wall_thickness + 7.75)])
    cube([175, 125, 2.5002], center=true);