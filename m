From: Anup Patel <anup@brainfault.org>
Date: Thu, 11 Nov 2021 18:30:49 +0530
Subject: [PATCH] lib: sbi: Fix PMP address bits detection
In-Reply-To: <20211108050646.2895200-1-anup.patel@wdc.com>
References: <20211108050646.2895200-1-anup.patel@wdc.com>
Message-ID: <CAAhSdy3cyFn1NyGidu+RtqBT5YPuBVrS4dZ3TNT7Yc7+gpR=+A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 8, 2021 at 10:37 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> From: Vasan VS <vasan.vs@gmail.com>
>
> We should ensure that pmpcfg0.pmp0cfg is set to zero before using
> pmpaddr0 CSR for detecting implemented PMP address bits.
>
> Fixes: bf21632860b4 ("lib: sbi: Detect PMP granularity and number
> of address bits")
> Signed-off-by: Vasan VS <vasan.vs@gmail.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

> ---
>  lib/sbi/sbi_hart.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 8eb0c38..366066b 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -339,6 +339,10 @@ static unsigned long hart_pmp_get_allowed_addr(void)
>         unsigned long val = 0;
>         struct sbi_trap_info trap = {0};
>
> +       csr_write_allowed(CSR_PMPCFG0, (ulong)&trap, 0);
> +       if (trap.cause)
> +               return 0;
> +
>         csr_write_allowed(CSR_PMPADDR0, (ulong)&trap, PMP_ADDR_MASK);
>         if (!trap.cause) {
>                 val = csr_read_allowed(CSR_PMPADDR0, (ulong)&trap);
> --
> 2.25.1
>

