//Verilog HDL for "comparch", "Control3" "behavioral"

module  Control3(Opcode, Funct, Jump, RegDst, Branch, MemRead, MemtoReg, ALUOp,
                MemWrite, ALUSrc, RegWrite, RegData, JR_JAL);   

input [5:0]     Opcode,Funct;

output         Jump, Branch, MemRead, MemtoReg,
                MemWrite, RegWrite, JR_JAL, RegData;
reg            Jump,  Branch, MemRead, MemtoReg,
                MemWrite, RegWrite, JR_JAL, RegData;

output[1:0]     ALUSrc,ALUOp,RegDst;
reg[1:0]         ALUSrc,ALUOp,RegDst;

 
   always @( Opcode or Funct )begin
      if(Opcode == 6'b000000 ) begin
	if(Funct == 6'b001000) begin // Opcode : R-type JR modify
	 Jump     <= 1'b1;
	 RegDst   <= 2'b00;
	 Branch   <= 1'bx;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'b0;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'bxx; 
	 ALUOp    <= 2'bxx;
	 RegWrite <= 1'b0;
	 JR_JAL   <= 1'b1;
	 RegData  <= 1'b0; 
	end else begin // Opcode : R-type(ADD SUB SLT AND OR)
	 Jump     <= 1'b0;
	 RegDst   <= 2'b01; // modify
	 Branch   <= 1'b0;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'b0;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'b00; // modify
	 ALUOp    <= 2'b10;
	 RegWrite <= 1'b1;
	 JR_JAL   <= 1'b0; // modify
	 RegData  <= 1'b1; // modify
      end end else
      if(Opcode == 6'b100011) begin // Opcode : LW
	 Jump     <= 1'b0;
	 RegDst   <= 2'b00; // modify
	 Branch   <= 1'b0;
	 MemRead  <= 1'b1;
	 MemtoReg <= 1'b1;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'b01; // modify
	 ALUOp    <= 2'b00;  
	 RegWrite <= 1'b1;
	 JR_JAL   <= 1'b0; // modify
	 RegData  <= 1'b1; // modify   
       end else
       if(Opcode == 6'b101011) begin // Opcode : SW
	 Jump     <= 1'b0;
	 RegDst   <= 2'b00; // modify
	 Branch   <= 1'b0;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'b1;
	 ALUSrc   <= 2'b01; // modify
	 ALUOp    <= 2'b00; 
	 RegWrite <= 1'b0;    
	 JR_JAL   <= 1'b0; // modify
	 RegData  <= 1'b1; // modify
       end else 
       if(Opcode == 6'b000100) begin // Opcode : BEQ
	 Jump     <= 1'b0;
	 RegDst   <= 2'b00; // modify
	 Branch   <= 1'b1;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'b00; // modify
	 ALUOp    <= 2'b01;
	 RegWrite <= 1'b0;
	 JR_JAL   <= 1'b0; // modify
	 RegData  <= 1'b0; // modify     
       end else 
       if(Opcode == 6'b000010) begin // Opcode : J
	 Jump     <= 1'b1;
	 RegDst   <= 2'b10; // modify
	 Branch   <= 1'bx;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'bxx; // modify
	 ALUOp    <= 2'bxx;
	 RegWrite <= 1'b0;
	 JR_JAL   <= 1'b1; // modify
	 RegData  <= 1'b0; // modify   
       end else 
       if(Opcode == 6'b001000) begin // Opcode : ADDI
	 Jump     <= 1'bx;
	 RegDst   <= 2'b00; // modify
	 Branch   <= 1'bx;
	 MemRead  <= 1'bx;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'bx;
	 ALUSrc   <= 2'bxx; 
	 ALUOp    <= 2'bxx;
	 RegWrite <= 1'bx;
	 JR_JAL   <= 1'b0; // modify
	 RegData  <= 1'b1; // modify   
       end else 
       if(Opcode == 6'b001100) begin // Opcode : ANDI 
	 Jump     <= 1'bx;
	 RegDst   <= 2'b00; // modify
	 Branch   <= 1'bx;
	 MemRead  <= 1'bx;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'bx;
	 ALUSrc   <= 2'bxx; 
	 ALUOp    <= 2'bxx;
	 RegWrite <= 1'bx;
	 JR_JAL   <= 1'b0; // modify
	 RegData  <= 1'b1; // modify   
       end else 
       if(Opcode == 6'b001101) begin // Opcode : ORI 
	 Jump     <= 1'bx;
	 RegDst   <= 2'b01; // modify
	 Branch   <= 1'bx;
	 MemRead  <= 1'bx;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'bx;
	 ALUSrc   <= 2'bxx; 
	 ALUOp    <= 2'bxx;
	 RegWrite <= 1'bx;
	 JR_JAL   <= 1'b0; // modify
	 RegData  <= 1'b1; // modify   
       end else 
       if(Opcode == 6'b001010) begin // Opcode : STLI
	 Jump     <= 1'bx;
	 RegDst   <= 2'b00; // modify
	 Branch   <= 1'bx;
	 MemRead  <= 1'bx;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'bx;
	 ALUSrc   <= 2'bxx; 
	 ALUOp    <= 2'bxx;
	 RegWrite <= 1'bx;
	 JR_JAL   <= 1'b0; // modify
	 RegData  <= 1'b1; // modify 
       end else 
       if(Opcode == 6'b000011) begin // Opcode : JAL modify
	 Jump     <= 1'b1;
	 RegDst   <= 2'b00;
	 Branch   <= 1'b0;
	 MemRead  <= 1'b0;
	 MemtoReg <= 1'b0;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'bxx; 
	 ALUOp    <= 2'bxx;
	 RegWrite <= 1'b0;
	 JR_JAL   <= 1'b1;
	 RegData  <= 1'b0; 
       end  else begin // Opcode : Error
	 Jump     <= 1'b0;
	 RegDst   <= 2'b00; // modify
	 Branch   <= 1'b0;
	 MemRead  <= 1'bx;
	 MemtoReg <= 1'bx;
	 MemWrite <= 1'b0;
	 ALUSrc   <= 2'b00; // modify
	 ALUOp    <= 2'bxx;
	 RegWrite <= 1'b0;
	 JR_JAL   <= 1'b0; // modify
	 RegData  <= 1'b0; // modify     
       end  

   end // always @ ( Opcode )
   
endmodule








