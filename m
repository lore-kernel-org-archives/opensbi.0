From: Anup Patel <anup@brainfault.org>
Date: Thu, 1 Aug 2024 20:04:29 +0530
Subject: [RFC PATCH] include: Adjust Sscofpmf mhpmevent mask for upper 8 bits
In-Reply-To: <20240730093022.11665-1-eric.lin@sifive.com>
References: <20240730093022.11665-1-eric.lin@sifive.com>
Message-ID: <CAAhSdy23qdUQOETAUSjGLUJoHBroacLbbup3xJecnkhyPt_dSg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 30, 2024 at 3:00?PM Eric Lin <eric.lin@sifive.com> wrote:
>
> Currently, OpenSBI reserves the upper 16 bits in mhpmevent for
> the Sscofpmf extension.
>
> However, according to the Sscofpmf extension specification[1],
> it only defines the upper 8 bits in mhpmevent for privilege mode
> inhibit and counter overflow disable. Other bits are defined by
> the platform for event selection.
>
> Since vendors might define raw event encoding exceeding 48 bits in
> mhpmevent, we should adjust the MHPMEVENT_SSCOF_MASK to support it.
>
> Link: https://github.com/riscvarchive/riscv-count-overflow [1]
> Signed-off-by: Eric Lin <eric.lin@sifive.com>

Actually, only the upper 6 bits of mhpmevent CSR are defined as-per
Sscofpmf in the integrated Priv spec.

I have updated this patch accordingly at the time of merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/riscv_encoding.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 477fa3a1..2ed05f24 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -207,7 +207,7 @@
>
>  #endif
>
> -#define MHPMEVENT_SSCOF_MASK           _ULL(0xFFFF000000000000)
> +#define MHPMEVENT_SSCOF_MASK           _ULL(0xFF00000000000000)
>
>  #define ENVCFG_STCE                    (_ULL(1) << 63)
>  #define ENVCFG_PBMTE                   (_ULL(1) << 62)
> --
> 2.43.2
>

