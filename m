From: Anup Patel <anup@brainfault.org>
Date: Mon, 31 Jul 2023 14:03:19 +0530
Subject: [PATCH] lib: sbi: Update system suspend to spec
In-Reply-To: <20230720154836.110674-2-ajones@ventanamicro.com>
References: <20230720154836.110674-2-ajones@ventanamicro.com>
Message-ID: <CAAhSdy36x2D438rF2qd0ioh46nZ7CA_r4kMJe7SZi2veYxzJkQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 20, 2023 at 9:18?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> commit 68e66106120f ("SUSP: Add SBI_ERR_DENIED") of the SBI spec adds
> a new error code, SBI_ERR_DENIED, which is returned when entry criteria
> has not be meant. Update the system suspend implementation to return
> this error when it has detected that not all harts are in the STOPPED
> state.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


> ---
>  lib/sbi/sbi_system.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
> index d803ffa84189..2e917c9e9130 100644
> --- a/lib/sbi/sbi_system.c
> +++ b/lib/sbi/sbi_system.c
> @@ -174,7 +174,7 @@ int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
>                 if (i == hartid)
>                         continue;
>                 if (__sbi_hsm_hart_get_state(i) != SBI_HSM_STATE_STOPPED)
> -                       return SBI_EFAIL;
> +                       return SBI_ERR_DENIED;
>         }
>
>         if (!sbi_domain_check_addr(dom, resume_addr, prev_mode,
> --
> 2.41.0
>

