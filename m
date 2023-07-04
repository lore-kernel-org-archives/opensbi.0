From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Jul 2023 18:48:54 +0530
Subject: [PATCH 4/6] lib: sbi: Add detection of Smepmp from ISA string in FDT
In-Reply-To: <20230620143212.2701598-5-hchauhan@ventanamicro.com>
References: <20230620143212.2701598-1-hchauhan@ventanamicro.com> <20230620143212.2701598-5-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy2YFpjjePjH_oxKjjijJ0FeBirNnQndkNc6OsVYKsK1Jw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 20, 2023 at 8:02?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> - To enable Smepmp, the ISA string in FDT should have "smepmp" string. This patch
>   adds support for parsing of Smepmp in ISA string.
> - A bit is reserved for Smepmp in extensions member of sbi_hart_features
>   which is set if Smepmp is detected in FDT.
> - A utilty function is added to check if Smepmp is detected and enabled.
> - In sbi_boot_print_hart, a print is added to display the state of Smepmp.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

This patch needs to be broken down into two PATCHs:
1) Add SBI_HART_EXT_SMEPMP in include/sbi/sbi_hart.h and
    lib/sbi/sbi_hart.c
2) Add ISA parsing in include/sbi_utils/fdt/fdt_helper.h,
    lib/utils/fdt/fdt_helper.c, and platform/generic/platform.c

See below for more comments...

> ---
>  include/sbi/sbi_hart.h             |   3 +
>  include/sbi_utils/fdt/fdt_helper.h |   3 +
>  lib/sbi/sbi_hart.c                 |   8 +++
>  lib/sbi/sbi_init.c                 |   2 +
>  lib/utils/fdt/fdt_helper.c         | 111 +++++++++++++++++++++++++++++
>  platform/generic/platform.c        |   5 ++
>  6 files changed, 132 insertions(+)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 95b40e7..9582b52 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -36,6 +36,8 @@ enum sbi_hart_extensions {
>         SBI_HART_EXT_SMSTATEEN,
>         /** HART has Sstc extension */
>         SBI_HART_EXT_SSTC,
> +       /** HART has Smepmp */
> +       SBI_HART_EXT_SMEPMP,
>
>         /** Maximum index of Hart extension */
>         SBI_HART_EXT_MAX,
> @@ -66,6 +68,7 @@ static inline ulong sbi_hart_expected_trap_addr(void)
>  unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch);
>  void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
>                               const char *prefix, const char *suffix);
> +unsigned int sbi_hart_smepmp_supported(struct sbi_scratch *scratch);

This is is not needed because sbi_hart_has_extension() does the same thing.

>  unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
>  unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch);
>  unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 39d7f3a..5c928ff 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -56,6 +56,9 @@ int fdt_parse_max_enabled_hart_id(void *fdt, u32 *max_hartid);
>
>  int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq);
>
> +int fdt_parse_isa_extensions(void *fdt, unsigned int hard_id,
> +                            unsigned long *extensions);
> +
>  int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
>                                 struct platform_uart_data *uart);
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 6e52cbd..c328243 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -260,6 +260,14 @@ unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
>         return hfeatures->pmp_count;
>  }
>
> +unsigned int sbi_hart_smepmp_supported(struct sbi_scratch *scratch)
> +{
> +       struct sbi_hart_features *hfeatures =
> +               sbi_scratch_offset_ptr(scratch, hart_features_offset);
> +
> +       return !!(hfeatures->extensions & (_UL(1) << SBI_HART_EXT_SMEPMP));
> +}
> +

Drop this function since sbi_hart_has_extension() does the same thing.

You missed adding "smepmp" in the sbi_hart_extension_id2string() function.

