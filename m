From: Anup Patel <anup@brainfault.org>
Date: Tue, 17 Jan 2023 09:10:28 +0530
Subject: [RFC PATCH 06/11] lib: sbi_hsm: Export some functions
In-Reply-To: <20230106112209.441825-7-ajones@ventanamicro.com>
References: <20230106112209.441825-1-ajones@ventanamicro.com> <20230106112209.441825-7-ajones@ventanamicro.com>
Message-ID: <CAAhSdy0LQWzJyX9YcZmTQKLW1KpLwkhbRwXiSOr09DTnLfaQVw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 6, 2023 at 4:52 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> A coming patch can make use of a few internal hsm functions if
> we export them.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/sbi_hsm.h |  4 ++++
>  lib/sbi/sbi_hsm.c     | 12 ++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
> index d6cc468d0528..00adfe1a4ef1 100644
> --- a/include/sbi/sbi_hsm.h
> +++ b/include/sbi/sbi_hsm.h
> @@ -65,9 +65,13 @@ void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch);
>  void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch);
>  int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
>                          ulong raddr, ulong rmode, ulong priv);
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
> index cce4b07bbb36..8eb9643e6e72 100644
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
> @@ -329,7 +337,7 @@ static int __sbi_hsm_suspend_default(struct sbi_scratch *scratch)
>         return 0;
>  }
>
> -static void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
> +void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
>  {
>         struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
>                                                             hart_data_offset);
> --
> 2.39.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

