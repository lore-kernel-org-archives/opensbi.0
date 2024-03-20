From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Mar 2024 11:12:29 +0530
Subject: [PATCH] platform: generic: allwinner: sun20i-d1: Remove
 duplicated CSR definitions
In-Reply-To: <20240319092642.1254434-1-christoph.muellner@vrull.eu>
References: <20240319092642.1254434-1-christoph.muellner@vrull.eu>
Message-ID: <CAAhSdy2PwkUzycK1Qj-4wZ2Re4HQZfg0+59abgOc9WsWCxkMZg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 19, 2024 at 2:56?PM Christoph M?llner
<christoph.muellner@vrull.eu> wrote:
>
> All T-Head CSRs are already defined in thead/c9xx_encoding.h.
> Let's reuse the values from there instead of redefining them with
> a slightly different name.
>
> Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/allwinner/sun20i-d1.c | 27 +++++++++-----------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
>
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index e9388db..ed19d5d 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -33,15 +33,6 @@
>  #define RISCV_CFG_BGR_REG              0xd0c
>  #define PPU_BGR_REG                    0x1ac
>
> -/*
> - * CSRs
> - */
> -
> -#define CSR_MXSTATUS                   0x7c0
> -#define CSR_MHCR                       0x7c1
> -#define CSR_MCOR                       0x7c2
> -#define CSR_MHINT                      0x7c5
> -
>  static unsigned long csr_mxstatus;
>  static unsigned long csr_mhcr;
>  static unsigned long csr_mhint;
> @@ -49,24 +40,24 @@ static unsigned long csr_mhint;
>  static void sun20i_d1_csr_save(void)
>  {
>         /* Save custom CSRs. */
> -       csr_mxstatus    = csr_read(CSR_MXSTATUS);
> -       csr_mhcr        = csr_read(CSR_MHCR);
> -       csr_mhint       = csr_read(CSR_MHINT);
> +       csr_mxstatus    = csr_read(THEAD_C9XX_CSR_MXSTATUS);
> +       csr_mhcr        = csr_read(THEAD_C9XX_CSR_MHCR);
> +       csr_mhint       = csr_read(THEAD_C9XX_CSR_MHINT);
>
>         /* Flush and disable caches. */
> -       csr_write(CSR_MCOR, 0x22);
> -       csr_write(CSR_MHCR, 0x0);
> +       csr_write(THEAD_C9XX_CSR_MCOR, 0x22);
> +       csr_write(THEAD_C9XX_CSR_MHCR, 0x0);
>  }
>
>  static void sun20i_d1_csr_restore(void)
>  {
>         /* Invalidate caches and the branch predictor. */
> -       csr_write(CSR_MCOR, 0x70013);
> +       csr_write(THEAD_C9XX_CSR_MCOR, 0x70013);
>
>         /* Restore custom CSRs, including the cache state. */
> -       csr_write(CSR_MXSTATUS, csr_mxstatus);
> -       csr_write(CSR_MHCR,     csr_mhcr);
> -       csr_write(CSR_MHINT,    csr_mhint);
> +       csr_write(THEAD_C9XX_CSR_MXSTATUS, csr_mxstatus);
> +       csr_write(THEAD_C9XX_CSR_MHCR, csr_mhcr);
> +       csr_write(THEAD_C9XX_CSR_MHINT, csr_mhint);
>  }
>
>  /*
> --
> 2.44.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

