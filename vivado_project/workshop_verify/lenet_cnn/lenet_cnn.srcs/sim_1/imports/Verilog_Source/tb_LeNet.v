/*`timescale 1ns / 1ps
`define TS 10 
`define DELAY `TS*2 
`define RunTime `TS*8798
module tb_LeNet;

reg clk, rst;
wire [31:0]LeNet_Out;
LeNet uut (clk,rst,LeNet_Out);
always @(LeNet_Out) $display("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d",O0,O1,O2,O3,O4,O5,O6,O7,O8,O9);
initial begin clk=0;forever #(`TS) clk=~clk;end
initial begin rst=1; #(`DELAY) rst=0; #(`RunTime);$finish;end
endmodule */

`timescale 1ns / 1ps
`define TS 10 
`define DELAY `TS*2 
`define RunTime `TS*8798

module tb_LeNet;

    reg clk, rst;
    wire [31:0] LeNet_Out; 
    
    // Connect the module
    LeNet uut (clk, rst, LeNet_Out);

    // ==========================================
    //  LARGE WORD DISPLAY LOGIC
    // ==========================================
    // ==========================================
    //  BILLBOARD DISPLAY LOGIC (Clean & Readable)
    // ==========================================
    always @(LeNet_Out) begin
        // Filter out the reset value (-1 / 32'hFFFFFFFF)
        if (LeNet_Out != 32'hFFFFFFFF) begin
            $display("\n");
            $display("/////////////////////////////////////////////////////");
            $display("//                                                 //");
            $display("//            PREDICTED DIGIT DETECTED             //");
            $display("//                                                 //");
            
            case(LeNet_Out)
                0: $display("//               Z  E  R  O                    //");
                1: $display("//                O  N  E                      //");
                2: $display("//                T  W  O                      //");
                3: $display("//              T  H  R  E  E                  //");
                4: $display("//               F  O  U  R                    //");
                5: $display("//               F  I  V  E                    //");
                6: $display("//                S  I  X                      //");
                7: $display("//              S  E  V  E  N                  //");
                8: $display("//              E  I  G  H  T                  //");
                9: $display("//               N  I  N  E                    //");
                default: 
                   $display("//             ? UNKNOWN ?                     //");
            endcase
            
            $display("//                                                     //");
            $display("/////////////////////////////////////////////////////");
            $display("\n");
        end
    end
    // Clock Generation
    initial begin 
        clk = 0; 
        forever #(`TS) clk = ~clk; 
    end

    // Reset and Runtime Control
    initial begin 
        rst = 1; 
        #(`DELAY) rst = 0; 
        
        #(`RunTime);
        $display("Simulation Finished.");
        $finish;
    end

endmodule