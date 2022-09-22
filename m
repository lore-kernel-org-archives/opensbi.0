From: Leo Liang <ycliang@andestech.com>
Date: Thu, 22 Sep 2022 06:18:33 +0000
Subject: [PATCH 06/12] lib: utils/reset: Add Andes fdt reset driver
 support
In-Reply-To: <20220915015121.27596-7-peterlin@andestech.com>
References: <20220915015121.27596-1-peterlin@andestech.com>
 <20220915015121.27596-7-peterlin@andestech.com>
Message-ID: <Yyv+OVji9ybaJ/X2@ubuntu01>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 15, 2022 at 09:51:15AM +0800, Yu Chien Peter Lin wrote:
> Add ATCWDT200 as reset device of ae350 platform, this driver requires
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
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  lib/utils/reset/Kconfig               |   4 +
>  lib/utils/reset/fdt_reset_atcwdt200.c | 122 ++++++++++++++++++++++++++
>  lib/utils/reset/objects.mk            |   3 +
>  platform/andes/ae350/Kconfig          |   2 +
>  platform/andes/ae350/platform.c       |   3 +
>  5 files changed, 134 insertions(+)
>  create mode 100644 lib/utils/reset/fdt_reset_atcwdt200.c
>

Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

