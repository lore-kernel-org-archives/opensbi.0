From: Samuel Holland <samuel@sholland.org>
Date: Sun, 16 Oct 2022 14:19:34 -0500
Subject: [PATCH v4 09/14] lib: utils/reset: Add Andes fdt reset driver
 support
In-Reply-To: <20221014003252.17765-10-peterlin@andestech.com>
References: <20221014003252.17765-1-peterlin@andestech.com>
 <20221014003252.17765-10-peterlin@andestech.com>
Message-ID: <4b4aafa5-c03c-2f60-0632-c4fd8fd6986c@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/13/22 19:32, Yu Chien Peter Lin wrote:
> Add ATCWDT200 as reset device of AE350 platform, this driver requires
> SMU to program the reset vector registers before triggering WDT software
> restart signal.
> 
> dts example:
> 
>   smu at f0100000 {
>     compatible = "andestech,atcsmu";
>     reg = <0x00000000 0xf0100000 0x00000000 0x00001000>;
>   };
> 
>   wdt: wdt at f0500000 {
>     compatible = "andestech,atcwdt200";
>     reg = <0x00000000 0xf0500000 0x00000000 0x00001000>;
>     interrupts = <3 4>;
>     interrupt-parent = <&plic0>;
>     clock-frequency = <15000000>;
>   };

The same applies here and in patch 12. A complete binding for these
compatible strings needs to be available somewhere. Otherwise, it is
impossible to review the code for compliance with the binding.

Regards,
Samuel


