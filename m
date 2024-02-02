From: yang.zhang <gaoshanliukou@163.com>
Date: Fri, 2 Feb 2024 15:20:08 +0800 (CST)
Subject: [PATCH] lib: sbi: Add sparse hartid support for mtimer/ipi
In-Reply-To: <20240201103020.21181-1-gaoshanliukou@163.com>
References: <20240201103020.21181-1-gaoshanliukou@163.com>
Message-ID: <52d7cf12.5c73.18d68b06b3f.Coremail.gaoshanliukou@163.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



The purpose of mentioning the "trap-n-emulate AMO" case is just to explain the context when issue happened.
The key point mayebe not the lock which i used, so i also emulate another case which is rdtime, if the platform does not
support read time csr, then it would trap, then sbi_emulate_csr_read can handle it correctly.But if trap earlier, then?
the issue is the same with us.
I completely agree with you ?If we are talking about other earlier traps,to me, that only means we have a bug in opensbi??So
i mentioned "?Of course, the above situation will not occur at present".
But, once we have a bug in opensbi in future, once phs_ptr_offset is zero? then?pmu_thishart_state_ptr would return scratch.fw_base,
for qemu is 0x80000000, if we don't add a check, it maybe intentionally breake text segment of opensbi, add additional debug difficulty meaningless.













At 2024-02-01 18:30:20, "yang.zhang" <gaoshanliukou@163.com> wrote:
>If hartid is sparse, such as 0, 7, 16..., mtimer/mswi
>can't work well.
>
>Test:
>1.Our platform support SMT, one core contains many harts
>whoes number is configurable, so the hartids is sparse when
>enter Opensbi?
>2.I just simply simulate a scenario on qemu, like below
>"qemu-system-riscv64 -M virt,aia=aplic -m 2g -smp 8 -dtb qemu2cpu.dtb
> -bios fw_jump.bin ..."
>There are total 8 cpus, but the dts only suppor 2 cpu nodes, hartid are
>0 and 7, so when enter opensbi, just hartid 0 and 7 are running, the others
>are hanged, like sparse hartid.Then the issue happened.
>Logs:
>OpenSBI v1.4-11-g0dcc2e6
>   ____                    _____ ____ _____
>  / __ \                  / ____|  _ \_   _|
> | |  | |_ __   ___ _ __ | (___ | |_) || |
> | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> | |__| | |_) |  __/ | | |____) | |_) || |_
>  \____/| .__/ \___|_| |_|_____/|____/_____|
>        | |
>        |_|
>
>init_coldboot: timer init failed (error -1000)
>
>Signed-off-by: yang.zhang <gaoshanliukou@163.com>
>---
> lib/utils/ipi/aclint_mswi.c     | 2 +-
> lib/utils/timer/aclint_mtimer.c | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
>index 4ae6bb1..3bbab8b 100644
>--- a/lib/utils/ipi/aclint_mswi.c
>+++ b/lib/utils/ipi/aclint_mswi.c
>@@ -102,7 +102,7 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
> 
> 	/* Update MSWI pointer in scratch space */
> 	for (i = 0; i < mswi->hart_count; i++) {
>-		scratch = sbi_hartid_to_scratch(mswi->first_hartid + i);
>+		scratch = sbi_hartindex_to_scratch(i);
> 		/*
> 		 * We don't need to fail if scratch pointer is not available
> 		 * because we might be dealing with hartid of a HART disabled
>diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
>index 271e625..77d5522 100644
>--- a/lib/utils/timer/aclint_mtimer.c
>+++ b/lib/utils/timer/aclint_mtimer.c
>@@ -218,7 +218,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
> 
> 	/* Update MTIMER pointer in scratch space */
> 	for (i = 0; i < mt->hart_count; i++) {
>-		scratch = sbi_hartid_to_scratch(mt->first_hartid + i);
>+		scratch = sbi_hartindex_to_scratch(i);
> 		/*
> 		 * We don't need to fail if scratch pointer is not available
> 		 * because we might be dealing with hartid of a HART disabled
>-- 
>2.25.1
