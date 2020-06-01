//Verilog HDL for "comparch", "Control" "behavioal"

module  Control2(Opcode, Jump, RegDst, Branch, MemRead, MemtoReg, ALUOp,
                MemWrite, ALUSrc, RegWrite);   
 
input [5:0]     Opcode;

output         Jump, RegDst, Branch, MemRead, MemtoReg,
                MemWrite, RegWrite;
reg            Jump, RegDst, Branch, MemRead, MemtoReg,
                MemWrite, RegWrite;

output[1:0]     ALUSrc,ALUOp;
reg[1:0]         ALUSrc,ALUOp;

   always @( Opcode )begin
      if(Opcode == 6'b000000 ) begin // Opcode : R-type(ADD SUB SLT AND OR)
	 Jump     <= 1'b0;
	 RegDst   <= 1'b1;
	 Branch   <= 1'b0;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'b0;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'b00; // modify
	 ALUOp    <= 2'b10;
	 RegWrite <= 1'b1;
      end else
      if(Opcode == 6'b100011) begin // Opcode : LW
	 Jump     <= 1'b0;
	 RegDst   <= 1'b0;
	 Branch   <= 1'b0;
	 MemRead  <= 1'b1;
	 MemtoReg <= 1'b1;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'b01; // modify
	 ALUOp    <= 2'b00;
	 RegWrite <= 1'b1;     
       end else
       if(Opcode == 6'b101011) begin // Opcode : SW
	 Jump     <= 1'b0;
	 RegDst   <= 1'bx;
	 Branch   <= 1'b0;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'b1;
	 ALUSrc   <= 2'b01; // modify
	 ALUOp    <= 2'b00; 
	 RegWrite <= 1'b0;    
       end else 
       if(Opcode == 6'b000100) begin // Opcode : BEQ
	 Jump     <= 1'b0;
	 RegDst   <= 1'bx;
	 Branch   <= 1'b1;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'b00; // modify
	 ALUOp    <= 2'b01; 
	 RegWrite <= 1'b0;    
       end else 
       if(Opcode == 6'b000010) begin // Opcode : J
	 Jump     <= 1'b1;
	 RegDst   <= 1'bx;
	 Branch   <= 1'bx;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'bxx; // modify
	 ALUOp    <= 2'bxx;  
	 RegWrite <= 1'b0; 
       end else 
       if(Opcode == 6'b001000) begin // Opcode : ADDI modify
	 Jump     <= 1'b0;
	 RegDst   <= 1'b0;
	 Branch   <= 1'b0;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'b0;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'b01; 
	 ALUOp    <= 2'b11;  
	 RegWrite <= 1'b1; 
       end else 
       if(Opcode == 6'b001100) begin // Opcode : ANDI modify
	 Jump     <= 1'b0;
	 RegDst   <= 1'b0;
	 Branch   <= 1'b0;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'b0;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'b01; 
	 RegWrite <= 1'b1;
	 ALUOp    <= 2'b11;   
       end else 
       if(Opcode == 6'b001101) begin // Opcode : ORI modify
	 Jump     <= 1'b0;
	 RegDst   <= 1'b0;
	 Branch   <= 1'b0;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'b0;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'b01; 
	 ALUOp    <= 2'b11; 
	 RegWrite <= 1'b1;  
       end else 
       if(Opcode == 6'b001010) begin // Opcode : STLI modify
	 Jump     <= 1'b0;
	 RegDst   <= 1'b0;
	 Branch   <= 1'b0;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'b0;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'b01; 
	 ALUOp    <= 2'b11;
	 RegWrite <= 1'b1;  
       end  else begin // Opcode : Error
	 Jump     <= 1'b0;
	 RegDst   <= 1'bx;
	 Branch   <= 1'b0;
	 MemRead  <= 1'bx;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'bxx; // modify
	 ALUOp    <= 2'bxx; 
	 RegWrite <= 1'b0;    
       end  

   end // always @ ( Opcode )
   

endmodule








