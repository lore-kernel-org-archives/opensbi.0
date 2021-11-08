From: Guo Ren <guoren@linux.alibaba.com>
Date: Mon, 8 Nov 2021 14:29:22 +0800
Subject: [PATCH v2] lib: utils/irqchip: Automatically delegate T-HEAD PLIC
 access
In-Reply-To: <20211018053350.39184-1-samuel@sholland.org>
References: <20211018053350.39184-1-samuel@sholland.org>
Message-ID: <e662c26f-edd1-3132-293f-ce90eb614e80@linux.alibaba.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Acked-by: Guo Ren <guoren@kernel.org>

On 2021/10/18 ??1:33, Samuel Holland wrote:
> The T-HEAD PLIC implementation requires setting a delegation bit
> to allow access from S-mode. Now that the T-HEAD PLIC has its own
> compatible string, set this bit automatically from the PLIC driver,
> instead of reaching into the PLIC's MMIO space from another driver.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
>
> ---
>
> Changes in v2:
>   - Use the thead,c900-plic compatible instead of the D1 compatible.
>   - Also apply this change to other T-HEAD device tree examples.
>   - Remove the plic-delegate code from the thead,reset-sample driver.
>   - Drop the return value from thead_plic_plat_init().
>
> The compatible string is added in the patch series here:
> https://lore.kernel.org/linux-riscv/20211016032200.2869998-1-guoren at kernel.org/T/
> ---
>   docs/platform/thead-c9xx.md          | 12 +++---------
>   lib/utils/irqchip/fdt_irqchip_plic.c | 15 +++++++++++++++
>   lib/utils/reset/fdt_reset_thead.c    |  8 --------
>   3 files changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/docs/platform/thead-c9xx.md b/docs/platform/thead-c9xx.md
> index c0daeb7..3490ed5 100644
> --- a/docs/platform/thead-c9xx.md
> +++ b/docs/platform/thead-c9xx.md
> @@ -51,11 +51,6 @@ DTS Example1: (Single core, eg: Allwinner D1 - c906)
>   		compatible = "simple-bus";
>   		ranges;
>   
> -		reset: reset-sample {
> -			compatible = "thead,reset-sample";
> -			plic-delegate = <0x0 0x101ffffc>;
> -		};
> -
>   		clint0: clint at 14000000 {
>   			compatible = "riscv,clint0";
>   			interrupts-extended = <
> @@ -67,7 +62,8 @@ DTS Example1: (Single core, eg: Allwinner D1 - c906)
>   
>   		intc: interrupt-controller at 10000000 {
>   			#interrupt-cells = <1>;
> -			compatible = "riscv,plic0";
> +			compatible = "allwinner,sun20i-d1-plic",
> +				     "thead,c900-plic";
>   			interrupt-controller;
>   			interrupts-extended = <
>   				&cpu0_intc  0xffffffff &cpu0_intc  9
> @@ -150,7 +146,6 @@ DTS Example2: (Multi cores with soc reset-regs)
>   
>   		reset: reset-sample {
>   			compatible = "thead,reset-sample";
> -			plic-delegate = <0xff 0xd81ffffc>;
>   			entry-reg = <0xff 0xff019050>;
>   			entry-cnt = <4>;
>   			control-reg = <0xff 0xff015004>;
> @@ -173,7 +168,7 @@ DTS Example2: (Multi cores with soc reset-regs)
>   
>   		intc: interrupt-controller at ffd8000000 {
>   			#interrupt-cells = <1>;
> -			compatible = "riscv,plic0";
> +			compatible = "thead,c900-plic";
>   			interrupt-controller;
>   			interrupts-extended = <
>   				&cpu0_intc  0xffffffff &cpu0_intc  9
> @@ -194,7 +189,6 @@ DTS Example2: (Multi cores with old reset csrs)
>   ```
>   	reset: reset-sample {
>   		compatible = "thead,reset-sample";
> -		plic-delegate = <0xff 0xd81ffffc>;
>   		using-csr-reset;
>   		csr-copy = <0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc
>   			    0x3b0 0x3b1 0x3b2 0x3b3
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index 18d2797..8d375be 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -9,6 +9,7 @@
>   
>   #include <libfdt.h>
>   #include <sbi/riscv_asm.h>
> +#include <sbi/riscv_io.h>
>   #include <sbi/sbi_error.h>
>   #include <sbi/sbi_hartmask.h>
>   #include <sbi_utils/fdt/fdt_helper.h>
> @@ -91,6 +92,11 @@ static int irqchip_plic_cold_init(void *fdt, int nodeoff,
>   	if (rc)
>   		return rc;
>   
> +	if (match->data) {
> +		void (*plic_plat_init)(struct plic_data *) = match->data;
> +		plic_plat_init(pd);
> +	}
> +
>   	rc = plic_cold_irqchip_init(pd);
>   	if (rc)
>   		return rc;
> @@ -106,9 +112,18 @@ static int irqchip_plic_cold_init(void *fdt, int nodeoff,
>   	return irqchip_plic_update_hartid_table(fdt, nodeoff, pd);
>   }
>   
> +#define THEAD_PLIC_CTRL_REG 0x1ffffc
> +
> +static void thead_plic_plat_init(struct plic_data *pd)
> +{
> +	writel_relaxed(BIT(0), (void *)pd->addr + THEAD_PLIC_CTRL_REG);
> +}
> +
>   static const struct fdt_match irqchip_plic_match[] = {
>   	{ .compatible = "riscv,plic0" },
>   	{ .compatible = "sifive,plic-1.0.0" },
> +	{ .compatible = "thead,c900-plic",
> +	  .data = thead_plic_plat_init },
>   	{ },
>   };
>   
> diff --git a/lib/utils/reset/fdt_reset_thead.c b/lib/utils/reset/fdt_reset_thead.c
> index 750b7aa..d491687 100644
> --- a/lib/utils/reset/fdt_reset_thead.c
> +++ b/lib/utils/reset/fdt_reset_thead.c
> @@ -82,14 +82,6 @@ static int thead_reset_init(void *fdt, int nodeoff,
>   			clone_csrs(cnt);
>   	}
>   
> -
> -	/* Delegate plic enable regs for S-mode */
> -	val = fdt_getprop(fdt, nodeoff, "plic-delegate", &len);
> -	if (len > 0 && val) {
> -		p = (void *)(ulong)fdt64_to_cpu(*val);
> -		writel(BIT(0), p);
> -	}
> -
>   	/* Old reset method for secondary harts */
>   	if (fdt_getprop(fdt, nodeoff, "using-csr-reset", &len)) {
>   		csr_write(0x7c7, (ulong)&__thead_pre_start_warm);


