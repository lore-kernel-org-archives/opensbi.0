From: Anup Patel <anup@brainfault.org>
Date: Sat, 2 Mar 2024 18:22:40 +0530
Subject: [PATCH v3 1/6] lib: sbi: rename sbi_misaligned_ldst.c to sbi_trap_ldst.c
In-Reply-To: <1709378725-56656-2-git-send-email-ganboing@gmail.com>
References: <1709378725-56656-1-git-send-email-ganboing@gmail.com> <1709378725-56656-2-git-send-email-ganboing@gmail.com>
Message-ID: <CAAhSdy0YqwyAuDH_stR_y+39NH7J9Q0+bk8=N1L-Hjb=B-ZopA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 2, 2024 at 4:55?PM Bo Gan <ganboing@gmail.com> wrote:
>
> Signed-off-by: Bo Gan <ganboing@gmail.com>

Please carry Reviewed-by tags obtained in previous revision.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/objects.mk                                 | 2 +-
>  lib/sbi/{sbi_misaligned_ldst.c => sbi_trap_ldst.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename lib/sbi/{sbi_misaligned_ldst.c => sbi_trap_ldst.c} (100%)
>
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 0a50e95..204dd6b 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -70,7 +70,6 @@ libsbi-objs-y += sbi_illegal_insn.o
>  libsbi-objs-y += sbi_init.o
>  libsbi-objs-y += sbi_ipi.o
>  libsbi-objs-y += sbi_irqchip.o
> -libsbi-objs-y += sbi_misaligned_ldst.o
>  libsbi-objs-y += sbi_platform.o
>  libsbi-objs-y += sbi_pmu.o
>  libsbi-objs-y += sbi_dbtr.o
> @@ -80,6 +79,7 @@ libsbi-objs-y += sbi_system.o
>  libsbi-objs-y += sbi_timer.o
>  libsbi-objs-y += sbi_tlb.o
>  libsbi-objs-y += sbi_trap.o
> +libsbi-objs-y += sbi_trap_ldst.o
>  libsbi-objs-y += sbi_unpriv.o
>  libsbi-objs-y += sbi_expected_trap.o
>  libsbi-objs-y += sbi_cppc.o
> diff --git a/lib/sbi/sbi_misaligned_ldst.c b/lib/sbi/sbi_trap_ldst.c
> similarity index 100%
> rename from lib/sbi/sbi_misaligned_ldst.c
> rename to lib/sbi/sbi_trap_ldst.c
> --
> 2.7.4
>

