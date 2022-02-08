From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 8 Feb 2022 01:03:36 -0800
Subject: [PATCH 07/13] lib: sbi: Enable mie.MEIE bit for IPIs based on
 external interrupts.
In-Reply-To: <20220104101323.127564-5-apatel@ventanamicro.com>
References: <20220104101323.127564-1-apatel@ventanamicro.com>
 <20220104101323.127564-5-apatel@ventanamicro.com>
Message-ID: <CAOnJCUKH4=rGNpvAw-1W6M6n+EpYd5N2M1aTmm7MRG7s5S0aVQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 4, 2022 at 2:13 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We can have IPIs based on external interrupts provided by devices
> such as AIA IMSIC so we should enable mie.MEIE bit at appropriate
> places in generic library.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/sbi/sbi_hsm.c  | 4 ++--
>  lib/sbi/sbi_init.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index ecd2e45..c4d2c6d 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -113,8 +113,8 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
>         /* Save MIE CSR */
>         saved_mie = csr_read(CSR_MIE);
>
> -       /* Set MSIE bit to receive IPI */
> -       csr_set(CSR_MIE, MIP_MSIP);
> +       /* Set MSIE and MEIE bits to receive IPI */
> +       csr_set(CSR_MIE, MIP_MSIP | MIP_MEIP);
>
>         /* Wait for hart_add call*/
>         while (atomic_read(&hdata->state) != SBI_HSM_STATE_START_PENDING) {
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 27d03a7..6876eb2 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -165,8 +165,8 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
>         /* Save MIE CSR */
>         saved_mie = csr_read(CSR_MIE);
>
> -       /* Set MSIE bit to receive IPI */
> -       csr_set(CSR_MIE, MIP_MSIP);
> +       /* Set MSIE and MEIE bits to receive IPI */
> +       csr_set(CSR_MIE, MIP_MSIP | MIP_MEIP);
>
>         /* Acquire coldboot lock */
>         spin_lock(&coldboot_lock);
> @@ -182,7 +182,7 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
>                 do {
>                         wfi();
>                         cmip = csr_read(CSR_MIP);
> -                } while (!(cmip & MIP_MSIP));
> +                } while (!(cmip & (MIP_MSIP | MIP_MEIP)));
>         };
>
>         /* Acquire coldboot lock */
> @@ -276,6 +276,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>                            __func__, rc);
>                 sbi_hart_hang();
>         }
> +       csr_set(CSR_MIE, MIP_MEIP);
>

This is only required for IPIs with IMSIC devices.
Why not do it inside sbi_ipi_init along with MIP_MSIP set ?

>         rc = sbi_ipi_init(scratch, TRUE);
>         if (rc) {
> @@ -376,6 +377,7 @@ static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
>         rc = sbi_platform_irqchip_init(plat, FALSE);
>         if (rc)
>                 sbi_hart_hang();
> +       csr_set(CSR_MIE, MIP_MEIP);
>
>         rc = sbi_ipi_init(scratch, FALSE);
>         if (rc)
> @@ -550,6 +552,7 @@ void __noreturn sbi_exit(struct sbi_scratch *scratch)
>
>         sbi_ipi_exit(scratch);
>
> +       csr_clear(CSR_MIE, MIP_MEIP);
>         sbi_platform_irqchip_exit(plat);
>
>         sbi_platform_final_exit(plat);
> --
> 2.25.1
>


-- 
Regards,
Atish

