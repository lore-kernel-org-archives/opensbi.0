From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 12:51:27 +0530
Subject: [RFC 2/3] lib: sbi: Add Zkr in hart extensions
In-Reply-To: <20231028224959.95465-3-heinrich.schuchardt@canonical.com>
References: <20231028224959.95465-1-heinrich.schuchardt@canonical.com> <20231028224959.95465-3-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy3ASwnDcQW_FE-JF7-2zhQ+-c0_ijBEoYWX+UiJjnZP0g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 29, 2023 at 4:20?AM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> - Add Zkr as extension in sbi_hart_extensions enum
> - Return "zkr" string for Zkr extension from sbi_hart_extension_id2string
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_hart.h     | 2 ++
>  lib/sbi/sbi_hart.c         | 3 +++
>  lib/utils/fdt/fdt_helper.c | 1 +
>  3 files changed, 6 insertions(+)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index e60f415..fe1124a 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -40,6 +40,8 @@ enum sbi_hart_extensions {
>         SBI_HART_EXT_ZICNTR,
>         /** HART has Zihpm extension */
>         SBI_HART_EXT_ZIHPM,
> +       /** HART has Zkr extension */
> +       SBI_HART_EXT_ZKR,
>         /** Hart has Smcntrpmf extension */
>         SBI_HART_EXT_SMCNTRPMF,
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 29d6481..569596f 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -678,6 +678,9 @@ static inline char *sbi_hart_extension_id2string(int ext)
>         case SBI_HART_EXT_ZIHPM:
>                 estr = "zihpm";
>                 break;
> +       case SBI_HART_EXT_ZKR:
> +               estr = "zkr";
> +               break;
>         case SBI_HART_EXT_SMEPMP:
>                 estr = "smepmp";
>                 break;
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 9ae7f09..35be7ba 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -376,6 +376,7 @@ static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
>                         }
>
>                 set_multi_letter_ext("smepmp", SBI_HART_EXT_SMEPMP);
> +               set_multi_letter_ext("zkr", SBI_HART_EXT_ZKR);
>  #undef set_multi_letter_ext
>         }
>
> --
> 2.40.1
>

