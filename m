From: Wei Liang Lim <weiliang.lim@starfivetech.com>
Date: Fri, 2 Dec 2022 14:38:45 +0800
Subject: [PATCH v2] lib: sbi: Add option to select boot hart
Message-ID: <20221202063845.14938-1-weiliang.lim@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In certain scenario, user needs to select a particular hart ID as the boot hart. This option provide the flexibility for user to select the preferred boot hart.

Signed-off-by: Wei Liang Lim <weiliang.lim@starfivetech.com>
Reviewed-by: Chee Hong Ang <cheehong.ang@starfivetech.com>
Reviewed-by: Jun Liang Tan <junliang.tan@starfivetech.com>
---
 firmware/objects.mk | 4 ++++
 lib/sbi/sbi_init.c  | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/firmware/objects.mk b/firmware/objects.mk
index a1704c4..2b41718 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -28,6 +28,10 @@ ifdef FW_TEXT_START
 firmware-genflags-y += -DFW_TEXT_START=$(FW_TEXT_START)
 endif
 
+ifdef FW_BOOT_HART_ID
+firmware-genflags-y += -DFW_BOOT_HART_ID=$(FW_BOOT_HART_ID)
+endif
+
 ifdef FW_FDT_PATH
 firmware-genflags-y += -DFW_FDT_PATH=\"$(FW_FDT_PATH)\"
 ifdef FW_FDT_PADDING
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a8500e5..28698f1 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -447,7 +447,9 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 			     scratch->next_mode, FALSE);
 }
 
+#ifndef FW_BOOT_HART_ID
 static atomic_t coldboot_lottery = ATOMIC_INITIALIZER(0);
+#endif
 
 /**
  * Initialize OpenSBI library for current HART and jump to next
@@ -498,7 +500,11 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 	 * HARTs which satisfy above condition.
 	 */
 
+#ifdef FW_BOOT_HART_ID
+	if (next_mode_supported && hartid == FW_BOOT_HART_ID)
+#else
 	if (next_mode_supported && atomic_xchg(&coldboot_lottery, 1) == 0)
+#endif
 		coldboot = TRUE;
 
 	/*
-- 
2.25.1


