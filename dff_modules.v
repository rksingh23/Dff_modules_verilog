//--------------------------------------------------------------------------------------------------
// File: D Flip Flop.v
// Purpose: Explain multiple flip flop coding practise
// Concept: 1. Synchronous Reset is triggered only at the posedge or the negedge of the clock
//          2. Asynchronous Reset is independent of the clock.
//          3. Whenever Data Enable is high, Q<=D, otherwise Q retains it's value
// 
// Owner: Rohit Kumar Singh
//--------------------------------------------------------------------------------------------------

`timescale 1ns/1ns

//-----------------------------------------------------------------------
// Synchronous Active High Reset and Active High Data Enable Flip Flop
//-----------------------------------------------------------------------

module dff_sync_high_high (CLK, RST, EN, D, Q);
output reg Q;
input CLK, RST, EN,D;

always@(posedge CLK) begin
if (RST)
	Q<=1'b0;
else if(EN)
	Q<=D;
end
endmodule

//-----------------------------------------------------------------------



//-----------------------------------------------------------------------
// Asynchronous Active High Reset and Active Low Data Enable Flip Flop
//-----------------------------------------------------------------------

module dff_async_high_low (CLK, RST, EN, D, Q);
output reg Q;
input CLK, RST, EN,D;
always @ (posedge CLK or posedge RST) begin
if (RST)
	Q<=1'b0;
else if(!EN)
	Q<=D;
end
endmodule

//-----------------------------------------------------------------------




//-----------------------------------------------------------------------
// Synchronous Active Low Reset and Active High Data Enable Flip Flop
//-----------------------------------------------------------------------


module dff_sync_low_high (CLK, RST, EN, D, Q);
output reg Q;
input CLK, RST, EN,D;

always@(posedge CLK) begin
if (!RST)
	Q<=1'b0;
else if(EN)
	Q<=D;
end
endmodule

//-----------------------------------------------------------------------




//-----------------------------------------------------------------------
// Asynchronous Active Low Reset and Active Low Data Enable Flip Flop
//-----------------------------------------------------------------------

module dff_async_low_low (CLK, RST, EN, D, Q);
output reg Q;
input CLK, RST, EN,D;
always @ (posedge CLK or negedge RST) begin
if (!RST)
	Q <=1'b0;
else if(!EN)
    Q<=D;
end
endmodule

//-----------------------------------------------------------------------