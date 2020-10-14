module blinker (
    input clk, // The clk input
    input switch, // The enabler is the switch output from timer
    input reset, 	// Standard system clock and reset
    input in, 	// Initialized on (1'b1)
    output out	// 
);
  
  // Switch is fed from timer, in should be intialized at one to start the blinker on.
  dffre #(1) blink(clk, reset, switch, in, out);
  
  always @(*) begin
    case(out) 
      1'b0: in = 1'b1;
      1'b1: in = 1'b0;
      default: in = out;
    endcase
  end


endmodule
