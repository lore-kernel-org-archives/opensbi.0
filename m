From: Minda Chen <minda.chen@starfivetech.com>
Date: Mon, 5 Feb 2024 02:07:46 +0000
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHYzIDIvN10gcGxhdGZvcm06IHN0YXJmaXZlOiBnZXQg?=
 =?gb2312?Q?I2C_offset_address_from_clocks_property?=
In-Reply-To: <e50c9ecfc7bb63ee0e3cd69d72bc2050d4c39d0c.1706880734.git.namcao@linutronix.de>
References: <cover.1706880734.git.namcao@linutronix.de>
 <e50c9ecfc7bb63ee0e3cd69d72bc2050d4c39d0c.1706880734.git.namcao@linutronix.de>
Message-ID: <SHXPR01MB0863ACB0B544190AF3E7819EE647A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----????-----
> ???: Nam Cao <namcao@linutronix.de>
> ????: 2024?2?2? 21:43
> ???: opensbi at lists.infradead.org; Cheehong Ang
> <cheehong.ang@starfivetech.com>; Wei Liang Lim
> <weiliang.lim@starfivetech.com>; Minda Chen <minda.chen@starfivetech.com>
> ??: Nam Cao <namcao@linutronix.de>
> ??: [PATCH v3 2/7] platform: starfive: get I2C offset address from clocks
> property
> 
> The current code gets the I2C offset address using the device tree node
> name: it get the I2C device index from the 4th character in the node name (for
> example, "i2c5" -> i2c device 5). However, the device tree node's name in
> U-Boot is actually just "i2c" without the number, so the current code cannot be
> used with the device tree from U-Boot.
> 
> Get the I2C offset address from the "clocks" property instead.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>  platform/generic/starfive/jh7110.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/platform/generic/starfive/jh7110.c
> b/platform/generic/starfive/jh7110.c
> index 4b22175..846b068 100644
> --- a/platform/generic/starfive/jh7110.c
> +++ b/platform/generic/starfive/jh7110.c
> @@ -29,7 +29,7 @@ struct pmic {
>  struct jh7110 {
>  	u64 pmu_reg_base;
>  	u64 clk_reg_base;
> -	u32 i2c_index;
> +	u32 i2c_clk_offset;
>  };
> 
>  static struct pmic pmic_inst;
> @@ -163,10 +163,7 @@ static void pmic_i2c_clk_enable(void)
>  	unsigned long clock_base;
>  	unsigned int val;
> 
> -	clock_base = jh7110_inst.clk_reg_base +
> -		I2C_APB_CLK_OFFSET +
> -		(jh7110_inst.i2c_index << 2);
> -
> +	clock_base = jh7110_inst.clk_reg_base + jh7110_inst.i2c_clk_offset;
>  	val = readl((void *)clock_base);
> 
>  	if (!val)
> @@ -241,7 +238,8 @@ static struct fdt_reset fdt_reset_pmic = {  static int
> starfive_jh7110_inst_init(void *fdt)  {
>  	int noff, rc = 0;
> -	const char *name;
> +	const fdt32_t *val;
> +	int len;
>  	u64 addr;
> 
>  	noff = fdt_node_offset_by_compatible(fdt, -1, "starfive,jh7110-pmu"); @@
> -261,9 +259,12 @@ static int starfive_jh7110_inst_init(void *fdt)
>  	}
> 
>  	if (pmic_inst.adapter) {
> -		name = fdt_get_name(fdt, pmic_inst.adapter->id, NULL);
> -		if (!sbi_strncmp(name, "i2c", 3))
> -			jh7110_inst.i2c_index = name[3] - '0';
> +		val = fdt_getprop(fdt, pmic_inst.adapter->id, "clocks", &len);
> +		/* The clocks property looks like this: clocks = <&syscrg
> JH7110_SYSCLK_I2C5_APB>;
> +		 * So check that the length is 8 bytes, and get the offset from the
> second value
> +		 */
> +		if (val && len == 8)
> +			jh7110_inst.i2c_clk_offset = fdt32_to_cpu(val[1]) << 2;
>  		else
>  			rc = SBI_EINVAL;
>  	}
> --
> 2.39.2

Please delete this macro 
-#define I2C_APB_CLK_OFFSET             0x228

Reviewed-by: Minda Chen <minda.chen@starfivetech.com>
