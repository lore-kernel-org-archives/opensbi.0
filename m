From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Dec 2023 14:09:30 +0530
Subject: [PATCH 6/7] lib: sbi: Not use smepmp if has pmp reserved and MSECCFG.MML=1
In-Reply-To: <tencent_C0BE4FC10C6D3847295C8418A91096465E07@qq.com>
References: <tencent_A2668222DA598E42B87A318A214D8DBD7C08@qq.com> <tencent_C0BE4FC10C6D3847295C8418A91096465E07@qq.com>
Message-ID: <CAAhSdy0jmM4QW1q4c=9eePiVmMgH3mV4Na=FO2QCY+Tk47BkRw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 8, 2023 at 3:34?AM Yangyu Chen <cyy@cyyself.name> wrote:
>
> If the platform already sets any locked PMPs before OpenSBI starts,
> CSR.MSECCFG.MML should never change by OpenSBI to make the locked PMPs
> behave as expected.

NACK.

For platforms with Smepmp, OpenSBI configures M-mode only regions
before setting mseccfg.MML.

In other words, it is mandatory for platforms with Smepmp to boot
OpenSBI with mseccfg.RLB = 1 and mseccfg.MML = 0.

Regards,
Anup

>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  lib/sbi/sbi_hart.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index f836b1c..fe24e82 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -559,7 +559,8 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>         pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
>         pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
>
> -       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
> +       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP) &&
> +               (csr_read(CSR_MSECCFG) & MSECCFG_MML || !sbi_hart_pmp_reserved(scratch)))
>                 rc = sbi_hart_smepmp_configure(scratch, pmp_count,
>                                                 pmp_gran_log2, pmp_addr_max);
>         else
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

