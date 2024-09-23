From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Sep 2024 18:19:48 +0530
Subject: [PATCH] lib: sbi: Respect scounteren when emulating the time CSR
In-Reply-To: <20240829202242.3659520-1-samuel.holland@sifive.com>
References: <20240829202242.3659520-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy39DiDbpZ4f7B96RkQqfSY1ZpYgEh7pZB6Wybyc_Mc4yQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 1:52?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This optimization creates a correctness issue, as it prevents supervisor
> software from restricting VS-mode or U-mode access to the time CSR for
> its own purposes.
>
> Closes: https://github.com/riscv-software-src/opensbi/issues/370
> Fixes: ebc8ebc0f846 ("lib: sbi: Improve HPM CSR read/write emulation")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  lib/sbi/sbi_emulate_csr.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
> index 869c81f4..3adec78d 100644
> --- a/lib/sbi/sbi_emulate_csr.c
> +++ b/lib/sbi/sbi_emulate_csr.c
> @@ -66,12 +66,11 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
>                 *csr_val = csr_read(CSR_MCYCLE);
>                 break;
>         case CSR_TIME:
> +               if (!hpm_allowed(csr_num - CSR_CYCLE, prev_mode, virt))
> +                       return SBI_ENOTSUPP;
>                 /*
>                  * We emulate TIME CSR for both Host (HS/U-mode) and
>                  * Guest (VS/VU-mode).
> -                *
> -                * Faster TIME CSR reads are critical for good performance
> -                * in S-mode software so we don't check CSR permissions.
>                  */
>                 *csr_val = (virt) ? sbi_timer_virt_value():
>                                     sbi_timer_value();
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

