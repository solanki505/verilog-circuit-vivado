
module jk_flipflop(
    input wire clk,   // Clock signal
    input wire reset, // Reset signal
    input wire J,     // J input
    input wire K,     // K input
    output reg Q,     // Output
    output reg Qn     // Complementary output
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Q <= 0;      // Reset output
            Qn <= 1;     // Reset complementary output
        end else begin
            case ({J, K})
                2'b00: begin // Hold state
                    Q <= Q;
                    Qn <= Qn;
                end
                2'b01: begin // Reset state
                    Q <= 0;
                    Qn <= 1;
                end
                2'b10: begin // Set state
                    Q <= 1;
                    Qn <= 0;
                end
                2'b11: begin // Toggle state
                    Q <= ~Q;
                    Qn <= ~Qn;
                end
            endcase
        end
    end
endmodule
