$fn=50;

module outring(){
	rotate_extrude(convexity = 10)
    translate([19, 0, 0])
    square(size = [1,1],center = true);
}

module midring(){
	rotate_extrude(convexity = 10)
    translate([14.5, 0, 0])
    square(size = [8,1],center = true);
}

module innerring(){
	rotate_extrude(convexity = 10)
    translate([10, 0, 0])
    square(size = [1,3],center = true);
}
outring();
midring();
innerring();

translate([34,0,0]) cube(size = [30,5,3], center = true);
translate([-34,0,0]) cube(size = [30,5,3], center = true);