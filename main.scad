bar_length= 230;
bar_width= 3;
bar_thick = 0.5;

reinforcement_thick = 2;
reinforcement_width = 1;

width = 50;

num_traverse = 5;

module reinforcement() {
    cube([bar_length,reinforcement_width,reinforcement_thick]);
}

module bar() {        
    cube([bar_length,bar_width,bar_thick]);
}

module traverse(height= bar_thick) {
    cube([bar_width,width, height]);
}


bar();
reinforcement();

translate([0,width-bar_width,0])
bar();
translate([0,width-reinforcement_width,0])
reinforcement();


for (i=[0:num_traverse]) {
    translate([(bar_length-bar_thick)/num_traverse*i,0,0])
    traverse();
}

traverse(7);

translate([bar_length-bar_thick,0,0])
traverse(7);

