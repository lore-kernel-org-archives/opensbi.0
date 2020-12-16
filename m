From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 16 Dec 2020 04:44:01 +0000
Subject: [PATCH 3/4] lib: utils: Remove fdt_domain_get() function
In-Reply-To: <CAOnJCUJxUdG+FJr7pV1y=yhtdmLYh2FAi0P4QDoSqwEE3FQv2w@mail.gmail.com>
References: <20201214044431.76677-1-anup.patel@wdc.com>
 <20201214044431.76677-4-anup.patel@wdc.com>
 <CAOnJCUJxUdG+FJr7pV1y=yhtdmLYh2FAi0P4QDoSqwEE3FQv2w@mail.gmail.com>
Message-ID: <DM6PR04MB6201FF0D67D383D9B852759A8DC50@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 16 December 2020 08:01
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH 3/4] lib: utils: Remove fdt_domain_get() function
> 
> On Sun, Dec 13, 2020 at 8:45 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The fdt_domain_get() function is now redundant because the
> > fdt_domains_populate() function can explicitly register new domains
> > using the sbi_domain_register() function.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi_utils/fdt/fdt_domain.h | 11 ----
> >  lib/utils/fdt/fdt_domain.c         | 83 +++++++++++++-----------------
> >  platform/generic/platform.c        |  1 -
> >  3 files changed, 36 insertions(+), 59 deletions(-)
> >
> > diff --git a/include/sbi_utils/fdt/fdt_domain.h
> > b/include/sbi_utils/fdt/fdt_domain.h
> > index 68daacc..5448eb4 100644
> > --- a/include/sbi_utils/fdt/fdt_domain.h
> > +++ b/include/sbi_utils/fdt/fdt_domain.h
> > @@ -58,17 +58,6 @@ int fdt_iterate_each_memregion(void *fdt, int
> domain_offset, void *opaque,
> >   */
> >  void fdt_domain_fixup(void *fdt);
> >
> > -/**
> > - * Get domain instance for given HART
> > - *
> > - * Note: Domains should be populated before using this function.
> > - *
> > - * @param hartid the HART for which domain instance is needed
> > - *
> > - * @return pointer to domain instance on success and NULL on failure
> > - */
> > -struct sbi_domain *fdt_domain_get(u32 hartid);
> > -
> >  /**
> >   * Populate domains from device tree
> >   *
> > diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> > index 0352af5..09615e5 100644
> > --- a/lib/utils/fdt/fdt_domain.c
> > +++ b/lib/utils/fdt/fdt_domain.c
> > @@ -215,8 +215,6 @@ skip_device_disable:
> >         fdt_nop_node(fdt, poffset);
> >  }
> >
> > -static struct sbi_domain
> > *fdt_hartid_to_domain[SBI_HARTMASK_MAX_BITS];
> > -
> >  #define FDT_DOMAIN_MAX_COUNT           8
> >  #define FDT_DOMAIN_REGION_MAX_COUNT    16
> >
> > @@ -226,13 +224,6 @@ static struct sbi_hartmask
> > fdt_masks[FDT_DOMAIN_MAX_COUNT];  static struct
> sbi_domain_memregion
> >
> fdt_regions[FDT_DOMAIN_MAX_COUNT][FDT_DOMAIN_REGION_MAX_CO
> UNT
> > + 2];
> >
> > -struct sbi_domain *fdt_domain_get(u32 hartid) -{
> > -       if (SBI_HARTMASK_MAX_BITS <= hartid)
> > -               return NULL;
> > -       return fdt_hartid_to_domain[hartid];
> > -}
> > -
> >  static int __fdt_parse_region(void *fdt, int domain_offset,
> >                               int region_offset, u32 region_access,
> >                               void *opaque) @@ -283,9 +274,10 @@
> > static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
> >         const u32 *val;
> >         struct sbi_domain *dom;
> >         struct sbi_hartmask *mask;
> > -       int i, err, len, cpu_offset;
> > +       struct sbi_hartmask assign_mask;
> >         int *cold_domain_offset = opaque;
> >         struct sbi_domain_memregion *regions;
> > +       int i, err, len, cpus_offset, cpu_offset, doffset;
> >
> >         /* Sanity check on maximum domains we can handle */
> >         if (FDT_DOMAIN_MAX_COUNT <= fdt_domains_count) @@ -388,18
> > +380,46 @@ static int __fdt_parse_domain(void *fdt, int domain_offset,
> void *opaque)
> >         else
> >                 dom->system_reset_allowed = FALSE;
> >
> > +       /* Find /cpus DT node */
> > +       cpus_offset = fdt_path_offset(fdt, "/cpus");
> > +       if (cpus_offset < 0)
> > +               return cpus_offset;
> > +
> > +       /* HART to domain assignment mask based on CPU DT nodes */
> > +       sbi_hartmask_clear_all(&assign_mask);
> > +       fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
> > +               err = fdt_parse_hart_id(fdt, cpu_offset, &val32);
> > +               if (err)
> > +                       continue;
> > +
> > +               if (SBI_HARTMASK_MAX_BITS <= val32)
> > +                       continue;
> > +
> > +               val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
> > +               if (!val || len < 4)
> > +                       return SBI_EINVAL;
> > +
> > +               doffset = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
> > +               if (doffset < 0)
> > +                       return doffset;
> > +
> > +               if (doffset == domain_offset)
> > +                       sbi_hartmask_set_hart(val32, &assign_mask);
> > +       }
> > +
> >         /* Increment domains count */
> >         fdt_domains_count++;
> >
> > -       return 0;
> > +       /* Register the domain */
> > +       return sbi_domain_register(dom, &assign_mask);
> >  }
> >
> >  int fdt_domains_populate(void *fdt)
> >  {
> >         const u32 *val;
> > -       int rc, cold_domain_offset;
> > -       u32 i, hartid, cold_hartid;
> > -       int err, len, cpus_offset, cpu_offset, domain_offset;
> > +       int cold_domain_offset;
> > +       u32 hartid, cold_hartid;
> > +       int err, len, cpus_offset, cpu_offset;
> >
> >         /* Sanity checks */
> >         if (!fdt)
> > @@ -430,37 +450,6 @@ int fdt_domains_populate(void *fdt)
> >         }
> >
> >         /* Iterate over each domain in FDT and populate details */
> > -       rc = fdt_iterate_each_domain(fdt, &cold_domain_offset,
> > -                                    __fdt_parse_domain);
> > -       if (rc)
> > -               return rc;
> > -
> > -       /* HART to domain assignment based on CPU DT nodes*/
> > -       fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
> > -               err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
> > -               if (err)
> > -                       continue;
> > -
> > -               if (SBI_HARTMASK_MAX_BITS <= hartid)
> > -                       continue;
> > -
> > -               val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
> > -               if (!val || len < 4)
> > -                       continue;
> > -
> > -               domain_offset = fdt_node_offset_by_phandle(fdt,
> > -                                                          fdt32_to_cpu(*val));
> > -               if (domain_offset < 0)
> > -                       continue;
> > -
> > -               for (i = 0; i < fdt_domains_count; i++) {
> > -                       if (!sbi_strcmp(fdt_domains[i].name,
> > -                               fdt_get_name(fdt, domain_offset, NULL))) {
> > -                               fdt_hartid_to_domain[hartid] = &fdt_domains[i];
> > -                               break;
> > -                       }
> > -               }
> > -       }
> > -
> > -       return 0;
> > +       return fdt_iterate_each_domain(fdt, &cold_domain_offset,
> > +                                      __fdt_parse_domain);
> >  }
> > diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> > index 6c93a51..8c1e06f 100644
> > --- a/platform/generic/platform.c
> > +++ b/platform/generic/platform.c
> > @@ -210,7 +210,6 @@ const struct sbi_platform_operations platform_ops
> = {
> >         .early_exit             = generic_early_exit,
> >         .final_exit             = generic_final_exit,
> >         .domains_init           = generic_domains_init,
> > -       .domain_get             = fdt_domain_get,
> >         .console_putc           = fdt_serial_putc,
> >         .console_getc           = fdt_serial_getc,
> >         .console_init           = fdt_serial_init,
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup
