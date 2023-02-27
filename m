From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 19:52:23 +0530
Subject: [PATCH v2 03/11] lib: sbi_hsm: Ensure errors are consistent with spec
In-Reply-To: <20230227103106.137995-4-ajones@ventanamicro.com>
References: <20230227103106.137995-1-ajones@ventanamicro.com> <20230227103106.137995-4-ajones@ventanamicro.com>
Message-ID: <CAAhSdy2iOzJi+fwe7_yA8J+d_vw0u42PwRYEf3mYWmbx0zZTtA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 27, 2023 at 4:01 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> HSM functions define when SBI_ERR_INVALID_PARAM should be returned.
> Ensure it's not used for reasons that don't meet the definitions by
> using the catch-all code, SBI_ERR_FAILED, for those reasons instead.
> Also, in one case sbi_hart_suspend() may have returned SBI_ERR_DENIED,
> which isn't defined for that function at all. Use SBI_ERR_FAILED for
> that case too.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_hsm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 7ee4159256be..3455520b8a94 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -402,7 +402,7 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
>
>         /* Sanity check on domain assigned to current HART */
>         if (!dom)
> -               return SBI_EINVAL;
> +               return SBI_EFAIL;
>
>         /* Sanity check on suspend type */
>         if (SBI_HSM_SUSPEND_RET_DEFAULT < suspend_type &&
> @@ -415,7 +415,7 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
>         /* Additional sanity check for non-retentive suspend */
>         if (suspend_type & SBI_HSM_SUSP_NON_RET_BIT) {
>                 if (rmode != PRV_S && rmode != PRV_U)
> -                       return SBI_EINVAL;
> +                       return SBI_EFAIL;
>                 if (dom && !sbi_domain_check_addr(dom, raddr, rmode,
>                                                   SBI_DOMAIN_EXECUTE))
>                         return SBI_EINVALID_ADDR;
> @@ -429,7 +429,7 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
>         /* Directly move from STARTED to SUSPENDED state */
>         if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_STARTED,
>                                          SBI_HSM_STATE_SUSPENDED))
> -               return SBI_EDENIED;
> +               return SBI_EFAIL;
>
>         /* Save the suspend type */
>         hdata->suspend_type = suspend_type;
> --
> 2.39.1
>

