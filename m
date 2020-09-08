From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 7 Sep 2020 22:49:01 -0700
Subject: [PATCH 2/3] include: Rename ECALL defines to match latest RISC-V
 spec
In-Reply-To: <20200904121341.156416-3-anup.patel@wdc.com>
References: <20200904121341.156416-1-anup.patel@wdc.com>
 <20200904121341.156416-3-anup.patel@wdc.com>
Message-ID: <CAOnJCULAULbP4H3jwP4HQ06xYwcPd49ps_nHmfBz-_+khSCa-A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 4, 2020 at 5:14 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We rename CAUSE_HYPERVISOR_ECALL to CAUSE_SUPERVISOR_ECALL and
> CAUSE_SUPERVISOR_ECALL to CAUSE_VIRTUAL_SUPERVISOR_ECALL so that
> it matches latest RISC-V privilege spec.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi/riscv_encoding.h | 4 ++--
>  lib/sbi/sbi_hart.c           | 2 +-
>  lib/sbi/sbi_trap.c           | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index ccd2c69..e1d0b46 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -539,8 +539,8 @@
>  #define CAUSE_MISALIGNED_STORE         0x6
>  #define CAUSE_STORE_ACCESS             0x7
>  #define CAUSE_USER_ECALL               0x8
> -#define CAUSE_HYPERVISOR_ECALL         0x9
> -#define CAUSE_SUPERVISOR_ECALL         0xa
> +#define CAUSE_SUPERVISOR_ECALL         0x9
> +#define CAUSE_VIRTUAL_SUPERVISOR_ECALL 0xa
>  #define CAUSE_MACHINE_ECALL            0xb
>  #define CAUSE_FETCH_PAGE_FAULT         0xc
>  #define CAUSE_LOAD_PAGE_FAULT          0xd
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 2211c3c..d788918 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -108,7 +108,7 @@ static int delegate_traps(struct sbi_scratch *scratch, u32 hartid)
>          * from VS-mode), Guest page faults and Virtual interrupts.
>          */
>         if (misa_extension('H')) {
> -               exceptions |= (1U << CAUSE_SUPERVISOR_ECALL);
> +               exceptions |= (1U << CAUSE_VIRTUAL_SUPERVISOR_ECALL);
>                 exceptions |= (1U << CAUSE_FETCH_GUEST_PAGE_FAULT);
>                 exceptions |= (1U << CAUSE_LOAD_GUEST_PAGE_FAULT);
>                 exceptions |= (1U << CAUSE_VIRTUAL_INST_FAULT);
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index 8fe6753..b8bb20c 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -251,7 +251,7 @@ void sbi_trap_handler(struct sbi_trap_regs *regs)
>                 rc  = sbi_misaligned_store_handler(mtval, mtval2, mtinst, regs);
>                 msg = "misaligned store handler failed";
>                 break;
> -       case CAUSE_HYPERVISOR_ECALL:
> +       case CAUSE_SUPERVISOR_ECALL:
>                 rc  = sbi_ecall_handler(regs);
>                 msg = "ecall handler failed";
>                 break;
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

