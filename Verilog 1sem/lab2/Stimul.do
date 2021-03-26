restart -force;
force pin_name  2#0 0ns, 2#1 100ns;
force pin_name1  2#0 0ns, 2#1 50ns, 2#0 100ns, 2#1 150ns;
force pin_name2  2#0 0ns, 2#1 25ns, 2#0 50ns, 2#1 75ns, 2#0 100ns, 2#1 125ns, 2#0 150ns, 2#1 175ns;
run @300ns;