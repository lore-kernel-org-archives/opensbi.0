From: Anup Patel <anup@brainfault.org>
Date: Wed, 10 Jan 2024 10:59:33 +0530
Subject: [PATCH v3 4/8] lib: sbi: Detect support of debug triggers
In-Reply-To: <20240109170020.1731282-5-hchauhan@ventanamicro.com>
References: <20240109170020.1731282-1-hchauhan@ventanamicro.com> <20240109170020.1731282-5-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy0gq5WLiWvepa57aUNM8p__uUKtTnodMNTm5kLAF_sk1A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 9, 2024 at 11:45?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Detect if debug triggers, sdtrig extension, is supported
> by the CPU. The support is detected by access traps and
> ISA string parsing.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/sbi_hart.h | 2 ++
>  lib/sbi/sbi_hart.c     | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 47be251..10dc3df 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -53,6 +53,8 @@ enum sbi_hart_extensions {
>         SBI_HART_EXT_ZICBOM,
>         /** Hart has Svpbmt extension */
>         SBI_HART_EXT_SVPBMT,
> +       /** Hart has debug trigger extension */
> +       SBI_HART_EXT_SDTRIG,
>
>         /** Maximum index of Hart extension */
>         SBI_HART_EXT_MAX,
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 770fee0..a0ab0c6 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -657,6 +657,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>         __SBI_HART_EXT_DATA(zicboz, SBI_HART_EXT_ZICBOZ),
>         __SBI_HART_EXT_DATA(zicbom, SBI_HART_EXT_ZICBOM),
>         __SBI_HART_EXT_DATA(svpbmt, SBI_HART_EXT_SVPBMT),
> +       __SBI_HART_EXT_DATA(sdtrig, SBI_HART_EXT_SDTRIG),
>  };
>
>  /**
> @@ -898,6 +899,9 @@ __pmp_skip:
>         /* Detect if hart supports smcntrpmf */
>         __check_ext_csr(SBI_HART_PRIV_VER_1_12,
>                         CSR_MCYCLECFG, SBI_HART_EXT_SMCNTRPMF);
> +       /* Detect if hart support sdtrig (debug triggers) */
> +       __check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
> +                       CSR_TSELECT, SBI_HART_EXT_SDTRIG);
>
>  #undef __check_ext_csr
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

