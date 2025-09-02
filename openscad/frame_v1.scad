$fn=100;
max_w=210;
max_h=138;
max_d=90;

pw=40;// spout holder width x 
ph=45;// spout holder length y
pg=60;// spout holder height z
//r=10;
fv=0.1; // for better visualization

module corner(ln=20, wd=30 ){ // a negative part for making a round corner 
	difference (){
		cube([wd,wd,ln]);
		translate([0,0,0])
		cylinder(r=wd, h=ln);
	}
}

module outbox(){ // outside box for the frame
	corner_wd=10;
	corner_ln=max_d;
	difference(){
		cube([max_w-fv,max_d-fv,max_h-fv],center=true);
		union(){
			translate([max_w/2-corner_wd, max_d/2, -max_h/2+corner_wd]) rotate([90,90,0]) corner(ln=corner_ln, wd=corner_wd);
			translate([-max_w/2+corner_wd, max_d/2, -max_h/2+corner_wd]) rotate([90,180,0]) corner(ln=corner_ln, wd=corner_wd);
		}
	}
}

module innerbox(){ // inside box for the frame
	inn_w=max_w-8;
	inn_h=max_h-20;
	inn_d=max_d;
	corner_wd=20;
	corner_ln=max_d;
	difference(){
		cube([inn_w-fv,inn_d-fv,inn_h-fv],center=true);
		union(){
			translate([inn_w/2-corner_wd, inn_d/2, -inn_h/2+corner_wd]) rotate([90,90,0]) corner(ln=corner_ln, wd=corner_wd);
			translate([-inn_w/2+corner_wd, inn_d/2, -inn_h/2+corner_wd]) rotate([90,180,0]) corner(ln=corner_ln, wd=corner_wd);
		}
	}
}

module frame(){
	difference () {
		outbox();
		translate([0,4+35,-max_h/2]) cube([max_w-20,max_d-7,max_h/2], center=true);
		translate([0,7+35,-8]) innerbox();//move back wall
        translate([0,7-61.9,-8]) innerbox();//move back wall
        translate([0,4-56,-max_h/2]) cube([max_w-20,max_d-7,max_h/2], center=true);
	}
}

module top_groove(){ // for the top cover
	xw=max_w-5;
	xd=max_d-5;
	difference(){
		union (){
	//		translate([xw/2-.5, xd/2-.5,-5]) corner2();
	//		translate([-xw/2+0.5, -xd/2+0.5,-5]) corner2() ;
	//		translate([-xw/2+0.5, xd/2-0.5,-5]) corner2() ;
	//		translate([xw/2-0.5, -xd/2+0.5,-5]) corner2() ;
			cube([xw, xd, 10], center=true);
		}
		//translate([0,0, -5.6])round_corner_box(r0=5, wd=max_w-24, lg=max_d-24,ht=11);
	}
}

module screw(){
	translate([-30,0,0])rotate([0,90,0]) cylinder(r=1.50, h=35,center=true);
}

module screwset_frame(){

    translate([0,36,-39])screw();
    translate([0,36,39])screw();
    translate([0,-36,-39])screw();
    translate([0,-36,39])screw();

}

module frontpanel(){
    difference(){
        union(){
            cube([69,69,8],center=true);
            translate([0,0,3])cube([84,78,2],center=true);
                translate([0,0,-20])rotate([0,90,0])    screwset_frame();

        }
    	//scale([.8,.95,1])translate([1,0,4])cylinder(r=dia-3,h=14,center=true,$fn=100);
       // translate([0,0,-20])rotate([0,90,0])    screwset_frame();

    }
}


module the_thing (){
	difference(){
		union(){
			difference(){
				//	pw=40;// spout holder width x 
				//	ph=40;// spout holder length y
				//	pg=50;// spout holder height z
				frame();
				union(){
					translate([0,0,max_h/2-4]) top_groove();
					//rotate([90,0,0]) translate([0,0,34]) motion_sensor();
					translate([-max_w/2,0,65]) rotate([0,90,0]) cylinder(r=1.8, h=10); //screw hole for the top cover on the side;
					translate([max_w/2-10,0,65]) rotate([0,90,0]) cylinder(r=1.8, h=10); //screw hole for the top cover on the side; 

					
				}
			}

		}
   translate([max_w/2-44,max_h/2-110+35,5])rotate([0,90,-90]) frontpanel();
   translate([-max_w/2+44,max_h/2-110+35,5])rotate([0,90,-90]) frontpanel();

	}
}
the_thing();

//translate([max_w/2-44,max_h/2-50,13])rotate([0,90,-90]) frontpanel();
//frontpanel();