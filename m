From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 29 Jul 2020 07:06:35 +0000
Subject: [PATCH v2 2/3] Use standard C string APIs in FDT helper
In-Reply-To: <20200725093041.7373-3-abner.chang@hpe.com>
References: <20200725093041.7373-1-abner.chang@hpe.com>
 <20200725093041.7373-3-abner.chang@hpe.com>
Message-ID: <DM6PR04MB62017403449F3867179D81638D700@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Abner Chang <abner.chang@hpe.com>
> Sent: 25 July 2020 15:01
> To: opensbi at lists.infradead.org
> Cc: abner.chang at hpe.com; Atish Patra <Atish.Patra@wdc.com>; Anup Patel
> <Anup.Patel@wdc.com>; Daniel Schaefer <daniel.schaefer@hpe.com>
> Subject: [PATCH v2 2/3] Use standard C string APIs in FDT helper
> 
> Use strncmp instead of using sbi_strcmp directly in fdthelp.c.
> - This commit add a macro to replace strncmp with sbi_strncmp.
> 
> Signed-off-by: Abner Chang <abner.chang@hpe.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> 
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Daniel Schaefer <daniel.schaefer@hpe.com>
> ---
>  lib/utils/libfdt/libfdt_env.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/utils/libfdt/libfdt_env.h b/lib/utils/libfdt/libfdt_env.h index
> 7fcfe01..bc3e758 100644
> --- a/lib/utils/libfdt/libfdt_env.h
> +++ b/lib/utils/libfdt/libfdt_env.h
> @@ -32,6 +32,7 @@
>  #define strrchr		sbi_strrchr
>  #define strcpy		sbi_strcpy
>  #define strcmp		sbi_strcmp
> +#define strncmp		sbi_strncmp
>  #define strlen		sbi_strlen
>  #define strnlen		sbi_strnlen
> 
> --
> 2.25.0

Fixed patch subject at time of applying patch.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