>  unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch)
>  {
>         struct sbi_hart_features *hfeatures =
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 423e6d8..31d2c3e 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -173,6 +173,8 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
>         misa_string(xlen, str, sizeof(str));
>         sbi_printf("Boot HART Base ISA        : %s\n", str);
>         sbi_hart_get_extensions_str(scratch, str, sizeof(str));
> +       sbi_printf("SMEPMP                    : %sDetected\n",
> +                  (sbi_hart_smepmp_supported(scratch) ? "" : "Not "));

No need for this because sbi_hart_extension_id2string() will ensure that
"smepmp" is printed as a "Boot HART ISA Extensions".

>         sbi_printf("Boot HART ISA Extensions  : %s\n", str);
>         sbi_printf("Boot HART PMP Count       : %d\n",
>                    sbi_hart_pmp_count(scratch));
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index a88a4ba..db9d4c3 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -12,6 +12,7 @@
>  #include <sbi/sbi_hartmask.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_scratch.h>
> +#include <sbi/sbi_hart.h> /* for hart extension enums */

No need for the "/* */" comment.

>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/irqchip/aplic.h>
>  #include <sbi_utils/irqchip/imsic.h>
> @@ -313,6 +314,116 @@ int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq)
>         return 0;
>  }
>
> +static int fdt_get_isa_string(void *fdt, unsigned int hartid,
> +                       const char **isa_string)
> +{
> +       int err, cpu_offset, cpus_offset, len;
> +       u32 c_hartid;
> +       const fdt32_t *val;
> +
> +       if (!fdt)
> +               return SBI_EINVAL;
> +
> +       cpus_offset = fdt_path_offset(fdt, "/cpus");
> +       if (cpus_offset < 0)
> +               return cpus_offset;
> +
> +       fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
> +               err = fdt_parse_hart_id(fdt, cpu_offset, &c_hartid);
> +               if (err)
> +                       continue;
> +
> +               if (!fdt_node_is_enabled(fdt, cpu_offset))
> +                       continue;
> +
> +               if (c_hartid == hartid) {
> +                       val = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
> +                       if (val && len > 0) {
> +                               *isa_string = (const char *)val;
> +                               return 0;
> +                       }
> +               }
> +       }
> +
> +       return SBI_EINVAL;
> +}
> +
> +#define RISCV_ISA_EXT_NAME_LEN_MAX     32
> +
> +int fdt_parse_isa_extensions(void *fdt, unsigned int hartid,
> +                       unsigned long *extensions)
> +{
> +       size_t i, j, isa_len;
> +       char mstr[RISCV_ISA_EXT_NAME_LEN_MAX];
> +       const char *isa = NULL;
> +
> +       if (fdt_get_isa_string(fdt, hartid, &isa))
> +               return SBI_EINVAL;
> +
> +       if (!isa)
> +               return SBI_EINVAL;
> +
> +       i = 0;
> +       isa_len = strlen(isa);
> +
> +       if (isa[i] == 'r' || isa[i] == 'R')
> +               i++;
> +       else
> +               return SBI_EINVAL;
> +
> +       if (isa[i] == 'v' || isa[i] == 'V')
> +               i++;
> +       else
> +               return SBI_EINVAL;
> +
> +       if (isa[i] == '3' || isa[i+1] == '2')
> +               i += 2;
> +       else if (isa[i] == '6' || isa[i+1] == '4')
> +               i += 2;
> +       else
> +               return SBI_EINVAL;
> +
> +       /* Skip base ISA extentions */

s/extentions/extensions/

> +       for (; i < isa_len; i++) {
> +               if (isa[i] == '_')
> +                       break;
> +       }
> +
> +       while (i < isa_len) {
> +               if (isa[i] != '_') {
> +                       i++;
> +                       continue;
> +               }
> +
> +               /* Skip the '_' character */
> +               i++;
> +
> +               /* Extract the multi-letter extension name */
> +               j = 0;
> +               while ((i < isa_len) && (isa[i] != '_') &&
> +                      (j < (sizeof(mstr) - 1)))
> +                       mstr[j++] = isa[i++];
> +               mstr[j] = '\0';
> +
> +               /* Skip empty multi-letter extension name */
> +               if (!j)
> +                       continue;
> +
> +#define SET_ISA_EXT_MAP(name, bit)                             \
> +               do {                                            \
> +                       if (!strcmp(mstr, name)) {              \
> +                               __set_bit(bit, extensions);     \
> +                               continue;                       \
> +                       }                                       \
> +               } while (false)                                 \
> +
> +               SET_ISA_EXT_MAP("smepmp", SBI_HART_EXT_SMEPMP);
> +#undef SET_ISA_EXT_MAP
> +       }
> +
> +       return 0;
> +}
> +
>  static int fdt_parse_uart_node_common(void *fdt, int nodeoffset,
>                                       struct platform_uart_data *uart,
>                                       unsigned long default_freq,
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 0c9cd95..24c0fa9 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -215,6 +215,11 @@ static int generic_extensions_init(struct sbi_hart_features *hfeatures)
>                 return generic_plat->extensions_init(generic_plat_match,
>                                                      hfeatures);
>
> +       /* Parse the ISA string from FDT and enable the listed extensions */
> +       if (fdt_parse_isa_extensions(fdt_get_address(), current_hartid(),
> +                                    &hfeatures->extensions))
> +               return 0;
> +

This needs to be done before generic_plat->extensions_init() because
code will not reach here if platform_override has extensions_init() callback.

Add following lines before generic_plat->extensions_init()

rc = fdt_parse_isa_extensions(fdt_get_address(), current_hartid(),
                                   &hfeatures->extensions));
if (rc)
    return rc;

>         return 0;
>  }
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

