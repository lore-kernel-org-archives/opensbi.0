From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 28 Apr 2022 06:53:40 -0700
Subject: [PATCH] lib: sbi: Fix mstatus_init() for RV32 when Sscofpmf is
 not available
In-Reply-To: <20220428074816.196542-1-apatel@ventanamicro.com>
References: <20220428074816.196542-1-apatel@ventanamicro.com>
Message-ID: <CAOnJCUK+1SsUQ6upZfMpARwtc==C6CbPe191s8fC3HeRVTC=3w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 28, 2022 at 12:49 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The mhpmevent3h to mhpmevent31h CSRs are available on RV32 only when
> Sscofpmf extension is available so mstatus_init() should set this
> CSRs only when Sscofpmf extension is available.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/sbi/sbi_hart.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index a50b6e4..229c14a 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -82,7 +82,9 @@ static void mstatus_init(struct sbi_scratch *scratch)
>         for (cidx = 0; cidx < num_mhpm; cidx++) {
>  #if __riscv_xlen == 32
>                 csr_write_num(CSR_MHPMEVENT3 + cidx, mhpmevent_init_val & 0xFFFFFFFF);
> -               csr_write_num(CSR_MHPMEVENT3H + cidx, mhpmevent_init_val >> BITS_PER_LONG);
> +               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> +                       csr_write_num(CSR_MHPMEVENT3H + cidx,
> +                                     mhpmevent_init_val >> BITS_PER_LONG);
>  #else
>                 csr_write_num(CSR_MHPMEVENT3 + cidx, mhpmevent_init_val);
>  #endif
> --
> 2.34.1
>

Thanks for the fix.
Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

