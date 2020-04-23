module curvedSurface (length = 10, width = 10, height = 10) {
    // todo - from min height to max height (currently just from 0 to max height
    for(i=[0:360])
        translate([0, (width / 360) * i, 0])
            cube([length, 1, sin(i) * height]);
}

curvedSurface(200, 200, 5);