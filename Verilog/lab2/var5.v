module work(pin_name, pin_name1, pin_name2, pin_name3);

	input pin_name, pin_name1, pin_name2;
	output pin_name3;
	
	assign pin_name3 = (pin_name|~pin_name1|~pin_name2)&(~pin_name|pin_name2)&(pin_name1|pin_name2);

endmodule

	