From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jul 2024 10:45:43 +0530
Subject: [PATCH] lib: sbi_emulate_csr: Do not log illegal CSR accesses
In-Reply-To: <20240701145501.761348-1-samuel.holland@sifive.com>
References: <20240701145501.761348-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1mgvu0bFYdOP_1sKWEb3jWwS21-GS7Zh2HjrDscCvB4A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 1, 2024 at 8:25?PM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> Illegal CSR accesses from lower privilege modes are delegated to S-mode
> and do not necessarily indicate a bug. Supervisor software may want to
> emulate some CSRs, or may intentionally disable access to certain
> existing CSRs, and thus will expect traps when those CSRs are accessed.
>
> For example, Linux disables sstatus.VS by default in order to detect
> when userspace first accesses vector register state; this includes the
> CSRs defined by the V extesion. As a result, if the first vector
> instruction in a process is a CSR access, OpenSBI will log the illegal
> instruction exception, even though there is no unexpected or erroneous
> behavior occurring.
>
> Since the illegal instruction exception is delegated to S-mode, S-mode
> software should be responsible for reporting the exception, not OpenSBI.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  lib/sbi/sbi_emulate_csr.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
> index 5f3b111d..869c81f4 100644
> --- a/lib/sbi/sbi_emulate_csr.c
> +++ b/lib/sbi/sbi_emulate_csr.c
> @@ -10,7 +10,6 @@
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_encoding.h>
>  #include <sbi/sbi_bitops.h>
> -#include <sbi/sbi_console.h>
>  #include <sbi/sbi_emulate_csr.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_hart.h>
> @@ -151,10 +150,6 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
>                 break;
>         }
>
> -       if (ret)
> -               sbi_dprintf("%s: hartid%d: invalid csr_num=0x%x\n",
> -                           __func__, current_hartid(), csr_num);
> -
>         return ret;
>  }
>
> @@ -189,9 +184,5 @@ int sbi_emulate_csr_write(int csr_num, struct sbi_trap_regs *regs,
>                 break;
>         }
>
> -       if (ret)
> -               sbi_dprintf("%s: hartid%d: invalid csr_num=0x%x\n",
> -                           __func__, current_hartid(), csr_num);
> -
>         return ret;
>  }
> --
> 2.44.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

