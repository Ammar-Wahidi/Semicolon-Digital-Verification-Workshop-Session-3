
module pa_cv ();

if (parity == ODD || parity == EVEN) begin
tx <= compute_parity(data, parity);
#(tx_time);
end
tx <= 1'b0;
#(tx_time);
if (stop_bits == 2) begin
tx <= 1'b0;
#(tx_time);
end

endmodule