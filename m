From: Yao Zi <ziyao@disroot.org>
Date: Tue, 25 Feb 2025 15:41:03 +0000
Subject: [PATCH 2/2] lib: utils: fdt: Claim Zicntr if time CSR emulation is possible
In-Reply-To: <20250225154103.5229-1-ziyao@disroot.org>
References: <20250225154103.5229-1-ziyao@disroot.org>
Message-ID: <20250225154103.5229-3-ziyao@disroot.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

OpenSBI is capable of emulating time CSR through an external timer for
HARTs that don't implement a full Zicntr extension. Let's register
Zicntr extension in the FDT if CSR emulation is active.

This avoids hardcoding the extension in the devicetree, which may
confuse pre-SBI bootloaders.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 lib/utils/fdt/fdt_fixup.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 192d6dd..341cada 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -16,6 +16,7 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_timer.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_pmu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
@@ -107,10 +108,22 @@ int fdt_add_cpu_idle_states(void *fdt, const struct sbi_cpu_idle_state *state)
 
 void fdt_cpu_fixup(void *fdt)
 {
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	int err, cpu_offset, cpus_offset, len;
-	const char *mmu_type;
+	const char *mmu_type, *extensions;
 	u32 hartid, hartindex;
+	bool emulated_zicntr;
+
+	/*
+	 * Claim Zicntr extension in riscv,isa-extensions if
+	 *  1. OpenSBI can emulate time CSR with a timer
+	 *  2. The other two CSRs specified by Zicntr are available
+	 */
+	emulated_zicntr = sbi_timer_get_device() != NULL &&
+			  sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR_CYCLE) &&
+			  sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR_INSTRET);
+
 
 	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
 	if (err < 0)
@@ -140,6 +153,21 @@ void fdt_cpu_fixup(void *fdt)
 		    !mmu_type || !len)
 			fdt_setprop_string(fdt, cpu_offset, "status",
 					   "disabled");
+
+		if (!emulated_zicntr)
+			continue;
+
+		extensions = fdt_getprop(fdt, cpu_offset,
+					 "riscv,isa-extensions", &len);
+		if (!extensions ||
+		    !fdt_stringlist_contains(extensions, len, "zicntr")) {
+			err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 16);
+			if (err)
+				continue;
+
+			fdt_appendprop_string(fdt, cpu_offset,
+					      "riscv,isa-extensions", "zicntr");
+		}
 	}
 }
 
-- 
2.48.1


