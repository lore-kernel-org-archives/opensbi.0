From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 Mar 2025 18:24:44 +0530
Subject: [PATCH 2/4] lib: sbi_scratch: Optimize hartid and scratch lookup
In-Reply-To: <20250220184233.23802-3-samuel.holland@sifive.com>
References: <20250220184233.23802-1-samuel.holland@sifive.com> <20250220184233.23802-3-samuel.holland@sifive.com>
Message-ID: <CAAhSdy2_VGLbs7V773VcOXnu=PCbFEYk54GRimvrVM7EkkR3HA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2025 at 12:12?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> The compiler generates much better code for sbi_hartindex_to_hartid()
> and sbi_hartindex_to_scratch() when using a constant for the bounds
> check. This works out nicely because the underlying arrays are already
> a constant size, so the only change needed is to fill the remainder of
> each array with the appropriate default/out-of-bounds value. The
> ellipsis in the designated initializer is a GCC extension (also
> supported by Clang), but avoids runtime initialization of the array.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  include/sbi/sbi_scratch.h | 6 +++---
>  lib/sbi/sbi_scratch.c     | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 0d188d12..1ec1710e 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -226,7 +226,7 @@ extern u32 hartindex_to_hartid_table[];
>  /** Get sbi_scratch from HART index */
>  #define sbi_hartindex_to_hartid(__hartindex)           \
>  ({                                                     \
> -       ((__hartindex) <= sbi_scratch_last_hartindex()) ?\
> +       ((__hartindex) < SBI_HARTMASK_MAX_BITS) ?       \
>         hartindex_to_hartid_table[__hartindex] : -1U;   \
>  })
>
> @@ -236,8 +236,8 @@ extern struct sbi_scratch *hartindex_to_scratch_table[];
>  /** Get sbi_scratch from HART index */
>  #define sbi_hartindex_to_scratch(__hartindex)          \
>  ({                                                     \
> -       ((__hartindex) <= sbi_scratch_last_hartindex()) ?\
> -       hartindex_to_scratch_table[__hartindex] : NULL;\
> +       ((__hartindex) < SBI_HARTMASK_MAX_BITS) ?       \
> +       hartindex_to_scratch_table[__hartindex] : NULL; \
>  })
>
>  /**
> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> index 5a9e935b..e1cc5658 100644
> --- a/lib/sbi/sbi_scratch.c
> +++ b/lib/sbi/sbi_scratch.c
> @@ -15,8 +15,8 @@
>  #include <sbi/sbi_string.h>
>
>  u32 last_hartindex_having_scratch = 0;
> -u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS] = { -1U };
> -struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS] = { 0 };
> +u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS] = { [0 ... SBI_HARTMASK_MAX_BITS-1] = -1U };
> +struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS];
>
>  static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
>  static unsigned long extra_offset = SBI_SCRATCH_EXTRA_SPACE_OFFSET;
> --
> 2.47.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

