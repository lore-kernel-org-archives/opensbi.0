From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 19:53:27 +0530
Subject: [PATCH v2 06/11] lib: sbi_hsm: Export some functions
In-Reply-To: <20230227103106.137995-7-ajones@ventanamicro.com>
References: <20230227103106.137995-1-ajones@ventanamicro.com> <20230227103106.137995-7-ajones@ventanamicro.com>
Message-ID: <CAAhSdy3=ACBCPK64Mn5qb-MUaf_zAoU0RWzmkXtcy24+i3Xwgg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 27, 2023 at 4:01 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> A coming patch can make use of a few internal hsm functions if
> we export them.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_hsm.h |  4 ++++
>  lib/sbi/sbi_hsm.c     | 12 ++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
> index 1170127baa87..c0b483030de8 100644
> --- a/include/sbi/sbi_hsm.h
> +++ b/include/sbi/sbi_hsm.h
> @@ -69,9 +69,13 @@ void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch);
>  void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch);
>  int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
>                          ulong raddr, ulong rmode, ulong arg1);
> +bool sbi_hsm_hart_change_state(struct sbi_scratch *scratch, long oldstate,
> +                              long newstate);
> +int __sbi_hsm_hart_get_state(u32 hartid);
>  int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid);
>  int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
>                                     ulong hbase, ulong *out_hmask);
> +void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch);
>  void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid);
>
>  #endif
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 294156a9a7bd..3eeeb586cbb8 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -46,7 +46,15 @@ struct sbi_hsm_data {
>         unsigned long saved_mip;
>  };
>
> -static inline int __sbi_hsm_hart_get_state(u32 hartid)
> +bool sbi_hsm_hart_change_state(struct sbi_scratch *scratch, long oldstate,
> +                              long newstate)
> +{
> +       struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
> +                                                           hart_data_offset);
> +       return __sbi_hsm_hart_change_state(hdata, oldstate, newstate);
> +}
> +
> +int __sbi_hsm_hart_get_state(u32 hartid)
>  {
>         struct sbi_hsm_data *hdata;
>         struct sbi_scratch *scratch;
> @@ -328,7 +336,7 @@ static int __sbi_hsm_suspend_default(struct sbi_scratch *scratch)
>         return 0;
>  }
>
> -static void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
> +void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
>  {
>         struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
>                                                             hart_data_offset);
> --
> 2.39.1
>

