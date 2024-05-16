From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 May 2024 11:13:59 +0530
Subject: [PATCH v6] lib:utils:irqchip: Check before initializing imsic.
In-Reply-To: <tencent_3519B70BE4D4C496A3FAEC5DD8981581C807@qq.com>
References: <tencent_3519B70BE4D4C496A3FAEC5DD8981581C807@qq.com>
Message-ID: <CAAhSdy0OTOXA=BeTmJrtV8=pm7PJ9-B8Wd=GNU69zmXiJDGVdA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 15, 2024 at 11:46?AM Cheng Yang <yangcheng.work@foxmail.com> wrote:
>
> The current mlevel imsic check is only for the platform, which
> may cause hart without imsic in the platform to trigger an
> illegal instruction exception when initializing imsic. For
> example, the platform contains a management hart that only
> supports wired interrupts.
>
> This patch will check if each hart supports Smaia extension
> before doing imsic initialization to avoid triggering illegal
> instruction exceptions.
>
> Signed-off-by: Cheng Yang <yangcheng.work@foxmail.com>
> Changes V5 -> V6:
>   - Use csr_read_allowed instead of bitmap to simplify checking if hart supports Imsic, suggestion from Anup.
> Changes V4 -> V5:
>   - Fixed the issue where patch cannot be applied due to the editor automatically removing trailing spaces.
> Changes V3 -> V4:
>   - Rebase to the latest master branch.
> Changes V2 -> V3:
>   - Trailing whitespace.
>   - Replace platform.hart_index2id to generic_hart_index2id.
> Changes V1 -> V2:
>   - Add the processing of plat->hart_index2id be NULL in fdt_check_imsic_mlevel.
> ---
>  lib/utils/irqchip/imsic.c | 7 +++++++

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>  1 file changed, 7 insertions(+)
>
> diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
> index f2a35c6..fad1beb 100644
> --- a/lib/utils/irqchip/imsic.c
> +++ b/lib/utils/irqchip/imsic.c
> @@ -12,6 +12,7 @@
>  #include <sbi/riscv_io.h>
>  #include <sbi/riscv_encoding.h>
>  #include <sbi/sbi_console.h>
> +#include <sbi/sbi_csr_detect.h>
>  #include <sbi/sbi_domain.h>
>  #include <sbi/sbi_ipi.h>
>  #include <sbi/sbi_irqchip.h>
> @@ -222,6 +223,7 @@ static void imsic_local_eix_update(unsigned long base_id,
>
>  void imsic_local_irqchip_init(void)
>  {
> +       struct sbi_trap_info trap = { 0 };
>         /*
>          * This function is expected to be called from:
>          * 1) nascent_init() platform callback which is called
> @@ -231,6 +233,11 @@ void imsic_local_irqchip_init(void)
>          *    in boot-up path.
>          */
>
> +       /* If Smaia not available then do nothing */
> +       csr_read_allowed(CSR_MTOPI, (ulong)&trap);
> +       if (trap.cause)
> +               return;
> +
>         /* Setup threshold to allow all enabled interrupts */
>         imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_ENABLE_EITHRESHOLD);
>
> --
> 2.34.1
>

