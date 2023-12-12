From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Dec 2023 13:45:01 +0530
Subject: [PATCH 3/7] lib: sbi: Probe reserved PMP regions before OpenSBI start
In-Reply-To: <tencent_364764DCAF98881083C651BE0A4100ED6107@qq.com>
References: <tencent_A2668222DA598E42B87A318A214D8DBD7C08@qq.com> <tencent_364764DCAF98881083C651BE0A4100ED6107@qq.com>
Message-ID: <CAAhSdy1dr_K9Jv-=ivKKoNz9jxjMQMqbbw_9fs5RW99SZvY+NQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 8, 2023 at 3:34?AM Yangyu Chen <cyy@cyyself.name> wrote:
>
> Some platform which has different domains for different CPU cores may
> disable some device by PMP in the bootloader.
>
> For example, Canaan Kendryte K230 provides SDK which locks some PMP
> entries in M-Mode U-Boot[1]. If the OpenSBI did not probe it, OpenSBI
> may get the wrong result from hart_pmp_get_allowed_addr() as the
> pmpaddr0 can not be changed if it is locked. It will also break the
> sbi_hart_pmp_configure() as it assumes the useable PMP index starts
> from 0.
>
> Thus, providing a function to probe the PMP regions that are reserved
> before OpenSBI starts and store the information in sbi_hart_features
> will be helpful to avoid the issues mentioned above.
>
> [1] https://github.com/kendryte/k230_sdk/blob/72be167ad4b3a7e91f7cc6abbe576d347b885af4/src/little/uboot/arch/riscv/cpu/k230/cpu.c#L82
>
> Co-developed-by: Vivian Wang <dramforever@live.com>
> Co-developed-by: Wende Tan <twd2.me@gmail.com>
> Signed-off-by: Vivian Wang <dramforever@live.com>
> Signed-off-by: Wende Tan <twd2.me@gmail.com>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  include/sbi/sbi_hart.h |  2 ++
>  lib/sbi/sbi_hart.c     | 51 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 811e5f5..8df655c 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -71,6 +71,7 @@ struct sbi_hart_features {
>         bool detected;
>         int priv_version;
>         unsigned long extensions[BITS_TO_LONGS(SBI_HART_EXT_MAX)];
> +       unsigned int pmp_reserved;
>         unsigned int pmp_count;
>         unsigned int pmp_addr_bits;
>         unsigned long pmp_gran;
> @@ -92,6 +93,7 @@ static inline ulong sbi_hart_expected_trap_addr(void)
>  unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
>  void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
>                               const char *prefix, const char *suffix);
> +unsigned int sbi_hart_pmp_reserved(struct sbi_scratch *scratch);
>  unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
>  unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch);
>  unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index eaa69ad..f18a6bc 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -259,6 +259,14 @@ unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch)
>         return hfeatures->mhpm_mask;
>  }
>
> +unsigned int sbi_hart_pmp_reserved(struct sbi_scratch *scratch)
> +{
> +       struct sbi_hart_features *hfeatures =
> +                       sbi_scratch_offset_ptr(scratch, hart_features_offset);
> +
> +       return hfeatures->pmp_reserved;
> +}
> +
>  unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
>  {
>         struct sbi_hart_features *hfeatures =
> @@ -741,6 +749,41 @@ void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
>                 sbi_strncpy(extensions_str, "none", nestr);
>  }
>
> +static unsigned long hart_pmp_probe_reserved(unsigned int nr_pmps)
> +{
> +       unsigned long pmpcfg;
> +       int n, pmpcfg_csr_idx = -1;
> +       int pmpcfg_csr, pmpcfg_shift;
> +       int pmpcfg_locked = 0;
> +
> +       /* Find the maximum index after the locked pmp. */
> +
> +       for (n = 0; n < nr_pmps; n++) {
> +               /* calculate PMP register and offset */
> +#if __riscv_xlen == 32
> +               pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
> +               pmpcfg_shift = (n & 3) << 3;
> +#elif __riscv_xlen == 64
> +               pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
> +               pmpcfg_shift = (n & 7) << 3;
> +#else
> +# error "Unexpected __riscv_xlen"
> +#endif
> +
> +               /* Load a pmpcfg from CSR */
> +               if (pmpcfg_csr != pmpcfg_csr_idx) {
> +                       pmpcfg = csr_read_num(pmpcfg_csr);
> +               }
> +
> +               /* Check pmpcfg[n] Lock Status */
> +               if ( (pmpcfg >> pmpcfg_shift) & PMP_L) {
> +                       pmpcfg_locked = MAX(pmpcfg_locked, n + 1);
> +               }
> +       }
> +
> +       return pmpcfg_locked;

This will only work when Smepmp is not available so this
function should simply return 0 when Smepmp is available.

> +}
> +
>  static unsigned long hart_pmp_get_allowed_addr(void)
>  {
>         unsigned long val = 0;
> @@ -871,6 +914,14 @@ static int hart_detect_features(struct sbi_scratch *scratch)
>         /* Detect number of PMP regions. At least PMPADDR0 should be implemented*/
>         __check_csr_64(CSR_PMPADDR0, true, 0, pmp_count, __pmp_count_probed);
>  __pmp_count_probed:
> +
> +       /**
> +        * Find the maximum index of the PMP entry that is locked before OpenSBI
> +        * starts and reserve the entries that index less than or equal to the
> +        * locked entry.
> +        */
> +       hfeatures->pmp_reserved = hart_pmp_probe_reserved(hfeatures->pmp_count);
> +
>         /**
>          * Detect the allowed address bits & granularity. At least PMPADDR0
>          * should be implemented.
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

