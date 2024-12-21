From: Anup Patel <anup@brainfault.org>
Date: Sat, 21 Dec 2024 18:32:40 +0530
Subject: [PATCH v2 2/2] lib: utils: Mark RPMI drivers as experimental
In-Reply-To: <20241219050250.3861915-2-samuel.holland@sifive.com>
References: <20241219050250.3861915-1-samuel.holland@sifive.com> <20241219050250.3861915-2-samuel.holland@sifive.com>
Message-ID: <CAAhSdy3ae5S_zft+k3d9QCHywdpK9HY3EO0pj14d9eJHemVzvQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 19, 2024 at 10:32?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> These drivers were merged on an experimental basis without the RPMI
> specification being frozen. As a result, they may not be compatible with
> the frozen version of the RPMI protocol. Additionally, their devicetree
> bindings have not been reviewed and are subject to change. Warn the user
> that these drivers make no compatibility guarantees, and that their
> behavior and devicetree bindings may change incompatibly in future
> versions of OpenSBI.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
> Changes in v2:
>  - Shorten the warning message
>
>  include/sbi_utils/fdt/fdt_driver.h         | 1 +
>  lib/utils/cppc/fdt_cppc_rpmi.c             | 1 +
>  lib/utils/fdt/fdt_driver.c                 | 4 ++++
>  lib/utils/hsm/fdt_hsm_rpmi.c               | 1 +
>  lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 1 +
>  lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c        | 1 +
>  lib/utils/reset/fdt_reset_rpmi.c           | 1 +
>  lib/utils/suspend/fdt_suspend_rpmi.c       | 1 +
>  8 files changed, 11 insertions(+)
>
> diff --git a/include/sbi_utils/fdt/fdt_driver.h b/include/sbi_utils/fdt/fdt_driver.h
> index f6fd26f9..12ffe3f9 100644
> --- a/include/sbi_utils/fdt/fdt_driver.h
> +++ b/include/sbi_utils/fdt/fdt_driver.h
> @@ -15,6 +15,7 @@ struct fdt_driver {
>         const struct fdt_match *match_table;
>         int (*init)(const void *fdt, int nodeoff,
>                     const struct fdt_match *match);
> +       bool experimental;
>  };
>
>  /**
> diff --git a/lib/utils/cppc/fdt_cppc_rpmi.c b/lib/utils/cppc/fdt_cppc_rpmi.c
> index b6789901..3b7006ce 100644
> --- a/lib/utils/cppc/fdt_cppc_rpmi.c
> +++ b/lib/utils/cppc/fdt_cppc_rpmi.c
> @@ -377,4 +377,5 @@ static const struct fdt_match rpmi_cppc_match[] = {
>  struct fdt_driver fdt_cppc_rpmi = {
>         .match_table = rpmi_cppc_match,
>         .init = rpmi_cppc_cold_init,
> +       .experimental = true,
>  };
> diff --git a/lib/utils/fdt/fdt_driver.c b/lib/utils/fdt/fdt_driver.c
> index 586ea8aa..f6707c0e 100644
> --- a/lib/utils/fdt/fdt_driver.c
> +++ b/lib/utils/fdt/fdt_driver.c
> @@ -30,6 +30,10 @@ int fdt_driver_init_by_offset(const void *fdt, int nodeoff,
>                         if (!fdt_stringlist_contains(prop, len, match->compatible))
>                                 continue;
>
> +                       if (driver->experimental)
> +                               sbi_printf("WARNING: %s driver is experimental and may change\n",
> +                                          match->compatible);
> +
>                         rc = driver->init(fdt, nodeoff, match);
>                         if (rc < 0) {
>                                 const char *name;
> diff --git a/lib/utils/hsm/fdt_hsm_rpmi.c b/lib/utils/hsm/fdt_hsm_rpmi.c
> index 975d3484..66fa0fe2 100644
> --- a/lib/utils/hsm/fdt_hsm_rpmi.c
> +++ b/lib/utils/hsm/fdt_hsm_rpmi.c
> @@ -359,4 +359,5 @@ static const struct fdt_match rpmi_hsm_match[] = {
>  struct fdt_driver fdt_hsm_rpmi = {
>         .match_table = rpmi_hsm_match,
>         .init = rpmi_hsm_cold_init,
> +       .experimental = true,
>  };
> diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
> index 91db4e96..b8bd3cd6 100644
> --- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
> +++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
> @@ -768,6 +768,7 @@ struct fdt_mailbox fdt_mailbox_rpmi_shmem = {
>         .driver = {
>                 .match_table = rpmi_shmem_mbox_match,
>                 .init = rpmi_shmem_mbox_init,
> +               .experimental = true,
>         },
>         .xlate = fdt_mailbox_simple_xlate,
>  };
> diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> index c09a4c52..78020eae 100644
> --- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> +++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
> @@ -439,4 +439,5 @@ static const struct fdt_match mpxy_mbox_match[] = {
>  struct fdt_driver fdt_mpxy_rpmi_mbox = {
>         .match_table = mpxy_mbox_match,
>         .init = mpxy_mbox_init,
> +       .experimental = true,
>  };
> diff --git a/lib/utils/reset/fdt_reset_rpmi.c b/lib/utils/reset/fdt_reset_rpmi.c
> index 1ec4396b..70826b96 100644
> --- a/lib/utils/reset/fdt_reset_rpmi.c
> +++ b/lib/utils/reset/fdt_reset_rpmi.c
> @@ -138,4 +138,5 @@ static const struct fdt_match rpmi_reset_match[] = {
>  struct fdt_driver fdt_reset_rpmi = {
>         .match_table = rpmi_reset_match,
>         .init = rpmi_reset_init,
> +       .experimental = true,
>  };
> diff --git a/lib/utils/suspend/fdt_suspend_rpmi.c b/lib/utils/suspend/fdt_suspend_rpmi.c
> index 11696648..07ff5198 100644
> --- a/lib/utils/suspend/fdt_suspend_rpmi.c
> +++ b/lib/utils/suspend/fdt_suspend_rpmi.c
> @@ -135,4 +135,5 @@ static const struct fdt_match rpmi_suspend_match[] = {
>  struct fdt_driver fdt_suspend_rpmi = {
>         .match_table = rpmi_suspend_match,
>         .init = rpmi_suspend_init,
> +       .experimental = true,
>  };
> --
> 2.45.1
>

