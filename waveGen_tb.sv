// ELEX 7660
// File: waveGen_tb.sv
// Description:  Testbench to check functionality of the waveGen module
// Author: Bryce Reid    Student ID: A01298718    Date: 2025-03-18
// Sections of code taken from: encoder_tb.sv	Author: Robert Trost	Date: 2024-01-15

/*
// function: check_value()
// description: check to see that expected value matches actual value.  
// Returns '1' if test fails, '0' for pass
function logic check_value ( int expected_value, int actual_value ) ;

	if ( expected_value != actual_value ) begin
        	$display( "FAIL: expected value is %d => actual value is %d", expected_value, actual_value ) ;
        	check_value = 1 ;
    	end else begin
		$display( "PASS: expected value is %d => actual value is %d", expected_value, actual_value ) ;
        	check_value = 0 ;
	end

endfunction
*/
module waveGen_tb ;

	logic data_req ;		// update data request
	logic [11:0] data ;     	// data to send to DAC
	logic data_ack = 0 ;
	logic reset_n = 1 ;
	logic clk = 1 ; 		// testbench clock signal
	logic test_signal = 0 ;
//	logic tb_fail = 0 ; 		// flag to track if testbench failed

  	waveGen dut_0 ( .* ) ; // device under test

  	initial begin

		reset_n = 0 ;
      		repeat(2) @(negedge clk) ;
      		reset_n = 1 ;
		repeat(2) @(negedge clk) ;

		for ( int i = 0 ; i < 5 ; i++ ) begin
			test_signal = 1 ;
			repeat(1) @(negedge clk) ;
			test_signal = 0 ;
			repeat(5) @(negedge clk) ;
			data_ack = 1 ;
			repeat(1) @(negedge clk) ;
			data_ack = 0 ;
			repeat(5) @(negedge clk) ;
		end
/*
      		if (tb_fail)
        		$display("Assignment 2 N-bit Sequence Detector Simulation *** FAILED ***  See transcript for details") ;
      		else
        		$display("Assignment 2 N-bit Sequence Detector Simulation *** PASSED ***") ;
*/
      		$stop ;
    
   	end

	// generate 1.5625 MHz clock
   	always #640ns clk = ~clk ;
   
endmodule   
