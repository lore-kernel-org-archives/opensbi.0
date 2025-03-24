From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 Mar 2025 18:26:04 +0530
Subject: [PATCH 3/4] lib: sbi_scratch: Add sbi_hart_count() and for_each_hartindex()
In-Reply-To: <20250220184233.23802-4-samuel.holland@sifive.com>
References: <20250220184233.23802-1-samuel.holland@sifive.com> <20250220184233.23802-4-samuel.holland@sifive.com>
Message-ID: <CAAhSdy3XGvP8_z=7S938G7DJw8jMV+Z+C1pGrq24dr6xpviexw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2025 at 12:12?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> There is currently no helper for iterating through the harts in a
> system, and code must choose between sbi_scratch_last_hartindex() and
> sbi_platform_hart_count() for the loop condition.
>
> sbi_scratch_last_hartindex() has unusual semantics, leading to the
> likelihood of off-by-one errors, and sbi_platform_hart_count() is
> provided by the platform and so may not be properly bounded.
>
> Add a new helper which definitively reports the number of harts managed
> by this OpenSBI instance, i.e. the number of valid hart indexes, and a
> convenient iterator macro.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  include/sbi/sbi_scratch.h | 16 +++++++++++-----
>  lib/sbi/sbi_scratch.c     | 13 +++++--------
>  2 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 1ec1710e..200f73d2 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -210,15 +210,21 @@ do {                                                                      \
>  #define current_hartindex() \
>         (sbi_scratch_thishart_ptr()->hartindex)
>
> -/** Last HART index having a sbi_scratch pointer */
> -extern u32 last_hartindex_having_scratch;
> +/** Number of harts managed by this OpenSBI instance */
> +extern u32 sbi_scratch_hart_count;
> +
> +/** Get the number of harts managed by this OpenSBI instance */
> +#define sbi_hart_count() sbi_scratch_hart_count
> +
> +/** Iterate over the harts managed by this OpenSBI instance */
> +#define for_each_hartindex(__var) \
> +       for (u32 __var = 0; __var < sbi_hart_count(); ++__var)

We have used "sbi_" prefix in for-loop macros of linked-list so we
should do that here as well. I will rename this macro@the time
of applying.

>
>  /** Get last HART index having a sbi_scratch pointer */
> -#define sbi_scratch_last_hartindex()   last_hartindex_having_scratch
> +#define sbi_scratch_last_hartindex() (sbi_hart_count() - 1)
>
>  /** Check whether a particular HART index is valid or not */
> -#define sbi_hartindex_valid(__hartindex) \
> -(((__hartindex) <= sbi_scratch_last_hartindex()) ? true : false)
> +#define sbi_hartindex_valid(__hartindex) ((__hartindex) < sbi_hart_count())
>
>  /** HART index to HART id table */
>  extern u32 hartindex_to_hartid_table[];
> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> index e1cc5658..2dc028ee 100644
> --- a/lib/sbi/sbi_scratch.c
> +++ b/lib/sbi/sbi_scratch.c
> @@ -14,7 +14,7 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
>
> -u32 last_hartindex_having_scratch = 0;
> +u32 sbi_scratch_hart_count;
>  u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS] = { [0 ... SBI_HARTMASK_MAX_BITS-1] = -1U };
>  struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS];
>
> @@ -23,9 +23,7 @@ static unsigned long extra_offset = SBI_SCRATCH_EXTRA_SPACE_OFFSET;
>
>  u32 sbi_hartid_to_hartindex(u32 hartid)
>  {
> -       u32 i;
> -
> -       for (i = 0; i <= last_hartindex_having_scratch; i++)
> +       for_each_hartindex(i)
>                 if (hartindex_to_hartid_table[i] == hartid)
>                         return i;
>
> @@ -36,22 +34,21 @@ typedef struct sbi_scratch *(*hartid2scratch)(ulong hartid, ulong hartindex);
>
>  int sbi_scratch_init(struct sbi_scratch *scratch)
>  {
> -       u32 i, h, hart_count;
> +       u32 h, hart_count;
>         const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>
>         hart_count = plat->hart_count;
>         if (hart_count > SBI_HARTMASK_MAX_BITS)
>                 hart_count = SBI_HARTMASK_MAX_BITS;
> +       sbi_scratch_hart_count = hart_count;
>
> -       for (i = 0; i < hart_count; i++) {
> +       for_each_hartindex(i) {
>                 h = (plat->hart_index2id) ? plat->hart_index2id[i] : i;
>                 hartindex_to_hartid_table[i] = h;
>                 hartindex_to_scratch_table[i] =
>                         ((hartid2scratch)scratch->hartid_to_scratch)(h, i);
>         }
>
> -       last_hartindex_having_scratch = hart_count - 1;
> -
>         return 0;
>  }
>
> --
> 2.47.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

