//This is the top module, here we created a package, imported uvm_pkg, and printed a dummy display statement 
// From this top module, we are running the test (wrt the class that we created for the scoreboards) 
//This includes all uvm environment 
// `include is absolutely necessary here to include the other module/file, where the testbench is written. 

`timescale 1ns/10ps

package learning; 
import uvm_pkg::*;
`include "test.sv"
endpackage : learning
 


import uvm_pkg::*;

module top();
  
  initial begin	
	$display("//////////////////////////////////\nWE ARE IN EE273 ASSG NO. 1 = MESSAGES \n Built 2 scoreboards named: one and two, and sent 20 messages from a to b \n//////////////////////////////////////////////////////");
	run_test("assg");
    
  end
  
endmodule: top 
