From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 19 Oct 2020 16:14:33 -0700
Subject: [PATCH v3 08/16] lib: sbi: Extend sbi_hsm_hart_start() for domains
In-Reply-To: <20201019125453.2460105-9-anup.patel@wdc.com>
References: <20201019125453.2460105-1-anup.patel@wdc.com>
 <20201019125453.2460105-9-anup.patel@wdc.com>
Message-ID: <CAOnJCUKxC4woAh9oTaHZOHVyawiatr4nAZnBOxJOrb12Zfsz0g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2020 at 5:55 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The sbi_hsm_hart_start() should consider the domain under which we
> are trying to start the HART. This will help ensure that HART A can
> start HART B only if both HARTs A and B belong to the same domain.
>
> We also have a special case when we bring-up boot HART of non-root
> domains in sbi_domain_finalize() where we should skip domain checks
> in sbi_hsm_hart_start(). To achieve this, sbi_hsm_hart_start() should
> do domain checks only when domain parameter is non-NULL.
>
> This patch extends sbi_hsm_hart_start() as-per above.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi/sbi_hsm.h   |  5 +++--
>  lib/sbi/sbi_domain.c    |  6 ++++--
>  lib/sbi/sbi_ecall_hsm.c |  4 ++--
>  lib/sbi/sbi_hsm.c       | 16 ++++++++--------
>  4 files changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
> index 296b267..4823383 100644
> --- a/include/sbi/sbi_hsm.h
> +++ b/include/sbi/sbi_hsm.h
> @@ -25,8 +25,9 @@ struct sbi_scratch;
>  int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot);
>  void __noreturn sbi_hsm_exit(struct sbi_scratch *scratch);
>
> -int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
> -                      ulong saddr, ulong smode, ulong priv);
> +int sbi_hsm_hart_start(struct sbi_scratch *scratch,
> +                      const struct sbi_domain *dom,
> +                      u32 hartid, ulong saddr, ulong smode, ulong priv);
>  int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow);
>  int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid);
>  int sbi_hsm_hart_state_to_status(int state);
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index ed0053f..2b6fa79 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -324,8 +324,10 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
>                         scratch->next_mode = dom->next_mode;
>                         scratch->next_arg1 = dom->next_arg1;
>                 } else {
> -                       rc = sbi_hsm_hart_start(scratch, dhart, dom->next_addr,
> -                                       dom->next_mode, dom->next_arg1);
> +                       rc = sbi_hsm_hart_start(scratch, NULL, dhart,
> +                                               dom->next_addr,
> +                                               dom->next_mode,
> +                                               dom->next_arg1);
>                         if (rc)
>                                 return rc;
>                 }
> diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
> index 3698a41..376740c 100644
> --- a/lib/sbi/sbi_ecall_hsm.c
> +++ b/lib/sbi/sbi_ecall_hsm.c
> @@ -28,8 +28,8 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
>         case SBI_EXT_HSM_HART_START:
>                 smode = csr_read(CSR_MSTATUS);
>                 smode = (smode & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
> -               ret = sbi_hsm_hart_start(scratch, args[0], args[1],
> -                                        smode, args[2]);
> +               ret = sbi_hsm_hart_start(scratch, sbi_domain_thishart_ptr(),
> +                                        args[0], args[1], smode, args[2]);
>                 break;
>         case SBI_EXT_HSM_HART_STOP:
>                 ret = sbi_hsm_hart_stop(scratch, TRUE);
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 65e7f3d..8ecf90f 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -205,10 +205,10 @@ fail_exit:
>         sbi_hart_hang();
>  }
>
> -int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
> -                      ulong saddr, ulong smode, ulong priv)
> +int sbi_hsm_hart_start(struct sbi_scratch *scratch,
> +                      const struct sbi_domain *dom,
> +                      u32 hartid, ulong saddr, ulong smode, ulong priv)
>  {
> -       int rc;
>         unsigned long init_count;
>         unsigned int hstate;
>         struct sbi_scratch *rscratch;
> @@ -217,6 +217,11 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
>
>         if (smode != PRV_M && smode != PRV_S && smode != PRV_U)
>                 return SBI_EINVAL;

We don't support M-mode as the next mode yet. Thus, this check can be
updated to reflect that.

> +       if (dom && !sbi_domain_is_assigned_hart(dom, hartid))
> +               return SBI_EINVAL;
> +       if (dom && !sbi_domain_check_addr(dom, saddr, smode,
> +                                         SBI_DOMAIN_EXECUTE))
> +               return SBI_EINVAL;
>
>         rscratch = sbi_hartid_to_scratch(hartid);
>         if (!rscratch)
> @@ -234,11 +239,6 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
>         if (hstate != SBI_HART_STOPPED)
>                 return SBI_EINVAL;
>
> -       rc = sbi_hart_pmp_check_addr(scratch, saddr, smode, PMP_X);
> -       if (rc)
> -               return rc;
> -       //TODO: We also need to check saddr for valid physical address as well.
> -
>         init_count = sbi_init_count(hartid);
>         rscratch->next_arg1 = priv;
>         rscratch->next_addr = saddr;
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Apart from that,

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

