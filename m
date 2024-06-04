From: Inochi Amaoto <inochiama@outlook.com>
Date: Tue, 4 Jun 2024 19:39:35 +0800
Subject: [PATCH] lib: sbi: Respect boot hart setting in "dynamic" boot
 mode
In-Reply-To: <ef012d4c1669139883ac30463a5916f15c0195f9.camel@126.com>
References: <IA1PR20MB4953755DBB1AC6F757C586A7BBF82@IA1PR20MB4953.namprd20.prod.outlook.com>
 <ef012d4c1669139883ac30463a5916f15c0195f9.camel@126.com>
Message-ID: <IA1PR20MB4953DB498ACF69490314D930BBF82@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 04, 2024 at 07:26:03PM GMT, Xiang W wrote:
> ? 2024-06-04???? 18:33 +0800?Inochi Amaoto???
> > In "dynamic" boot mode, the boot hart is only used for the early
> > initialization, but not for the coldboot even if it is available.
> > This make the boot hart configuration in the dynamic mode
> > meaningless.
> > 
> > To solve this, add extra check for coldboot detection and fallback
> > to the lottery if the boot hart does not support coldboot.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> 
> It seems that someone has submitted a similar patch. But this is not
> necessary, see the comment of fw_dynamic_info.hartid:
> 
> 	/**
> 	 * Preferred boot HART id
> 	 *
> 	 * It is possible that the previous booting stage uses same link
> 	 * address as the FW_DYNAMIC firmware. In this case, the relocation
> 	 * lottery mechanism can potentially overwrite the previous booting
> 	 * stage while other HARTs are still running in the previous booting
> 	 * stage leading to boot-time crash. To avoid this boot-time crash,
> 	 * the previous booting stage can specify last HART that will jump
> 	 * to the FW_DYNAMIC firmware as the preferred boot HART.
> 	 *
> 	 * To avoid specifying a preferred boot HART, the previous booting
> 	 * stage can set it to -1UL which will force the FW_DYNAMIC firmware
> 	 * to use the relocation lottery mechanism.
> 	 */
> 
> If you need to specify the cold boot hart, you can set cold-boot-harts through dt.
> 
> Regards,
> Xiang W
> 

Thanks. It looks like I miss these things. Let's drop this patch.

> > ---
> > ?firmware/fw_dynamic.S? |? 4 +---
> > ?include/sbi/sbi_init.h |? 2 ++
> > ?lib/sbi/sbi_init.c???? | 14 +++++++++++++-
> > ?3 files changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
> > index 5ee2883..c08ba5f 100644
> > --- a/firmware/fw_dynamic.S
> > +++ b/firmware/fw_dynamic.S
> > @@ -66,7 +66,7 @@ fw_save_info:
> > ?	li	a4, FW_DYNAMIC_INFO_VERSION_2
> > ?	REG_L	a3, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
> > ?	blt	a3, a4, 2f
> > -	lla	a4, _dynamic_boot_hart
> > +	lla	a4, sbi_boot_hart
> > ?	REG_L	a3, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
> > ?	REG_S	a3, (a4)
> > ?2:
> > @@ -133,5 +133,3 @@ _dynamic_next_mode:
> > ?	RISCV_PTR PRV_S
> > ?_dynamic_options:
> > ?	RISCV_PTR 0x0
> > -_dynamic_boot_hart:
> > -	RISCV_PTR -1
> > diff --git a/include/sbi/sbi_init.h b/include/sbi/sbi_init.h
> > index 9640fee..dd88c23 100644
> > --- a/include/sbi/sbi_init.h
> > +++ b/include/sbi/sbi_init.h
> > @@ -22,4 +22,6 @@ unsigned long sbi_init_count(u32 hartid);
> > ?
> > ?void __noreturn sbi_exit(struct sbi_scratch *scratch);
> > ?
> > +extern long sbi_boot_hart;
> > +
> > ?#endif
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> > index 389172a..70ff4d7 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -18,6 +18,7 @@
> > ?#include <sbi/sbi_hartmask.h>
> > ?#include <sbi/sbi_heap.h>
> > ?#include <sbi/sbi_hsm.h>
> > +#include <sbi/sbi_init.h>
> > ?#include <sbi/sbi_ipi.h>
> > ?#include <sbi/sbi_irqchip.h>
> > ?#include <sbi/sbi_platform.h>
> > @@ -479,6 +480,8 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
> > ?
> > ?static atomic_t coldboot_lottery = ATOMIC_INITIALIZER(0);
> > ?
> > +long sbi_boot_hart = -1;
> > +
> > ?/**
> > ? * Initialize OpenSBI library for current HART and jump to next
> > ? * booting stage.
> > @@ -532,9 +535,18 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
> > ?	 *
> > ?	 * We use a lottery mechanism to select coldboot HART among
> > ?	 * HARTs which satisfy above condition.
> > +	 *
> > +	 * If user set the boot HART, we will check whether it supports
> > +	 * coldboot, and boot the system with the selected one if the
> > +	 * check success. Otherwise, we fall back to any supported HART
> > +	 * selected from the lottery mechanism.
> > ?	 */
> > ?
> > -	if (sbi_platform_cold_boot_allowed(plat, hartid)) {
> > +	if (sbi_boot_hart != -1 &&
> > +	??? sbi_platform_cold_boot_allowed(plat, sbi_boot_hart)) {
> > +		if (sbi_boot_hart == hartid)
> > +			coldboot = true;
> > +	} else if (sbi_platform_cold_boot_allowed(plat, hartid)) {
> > ?		if (next_mode_supported &&
> > ?		??? atomic_xchg(&coldboot_lottery, 1) == 0)
> > ?			coldboot = true;
> > -- 
> > 2.45.2
> > 
> > 
> 

