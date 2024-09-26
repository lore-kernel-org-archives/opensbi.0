From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Sep 2024 11:37:16 +0530
Subject: [PATCH 06/12] lib: sbi_ecall_legacy: Use SBI v0.2 encoding for
 "all harts"
In-Reply-To: <20240830154929.3971790-7-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com> <20240830154929.3971790-7-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1E+8-Et8DZ0mKVxw4rrA=1sZO0Eb2ovNyn6dF74dAnkA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 9:19?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This simplifies the logic so that sbi_hsm_hart_interruptible_mask() is
> only called from one place (sbi_ipi_send_many()). A minor functional
> change is that the legacy functions can now affect more than XLEN harts
> when targeting all harts.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  lib/sbi/sbi_ecall_legacy.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
> index 9a1ae1e4..25e9a1e8 100644
> --- a/lib/sbi/sbi_ecall_legacy.c
> +++ b/lib/sbi/sbi_ecall_legacy.c
> @@ -14,7 +14,6 @@
>  #include <sbi/sbi_ecall.h>
>  #include <sbi/sbi_ecall_interface.h>
>  #include <sbi/sbi_error.h>
> -#include <sbi/sbi_hsm.h>
>  #include <sbi/sbi_ipi.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_system.h>
> @@ -24,7 +23,7 @@
>  #include <sbi/sbi_unpriv.h>
>  #include <sbi/sbi_hart.h>
>
> -static bool sbi_load_hart_mask_unpriv(ulong *pmask, ulong *hmask,
> +static bool sbi_load_hart_mask_unpriv(ulong *pmask, ulong *hmask, ulong *hbase,
>                                       struct sbi_trap_info *uptrap)
>  {
>         ulong mask = 0;
> @@ -33,9 +32,9 @@ static bool sbi_load_hart_mask_unpriv(ulong *pmask, ulong *hmask,
>                 mask = sbi_load_ulong(pmask, uptrap);
>                 if (uptrap->cause)
>                         return false;
> +               *hbase = 0;
>         } else {
> -               sbi_hsm_hart_interruptible_mask(sbi_domain_thishart_ptr(),
> -                                               0, &mask);
> +               *hbase = -1UL;
>         }
>         *hmask = mask;
>
> @@ -50,7 +49,7 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
>         struct sbi_tlb_info tlb_info;
>         u32 source_hart = current_hartid();
>         struct sbi_trap_info trap = {0};
> -       ulong hmask = 0;
> +       ulong hmask, hbase;
>
>         switch (extid) {
>         case SBI_EXT_0_1_SET_TIMER:
> @@ -71,8 +70,8 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
>                 break;
>         case SBI_EXT_0_1_SEND_IPI:
>                 if (sbi_load_hart_mask_unpriv((ulong *)regs->a0,
> -                                               &hmask, &trap)) {
> -                       ret = sbi_ipi_send_smode(hmask, 0);
> +                                             &hmask, &hbase, &trap)) {
> +                       ret = sbi_ipi_send_smode(hmask, hbase);
>                 } else {
>                         sbi_trap_redirect(regs, &trap);
>                         out->skip_regs_update = true;
> @@ -80,10 +79,10 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
>                 break;
>         case SBI_EXT_0_1_REMOTE_FENCE_I:
>                 if (sbi_load_hart_mask_unpriv((ulong *)regs->a0,
> -                                               &hmask, &trap)) {
> +                                             &hmask, &hbase, &trap)) {
>                         SBI_TLB_INFO_INIT(&tlb_info, 0, 0, 0, 0,
>                                           SBI_TLB_FENCE_I, source_hart);
> -                       ret = sbi_tlb_request(hmask, 0, &tlb_info);
> +                       ret = sbi_tlb_request(hmask, hbase, &tlb_info);
>                 } else {
>                         sbi_trap_redirect(regs, &trap);
>                         out->skip_regs_update = true;
> @@ -91,10 +90,10 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
>                 break;
>         case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
>                 if (sbi_load_hart_mask_unpriv((ulong *)regs->a0,
> -                                               &hmask, &trap)) {
> +                                             &hmask, &hbase, &trap)) {
>                         SBI_TLB_INFO_INIT(&tlb_info, regs->a1, regs->a2, 0, 0,
>                                           SBI_TLB_SFENCE_VMA, source_hart);
> -                       ret = sbi_tlb_request(hmask, 0, &tlb_info);
> +                       ret = sbi_tlb_request(hmask, hbase, &tlb_info);
>                 } else {
>                         sbi_trap_redirect(regs, &trap);
>                         out->skip_regs_update = true;
> @@ -102,12 +101,12 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
>                 break;
>         case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
>                 if (sbi_load_hart_mask_unpriv((ulong *)regs->a0,
> -                                               &hmask, &trap)) {
> +                                             &hmask, &hbase, &trap)) {
>                         SBI_TLB_INFO_INIT(&tlb_info, regs->a1,
>                                           regs->a2, regs->a3, 0,
>                                           SBI_TLB_SFENCE_VMA_ASID,
>                                           source_hart);
> -                       ret = sbi_tlb_request(hmask, 0, &tlb_info);
> +                       ret = sbi_tlb_request(hmask, hbase, &tlb_info);
>                 } else {
>                         sbi_trap_redirect(regs, &trap);
>                         out->skip_regs_update = true;
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

