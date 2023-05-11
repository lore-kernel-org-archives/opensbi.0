From: Anup Patel <anup@brainfault.org>
Date: Thu, 11 May 2023 13:21:00 +0530
Subject: [PATCH v3] lib: sbi: Ensure SBI extension is available
In-Reply-To: <20230501120839.334341-1-ajones@ventanamicro.com>
References: <20230501120839.334341-1-ajones@ventanamicro.com>
Message-ID: <CAAhSdy1TpSuWepN92vRfGcgZ4Sqe2FBr2v9pzgO5pwdAAs4cqA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 1, 2023 at 5:38?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Ensure attempts to invoke SBI extension functions fail with
> SBI_ERR_NOT_SUPPORTED when the extension's probe function has
> reported that the extension is not available. To avoid invoking
> probe too frequently, we check single extension ID extensions at
> init time and even drop them from the extension list when their
> probe fails. If the probe succeeds, we keep it, and then later
> seeing that it's a single extension ID extension is enough to know
> it's available. Extensions which have multiple IDs must have its probe
> called for each, so we don't try to reduce calls to those. It's
> expected that these multi-ID extension probe functions implement
> their own optimizations in order to ensure extension lookups are
> fast.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> v3:
>  - Only apply optimization to single extension ID extensions [Xiang]
>  - Drop extensions from extension list when they can be probed
>    at init time (and drop the, now unnecessary, status) [Anup]
>
>  lib/sbi/sbi_ecall.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> index 76a1ae9ab733..cb73105d7aa8 100644
> --- a/lib/sbi/sbi_ecall.c
> +++ b/lib/sbi/sbi_ecall.c
> @@ -42,16 +42,19 @@ static SBI_LIST_HEAD(ecall_exts_list);
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
> +                       if (t->extid_start != t->extid_end && t->probe &&
> +                           (t->probe(extid, &out_val) || !out_val))

I disagree with this approach of penalizing extension spread over
a range of extension IDs. Particularly this adds overhead for
vendor extension.

I suggest, we should change the prototype of probe callback to:
"int (* probe)(struct sbi_ecall_extension *extl);"

And update existing probe functions to directly register extension
by calling sbi_ecall_register_extension().

The sbi_ecall_init() should call sbi_ecall_register_extension()
only for extensions which don't have a probe callback.

Based on this suggestion, no changes are required in
sbi_ecall_find_extension().

Regards,
Anup

> +                               return NULL;
> +                       return t;
>                 }
>         }
>
> -       return ret;
> +       return NULL;
>  }
>
>  int sbi_ecall_register_extension(struct sbi_ecall_extension *ext)
> @@ -148,15 +151,26 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
>
>  int sbi_ecall_init(void)
>  {
> -       int ret;
>         struct sbi_ecall_extension *ext;
> -       unsigned long i;
> +       unsigned long out_val, i;
> +       int ret;
>
>         for (i = 0; i < sbi_ecall_exts_size; i++) {
>                 ext = sbi_ecall_exts[i];
> -               ret = sbi_ecall_register_extension(ext);
> -               if (ret)
> -                       return ret;
> +               /*
> +                * Don't bother adding extensions which have a single extension
> +                * ID and its probe fails. Extensions with multiple IDs need to
> +                * have their probe called on specific IDs, so we need to add
> +                * them here and probe on each use. And, of course, if there
> +                * isn't a probe function, then the extension is always
> +                * available, so we add it here.
> +                */
> +               if (ext->extid_start != ext->extid_end || !ext->probe ||
> +                   (!ext->probe(ext->extid_start, &out_val) && out_val)) {
> +                       ret = sbi_ecall_register_extension(ext);
> +                       if (ret)
> +                               return ret;
> +               }
>         }
>
>         return 0;
> --
> 2.40.0
>

