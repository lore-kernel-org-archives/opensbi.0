From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Jul 2024 13:11:51 +0530
Subject: [PATCH v1] lib: utils/fdt: Add support for parsing riscv,isa-extensions
In-Reply-To: <20240702105913.1843900-2-conor@kernel.org>
References: <20240702105913.1843900-2-conor@kernel.org>
Message-ID: <CAAhSdy2xNmy0sRgV4QQ_sTm+RZ-Y3d1CTLwLEH6ga-u19_2mbA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 2, 2024 at 4:30?PM Conor Dooley <conor@kernel.org> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> A new property has been added, with an extensive rationale at [1], that
> can be used in place of "riscv,isa" to indicate what extensions are
> supported by a given platform that is a list of strings rather than a
> single string. There are some differences between the new property,
> "riscv,isa-extensions" and the incumbent "riscv,isa" - chief among them
> for the sake of parsing being the list of strings, as opposed to a
> string. Another advantage is strictly defined meanings for each string
> in a dt-binding, rather than deriving meaning from RVI standards. This
> may likely to some divergence over time, but, at least for now, there's
> no relevant differences between the two for an M-Mode program.
>
> Add support for the new property in OpenSBI, prioritising it, before
> falling back to the, now deprecated, "riscv,isa" property if it is not
> present.
>
> Link: https://lore.kernel.org/all/20230702-eats-scorebook-c951f170d29f at spud/ [1]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/fdt/fdt_helper.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 9a945af..b7f7e07 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -411,6 +411,18 @@ static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
>         return 0;
>  }
>
> +static void fdt_parse_isa_extensions_one_hart(const char *isa,
> +                                             unsigned long *extensions,
> +                                             int len)
> +{
> +       size_t i;
> +
> +       for (i = 0; i < SBI_HART_EXT_MAX; i++) {
> +               if (fdt_stringlist_contains(isa, len, sbi_hart_ext[i].name))
> +                       __set_bit(sbi_hart_ext[i].id, extensions);
> +       }
> +}
> +
>  static int fdt_parse_isa_all_harts(void *fdt)
>  {
>         u32 hartid;
> @@ -434,10 +446,6 @@ static int fdt_parse_isa_all_harts(void *fdt)
>                 if (!fdt_node_is_enabled(fdt, cpu_offset))
>                         continue;
>
> -               val = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
> -               if (!val || len <= 0)
> -                       return SBI_ENOENT;
> -
>                 scratch = sbi_hartid_to_scratch(hartid);
>                 if (!scratch)
>                         return SBI_ENOENT;
> @@ -445,6 +453,17 @@ static int fdt_parse_isa_all_harts(void *fdt)
>                 hart_exts = sbi_scratch_offset_ptr(scratch,
>                                                    fdt_isa_bitmap_offset);
>
> +               val = fdt_getprop(fdt, cpu_offset, "riscv,isa-extensions", &len);
> +               if (val && len > 0) {
> +                       fdt_parse_isa_extensions_one_hart((const char *)val,
> +                                                         hart_exts, len);
> +                       continue;
> +               }
> +
> +               val = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
> +               if (!val || len <= 0)
> +                       return SBI_ENOENT;
> +
>                 err = fdt_parse_isa_one_hart((const char *)val, hart_exts);
>                 if (err)
>                         return err;
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

