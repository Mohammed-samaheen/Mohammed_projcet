module Up_Down_Counter(
			input s0,s1,clk,res,
			input [3:0]x,
			output reg [3:0]y);
	initial y=0;
	always @(posedge clk)
		begin
			if(res==0)
			   y=0;
			case({s0,s1})
			  2'b00 :y=x;
			  2'b01 :y=(y+1)%16;
			  2'b10 :y=(y-1)%16;
     		  2'b11 :y=y;
			endcase
		end
	
endmodule

module Counter_test;
	reg [3:0]x; reg s0,s1,clk,res;
	wire [3:0]y;
	
	Up_Down_Counter t1(s0,s1,clk,res,x,y);
	
	initial 
	    begin
        	clk=0; x=0;
        	forever #5 clk=~clk;
        	
         end
	
	initial 
		begin
		    
			s0=0;s1=1;res=1;
			$display("time\ts0\ts1\tres\t  x\t      y");
			 $monitor("%g\t\t%b\t%b\t%b\t%b\t%b",$time,s0,s1,res,x,y);
			#150 s0=1;s1=0;
			#150 s0=0;s1=0; x=7;
			#10 s1=0;s1=0;
			#10 s0=1;s1=1;
			#5 res=0;
			#5$finish;
			   
		end
		
	
endmodule

