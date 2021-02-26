From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Fri, 26 Feb 2021 00:52:17 +0000
Subject: [PATCH 1/1] platform: implement K210 system reset
References: <20210226004119.17716-1-xypron.glpk@gmx.de>
Message-ID: <BL0PR04MB651441277BC331ED3CAD5789E79D9@BL0PR04MB6514.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021/02/26 9:41, Heinrich Schuchardt wrote:
> Implement rebooting the K210 via the system reset extension.
> 
> All reset types are treated in the same way.
> A request for shutdown results in a reboot.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  platform/kendryte/k210/platform.c | 19 +++++++++++++++++++
>  platform/kendryte/k210/platform.h |  6 ++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> index 944b388..cba8c7d 100644
> --- a/platform/kendryte/k210/platform.c
> +++ b/platform/kendryte/k210/platform.c
> @@ -129,6 +129,22 @@ static int k210_timer_init(bool cold_boot)
>  	return clint_warm_timer_init();
>  }
> 
> +static int k210_system_reset_check(u32 type, u32 reason)
> +{
> +	return 1;
> +}
> +
> +static void k210_system_reset(u32 type, u32 reason)
> +{
> +	u32 val;
> +
> +	val = k210_read_sysreg(K210_RESET);
> +	val |= 1;

Instead of the magic value, can you define a macro for it ? E.g.

#define K210_RESET_ROM	(1 << 0)

There lots of other reset lines, so this way it is clear which one is being used.

> +	k210_write_sysreg(val, K210_RESET);
> +
> +	while(1);
> +}
> +
>  const struct sbi_platform_operations platform_ops = {
>  	.final_init	= k210_final_init,
> 
> @@ -142,6 +158,9 @@ const struct sbi_platform_operations platform_ops = {
>  	.ipi_send  = clint_ipi_send,
>  	.ipi_clear = clint_ipi_clear,
> 
> +	.system_reset_check = k210_system_reset_check,
> +	.system_reset = k210_system_reset,
> +
>  	.timer_init	   = k210_timer_init,
>  	.timer_value	   = clint_timer_value,
>  	.timer_event_stop  = clint_timer_event_stop,
> diff --git a/platform/kendryte/k210/platform.h b/platform/kendryte/k210/platform.h
> index 5269bc4..2946928 100644
> --- a/platform/kendryte/k210/platform.h
> +++ b/platform/kendryte/k210/platform.h
> @@ -27,10 +27,16 @@
>  /* Registers */
>  #define K210_PLL0		0x08
>  #define K210_CLKSEL0		0x20
> +#define K210_RESET		0x30
> 
>  static inline u32 k210_read_sysreg(u32 reg)
>  {
>  	return readl((volatile void *)(K210_SYSCTL_BASE_ADDR + reg));
>  }
> 
> +static inline void k210_write_sysreg(u32 val, u32 reg)
> +{
> +	writel(val, (volatile void *)(K210_SYSCTL_BASE_ADDR + reg));
> +}
> +
>  #endif /* _K210_PLATFORM_H_ */
> --
> 2.30.0
> 
> 

With the above comment addressed, looks good to me. Feel free to add:

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital Research

