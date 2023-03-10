From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Mar 2023 14:22:56 +0530
Subject: [PATCH v3 1/3] lib: sbi: Refactor the calls to sbi_hart_switch_mode()
In-Reply-To: <20230305212247.494912-2-e.shatokhin@yadro.com>
References: <20230305212247.494912-1-e.shatokhin@yadro.com> <20230305212247.494912-2-e.shatokhin@yadro.com>
Message-ID: <CAAhSdy17NAEDjxQ+77wi5t+Bhn-yf6GsCaYB_4O7-o9-bSW7JA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 6, 2023 at 2:53?AM Evgenii Shatokhin <e.shatokhin@yadro.com> wrote:
>
> Move them into sbi_hsm_hart_start_finish() and sbi_hsm_hart_resume_finish()
> to make them easier to manage.
>
> This will be used by subsequent patches.
>
> Suggested-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Evgenii Shatokhin <e.shatokhin@yadro.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_hsm.h |  6 ++++--
>  lib/sbi/sbi_hsm.c     | 13 +++++++++++--
>  lib/sbi/sbi_init.c    | 20 ++++++++------------
>  3 files changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
> index c0b4830..4b5601b 100644
> --- a/include/sbi/sbi_hsm.h
> +++ b/include/sbi/sbi_hsm.h
> @@ -66,7 +66,8 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
>                        u32 hartid, ulong saddr, ulong smode, ulong arg1);
>  int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow);
>  void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch);
> -void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch);
> +void __noreturn sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch,
> +                                          u32 hartid);
>  int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
>                          ulong raddr, ulong rmode, ulong arg1);
>  bool sbi_hsm_hart_change_state(struct sbi_scratch *scratch, long oldstate,
> @@ -76,6 +77,7 @@ int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid);
>  int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
>                                     ulong hbase, ulong *out_hmask);
>  void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch);
> -void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid);
> +void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
> +                                         u32 hartid);
>
>  #endif
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 3eeeb58..100b8c0 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -110,7 +110,8 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
>         return 0;
>  }
>
> -void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid)
> +void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
> +                                         u32 hartid)
>  {
>         struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
>                                                             hart_data_offset);
> @@ -118,6 +119,9 @@ void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid)
>         if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_START_PENDING,
>                                          SBI_HSM_STATE_STARTED))
>                 sbi_hart_hang();
> +
> +       sbi_hart_switch_mode(hartid, scratch->next_arg1, scratch->next_addr,
> +                            scratch->next_mode, false);
>  }
>
>  static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
> @@ -381,7 +385,8 @@ void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch)
>         hsm_device_hart_resume();
>  }
>
> -void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch)
> +void __noreturn sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch,
> +                                          u32 hartid)
>  {
>         struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
>                                                             hart_data_offset);
> @@ -396,6 +401,10 @@ void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch)
>          * the warm-boot sequence.
>          */
>         __sbi_hsm_suspend_non_ret_restore(scratch);
> +
> +       sbi_hart_switch_mode(hartid, scratch->next_arg1,
> +                            scratch->next_addr,
> +                            scratch->next_mode, false);
>  }
>
>  int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index bc60a42..dcca2c8 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -355,12 +355,11 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>         init_count = sbi_scratch_offset_ptr(scratch, init_count_offset);
>         (*init_count)++;
>
> -       sbi_hsm_prepare_next_jump(scratch, hartid);
> -       sbi_hart_switch_mode(hartid, scratch->next_arg1, scratch->next_addr,
> -                            scratch->next_mode, false);
> +       sbi_hsm_hart_start_finish(scratch, hartid);
>  }
>
> -static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
> +static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
> +                                        u32 hartid)
>  {
>         int rc;
>         unsigned long *init_count;
> @@ -412,10 +411,11 @@ static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
>         init_count = sbi_scratch_offset_ptr(scratch, init_count_offset);
>         (*init_count)++;
>
> -       sbi_hsm_prepare_next_jump(scratch, hartid);
> +       sbi_hsm_hart_start_finish(scratch, hartid);
>  }
>
> -static void init_warm_resume(struct sbi_scratch *scratch)
> +static void __noreturn init_warm_resume(struct sbi_scratch *scratch,
> +                                       u32 hartid)
>  {
>         int rc;
>
> @@ -429,7 +429,7 @@ static void init_warm_resume(struct sbi_scratch *scratch)
>         if (rc)
>                 sbi_hart_hang();
>
> -       sbi_hsm_hart_resume_finish(scratch);
> +       sbi_hsm_hart_resume_finish(scratch, hartid);
>  }
>
>  static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
> @@ -443,13 +443,9 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
>                 sbi_hart_hang();
>
>         if (hstate == SBI_HSM_STATE_SUSPENDED)
> -               init_warm_resume(scratch);
> +               init_warm_resume(scratch, hartid);
>         else
>                 init_warm_startup(scratch, hartid);
> -
> -       sbi_hart_switch_mode(hartid, scratch->next_arg1,
> -                            scratch->next_addr,
> -                            scratch->next_mode, false);
>  }
>
>  static atomic_t coldboot_lottery = ATOMIC_INITIALIZER(0);
> --
> 2.34.1
>
>

