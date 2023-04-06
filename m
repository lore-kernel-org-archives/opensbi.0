From: Tan En De <ende.tan@starfivetech.com>
Date: Thu, 6 Apr 2023 19:25:35 +0800
Subject: [1/1] lib: utils/fdt: Parse for UART "clocks" property if
 "clock-frequency" is absent
In-Reply-To: <F8BEB3D4-B938-42D7-B57D-21541873FFD2@jrtc27.com>
References: <20230406062622.1484-1-ende.tan@starfivetech.com>
 <F8BEB3D4-B938-42D7-B57D-21541873FFD2@jrtc27.com>
Message-ID: <4db712ef-b91c-13ac-0949-cebcca973612@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, taking example UART nodes from snps-dw-apb-uart.yaml
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
(The following is just for examples, it's relevant to many other 
vendor's UART device tree too)
=================================
 ? // Example with one clock:
 ? serial at 80230000 {
 ??? ....
 ??? clocks = <&baudclk>;
 ??? ....
 ??? };

 ? // Example with two clocks:
 ? serial at 80230000 {
 ??? ....
 ??? clocks = <&baudclk>, <&apb_pclk>;
 ??? clock-names = "baudclk", "apb_pclk";
 ?? ....
 ??? };
=================================

Notice that "clock-frequency" property is absent in the serial node.
However, we can get the "clock-frequency" if we parse the phandle in the 
"clocks" property.
For example, we can use the &bauclk phandle to trace back to baudclk node.
=================================
 ? baudclk {
 ??? compatible = "fixed-clock";
 ??? #clock-cells = <0>;
 ??? clock-frequency = <uart_clock_frequency_here>;
 ??? phandle = <phandle_of_baudclk>;
 ? ? };
=================================


As UART driver vendors have so many ways of presenting the UART device 
tree node,
here are some possible solutions to cater them:
-------------
Solution 1
-------------
The easiest solution, replicate the "clock-frequency" property into the 
UART node.
=================================
 ? serial at 80230000 {
 ??? ....
 ??? clocks = <&baudclk>, <&apb_pclk>;
 ??? clock-names = "baudclk", "apb_pclk";
 ??? clock-frequency = <uart_clock_frequency_here>;
 ??? ....
 ??? };
=================================

-------------
Solution 2
-------------
This is the solution provided in this patch submission.
Use clock index to specify which entry in the "clocks" property contains 
the main UART clock's phandle, which baudrate calculation will be 
calculated from.
For example, let's consider a fictitious UART node like this
=================================
 ? serial at 12341234 {
 ??? ....
 ??? clocks = <&internal_clk SOME_SPECIFIER ANOTHER_SPECIFIER>, 
<&auxiliary_clk ANOTHER_SPECIFIER>, <&uart_clk>;
 ??? clock-names = "intclk", "auxclk", "uartclk";
 ?? ....
 ?? };
=================================
where internal_clk is indexed 0, auxiliary_clk is indexed 1, uart_clk is 
indexed 2.
Using the function provided in this patch submission,
since uart_clk is indexed 2, set uart.clock_index = 2,
then call fdt_parse_uart_clocks_prop() to parse the uart_clk and set the 
uart.freq.

-------------
Solution 3
-------------
Simply leave the fdt parsing mentioned in Solution 2 to the vendor's 
implementation in the fdt_serial_<vendor>.c
If this is the preferred solution, this patch shall be archived and 
changes shall be made to fdt_serial_cadence.c instead.


I'm having paradox of choice, let me know what's your opinion, thanks. :-)



On 6/4/2023 3:07 pm, Jessica Clarke wrote:
> On 6 Apr 2023, at 07:26, Tan En De <ende.tan@starfivetech.com> wrote:
>> For UART node, current implementation of fdt_parse_uart_node_common() checks for "clock-frequency" property only.
>> However, for UART node that uses more than one clock,
>> "clock-frequency" may need to be parsed from the phandle specified in "clocks" property.
>> So, this commit adds in logic to parse "clocks" property if "clock-frequency" is absent.
> FreeBSD?s common FDT UART code doesn?t do this. What specific
> hardware/bindings do you need this for? If this is for the
> snps,dw-apb-uart (which I would assume is what it?s for given you?re a
> StarFive employee) then why? The Linux driver assumes that
> clock-frequency exists, as does FreeBSD.
>
> Needs further justification, otherwise it?s a NAK from me.
>
> Jess


