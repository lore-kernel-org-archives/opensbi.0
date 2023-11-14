From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Nov 2023 22:09:23 +0530
Subject: [PATCH] lib: sbi: Improve hartindex_to_hartid_table
In-Reply-To: <20231009092202.267633-1-wxjstz@126.com>
References: <20231009092202.267633-1-wxjstz@126.com>
Message-ID: <CAAhSdy3rEn0FKSyH1HL0VEx2Se5o62U9cYFFWeh_vGtS20B_mA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 9, 2023 at 2:52?PM Xiang W <wxjstz@126.com> wrote:
>
> Modify hartindex_to_hartid_table point to plat->hart_index2id to
> save memory. This slows down sbi_hartindex_to_hartid slightly
> because it needs to determine whether hartindex_to_hartid_table is
> NULL. This will also improve the speed of sbi_hartid_to_hartindex
> when plat->hart_index2id is NULL, since there is no need to iterate
> through the array.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  include/sbi/sbi_scratch.h | 13 ++++++++-----
>  lib/sbi/sbi_scratch.c     |  7 +++++--
>  2 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index e6a33ba..02db224 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -213,13 +213,16 @@ extern u32 last_hartindex_having_scratch;
>  (((__hartindex) <= sbi_scratch_last_hartindex()) ? true : false)
>
>  /** HART index to HART id table */
> -extern u32 hartindex_to_hartid_table[];
> +extern const u32* hartindex_to_hartid_table;
>
>  /** Get sbi_scratch from HART index */
> -#define sbi_hartindex_to_hartid(__hartindex)           \
> -({                                                     \
> -       ((__hartindex) <= sbi_scratch_last_hartindex()) ?\
> -       hartindex_to_hartid_table[__hartindex] : -1U;   \
> +#define sbi_hartindex_to_hartid(__hartindex)                   \
> +({                                                             \
> +       ((__hartindex) <= sbi_scratch_last_hartindex()) ?       \
> +               (hartindex_to_hartid_table ?                    \
> +                       hartindex_to_hartid_table[__hartindex] :\
> +                       __hartindex) :                          \
> +               -1U;                                            \

Now, we have one more unnecessary "if ()" check in the
hot-path.

This patch deteriorates sbi_hartindex_to_hartid() instead
of improving it.

Regards,
Anup

>  })
>
>  /** HART index to scratch table */
> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> index ccbbc68..e097077 100644
> --- a/lib/sbi/sbi_scratch.c
> +++ b/lib/sbi/sbi_scratch.c
> @@ -15,7 +15,7 @@
>  #include <sbi/sbi_string.h>
>
>  u32 last_hartindex_having_scratch = 0;
> -u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
> +const u32 *hartindex_to_hartid_table;
>  struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
>
>  static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
> @@ -25,6 +25,9 @@ u32 sbi_hartid_to_hartindex(u32 hartid)
>  {
>         u32 i;
>
> +       if (hartindex_to_hartid_table == NULL)
> +               return hartid;
> +
>         for (i = 0; i <= last_hartindex_having_scratch; i++)
>                 if (hartindex_to_hartid_table[i] == hartid)
>                         return i;
> @@ -41,11 +44,11 @@ int sbi_scratch_init(struct sbi_scratch *scratch)
>
>         for (i = 0; i < plat->hart_count; i++) {
>                 h = (plat->hart_index2id) ? plat->hart_index2id[i] : i;
> -               hartindex_to_hartid_table[i] = h;
>                 hartindex_to_scratch_table[i] =
>                         ((hartid2scratch)scratch->hartid_to_scratch)(h, i);
>         }
>
> +       hartindex_to_hartid_table = plat->hart_index2id;
>         last_hartindex_having_scratch = plat->hart_count - 1;
>
>         return 0;
> --
> 2.40.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

