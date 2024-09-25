From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Sep 2024 12:14:06 +0530
Subject: [PATCH 02/12] include: sbi: Store the hart index in struct sbi_scratch
In-Reply-To: <20240830154929.3971790-3-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com> <20240830154929.3971790-3-samuel.holland@sifive.com>
Message-ID: <CAAhSdy05+7tkuLEpjz0eX-1ek4XfqgKRNejBESH7AUuYe7WbgA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 10:31?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This is a more efficient way to get the index of the current hart than
> calling a function to loop through the hartindex -> hartid lookup table.

Good improvement.

>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  firmware/fw_base.S        |  2 ++
>  include/sbi/sbi_scratch.h | 10 +++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index b950c0b8..30dc28f0 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -218,6 +218,8 @@ _scratch_init:
>  #endif
>         REG_S   a0, SBI_SCRATCH_OPTIONS_OFFSET(tp)
>         MOV_3R  a0, s0, a1, s1, a2, s2
> +       /* Store hart index in scratch space */
> +       REG_S   t1, SBI_SCRATCH_HARTINDEX_OFFSET(tp)
>         /* Move to next scratch space */
>         add     t1, t1, t2
>         blt     t1, s7, _scratch_init
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 12e6a983..9ae4f891 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -42,8 +42,10 @@
>  #define SBI_SCRATCH_TMP0_OFFSET                        (12 * __SIZEOF_POINTER__)
>  /** Offset of options member in sbi_scratch */
>  #define SBI_SCRATCH_OPTIONS_OFFSET             (13 * __SIZEOF_POINTER__)
> +/** Offset of hartindex member in sbi_scratch */
> +#define SBI_SCRATCH_HARTINDEX_OFFSET           (14 * __SIZEOF_POINTER__)
>  /** Offset of extra space in sbi_scratch */
> -#define SBI_SCRATCH_EXTRA_SPACE_OFFSET         (14 * __SIZEOF_POINTER__)
> +#define SBI_SCRATCH_EXTRA_SPACE_OFFSET         (15 * __SIZEOF_POINTER__)
>  /** Maximum size of sbi_scratch (4KB) */
>  #define SBI_SCRATCH_SIZE                       (0x1000)
>
> @@ -83,6 +85,8 @@ struct sbi_scratch {
>         unsigned long tmp0;
>         /** Options for OpenSBI library */
>         unsigned long options;
> +       /** Index of the hart */
> +       unsigned long hartindex;
>  };
>
>  /**
> @@ -202,6 +206,10 @@ do {                                                                       \
>                                         = (__type)(__ptr);              \
>  } while (0)
>
> +/** Get the hart index of the current hart */
> +#define current_hartindex() \
> +       (sbi_scratch_thishart_ptr()->hartindex)
> +
>  /** Last HART index having a sbi_scratch pointer */
>  extern u32 last_hartindex_having_scratch;
>
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

