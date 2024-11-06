From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Nov 2024 11:27:30 +0530
Subject: [PATCH 1/2] lib: sbi_timer: Call driver warm_init from SBI core
In-Reply-To: <20240903040814.622145-2-samuel.holland@sifive.com>
References: <20240903040814.622145-1-samuel.holland@sifive.com> <20240903040814.622145-2-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1dpkV9rvqcQSo5jn4NbEiOTKX+34C3+gTFai7rR=+8Wg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 3, 2024 at 9:38?AM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> Currently, the platform's timer device is tracked in two places: the
> core SBI implementation has `timer_dev`, and the FDT timer layer has
> `current_driver`. The latter is used for warm initialization of the
> timer device. However, this warm init is not specific to FDT-based
> platforms; other platforms call exactly the same functions from the
> same point in the boot sequence.
>
> The code is simplified and made common across platforms by treating warm
> init and exit as properties of the driver, not the platform. Then the
> platform's only role is to select and prepare a driver during cold boot.
>
> For now, only add a .warm_init hook, since none of the existing drivers
> need an .exit hook. It could be added in the future if needed.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  include/sbi/sbi_timer.h                 |  3 +++
>  include/sbi_utils/timer/aclint_mtimer.h |  2 --
>  include/sbi_utils/timer/andes_plmt.h    |  1 -
>  lib/sbi/sbi_timer.c                     | 13 ++++++++++++-
>  lib/utils/timer/aclint_mtimer.c         |  3 ++-
>  lib/utils/timer/andes_plmt.c            | 23 ++++++++++++-----------
>  lib/utils/timer/fdt_timer_mtimer.c      |  2 +-
>  lib/utils/timer/fdt_timer_plmt.c        |  2 +-
>  platform/fpga/ariane/platform.c         |  2 +-
>  platform/fpga/openpiton/platform.c      |  2 +-
>  platform/kendryte/k210/platform.c       |  2 +-
>  platform/nuclei/ux600/platform.c        |  2 +-
>  platform/template/platform.c            |  2 +-
>  13 files changed, 36 insertions(+), 23 deletions(-)
>
> diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
> index ac48e2b8..64df9dfa 100644
> --- a/include/sbi/sbi_timer.h
> +++ b/include/sbi/sbi_timer.h
> @@ -28,6 +28,9 @@ struct sbi_timer_device {
>
>         /** Stop timer event for current HART */
>         void (*timer_event_stop)(void);
> +
> +       /** Initialize timer device for current HART */
> +       int (*warm_init)(void);
>  };
>
>  struct sbi_scratch;
> diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
> index 6ab8799c..a245e13e 100644
> --- a/include/sbi_utils/timer/aclint_mtimer.h
> +++ b/include/sbi_utils/timer/aclint_mtimer.h
> @@ -47,8 +47,6 @@ void aclint_mtimer_sync(struct aclint_mtimer_data *mt);
>  void aclint_mtimer_set_reference(struct aclint_mtimer_data *mt,
>                                  struct aclint_mtimer_data *ref);
>
> -int aclint_mtimer_warm_init(void);
> -
>  int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
>                             struct aclint_mtimer_data *reference);
>
> diff --git a/include/sbi_utils/timer/andes_plmt.h b/include/sbi_utils/timer/andes_plmt.h
> index 08bce332..119f1b44 100644
> --- a/include/sbi_utils/timer/andes_plmt.h
> +++ b/include/sbi_utils/timer/andes_plmt.h
> @@ -24,6 +24,5 @@ struct plmt_data {
>  };
>
>  int plmt_cold_timer_init(struct plmt_data *plmt);
> -int plmt_warm_timer_init(void);
>
>  #endif /* __TIMER_ANDES_PLMT_H__ */
> diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> index 7b618de1..466e81e5 100644
> --- a/lib/sbi/sbi_timer.c
> +++ b/lib/sbi/sbi_timer.c
> @@ -182,6 +182,7 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
>  {
>         u64 *time_delta;
>         const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> +       int ret;
>
>         if (cold_boot) {
>                 time_delta_off = sbi_scratch_alloc_offset(sizeof(*time_delta));
> @@ -198,7 +199,17 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
>         time_delta = sbi_scratch_offset_ptr(scratch, time_delta_off);
>         *time_delta = 0;
>
> -       return sbi_platform_timer_init(plat, cold_boot);
> +       ret = sbi_platform_timer_init(plat, cold_boot);
> +       if (ret)
> +               return ret;
> +
> +       if (timer_dev && timer_dev->warm_init) {
> +               ret = timer_dev->warm_init();
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
>  }
>
>  void sbi_timer_exit(struct sbi_scratch *scratch)
> diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
> index 9acb26eb..3db3c3be 100644
> --- a/lib/utils/timer/aclint_mtimer.c
> +++ b/lib/utils/timer/aclint_mtimer.c
> @@ -143,7 +143,7 @@ void aclint_mtimer_set_reference(struct aclint_mtimer_data *mt,
>         mt->time_delta_computed = 0;
>  }
>
> -int aclint_mtimer_warm_init(void)
> +static int aclint_mtimer_warm_init(void)
>  {
>         u64 *mt_time_cmp;
>         u32 target_hart = current_hartid();
> @@ -260,6 +260,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
>         }
>
>         mtimer.timer_freq = mt->mtime_freq;
> +       mtimer.warm_init = aclint_mtimer_warm_init;
>         sbi_timer_set_device(&mtimer);
>
>         return 0;
> diff --git a/lib/utils/timer/andes_plmt.c b/lib/utils/timer/andes_plmt.c
> index 6e4bfafe..d034feb9 100644
> --- a/lib/utils/timer/andes_plmt.c
> +++ b/lib/utils/timer/andes_plmt.c
> @@ -67,12 +67,23 @@ static void plmt_timer_event_start(u64 next_event)
>  #endif
>  }
>
> +static int plmt_warm_timer_init(void)
> +{
> +       if (!plmt.time_val)
> +               return SBI_ENODEV;
> +
> +       plmt_timer_event_stop();
> +
> +       return 0;
> +}
> +
>  static struct sbi_timer_device plmt_timer = {
>         .name              = "andes_plmt",
>         .timer_freq        = DEFAULT_AE350_PLMT_FREQ,
>         .timer_value       = plmt_timer_value,
>         .timer_event_start = plmt_timer_event_start,
> -       .timer_event_stop  = plmt_timer_event_stop
> +       .timer_event_stop  = plmt_timer_event_stop,
> +       .warm_init         = plmt_warm_timer_init,
>  };
>
>  int plmt_cold_timer_init(struct plmt_data *plmt)
> @@ -95,13 +106,3 @@ int plmt_cold_timer_init(struct plmt_data *plmt)
>
>         return 0;
>  }
> -
> -int plmt_warm_timer_init(void)
> -{
> -       if (!plmt.time_val)
> -               return SBI_ENODEV;
> -
> -       plmt_timer_event_stop();
> -
> -       return 0;
> -}
> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> index 458e8881..eff50417 100644
> --- a/lib/utils/timer/fdt_timer_mtimer.c
> +++ b/lib/utils/timer/fdt_timer_mtimer.c
> @@ -165,6 +165,6 @@ static const struct fdt_match timer_mtimer_match[] = {
>  struct fdt_timer fdt_timer_mtimer = {
>         .match_table = timer_mtimer_match,
>         .cold_init = timer_mtimer_cold_init,
> -       .warm_init = aclint_mtimer_warm_init,
> +       .warm_init = NULL,
>         .exit = NULL,
>  };
> diff --git a/lib/utils/timer/fdt_timer_plmt.c b/lib/utils/timer/fdt_timer_plmt.c
> index 88a42e2a..87e634bd 100644
> --- a/lib/utils/timer/fdt_timer_plmt.c
> +++ b/lib/utils/timer/fdt_timer_plmt.c
> @@ -46,6 +46,6 @@ static const struct fdt_match timer_plmt_match[] = {
>  struct fdt_timer fdt_timer_plmt = {
>         .match_table = timer_plmt_match,
>         .cold_init   = fdt_plmt_cold_timer_init,
> -       .warm_init   = plmt_warm_timer_init,
> +       .warm_init   = NULL,
>         .exit        = NULL,
>  };
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index ec0584ab..c895cb47 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -159,7 +159,7 @@ static int ariane_timer_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return aclint_mtimer_warm_init();
> +       return 0;
>  }
>
>  /*
> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> index 81cc48f4..ea0a4799 100644
> --- a/platform/fpga/openpiton/platform.c
> +++ b/platform/fpga/openpiton/platform.c
> @@ -190,7 +190,7 @@ static int openpiton_timer_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return aclint_mtimer_warm_init();
> +       return 0;
>  }
>
>  /*
> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> index 2f3f7079..82dd0809 100644
> --- a/platform/kendryte/k210/platform.c
> +++ b/platform/kendryte/k210/platform.c
> @@ -169,7 +169,7 @@ static int k210_timer_init(bool cold_boot)
>                         return rc;
>         }
>
> -       return aclint_mtimer_warm_init();
> +       return 0;
>  }
>
>  const struct sbi_platform_operations platform_ops = {
> diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> index 5610e7c7..b17c1df2 100644
> --- a/platform/nuclei/ux600/platform.c
> +++ b/platform/nuclei/ux600/platform.c
> @@ -225,7 +225,7 @@ static int ux600_timer_init(bool cold_boot)
>                         return rc;
>         }
>
> -       return aclint_mtimer_warm_init();
> +       return 0;
>  }
>
>  const struct sbi_platform_operations platform_ops = {
> diff --git a/platform/template/platform.c b/platform/template/platform.c
> index b4d30a57..1238a8d6 100644
> --- a/platform/template/platform.c
> +++ b/platform/template/platform.c
> @@ -129,7 +129,7 @@ static int platform_timer_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return aclint_mtimer_warm_init();
> +       return 0;
>  }
>
>  /*
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

