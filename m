From: Xiang W <wxjstz@126.com>
Date: Tue, 20 Dec 2022 18:29:19 +0800
Subject: [PATCH v4 1/3] lib: sbi: Allow platform to influence cold boot
 HART selection
In-Reply-To: <20221220034102.150151-2-weiliang.lim@starfivetech.com>
References: <20221220034102.150151-1-weiliang.lim@starfivetech.com>
	 <20221220034102.150151-2-weiliang.lim@starfivetech.com>
Message-ID: <7a8bdc8bac2df7b357f01e3334757543a27967ba.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-12-20???? 11:41 +0800?Wei Liang Lim???
> From: Anup Patel <apatel@ventanamicro.com>
> 
> We add an optional cold_boot_allowed() platform callback which allows
> platform support to decide which HARTs can do cold boot initialization.
> 
> If this platform callback is not available then any HART can do cold
> boot initialization.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?include/sbi/sbi_platform.h | 20 ++++++++++++++++++++
> ?lib/sbi/sbi_init.c???????? |? 7 +++++--
> ?2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 722f27a..566eee3 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -65,6 +65,9 @@ enum sbi_platform_features {
> ?
> ?/** Platform functions */
> ?struct sbi_platform_operations {
> +???????/* Check if specified HART is allowed to do cold boot */
> +???????bool (*cold_boot_allowed)(u32 hartid);
> +
> ????????/* Platform nascent initialization */
> ????????int (*nascent_init)(void);
> ?
> @@ -356,6 +359,23 @@ static inline bool sbi_platform_hart_invalid(const struct sbi_platform *plat,
> ????????return FALSE;
> ?}
> ?
> +/**
> + * Check whether given HART is allowed to do cold boot
> + *
> + * @param plat pointer to struct sbi_platform
> + * @param hartid HART ID
> + *
> + * @return TRUE if HART is allowed to do cold boot and FALSE otherwise
> + */
> +static inline bool sbi_platform_cold_boot_allowed(
> +???????????????????????????????????????const struct sbi_platform *plat,
> +???????????????????????????????????????u32 hartid)
> +{
> +???????if (plat && sbi_platform_ops(plat)->cold_boot_allowed)
> +???????????????return sbi_platform_ops(plat)->cold_boot_allowed(hartid);
> +???????return TRUE;
> +}
> +
> ?/**
> ? * Nascent (very early) initialization for current HART
> ? *
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index a8500e5..d4902d9 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -498,8 +498,11 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
> ???????? * HARTs which satisfy above condition.
> ???????? */
> ?
> -???????if (next_mode_supported && atomic_xchg(&coldboot_lottery, 1) == 0)
> -???????????????coldboot = TRUE;
> +???????if (sbi_platform_cold_boot_allowed(plat, hartid)) {
> +???????????????if (next_mode_supported &&
> +?????????????????? atomic_xchg(&coldboot_lottery, 1) == 0)
> +???????????????????????coldboot = TRUE;
> +???????}
> ?
> ????????/*
> ???????? * Do platform specific nascent (very early) initialization so
> -- 
> 2.25.1
> 
> 



