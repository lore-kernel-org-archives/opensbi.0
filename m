From: Anup Patel <anup.patel@wdc.com>
Date: Wed,  9 Sep 2020 20:20:26 +0530
Subject: [PATCH 3/5] lib: utils: Improve fdt_cpu_fixup() implementation
In-Reply-To: <20200909145028.446794-1-anup.patel@wdc.com>
References: <20200909145028.446794-1-anup.patel@wdc.com>
Message-ID: <20200909145028.446794-4-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The fdt_cpu_fixup() should work fine even if HARTs without MMU
are not marked invalid by platform support code.

In future, we plan to treat HARTs without MMU as valid in the
generic platform support so that we can hold these HARTs in
HSM STOPPED state.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/utils/fdt/fdt_fixup.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 4da7397..8f554e1 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -21,7 +21,8 @@ void fdt_cpu_fixup(void *fdt)
 {
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
-	int err, cpu_offset, cpus_offset;
+	int err, cpu_offset, cpus_offset, len;
+	const char *mmu_type;
 	u32 hartid;
 
 	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
@@ -37,7 +38,15 @@ void fdt_cpu_fixup(void *fdt)
 		if (err)
 			continue;
 
-		if (sbi_platform_hart_invalid(plat, hartid))
+		/*
+		 * Disable a HART DT node if one of the following is true:
+		 * 1. The HART is marked invalid by platform support
+		 * 2. MMU is not available for the HART
+		 */
+
+		mmu_type = fdt_getprop(fdt, cpu_offset, "mmu-type", &len);
+		if (sbi_platform_hart_invalid(plat, hartid) ||
+		    !mmu_type || !len)
 			fdt_setprop_string(fdt, cpu_offset, "status",
 					   "disabled");
 	}
-- 
2.25.1


