`timescale 1ns / 1ps

module theFunction(
    input logic reset,
    input logic clk,
    input logic Sa,
    input logic Sb,
    output logic [2:0] ledA,
    output logic [2:0] ledB
    );
    
    reg [1:0] lightA;
    reg [1:0] lightB;
    
    typedef enum logic [2:0] {S0, S1, S2, S3, S4, S5, S6, S7} statetype;
    statetype state, nextstate;
    reg [32:0] count = 32'b0;
     
    always_ff @(posedge clk, posedge reset)begin
        if(reset) state <= S0;
        else begin 
            count <= count + 1'b1;
                if (count == 32'b1111_1111_1111_1111_1111_1111_1111) begin
                    count <= 32'b0;
                    state <= nextstate;
                end
        end
    end

    always_comb
        case (state)
            S0: if(Sa) nextstate = S0;
                else   nextstate = S1;
            S1: nextstate = S2;
            S2: nextstate = S3;
            S3: nextstate = S4;
            S4: if(Sb) nextstate = S4;
                else   nextstate = S5;
            S5: nextstate = S6;
            S6: nextstate = S7;
            S7: nextstate = S0;
            default: nextstate = S0;
        endcase
        
    always_comb begin
        if (state == S1 || state == S7) begin
            lightA = 2'b01;
            lightB = 2'b00;
        end else if (state == S3 || state == S5) begin
            lightA = 2'b00;
            lightB = 2'b01;
        end else if (state == S0) begin
            lightA = 2'b10;
            lightB = 2'b00;
        end else if(state == S4) begin
            lightA = 2'b00;
            lightB = 2'b10;
        end else if(state == S2 || state == S6) begin
            lightA = 2'b00;
            lightB = 2'b00;
        end else begin
            lightA = 2'b11;
            lightB = 2'b11;
        end
    end

    always_comb begin
        if (lightA == 2'b00)
            ledA = 3'b111;
        else if (lightA == 2'b01)
            ledA = 3'b001;
        else if (lightA == 2'b10)
            ledA = 3'b011;  
        else
            ledA = 3'b000;  
    end
    
    always_comb begin
        if (lightB == 2'b00)
            ledB = 3'b111;
        else if (lightB == 2'b01)
            ledB = 3'b001;
        else if (lightB == 2'b10)
            ledB = 3'b011;  
        else
            ledB = 3'b000;  
    end

endmodule


