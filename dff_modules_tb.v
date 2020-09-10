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

module dff_sync_high_high_tb();
wire Q;
reg CLK, RST, EN,D;
integer output_file;

dff_sync_high_high dff_h_h (.CLK(CLK),.RST(RST),.EN(EN),.D(D),.Q(Q));

always #1 CLK=~CLK;


initial begin
output_file = $fopen("sync_high_high.txt","w");
$fwrite(output_file,"At %0t ns << Starting the Simulation >>\n",$time);

CLK<=0;
D<=0;
EN<=0;
RST<=1;
#1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5;
RST<=0;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5;
D<= 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#2;
EN<= 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5
D<= 0;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#7;
D<= 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#9;
EN<= 0;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
D<= 0;
#13;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#1;
$fwrite(output_file,"At %0t ns << Ending the Simulation >>\n",$time);

$fclose(output_file);
end


endmodule

//-----------------------------------------------------------------------



//-----------------------------------------------------------------------
// Asynchronous Active High Reset and Active Low Data Enable Flip Flop
//-----------------------------------------------------------------------

module dff_async_high_low_tb();
wire Q;
reg CLK, RST, EN,D;
integer output_file;

dff_async_high_low dff_h_l (.CLK(CLK),.RST(RST),.EN(EN),.D(D),.Q(Q));

always #1 CLK=~CLK;

initial begin
output_file = $fopen("async_high_low.txt","w");
$fwrite(output_file,"At %0t ns << Starting the Simulation >> \n",$time);

CLK<=0;
D<=0;
EN<=1;
RST<=1;
#1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5;
RST<=0;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5;
D<=#5 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#2;
EN<= 0;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5
D<= 0;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#7;
D<= 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#9;
EN<= 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
D<= 0;
#13;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#1;
$fwrite(output_file,"At %0t ns << Ending the Simulation >> \n",$time);

$fclose(output_file);
end

endmodule

//-----------------------------------------------------------------------




//-----------------------------------------------------------------------
// Synchronous Active Low Reset and Active High Data Enable Flip Flop
//-----------------------------------------------------------------------

module dff_sync_low_high_tb();
wire Q;
reg CLK, RST, EN,D;
integer output_file;

dff_sync_low_high dff_l_h (.CLK(CLK),.RST(RST),.EN(EN),.D(D),.Q(Q));

always #1 CLK=~CLK;

initial begin
output_file = $fopen("sync_low_high.txt","w");
$fwrite(output_file,"At %0t ns << Starting the Simulation >> \n",$time);

CLK<=0;
D<=0;
EN<=0;
RST<=0;
#1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5;
RST<=1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5;
D<=#5 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#2;
EN<= 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5
D<= 0;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#7;
D<= 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#9;
EN<= 0;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
D<= 0;
#13;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#1;
$fwrite(output_file,"At %0t ns << Ending the Simulation >> \n",$time);

$fclose(output_file);
end

endmodule

//-----------------------------------------------------------------------




//-----------------------------------------------------------------------
// Asynchronous Active Low Reset and Active Low Data Enable Flip Flop
//-----------------------------------------------------------------------

module dff_async_low_low_tb();

wire Q;
reg CLK, RST, EN,D;
integer output_file;

dff_async_low_low dff_l_l (.CLK(CLK),.RST(RST),.EN(EN),.D(D),.Q(Q));

always #1 CLK=~CLK;

initial begin
output_file = $fopen("async_low_low.txt","w");
$fwrite(output_file,"At %0t ns << Starting the Simulation >> \n",$time);

CLK<=0;
D<=0;
EN<=1;
RST<=0;
#1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5;
RST<=1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5;
D<=#5 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#2;
EN<= 0;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#5
D<= 0;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#7;
D<= 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#9;
EN<= 1;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
D<= 0;
#13;
$fwrite(output_file,"At %0t ns Value of Reset is =%b, Enable is =%b, D is =%b, and Q is =%b \n",
				 $time,RST,EN, D, Q);
#1;
$fwrite(output_file,"At %0t ns << Ending the Simulation >> \n",$time);

$fclose(output_file);
end

endmodule

//-----------------------------------------------------------------------