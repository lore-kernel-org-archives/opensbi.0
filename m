From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Dec 2022 14:26:22 +0530
Subject: [PATCH] lib: sbi: Synchronize PMP settings with virtual memory system
In-Reply-To: <20221205164231.170617-1-hchauhan@ventanamicro.com>
References: <20221205164231.170617-1-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy2gGN0a0Zo9gbtfM0AVPJyRUqi00XczVmeedur5gut_4A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 5, 2022 at 10:13 PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> As per section 3.7.2 of RISC-V Privileged Specification,
> PMP settings must be synchronized with the virtual memory
> system after PMP settings have been written.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_hart.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index dacab1a..5447c52 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -22,6 +22,7 @@
>  #include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_string.h>
>  #include <sbi/sbi_trap.h>
> +#include <sbi/sbi_hfence.h>
>
>  extern void __sbi_expected_trap(void);
>  extern void __sbi_expected_trap_hext(void);
> @@ -321,6 +322,27 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>                 }
>         }
>
> +       /*
> +        * As per section 3.7.2 of privileged specification v1.12,
> +        * virtual address translations can be speculatively performed
> +        * (even before actual access). These, along with PMP traslations,
> +        * can be cached. This can pose a problem with CPU hotplug
> +        * and non-retentive suspend scenario because PMP states are
> +        * not preserved.
> +        * It is advisable to flush the caching structures under such
> +        * conditions.
> +        */
> +       if (misa_extension('S')) {
> +               __asm__ __volatile__("sfence.vma");
> +
> +               /*
> +                * If hypervisor mode is supported, flush caching
> +                * structures in guest mode too.
> +                */
> +               if (misa_extension('H'))
> +                       __sbi_hfence_gvma_all();
> +       }
> +
>         return 0;
>  }
>
> --
> 2.38.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

