//----------------------------------
// Creating scoreboard number 1, labelled as "one"
// Also adding run_phase here, because we want to send message from first scoreboard 
// Also creating an integer called m_no, which is incremented everytime in order to print 20 messages as required in the question. 
// Applying "phase.raise_objection(this)" and "phase.drop_objection(this)" in order to see some simulation time. 
// If that is not added, simulation stops at 0 time itself, and we cannot see output in case of delay statements presence. 


class one extends uvm_scoreboard;
	`uvm_component_utils(one);
	uvm_analysis_port #(int) text;
	int mno;

	function new (string name = "one", uvm_component parent = null);
		super.new(name,parent);
	endfunction: new 

  	function void build_phase(uvm_phase phase);
    		text = new("SJSU",this);
  	endfunction: build_phase

  	task run_phase(uvm_phase phase);
	    	mno=0;
		phase.raise_objection(this);
		    repeat(20) begin
		      text.write(mno);
		      mno+=1;
		    end
    		phase.drop_objection(this);
  	endtask: run_phase 

endclass: one

//----------------------------------
// Creating scoreboard number 2, labelled as "two" 
// Scoreboard number 2 is receiving the messages sent from "one" 
// This object called "text" is basically carrying the messages from scoreboard one to two. 

class two extends uvm_scoreboard;
	  `uvm_component_utils(two);
	   uvm_analysis_imp #(int,two) text;
	
	function new (string name = "two", uvm_component parent = null);
		super.new(name,parent);
	endfunction: new 

	  function void build_phase(uvm_phase phase);
	   	text = new("VLSI",this);
	  endfunction: build_phase
  
	  function void write(int nmb);
	    `uvm_info("learning", $sformatf("Hi, I am Ankita, This is: MSG. NO.%03d",nmb), UVM_MEDIUM);
	  endfunction: write 

endclass: two

//----------------------------------------
//This is the actual class inside of which the two scoreboards exist.
//This includes the connect phase, which is needed to connect the two scoreboards, thus messages are transmitted. 

class assg extends uvm_test;

	`uvm_component_utils(assg);
  	 one sb1;
   	 two sb2;

	function new (string name = "assg", uvm_component parent = null);
		super.new(name,parent);
	endfunction: new
 
  	function void build_phase (uvm_phase phase);
    		sb1 = one::type_id::create("sb1",this);
    		sb2 = two::type_id::create("sb2",this);
        endfunction: build_phase

	   function void connect_phase (uvm_phase phase);
	   	sb1.text.connect(sb2.text);
	   endfunction: connect_phase

endclass: assg







