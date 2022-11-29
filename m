From: Xiang W <wxjstz@126.com>
Date: Tue, 29 Nov 2022 16:16:53 +0800
Subject: [PATCH] lib: sbi: Add option to select boot hart
In-Reply-To: <20221129052119.379830-1-weiliang.lim@starfivetech.com>
References: <20221129052119.379830-1-weiliang.lim@starfivetech.com>
Message-ID: <c7969edd4515971647ea85bdc08f4cc9a0f24aac.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-11-29???? 13:21 +0800?Wei Liang Lim???
> In certain scenario, user needs to select a particular hart ID as the boot hart. This option provide the flexibility for user to select the
> preferred boot hart.
> 
> Signed-off-by: Wei Liang Lim <weiliang.lim@starfivetech.com>
> Reviewed-by: Chee Hong Ang <cheehong.ang@starfivetech.com>
> Reviewed-by: Jun Liang Tan <junliang.tan@starfivetech.com>
> ---
> ?firmware/objects.mk | 4 ++++
> ?lib/sbi/sbi_init.c? | 9 ++++++++-
> ?2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/firmware/objects.mk b/firmware/objects.mk
> index a1704c4..2b41718 100644
> --- a/firmware/objects.mk
> +++ b/firmware/objects.mk
> @@ -28,6 +28,10 @@ ifdef FW_TEXT_START
> ?firmware-genflags-y += -DFW_TEXT_START=$(FW_TEXT_START)
> ?endif
> ?
> +ifdef FW_BOOT_HART_ID
> +firmware-genflags-y += -DFW_BOOT_HART_ID=$(FW_BOOT_HART_ID)
> +endif
> +
> ?ifdef FW_FDT_PATH
> ?firmware-genflags-y += -DFW_FDT_PATH=\"$(FW_FDT_PATH)\"
> ?ifdef FW_FDT_PADDING
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index d57efa7..5abfa79 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -443,7 +443,9 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
> ???????????????????????????? scratch->next_mode, FALSE);
> ?}
> ?
> +#ifndef FW_BOOT_HART_ID
> ?static atomic_t coldboot_lottery = ATOMIC_INITIALIZER(0);
> +#endif
> ?
> ?/**
> ? * Initialize OpenSBI library for current HART and jump to next
> @@ -494,7 +496,12 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
> ???????? * HARTs which satisfy above condition.
> ???????? */
> ?
> -???????if (next_mode_supported && atomic_xchg(&coldboot_lottery, 1) == 0)
> +???????if (next_mode_supported &&
> +#ifdef FW_BOOT_HART_ID
> +???????????????hartid == FW_BOOT_HART_ID)
> +#else
> +???????????????atomic_xchg(&coldboot_lottery, 1) == 0)
> +#endif
Look good to me. I recommend

#ifdef FW_BOOT_HART_ID
               if (next_mode_supported && hartid == FW_BOOT_HART_ID)
#else
               if (next_mode_supported && atomic_xchg(&coldboot_lottery, 1) == 0)
endif

Reviewed-by: Xiang W <wxjstz@126.com>
> ????????????????coldboot = TRUE;
> ?
> ????????/*
> -- 
> 2.25.1
> 
> 



