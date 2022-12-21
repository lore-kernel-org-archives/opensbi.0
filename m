From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Dec 2022 17:30:00 +0800
Subject: [PATCH v3 3/6] lib: sbi: Add sbi_domain_check_addr_range() function
In-Reply-To: <20221124132906.257732-4-apatel@ventanamicro.com>
References: <20221124132906.257732-1-apatel@ventanamicro.com> <20221124132906.257732-4-apatel@ventanamicro.com>
Message-ID: <CAEUhbmUdpvHRgjMyGLu0Gu1wT+gSqLB2SK1_3XSa6UQi7j1tDw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 24, 2022 at 9:32 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We add sbi_domain_check_addr_range() helper function to check
> whether a given address range is accessible under a particular
> domain.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_domain.h | 15 +++++++++
>  lib/sbi/sbi_domain.c     | 69 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
>
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index 5553d21..4afcc37 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -154,6 +154,21 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
>                            unsigned long addr, unsigned long mode,
>                            unsigned long access_flags);
>
> +/**
> + * Check whether we can access specified address range for given mode and
> + * memory region flags under a domain
> + * @param dom pointer to domain
> + * @param addr the start of the address range to be checked
> + * @param size the size of the address range to be checked
> + * @param mode the privilege mode of access
> + * @param access_flags bitmask of domain access types (enum sbi_domain_access)
> + * @return TRUE if access allowed otherwise FALSE
> + */
> +bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
> +                                unsigned long addr, unsigned long size,
> +                                unsigned long mode,
> +                                unsigned long access_flags);
> +
>  /** Dump domain details on the console */
>  void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix);
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index f24a8e5..11a547c 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -195,6 +195,44 @@ static bool is_region_before(const struct sbi_domain_memregion *regA,
>         return FALSE;
>  }
>
> +static const struct sbi_domain_memregion *find_region(
> +                                               const struct sbi_domain *dom,
> +                                               unsigned long addr)
> +{
> +       unsigned long rstart, rend;
> +       struct sbi_domain_memregion *reg;
> +
> +       sbi_domain_for_each_memregion(dom, reg) {
> +               rstart = reg->base;
> +               rend = (reg->order < __riscv_xlen) ?
> +                       rstart + ((1UL << reg->order) - 1) : -1UL;
> +               if (rstart <= addr && addr <= rend)

addr < rend?

> +                       return reg;
> +       }
> +
> +       return NULL;
> +}
> +
> +static const struct sbi_domain_memregion *find_next_subset_region(
> +                               const struct sbi_domain *dom,
> +                               const struct sbi_domain_memregion *reg,
> +                               unsigned long addr)
> +{
> +       struct sbi_domain_memregion *sreg, *ret = NULL;
> +
> +       sbi_domain_for_each_memregion(dom, sreg) {
> +               if (sreg == reg || (sreg->base <= addr) ||
> +                   !is_region_subset(sreg, reg))
> +                       continue;
> +
> +               if (!ret || (sreg->base < ret->base) ||
> +                   ((sreg->base == ret->base) && (sreg->order < ret->order)))
> +                       ret = sreg;
> +       }
> +
> +       return ret;
> +}
> +
>  static int sanitize_domain(const struct sbi_platform *plat,
>                            struct sbi_domain *dom)
>  {
> @@ -303,6 +341,37 @@ static int sanitize_domain(const struct sbi_platform *plat,
>         return 0;
>  }
>
> +bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
> +                                unsigned long addr, unsigned long size,
> +                                unsigned long mode,
> +                                unsigned long access_flags)
> +{
> +       unsigned long max = addr + size;
> +       const struct sbi_domain_memregion *reg, *sreg;
> +
> +       if (!dom)
> +               return FALSE;
> +
> +       while (addr < max) {
> +               reg = find_region(dom, addr);
> +               if (!reg)
> +                       return FALSE;
> +
> +               if (!sbi_domain_check_addr(dom, addr, mode, access_flags))
> +                       return FALSE;
> +
> +               sreg = find_next_subset_region(dom, reg, addr);
> +               if (sreg)
> +                       addr = sreg->base;
> +               else if (reg->order < __riscv_xlen)
> +                       addr = reg->base + (1UL << reg->order);
> +               else
> +                       break;
> +       }
> +
> +       return TRUE;
> +}
> +
>  void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
>  {
>         u32 i, k;

Regards,
Bin

