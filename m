From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Feb 2025 11:07:28 +0530
Subject: [PATCH] lib: sbi: increase the size of the string used for
 extension display
In-Reply-To: <20250123145808.3229017-1-cleger@rivosinc.com>
References: <20250123145808.3229017-1-cleger@rivosinc.com>
Message-ID: <CAAhSdy2wCkuE6+KTZ3evvf_6fDEuf4HKJKmK-n4eUersQDCgRw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 23, 2025 at 8:32?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> With the "max" QEMU cpu, the displayed extension string is truncated due
> to the buffer being too small. Increase it to 256 to display the full
> set of extensions correctly.
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


> ---
>  lib/sbi/sbi_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 58030cf2..2feb37cd 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -160,7 +160,7 @@ static void sbi_boot_print_domains(struct sbi_scratch *scratch)
>  static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
>  {
>         int xlen;
> -       char str[128];
> +       char str[256];
>         const struct sbi_domain *dom = sbi_domain_thishart_ptr();
>
>         if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
> --
> 2.47.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

