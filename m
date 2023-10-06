From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Oct 2023 17:32:21 +0530
Subject: [PATCH v2 1/1] lib: utils: Simplify SET_ISA_EXT_MAP()
In-Reply-To: <20230928121720.41669-1-heinrich.schuchardt@canonical.com>
References: <20230928121720.41669-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy2-PLPTtNr06MP6_wj0yJQ6VmwPEHEjUAbUexT1bwK45Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 28, 2023 at 5:47?PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The define is hard to read. The continue statement does not do what was
> intended.
>
> * Remove do {} while (false);
> * Change the name to set_multi_letter_ext
>   - Other local macros are lower case too.
>   - Refer to the fact that this is only used for multi-letter extensions.
>
> Addresses-Coverity-ID: 1568359 Unexpected control flow
> Fixes: d72f5f17478d ("lib: utils: Add detection of Smepmp from ISA string in FDT")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v2:
>         keep continue statement
>         rename macro
> ---
>  lib/utils/fdt/fdt_helper.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index c97f09d..b97ff74 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -369,16 +369,15 @@ static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
>                 if (!j)
>                         continue;
>
> -#define SET_ISA_EXT_MAP(name, bit)                             \
> -               do {                                            \
> -                       if (!strcmp(mstr, name)) {              \
> +#define set_multi_letter_ext(name, bit)                                \
> +               {                                               \
> +                       if (!strcmp(mstr, name))                \
>                                 __set_bit(bit, extensions);     \
>                                 continue;                       \
> -                       }                                       \

The braces around "if ()" are still required otherwise it fails to compile.

I have taken care of this at the time of merging this patch.

> -               } while (false)                                 \
> +               }                                               \
>
> -               SET_ISA_EXT_MAP("smepmp", SBI_HART_EXT_SMEPMP);
> -#undef SET_ISA_EXT_MAP
> +               set_multi_letter_ext("smepmp", SBI_HART_EXT_SMEPMP);
> +#undef set_multi_letter_ext
>         }
>
>         return 0;
> --
> 2.40.1
>

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

