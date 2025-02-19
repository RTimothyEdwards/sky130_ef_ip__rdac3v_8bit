// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

/*--------------------------------------------------------------*/
/* Verilog behavioral model of 8-bit digtal-to-analog converter */
/*                                                              */
/* 
/*                                                              */
/* The analog signals are on a 3.3V domain (vdd, vss).          */
/* The data bits "b0" to "b7" are on a 1.8V domain (dvdd, dvss)	*/
/* The digital "ena" (enable) signal is on the 1.8V domain.	*/
/*                                                              */
/* "ena" is active high (1 = enabled)                           */
/*--------------------------------------------------------------*/

`default_nettype none

module sky130_ef_ip__rdac3v_8bit #(parameter FUNCTIONAL = 1)(
`ifdef USE_POWER_PINS
   inout       vdd,
   inout       vss,
   inout       dvdd,
   inout       dvss,
`endif
   input  real Vlow,
   input  real Vhigh,
   input       ena,
   input [7:0] b,
   output real out
);


generate
   if(FUNCTIONAL == 1) begin
      reg    real dacvalue;

      assign out = dacvalue;

      initial begin
         dacvalue <= 0;
      end

      always @* begin
         if (ena == 1'b1) begin
            dacvalue <= Vlow + b * (Vhigh - Vlow) / 255.0;
         end else begin
            dacvalue <= 0;
         end
      end
   end
endgenerate

endmodule
`default_nettype wire

