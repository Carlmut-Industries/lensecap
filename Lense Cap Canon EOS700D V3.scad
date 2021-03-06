$fn=128;

//Wall strengh of sides
thickness=1;
//Inner diameter
idiam=63;   
//Height
lidh=5.5;
//Give in Friction fit
looseness=5;

loose=looseness/10; // ie looseness = 5 loose = 0.5mm
difference(){
    lid();
    //to cut off excess that sticks out of the lid
    difference(){
        cylinder(h=lidh,r=idiam/2+10);
        cylinder(h=lidh,r=idiam/2+1);
     }
}
//Rim outside 
module tube(d,h,th) {  // d= outside diam
rad=d/2;
difference() {
	cylinder(h=h,r=rad);
	cylinder(h=h,r=rad-th);
	}
}


module lid(){
union() {
	tube(idiam+thickness*2+loose,lidh,thickness); // sides
	tube(idiam+thickness*2+loose,thickness,idiam+thickness*2+loose); // base
	
}
//Screw-Lip
//Pin that screws sticks 1mm inwards 
//and is 1mm thick
//Lenghth of the lip is appr. 36mm
difference(){
    translate([idiam/2-1, 0, lidh-1.1])
    cube(size = [8, 42, 1], center = true);
    
    rotate([0, 0, 90])
    translate([0, 0, 2])
    cylinder(h = lidh+2.9, r=(idiam/2)-0.5, center = true, $fn=128);
}
//Mirrowed Screw-Lip
difference() {
    translate([-idiam/2+1, 0, lidh-1.1])
    cube(size = [8, 42, 1], center = true);
    
    rotate([0, 0, 90])
    translate([0, 0, 2])
    cylinder(h = lidh+2.9, r=(idiam/2)-0.5, center = true, $fn=128);
}

}

