restart -force;
force A[2]  2#0 0ns, 2#1 100ns, 2#0 200ns;
force A[1]  2#0 0ns, 2#1 50ns, 2#0 100ns, 2#1 150ns, 2#0 200ns;
force A[0]  2#0 0ns, 2#1 25ns, 2#0 50ns, 2#1 75ns, 2#0 100ns, 2#1 125ns, 2#0 150ns, 2#1 175ns, 2#0 200ns;
force D   2#1 0ns, 2#0 100ns, 2#1 200ns;
force EN  2#0 0ns, 2#1 150ns, 2#0 200ns;
run @300ns;