From: Anup Patel <anup@brainfault.org>
Date: Tue, 17 Jan 2023 09:17:50 +0530
Subject: [RFC PATCH 08/11] lib: sbi: Add system_suspend_allowed domain property
In-Reply-To: <20230106112209.441825-9-ajones@ventanamicro.com>
References: <20230106112209.441825-1-ajones@ventanamicro.com> <20230106112209.441825-9-ajones@ventanamicro.com>
Message-ID: <CAAhSdy35kKXm_9cx67FtPwH0b_sib61wm0CmyDYnFmqr-SXtUA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 6, 2023 at 4:52 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Only privileged domains should be allowed to suspend the entire
> system. Give the root domain this property by default and allow
> other domains to be given the property by specifying it in the
> DT.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  docs/domain_support.md     | 5 +++++
>  include/sbi/sbi_domain.h   | 2 ++
>  lib/sbi/sbi_domain.c       | 4 ++++
>  lib/utils/fdt/fdt_domain.c | 7 +++++++
>  4 files changed, 18 insertions(+)
>
> diff --git a/docs/domain_support.md b/docs/domain_support.md
> index 8963b57e3787..ac8c73d40b3e 100644
> --- a/docs/domain_support.md
> +++ b/docs/domain_support.md
> @@ -52,6 +52,7 @@ has following details:
>  * **next_mode** - Privilege mode of the next booting stage for this
>    domain. This can be either S-mode or U-mode.
>  * **system_reset_allowed** - Is domain allowed to reset the system?
> +* **system_suspend_allowed** - Is domain allowed to suspend the system?
>
>  The memory regions represented by **regions** in **struct sbi_domain** have
>  following additional constraints to align with RISC-V PMP requirements:
> @@ -91,6 +92,7 @@ following manner:
>  * **next_mode** - Next booting stage mode in coldboot HART scratch space
>    is the next mode for the ROOT domain
>  * **system_reset_allowed** - The ROOT domain is allowed to reset the system
> +* **system_suspend_allowed** - The ROOT domain is allowed to suspend the system
>
>  Domain Effects
>  --------------
> @@ -187,6 +189,8 @@ The DT properties of a domain instance DT node are as follows:
>    stage mode of coldboot HART** is used as default value.
>  * **system-reset-allowed** (Optional) - A boolean flag representing
>    whether the domain instance is allowed to do system reset.
> +* **system-suspend-allowed** (Optional) - A boolean flag representing
> +  whether the domain instance is allowed to do system suspend.
>
>  ### Assigning HART To Domain Instance
>
> @@ -252,6 +256,7 @@ be done:
>                  next-addr = <0x0 0x80100000>;
>                  next-mode = <0x0>;
>                  system-reset-allowed;
> +                system-suspend-allowed;
>              };
>
>              udomain: untrusted-domain {
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index f0d9289ec7cc..6f51b3f6324c 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -78,6 +78,8 @@ struct sbi_domain {
>         unsigned long next_mode;
>         /** Is domain allowed to reset the system */
>         bool system_reset_allowed;
> +       /** Is domain allowed to suspend the system */
> +       bool system_suspend_allowed;
>  };
>
>  /** The root domain instance */
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 19e2029e6c4c..38684cdc6527 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -34,6 +34,7 @@ struct sbi_domain root = {
>         .possible_harts = &root_hmask,
>         .regions = root_memregs,
>         .system_reset_allowed = true,
> +       .system_suspend_allowed = true,
>  };
>
>  bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
> @@ -374,6 +375,9 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
>
>         sbi_printf("Domain%d SysReset    %s: %s\n",
>                    dom->index, suffix, (dom->system_reset_allowed) ? "yes" : "no");
> +
> +       sbi_printf("Domain%d SysSuspend  %s: %s\n",
> +                  dom->index, suffix, (dom->system_suspend_allowed) ? "yes" : "no");
>  }
>
>  void sbi_domain_dump_all(const char *suffix)
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index 35462a2008aa..32be6a5ab7e4 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -405,6 +405,13 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
>         else
>                 dom->system_reset_allowed = false;
>
> +       /* Read "system-suspend-allowed" DT property */
> +       if (fdt_get_property(fdt, domain_offset,
> +                            "system-suspend-allowed", NULL))
> +               dom->system_suspend_allowed = true;
> +       else
> +               dom->system_suspend_allowed = false;
> +
>         /* Find /cpus DT node */
>         cpus_offset = fdt_path_offset(fdt, "/cpus");
>         if (cpus_offset < 0)
> --
> 2.39.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

