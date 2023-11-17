From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 13:10:57 +0530
Subject: [RFC 3/3] lib: sbi: enable seed access in S-mode
In-Reply-To: <20231028224959.95465-4-heinrich.schuchardt@canonical.com>
References: <20231028224959.95465-1-heinrich.schuchardt@canonical.com> <20231028224959.95465-4-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy2CO3JUUYM-W1kT+QLPbzGb9UAg1RfhrCOuvfEvJh2pvw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 29, 2023 at 4:20?AM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> If ISA extension Zkr is available, set
>
>     mseccfg.sseed=1
>     mseccfg.useed=0
>
> This enables access to the seed CSR in S-mode but not in U-mode.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  lib/sbi/sbi_hart.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 569596f..5a3e8ee 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -530,6 +530,15 @@ int sbi_hart_unmap_saddr(void)
>         return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
>  }
>
> +static void sbi_hart_zkr_configure(struct sbi_scratch *scratch)
> +{
> +       unsigned long mseccfg_val = csr_read(CSR_MSECCFG);
> +
> +       mseccfg_val |= MSECCFG_SSEED;
> +       mseccfg_val &= ~MSECCFG_USEED;
> +       csr_set(CSR_MSECCFG, mseccfg_val);
> +}
> +
>  int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>  {
>         int rc;
> @@ -551,6 +560,9 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>                 rc = sbi_hart_oldpmp_configure(scratch, pmp_count,
>                                                 pmp_gran_log2, pmp_addr_max);
>
> +       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_ZKR))
> +               sbi_hart_zkr_configure(scratch);
> +

This needs to be done from the mstatus_init() function since it is not
related to PMP. I have taken care of this at the time of merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

>         /*
>          * As per section 3.7.2 of privileged specification v1.12,
>          * virtual address translations can be speculatively performed
> --
> 2.40.1
>

Regards,
Anup

