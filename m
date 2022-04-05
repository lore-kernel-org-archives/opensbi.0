From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Apr 2022 09:02:29 +0530
Subject: [RFC PATCH v1 3/3] lib: sbi: configure mstateen
In-Reply-To: <20220321051528.20143-4-mchitale@ventanamicro.com>
References: <20220321051528.20143-1-mchitale@ventanamicro.com>
 <20220321051528.20143-4-mchitale@ventanamicro.com>
Message-ID: <CAAhSdy3sZ1c3sEGokmrrtMNu_tPSdp7g9YTbUw+STmOJ3DgHJw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 21, 2022 at 10:46 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> When mstateen registers are implemented, the AIA related
> configurations need to be done in mstateen for the IMSIC
> initialization to succeed.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  lib/sbi/sbi_hart.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 9d0c435..f5c44e1 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -80,6 +80,15 @@ static void mstatus_init(struct sbi_scratch *scratch)
>                         mstateen_val |= (1UL << SMSTATEEN0_HSENVCFG);
>                 else
>                         mstateen_val &= ~(1UL << SMSTATEEN0_HSENVCFG);
> +
> +               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_AIA))
> +                       mstateen_val |= (1UL << SMSTATEEN0_AIA |
> +                                       1UL << SMSTATEEN0_SVSLCT |
> +                                       1UL << SMSTATEEN0_IMSIC);
> +               else
> +                       mstateen_val &= ~(1UL << SMSTATEEN0_AIA |
> +                                       1UL << SMSTATEEN0_SVSLCT |
> +                                       1UL << SMSTATEEN0_IMSIC);

This breaks compilation for RV32 because some the bits are
at position > 31

Regards,
Anup

>                 csr_write(CSR_MSTATEEN0, mstateen_val);
>         }
>
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

