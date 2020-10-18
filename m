From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 18 Oct 2020 16:42:03 -0700
Subject: [PATCH v2 13/16] lib: sbi: Remove redundant sbi_hart_pmp_xyz()
 functions
In-Reply-To: <20201015132700.2232820-14-anup.patel@wdc.com>
References: <20201015132700.2232820-1-anup.patel@wdc.com>
 <20201015132700.2232820-14-anup.patel@wdc.com>
Message-ID: <CAOnJCUKui-emdXe8hDu4uBPB91ZLbccm-1ogiYF7roRFu3UQaA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 15, 2020 at 6:28 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The sbi_hart_pmp_get() and sbi_hart_pmp_check_addr() functions
> are not used anymore hence this patch removes these functions.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi/sbi_hart.h |  6 ------
>  lib/sbi/sbi_hart.c     | 42 ------------------------------------------
>  2 files changed, 48 deletions(-)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 2efe44d..79d745a 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -38,13 +38,7 @@ static inline ulong sbi_hart_expected_trap_addr(void)
>  unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch);
>  void sbi_hart_delegation_dump(struct sbi_scratch *scratch);
>  unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
> -int sbi_hart_pmp_get(struct sbi_scratch *scratch, unsigned int n,
> -                    unsigned long *prot_out, unsigned long *addr_out,
> -                    unsigned long *size);
>  void sbi_hart_pmp_dump(struct sbi_scratch *scratch);
> -int  sbi_hart_pmp_check_addr(struct sbi_scratch *scratch,
> -                            unsigned long daddr, unsigned long mode,
> -                            unsigned long attr);
>  int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
>  bool sbi_hart_has_feature(struct sbi_scratch *scratch, unsigned long feature);
>  void sbi_hart_get_features_str(struct sbi_scratch *scratch,
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 88ffab0..ea5d479 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -153,24 +153,6 @@ unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
>         return hfeatures->pmp_count;
>  }
>
> -int sbi_hart_pmp_get(struct sbi_scratch *scratch, unsigned int n,
> -                    unsigned long *prot_out, unsigned long *addr_out,
> -                    unsigned long *size)
> -{
> -       int err;
> -       unsigned long log2size;
> -
> -       if (sbi_hart_pmp_count(scratch) <= n)
> -               return SBI_EINVAL;
> -
> -       err = pmp_get(n, prot_out, addr_out, &log2size);
> -       if (err)
> -               return err;
> -       *size = (log2size < __riscv_xlen) ? 1UL << log2size : 0;
> -
> -       return 0;
> -}
> -
>  void sbi_hart_pmp_dump(struct sbi_scratch *scratch)
>  {
>         unsigned long prot, addr, size, log2size;
> @@ -200,30 +182,6 @@ void sbi_hart_pmp_dump(struct sbi_scratch *scratch)
>         }
>  }
>
> -int sbi_hart_pmp_check_addr(struct sbi_scratch *scratch,
> -                           unsigned long addr, unsigned long mode,
> -                           unsigned long attr)
> -{
> -       unsigned long prot, size, log2size, tempaddr;
> -       unsigned int i, pmp_count;
> -
> -       pmp_count = sbi_hart_pmp_count(scratch);
> -       for (i = 0; i < pmp_count; i++) {
> -               pmp_get(i, &prot, &tempaddr, &log2size);
> -               if (!(prot & PMP_A))
> -                       continue;
> -               if (mode == PRV_M && !(prot & PMP_L))
> -                       continue;
> -               size = 1UL << log2size;
> -               if ((log2size >= __riscv_xlen) ||
> -                   ((tempaddr <= addr && addr <= tempaddr + size)))
> -                       if (!(prot & attr))
> -                               return SBI_EINVALID_ADDR;
> -       }
> -
> -       return SBI_OK;
> -}
> -
>  int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>  {
>         u32 pmp_idx = 0;
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

