From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Apr 2022 08:42:25 +0530
Subject: [PATCH v3 3/3] lib: irqchip/imsic: configure mstateen
In-Reply-To: <20220406165741.663-4-mchitale@ventanamicro.com>
References: <20220406165741.663-1-mchitale@ventanamicro.com>
 <20220406165741.663-4-mchitale@ventanamicro.com>
Message-ID: <CAAhSdy0CT4CALmJaL-zZ3PRzw26ZpBzePdP4_0R=bymtMAhitQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 6, 2022 at 10:28 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> When mstateen registers are implemented, the AIA related
> configurations need to be done in mstateen for the IMSIC
> initialization to succeed.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_hart.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index b0edf38..7b602c3 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -98,6 +98,12 @@ static void mstatus_init(struct sbi_scratch *scratch)
>                         mstateen_val |= SMSTATEEN0_HSENVCFG;
>                 else
>                         mstateen_val &= ~SMSTATEEN0_HSENVCFG;
> +               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_AIA))
> +                       mstateen_val |= (SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT |
> +                                       SMSTATEEN0_IMSIC);
> +               else
> +                       mstateen_val &= ~(SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT |
> +                                       SMSTATEEN0_IMSIC);
>                 csr_write(CSR_MSTATEEN0, mstateen_val);
>  #if __riscv_xlen == 32
>                 csr_write(CSR_MSTATEEN0H, mstateen_val >> 32);
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

