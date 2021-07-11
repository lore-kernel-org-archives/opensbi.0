From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 Jul 2021 10:48:35 +0530
Subject: [PATCH v5 05/15] lib: sbi: Disable m/scounteren & enable
 mcountinhibit
In-Reply-To: <20210710161816.632364-6-atish.patra@wdc.com>
References: <20210710161816.632364-1-atish.patra@wdc.com>
 <20210710161816.632364-6-atish.patra@wdc.com>
Message-ID: <CAAhSdy3ACxwTtrab-Qci9+1+fjoPoJh_S=p13iU4sgj7RPaRng@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 10, 2021 at 9:48 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, all bits in mcountern are enabled unconditionally at
> boot time. With SBI PMU extension, all the programmable counters should enabled
> only during performance monitoring for a particular event. However,
> this is done only if mcountinhibit is implemented because the supervisor
> mode can not start/stop any event without mcountinhibit.
>
> Similarly, supervisor should take care enabling scounteren which allows
> U-mode to access programmable pmu counters. All the non-programmable ones
> (CY, TM, IR) should be enabled in M-mode because some userspace may rely on
> builtins such as __builtin_readcyclecounter. Supervisor OS can still disable
> them during initial configuration.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_hart.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index e8cd0421b5e6..6254452e11bb 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -51,12 +51,29 @@ static void mstatus_init(struct sbi_scratch *scratch)
>
>         csr_write(CSR_MSTATUS, mstatus_val);
>
> -       /* Enable user/supervisor use of perf counters */
> +       /* Disable user mode usage of all perf counters except default ones (CY, TM, IR) */
>         if (misa_extension('S') &&
>             sbi_hart_has_feature(scratch, SBI_HART_HAS_SCOUNTEREN))
> -               csr_write(CSR_SCOUNTEREN, -1);
> -       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTEREN))
> -               csr_write(CSR_MCOUNTEREN, -1);
> +               csr_write(CSR_SCOUNTEREN, 7);
> +
> +       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTEREN)) {
> +               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
> +                       /**
> +                        * Just enable the default counters (CY, TM, IR) because
> +                        * some OS (e.g FreeBSD) expect them to be enabled.
> +                        *
> +                        * All other counters will be enabled at runtime after
> +                        * S-mode request.
> +                        */
> +                       csr_write(CSR_MCOUNTEREN, 7);
> +               else
> +                       /* Supervisor mode usage are enabled by default */
> +                       csr_write(CSR_MCOUNTEREN, -1);
> +       }
> +
> +       /* All programmable counters will start running at runtime after S-mode request */
> +       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
> +               csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
>
>         /* Disable all interrupts */
>         csr_write(CSR_MIE, 0);
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

