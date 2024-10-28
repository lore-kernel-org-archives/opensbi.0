From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Oct 2024 17:57:23 +0530
Subject: [PATCH] lib: sbi: fix number of PMP entries detection
In-Reply-To: <20240902102110.1311636-1-vladimir.kondratiev@mobileye.com>
References: <20240902102110.1311636-1-vladimir.kondratiev@mobileye.com>
Message-ID: <CAAhSdy3SGOJZe64jDA8bf8AM+EfdrkQqX+Fec0vMUjxLjiMg1w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 2, 2024 at 3:58?PM Vladimir Kondratiev
<vladimir.kondratiev@mobileye.com> wrote:
>
> CSR_PMPADDRn lower bits may read all-0 or all-1, depending on
> the configuration. For TOR it is all-0, for NAPOT - all-1.
>
> Thus if PMP entry was pre-configured as NAPOT, original code would
> stop scanning because value read back not equal to the written one.
>
> Mask lower bits before comparison to fix this
>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

LGTM.

In the future, we may also want to initialize pmpcfgX CSRs to
known values before detecting PMP regions.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  lib/sbi/sbi_hart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index cc364fac2cc8..61cddc2b1d0f 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -817,7 +817,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
>                 } else {                                                \
>                         csr_write_allowed(__csr, &trap, __wrval);       \
>                         if (!trap.cause) {                              \
> -                               if (csr_swap(__csr, oldval) == __wrval) \
> +                               if ((csr_swap(__csr, oldval) & __wrval) == __wrval)     \
>                                         (hfeatures->__field)++;         \
>                                 else                                    \
>                                         goto __skip;                    \
> --
> 2.37.3
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

