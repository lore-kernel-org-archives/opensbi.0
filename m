From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 21 Jan 2022 21:51:35 +0530
Subject: [PATCH 1/2] platform: sifive_fu740: do not use a global in
 da9063_reset/shutdown
In-Reply-To: <20220105072039.2609845-1-aurelien@aurel32.net>
References: <20220105072039.2609845-1-aurelien@aurel32.net>
Message-ID: <CAK9=C2Xk+e3B3Kw28e51m66vGWbozKdPed54+wDDqckZ3_WYjg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 5, 2022 at 12:52 PM Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> da9063_reset() and da9063_shutdown() take the chip address in argument
> (like similar functions), but in practice use the da9063 global struct
> instead. Fix that.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Apologies for being slow on this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/sifive_fu740.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/platform/generic/sifive_fu740.c b/platform/generic/sifive_fu740.c
> index 333b3fb..866e924 100644
> --- a/platform/generic/sifive_fu740.c
> +++ b/platform/generic/sifive_fu740.c
> @@ -81,32 +81,32 @@ static inline int da9063_sanity_check(struct i2c_adapter *adap, uint32_t reg)
>
>  static inline int da9063_shutdown(struct i2c_adapter *adap, uint32_t reg)
>  {
> -       int rc = i2c_adapter_reg_write(adap, da9063.reg,
> +       int rc = i2c_adapter_reg_write(adap, reg,
>                                         DA9063_REG_PAGE_CON, 0x00);
>
>         if (rc)
>                 return rc;
>
> -       return i2c_adapter_reg_write(adap, da9063.reg,
> +       return i2c_adapter_reg_write(adap, reg,
>                                      DA9063_REG_CONTROL_F,
>                                      DA9063_CONTROL_F_SHUTDOWN);
>  }
>
>  static inline int da9063_reset(struct i2c_adapter *adap, uint32_t reg)
>  {
> -       int rc = i2c_adapter_reg_write(adap, da9063.reg,
> +       int rc = i2c_adapter_reg_write(adap, reg,
>                                         DA9063_REG_PAGE_CON, 0x00);
>
>         if (rc)
>                 return rc;
>
> -       rc = i2c_adapter_reg_write(adap, da9063.reg,
> +       rc = i2c_adapter_reg_write(adap, reg,
>                                    DA9063_REG_CONTROL_F,
>                                    DA9063_CONTROL_F_WAKEUP);
>         if (rc)
>                 return rc;
>
> -       return i2c_adapter_reg_write(adap, da9063.reg,
> +       return i2c_adapter_reg_write(adap, reg,
>                                 DA9063_REG_CONTROL_A,
>                                 DA9063_CONTROL_A_M_POWER1_EN |
>                                 DA9063_CONTROL_A_M_POWER_EN |
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

