From: Anup Patel <anup.patel@wdc.com>
Date: Wed,  9 Sep 2020 20:20:27 +0530
Subject: [PATCH 4/5] lib: sbi: Ensure coldboot HART supports next privilege
 mode
In-Reply-To: <20200909145028.446794-1-anup.patel@wdc.com>
References: <20200909145028.446794-1-anup.patel@wdc.com>
Message-ID: <20200909145028.446794-5-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The coldboot HART jumps to the next booting stage at the end of
init_coldboot() so it is absolutely necessary for coldboot HART
to support the privilege mode expected by the next booting stage.

We extend the coldboot HART selection in sbi_init() to ensure that
the selected coldboot HART always supports privilege mode specified
in scratch space (i.e. scratch->next_mode). This will further help
us allow E-core (without MMU) on SiFive Unleashed and PolarFire
ICICLE boards to proceed further and wait in HSM STOPPED state.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/sbi/sbi_init.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index e1a1d96..65d81ba 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -295,6 +295,7 @@ static atomic_t coldboot_lottery = ATOMIC_INITIALIZER(0);
  */
 void __noreturn sbi_init(struct sbi_scratch *scratch)
 {
+	bool next_mode_supported	= FALSE;
 	bool coldboot			= FALSE;
 	u32 hartid			= current_hartid();
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
@@ -303,7 +304,33 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 	    sbi_platform_hart_invalid(plat, hartid))
 		sbi_hart_hang();
 
-	if (atomic_xchg(&coldboot_lottery, 1) == 0)
+	switch (scratch->next_mode) {
+	case PRV_M:
+		next_mode_supported = TRUE;
+		break;
+	case PRV_S:
+		if (misa_extension('S'))
+			next_mode_supported = TRUE;
+		break;
+	case PRV_U:
+		if (misa_extension('U'))
+			next_mode_supported = TRUE;
+		break;
+	default:
+		sbi_hart_hang();
+	}
+
+	/*
+	 * Only the HART supporting privilege mode specified in the
+	 * scratch->next_mode should be allowed to become the coldboot
+	 * HART because the coldboot HART will be directly jumping to
+	 * the next booting stage.
+	 *
+	 * We use a lottery mechanism to select coldboot HART among
+	 * HARTs which satisfy above condition.
+	 */
+
+	if (next_mode_supported && atomic_xchg(&coldboot_lottery, 1) == 0)
 		coldboot = TRUE;
 
 	if (coldboot)
-- 
2.25.1


