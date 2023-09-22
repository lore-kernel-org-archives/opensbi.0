From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Sep 2023 12:37:20 +0530
Subject: [PATCH 2/4] lib: sbi: Add support for Svadu extension
In-Reply-To: <20230907092729.11200-3-yongxuan.wang@sifive.com>
References: <20230907092729.11200-1-yongxuan.wang@sifive.com> <20230907092729.11200-3-yongxuan.wang@sifive.com>
Message-ID: <CAAhSdy21vF3ghjFjzedQ_WsJY3Stf+UAshSnVamsZJrnY-SojA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 7, 2023 at 2:57?PM Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
>
> This patch enables Svadu extension in the menvcfg CSR for lower privilege
> modes. The menvcfg.HADE bit is read-only zero when the Svadu extension is
> not implemented. So we try to enable menvcfg.HADE bit irrespective whether
> the extension is available or not.
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/riscv_encoding.h | 1 +
>  lib/sbi/sbi_hart.c           | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 01bafcd..0952cba 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -209,6 +209,7 @@
>
>  #define ENVCFG_STCE                    (_ULL(1) << 63)
>  #define ENVCFG_PBMTE                   (_ULL(1) << 62)
> +#define ENVCFG_HADE                    (_ULL(1) << 61)
>  #define ENVCFG_CBZE                    (_UL(1) << 7)
>  #define ENVCFG_CBCFE                   (_UL(1) << 6)
>  #define ENVCFG_CBIE_SHIFT              4
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index d749aea..21af2b5 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -153,6 +153,12 @@ static void mstatus_init(struct sbi_scratch *scratch)
>                         menvcfg_val |= ENVCFG_STCE;
>                 }
>
> +               /* Set menvcfg.HADE == 1
> +                * If Svadu extension is not available then writes to
> +                * menvcfg.HADE will be ignored because it is a WARL field.
> +                */
> +               menvcfg_val |= ENVCFG_HADE;
> +
>                 csr_write(CSR_MENVCFG, menvcfg_val);
>  #if __riscv_xlen == 32
>                 csr_write(CSR_MENVCFGH, menvcfg_val >> 32);
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

