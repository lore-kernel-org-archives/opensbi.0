From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 28 Apr 2023 09:35:45 +0530
Subject: [PATCH] lib: sbi: Ensure SBI extension is available
In-Reply-To: <20230426172753.70664-1-ajones@ventanamicro.com>
References: <20230426172753.70664-1-ajones@ventanamicro.com>
Message-ID: <CAK9=C2XgR1d1QRQdLZhDjSMsp=WBs=18zoN2q3xUdNQNhe+qkg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 26, 2023 at 10:58?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Ensure attempts to invoke SBI extension functions fail with
> SBI_ERR_NOT_SUPPORTED when the extension's probe function has
> reported that the extension is not available. By adding a new
> status member to the extension which has three states
> (uninitialized, available, unavailable), we ensure that the
> probe function is only invoked once, lazily, upon first use.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  include/sbi/sbi_ecall.h |  6 ++++++
>  lib/sbi/sbi_ecall.c     | 18 ++++++++++++++----
>  2 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
> index ff9bf8e2b435..8e31d0d91620 100644
> --- a/include/sbi/sbi_ecall.h
> +++ b/include/sbi/sbi_ecall.h
> @@ -20,10 +20,16 @@
>  struct sbi_trap_regs;
>  struct sbi_trap_info;
>
> +enum sbi_ext_status {
> +       SBI_EXT_AVAILABLE = 1,
> +       SBI_EXT_UNAVAILABLE,
> +};
> +
>  struct sbi_ecall_extension {
>         struct sbi_dlist head;
>         unsigned long extid_start;
>         unsigned long extid_end;
> +       enum sbi_ext_status status;
>         int (* probe)(unsigned long extid, unsigned long *out_val);
>         int (* handle)(unsigned long extid, unsigned long funcid,
>                        const struct sbi_trap_regs *regs,
> diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> index 76a1ae9ab733..20ff06f32dad 100644
> --- a/lib/sbi/sbi_ecall.c
> +++ b/lib/sbi/sbi_ecall.c
> @@ -42,16 +42,26 @@ static SBI_LIST_HEAD(ecall_exts_list);
>
>  struct sbi_ecall_extension *sbi_ecall_find_extension(unsigned long extid)
>  {
> -       struct sbi_ecall_extension *t, *ret = NULL;
> +       struct sbi_ecall_extension *t;
> +       unsigned long out_val;
>
>         sbi_list_for_each_entry(t, &ecall_exts_list, head) {
>                 if (t->extid_start <= extid && extid <= t->extid_end) {
> -                       ret = t;
> -                       break;
> +                       if (t->status == SBI_EXT_AVAILABLE)
> +                               return t;
> +                       if (t->status == SBI_EXT_UNAVAILABLE)
> +                               return NULL;
> +                       if (t->probe && (t->probe(extid, &out_val) || !out_val)) {
> +                               t->status = SBI_EXT_UNAVAILABLE;

Setting this `status` flag is a bit racey because two HARTs can end-up
in sbi_ecall_find_extension() at the same time.

I suggest an alternate approach whereby we don't need the `status`
flag and sbi_ecall_find_extension() also does not need to change:

1) Rename `probe()` callback to `init()` callback
2) Remove sbi_ecall_register_extension() call from sbi_ecall_init()
    and instead call `init()` for each extension
3) Implement `init()` for each extension such that each extension
    explicitly register itself using sbi_ecall_register_extension()
    only if the extension is actually available.

In other words, the alternate approach treats SBI extensions are
driver instances which need to be registered by some init() call.

Regards,
Anup

> +                               return NULL;
> +                       }
> +
> +                       t->status = SBI_EXT_AVAILABLE;
> +                       return t;
>                 }
>         }
>
> -       return ret;
> +       return NULL;
>  }
>
>  int sbi_ecall_register_extension(struct sbi_ecall_extension *ext)
> --
> 2.39.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

