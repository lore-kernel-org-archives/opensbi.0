From: Anup Patel <anup@brainfault.org>
Date: Wed, 11 May 2022 09:26:00 +0530
Subject: [PATCH v2 2/3] lib: utils: check if CPU node is enabled
In-Reply-To: <CALXH3=KYXVan_L_u_JCbqTgVJYT5q9rkqTVF_z1ZVyVSz9UpaA@mail.gmail.com>
References: <CALXH3=KYXVan_L_u_JCbqTgVJYT5q9rkqTVF_z1ZVyVSz9UpaA@mail.gmail.com>
Message-ID: <CAAhSdy0-m-BxYA_xUuWc+hABHi4Dbn9GBpF0nP2tE8NuJkbmnw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 9, 2022 at 7:26 PM Jan Reme? <jan.remes@codasip.com> wrote:
>
> Ignore CPU nodes in FDT that are not enabled.
>
> Signed-off-by: Jan Remes <jan.remes@codasip.com>

We have MMIO devices (such as ACLINT, PLIC, IMSIC, APLIC, etc)
where the "interrupts-extended" DT property describes the layout
of per-HART MMIO addresses.

Explicitly disabling CPU DT nodes for platform only means that, the
platform has total M CPUs/HARTs but out of these only N CPUs/HARTs
are usable whereas remaining (M - N) CPUs/HARTs are fused (i.e. SoC
is a Variant/SKU of original SOC with M CPUs).

Now, some CPU DT nodes being disabled also means that certain
per-HART MMIO addresses are still there but not usable. If we skip
entries in "interrupts-extended" for disabled CPUs then it will result
in wrong computation of per-HART MMIO addresses.

I suggest we don't check fdt_node_is_enabled() for ACLINT, PLIC,
IMSIC, and APLIC.

Regards,
Anup

> ---
>  lib/utils/fdt/fdt_domain.c            | 14 +++++++++++++-
>  lib/utils/fdt/fdt_fixup.c             |  3 +++
>  lib/utils/fdt/fdt_helper.c            |  6 ++++++
>  lib/utils/irqchip/fdt_irqchip_imsic.c |  3 +++
>  lib/utils/irqchip/fdt_irqchip_plic.c  |  3 +++
>  5 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index 676c757..bd0eec3 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -165,6 +165,9 @@ void fdt_domain_fixup(void *fdt)
>          if (err)
>              continue;
>
> +        if (!fdt_node_is_enabled(fdt, doffset))
> +            continue;
> +
>          fdt_nop_property(fdt, doffset, "opensbi-domain");
>      }
>
> @@ -308,6 +311,9 @@ static int __fdt_parse_domain(void *fdt, int
> domain_offset, void *opaque)
>              if (err)
>                  return err;
>
> +            if (!fdt_node_is_enabled(fdt, cpu_offset))
> +                continue;
> +
>              sbi_hartmask_set_hart(val32, mask);
>          }
>      }
> @@ -347,7 +353,7 @@ static int __fdt_parse_domain(void *fdt, int
> domain_offset, void *opaque)
>      if (val && len >= 4) {
>          cpu_offset = fdt_node_offset_by_phandle(fdt,
>                               fdt32_to_cpu(*val));
> -        if (cpu_offset >= 0)
> +        if (cpu_offset >= 0 && fdt_node_is_enabled(fdt, cpu_offset))
>              fdt_parse_hart_id(fdt, cpu_offset, &val32);
>      } else {
>          if (domain_offset == *cold_domain_offset)
> @@ -414,6 +420,9 @@ static int __fdt_parse_domain(void *fdt, int
> domain_offset, void *opaque)
>          if (SBI_HARTMASK_MAX_BITS <= val32)
>              continue;
>
> +        if (!fdt_node_is_enabled(fdt, cpu_offset))
> +            continue;
> +
>          val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
>          if (!val || len < 4)
>              return SBI_EINVAL;
> @@ -460,6 +469,9 @@ int fdt_domains_populate(void *fdt)
>          if (hartid != cold_hartid)
>              continue;
>
> +        if (!fdt_node_is_enabled(fdt, cpu_offset))
> +            continue;
> +
>          val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
>          if (val && len >= 4)
>              cold_domain_offset = fdt_node_offset_by_phandle(fdt,
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index a80bd82..d1050bb 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -38,6 +38,9 @@ void fdt_cpu_fixup(void *fdt)
>          if (err)
>              continue;
>
> +        if (!fdt_node_is_enabled(fdt, cpu_offset))
> +            continue;
> +
>          /*
>           * Disable a HART DT node if one of the following is true:
>           * 1. The HART is not assigned to the current domain
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 3b45ae8..a2736af 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -283,6 +283,9 @@ int fdt_parse_max_hart_id(void *fdt, u32 *max_hartid)
>          if (err)
>              continue;
>
> +        if (!fdt_node_is_enabled(fdt, cpu_offset))
> +            continue;
> +
>          if (hartid > *max_hartid)
>              *max_hartid = hartid;
>      }
> @@ -864,6 +867,9 @@ int fdt_parse_aclint_node(void *fdt, int
> nodeoffset, bool for_timer,
>          if (rc)
>              continue;
>
> +        if (!fdt_node_is_enabled(fdt, cpu_offset))
> +            continue;
> +
>          if (SBI_HARTMASK_MAX_BITS <= hartid)
>              continue;
>
> diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c
> b/lib/utils/irqchip/fdt_irqchip_imsic.c
> index b6962be..bbd8b8d 100644
> --- a/lib/utils/irqchip/fdt_irqchip_imsic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
> @@ -51,6 +51,9 @@ static int irqchip_imsic_update_hartid_table(void
> *fdt, int nodeoff,
>          if (SBI_HARTMASK_MAX_BITS <= hartid)
>              return SBI_EINVAL;
>
> +        if (!fdt_node_is_enabled(fdt, cpu_offset))
> +            continue;
> +
>          switch (hwirq) {
>          case IRQ_M_EXT:
>              err = imsic_map_hartid_to_data(hartid, id, i / 2);
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c
> b/lib/utils/irqchip/fdt_irqchip_plic.c
> index b2d2a1b..94ddd08 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -64,6 +64,9 @@ static int irqchip_plic_update_hartid_table(void
> *fdt, int nodeoff,
>          if (SBI_HARTMASK_MAX_BITS <= hartid)
>              continue;
>
> +        if (!fdt_node_is_enabled(fdt, cpu_offset))
> +            continue;
> +
>          plic_hartid2data[hartid] = pd;
>          switch (hwirq) {
>          case IRQ_M_EXT:
> --
> 2.35.1
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

