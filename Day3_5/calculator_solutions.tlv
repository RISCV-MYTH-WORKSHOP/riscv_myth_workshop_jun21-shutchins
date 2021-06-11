\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   // RV_D3SK2_L2_Sequential Calculator Lab
   // Lab: Sequential Calculator
   
   // Initialize operands
   $val1[31:0] = (>>1$out);
   $val2[31:0] = $rand1[3:0];
   
   // Perform operations
   $sum[31:0] = $val1 + $val2 ;
   $diff[31:0] = $val1 - $val2 ;
   $prod[31:0] = $val1 * $val2 ;
   $quot[31:0] = $val1 / $val2 ;
   
   // Select result
   $out[31:0] = $reset ? 32'b0 :
                $op[1:0] == 2'b00 ? $sum :
                $op == 2'b01 ? $diff :
                $op == 2'b10 ? $prod :
                //$op == 2'b11
                $quot;
   
   // Free-running counter
   $cnt[31:0] = $reset ? 32'b0 : 1 + (>>1$cnt);
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
