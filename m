From: Anup Patel <anup@brainfault.org>
Date: Sun, 9 Jul 2023 21:01:23 +0530
Subject: [PATCH v2 6/8] lib: sbi: Add support for Smepmp
In-Reply-To: <20230706104928.3391947-7-hchauhan@ventanamicro.com>
References: <20230620143212.2701598-1-hchauhan@ventanamicro.com>
 <20230706104928.3391947-1-hchauhan@ventanamicro.com> <20230706104928.3391947-7-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy2huP1Abayuq6VtKz1+5GLMjJ5SV3d1Jjo-Q+Viezb_cg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 6, 2023 at 4:19?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> - If Smepmp is enabled, the access flags of an entry are determined based on
>   truth table defined in Smepmp.
> - First PMP entry (index 0) is reserved.
> - Existing boot PMP entries start from index 1.
> - Since enabling Smepmp revokes the access privileges of the M-mode software
>   on S/U-mode region, first PMP entry is used to map/unmap the shared memory
>   between M and S/U-mode. This allows a temporary access window for the M-mode
>   software to read/write to S/U-mode memory region.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  include/sbi/sbi_hart.h |  15 +++++
>  lib/sbi/sbi_domain.c   |  14 +++--
>  lib/sbi/sbi_hart.c     | 132 +++++++++++++++++++++++++++++++++++------
>  lib/sbi/sbi_init.c     |  22 ++++---
>  4 files changed, 151 insertions(+), 32 deletions(-)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 9957565..fb5bb59 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -43,6 +43,21 @@ enum sbi_hart_extensions {
>         SBI_HART_EXT_MAX,
>  };
>
> +/*
> + * Smepmp enforces access boundaries between M-mode and
> + * S/U-mode. When it is enabled, the PMPs are programmed
> + * such that M-mode doesn't have access to S/U-mode memory.
> + *
> + * To give M-mode R/W access to the shared memory between M and
> + * S/U-mode, first entry is reserved. It is disabled at boot.
> + * When shared memory access is required, the physical address
> + * should be programmed into the first PMP entry with R/W
> + * permissions to the M-mode. Once the work is done, it should be
> + * unmapped. sbi_hart_map_saddr/sbi_hart_unmap_saddr function
> + * pair should be used to map/unmap the shared memory.
> + */
> +#define SBI_SMEPMP_RESV_ENTRY          0
> +
>  struct sbi_hart_features {
>         bool detected;
>         int priv_version;
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 38a5902..acd0f74 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -772,11 +772,17 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>
>         root.fw_region_inited = true;
>
> -       /* Root domain allow everything memory region */
> +       /*
> +        * Allow SU RWX on rest of the memory region. Since pmp entries
> +        * have implicit priority on index, previous entries will
> +        * deny access to SU on M-mode region. Also, M-mode will not
> +        * have access to SU region while previous entries will allow
> +        * access to M-mode regions.
> +        */
>         sbi_domain_memregion_init(0, ~0UL,
> -                                 (SBI_DOMAIN_MEMREGION_READABLE |
> -                                  SBI_DOMAIN_MEMREGION_WRITEABLE |
> -                                  SBI_DOMAIN_MEMREGION_EXECUTABLE),
> +                                 (SBI_DOMAIN_MEMREGION_SU_READABLE |
> +                                  SBI_DOMAIN_MEMREGION_SU_WRITABLE |
> +                                  SBI_DOMAIN_MEMREGION_SU_EXECUTABLE),

This change in sbi_domain.c needs to be a separate patch since
it is more of a preparatory change for Smepmp support.

>                                   &root_memregs[root_memregs_count++]);
>
>         /* Root domain memory region end */
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 7b9d5dc..5d91718 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -284,11 +284,75 @@ unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch)
>         return hfeatures->mhpm_bits;
>  }
>
> +/*
> + * Returns Smepmp flags for a given domain and region based on permissions.
> + */
> +unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
> +                                      struct sbi_domain *dom,
> +                                      struct sbi_domain_memregion *reg)
> +{
> +       unsigned int pmp_flags = 0;
> +
> +       if (SBI_DOMAIN_MEMREGION_IS_SHARED(reg->flags)) {
> +               /* Read only for both M and SU modes */
> +               if (SBI_DOMAIN_MEMREGION_IS_SUR_MR(reg->flags))
> +                       pmp_flags = (PMP_R | PMP_W | PMP_X);
> +
> +               /* Execute for SU but Read/Execute for M mode */
> +               else if (SBI_DOMAIN_MEMREGION_IS_SUX_MRX(reg->flags))
> +                       /* locked region */
> +                       pmp_flags = (PMP_L | PMP_W | PMP_X);
> +
> +               /* Execute only for both M and SU modes */
> +               else if (SBI_DOMAIN_MEMREGION_IS_SUX_MX(reg->flags))
> +                       pmp_flags = (PMP_L | PMP_W);
> +
> +               /* Read/Write for both M and SU modes */
> +               else if (SBI_DOMAIN_MEMREGION_IS_SURW_MRW(reg->flags))
> +                       pmp_flags = (PMP_W | PMP_X);
> +
> +               /* Read only for SU mode but Read/Write for M mode */
> +               else if (SBI_DOMAIN_MEMREGION_IS_SUR_MRW(reg->flags))
> +                       pmp_flags = (PMP_W);
> +       } else if (SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
> +               /*
> +                * When smepmp is supported and used, M region cannot have RWX
> +                * permissions on any region.
> +                */
> +               if ((reg->flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK)
> +                   == SBI_DOMAIN_MEMREGION_M_RWX) {
> +                       sbi_printf("%s: M-mode only regions cannot have"
> +                                  "RWX permissions\n", __func__);
> +                       return 0;
> +               }
> +
> +               /* M-mode only access regions are always locked */
> +               pmp_flags |= PMP_L;
> +
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_M_READABLE)
> +                       pmp_flags |= PMP_R;
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_M_WRITABLE)
> +                       pmp_flags |= PMP_W;
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
> +                       pmp_flags |= PMP_X;
> +       } else if (SBI_DOMAIN_MEMREGION_SU_ONLY_ACCESS(reg->flags)) {
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
> +                       pmp_flags |= PMP_R;
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
> +                       pmp_flags |= PMP_W;
> +               if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
> +                       pmp_flags |= PMP_X;
> +       }
> +
> +       return pmp_flags;
> +}
> +
>  int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>  {
>         struct sbi_domain_memregion *reg;
>         struct sbi_domain *dom = sbi_domain_thishart_ptr();
> -       unsigned int pmp_idx = 0, pmp_flags, pmp_bits, pmp_gran_log2;
> +       unsigned int pmp_idx = 0;
> +       unsigned int pmp_flags, pmp_bits, pmp_gran_log2;
>         unsigned int pmp_count = sbi_hart_pmp_count(scratch);
>         unsigned long pmp_addr = 0, pmp_addr_max = 0;
>
> @@ -299,36 +363,66 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>         pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
>         pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
>
> +       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
> +               /* Reserve first entry for dynamic shared mappings */
> +                pmp_idx = SBI_SMEPMP_RESV_ENTRY + 1;
> +
> +               /*
> +                * Set the RLB now so that, we can write to entries
> +                * even if some entries are locked.
> +                */
> +               csr_write(CSR_MSECCFG, MSECCFG_RLB);
> +
> +               /* Disable the reserved entry */
> +               pmp_disable(SBI_SMEPMP_RESV_ENTRY);
> +       }
> +
>         sbi_domain_for_each_memregion(dom, reg) {
>                 if (pmp_count <= pmp_idx)
>                         break;
>
>                 pmp_flags = 0;
>
> -               /*
> -                * If permissions are to be enforced for all modes on this
> -                * region, the lock bit should be set.
> -                */
> -               if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
> -                       pmp_flags |= PMP_L;
> -
> -               if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
> -                       pmp_flags |= PMP_R;
> -               if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
> -                       pmp_flags |= PMP_W;
> -               if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
> -                       pmp_flags |= PMP_X;
> +               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
> +                       pmp_flags = sbi_hart_get_smepmp_flags(scratch, dom, reg);
> +
> +                       if (pmp_flags == 0)
> +                               return 0;
> +               } else {
> +                       /*
> +                        * If permissions are to be enforced for all modes on
> +                        * this region, the lock bit should be set.
> +                        */
> +                       if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
> +                               pmp_flags |= PMP_L;
> +
> +                       if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
> +                               pmp_flags |= PMP_R;
> +                       if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
> +                               pmp_flags |= PMP_W;
> +                       if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
> +                               pmp_flags |= PMP_X;
> +               }
>
>                 pmp_addr =  reg->base >> PMP_SHIFT;
> -               if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max)
> +               if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max) {
>                         pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
> -               else {
> -                       sbi_printf("Can not configure pmp for domain %s", dom->name);
> -                       sbi_printf(" because memory region address %lx or size %lx is not in range\n",
> -                                   reg->base, reg->order);
> +               } else {
> +                       sbi_printf("Can not configure pmp for domain %s because"
> +                                  " memory region address 0x%lx or size 0x%lx "
> +                                  "is not in range.\n", dom->name, reg->base,
> +                                  reg->order);
>                 }
>         }
>
> +       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
> +               /*
> +                * All entries are programmed. Enable MML bit.
> +                * Keep the RLB bit so that dynamic mappings can be done.
> +                */
> +               csr_write(CSR_MSECCFG, (MSECCFG_RLB | MSECCFG_MML));
> +       }
> +
>         /*
>          * As per section 3.7.2 of privileged specification v1.12,
>          * virtual address translations can be speculatively performed
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 423e6d8..5e1f439 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -356,13 +356,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>                 sbi_hart_hang();
>         }
>
> -       rc = sbi_hart_pmp_configure(scratch);
> -       if (rc) {
> -               sbi_printf("%s: PMP configure failed (error %d)\n",
> -                          __func__, rc);
> -               sbi_hart_hang();
> -       }
> -
>         /*
>          * Note: Platform final initialization should be after finalizing
>          * domains so that it sees correct domain assignment and PMP
> @@ -392,6 +385,17 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>
>         sbi_boot_print_hart(scratch, hartid);
>
> +       /*
> +        * Configure PMP at last because if SMEPMP is detected,
> +        * M-mode access to the S/U space will be rescinded.
> +        */
> +       rc = sbi_hart_pmp_configure(scratch);
> +       if (rc) {
> +               sbi_printf("%s: PMP configure failed (error %d)\n",
> +                          __func__, rc);
> +               sbi_hart_hang();
> +       }
> +

We need this change in init_warm_startup() as well.

I would also suggest to create a separate patch for this change in
order of sbi_hart_pmp_configure() since it is more of preparatory
patch for Smepmp support.


>         wake_coldboot_harts(scratch, hartid);
>
>         count = sbi_scratch_offset_ptr(scratch, init_count_offset);
> @@ -445,11 +449,11 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
>         if (rc)
>                 sbi_hart_hang();
>
> -       rc = sbi_hart_pmp_configure(scratch);
> +       rc = sbi_platform_final_init(plat, false);
>         if (rc)
>                 sbi_hart_hang();
>
> -       rc = sbi_platform_final_init(plat, false);
> +       rc = sbi_hart_pmp_configure(scratch);
>         if (rc)
>                 sbi_hart_hang();
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

