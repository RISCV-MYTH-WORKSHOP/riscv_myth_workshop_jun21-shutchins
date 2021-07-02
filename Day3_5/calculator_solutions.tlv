\m4_TLV_version 1d: tl-x.org
\SV
   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
   
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/bd1f186fde018ff9e3fd80597b7397a1c862cf15/tlv_lib/calculator_shell_lib.tlv'])

\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)

// RV_D3SK3_L4_Lab On 2-Cycle Calculator
// Lab: Counter and Calculator in Pipeline
                                       
\TLV
   |calc
      @0
         // to enable viz
         $reset = *reset;
         
      @1
         // Free-running counter
         $valid = $reset ? 1'b0 : 1'b1 + (>>1$valid);
         $reset_or_valid = $reset || $valid;
         
         $val1[31:0] = >>2$out;
         $val2[31:0] = $rand1[3:0];
         
      ?$reset_or_valid
         @1
            // Perform operations
            $sum[31:0] = $val1 + $val2 ;
            $diff[31:0] = $val1 - $val2 ;
            $prod[31:0] = $val1 * $val2 ;
            $quot[31:0] = $val1 / $val2 ;
            
         @2
         
            // memory store
            $mem[31:0] = $reset ? 32'b0 :
               $op == 3'b101 ? $out : >>2$mem;
            
            // Select result
            $out[31:0] = $reset ? 32'b0 :
              $op[2:0] == 2'b000 ? $sum :
              $op == 3'b001 ? $diff :
              $op == 3'b010 ? $prod :
              $op == 3'b011 ? $quot :
              $op == 3'b100 ? (>>2$mem) :
              (>>2$out);
         
      // Macro instantiations for calculator visualization(disabled by default).
      // Uncomment to enable visualisation, and also,
      // NOTE: If visualization is enabled, $op must be defined to the proper width using the expression below.
      //       (Any signals other than $rand1, $rand2 that are not explicitly assigned will result in strange errors.)
      //       You can, however, safely use these specific random signals as described in the videos:
      //  o $rand1[3:0]
      //  o $rand2[3:0]
      //  o $op[x:0]
      
   m4+cal_viz(@3) // Arg: Pipeline stage represented by viz, should be atleast equal to last stage of CALCULATOR logic.
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   

\SV
   endmodule
