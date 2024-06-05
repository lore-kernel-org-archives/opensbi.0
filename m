From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed,  5 Jun 2024 20:11:10 +0800
Subject: [PATCH v4 2/2] lib: utils/fdt: fixup DT when both Svade and Svadu are in DT
In-Reply-To: <20240605121110.14784-1-yongxuan.wang@sifive.com>
References: <20240605121110.14784-1-yongxuan.wang@sifive.com>
Message-ID: <20240605121110.14784-3-yongxuan.wang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Delete Svadu when bot Svade and Svadu are present in DT. This will be
removed after we have FWFT support.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 lib/utils/fdt/fdt_fixup.c | 71 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 974b1b883eb4..77a2bee79d95 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_math.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_error.h>
@@ -108,9 +109,11 @@ int fdt_add_cpu_idle_states(void *fdt, const struct sbi_cpu_idle_state *state)
 void fdt_cpu_fixup(void *fdt)
 {
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	int err, cpu_offset, cpus_offset, len;
-	const char *mmu_type;
+	int err, cpu_offset, cpus_offset, len, idx;
+	const char *mmu_type, *isa;
+	char *new_isa = NULL;
 	u32 hartid;
+	bool has_svadu, has_svade;
 
 	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
 	if (err < 0)
@@ -139,6 +142,70 @@ void fdt_cpu_fixup(void *fdt)
 		    !mmu_type || !len)
 			fdt_setprop_string(fdt, cpu_offset, "status",
 					   "disabled");
+
+		/*
+		 * Delete Svadu when both Svade and Svadu are in DT. This will be removed after
+		 * we have FWFT extension.
+		 */
+
+		isa = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
+		if (isa) {
+			has_svadu = has_svade = false;
+			idx = 0;
+
+			for (int i = 0; i < len; i++) {
+				if (isa[i] != '_')
+					continue;
+
+				/* Skip the '_' character */
+				if (!sbi_strncmp(isa + i + 1, "svadu", 5)) {
+					has_svadu = true;
+					idx = i + 1;
+				} else if (!sbi_strncmp(isa + i + 1, "svade", 5)) {
+					has_svade = true;
+				}
+			}
+
+			if (has_svadu && has_svade) {
+				new_isa = sbi_calloc(sizeof(char), len - 6);
+
+				idx--;
+				sbi_memcpy(new_isa, isa, idx);
+				sbi_memcpy(new_isa + idx, isa + idx + 6, sbi_strlen(isa + idx + 6));
+
+				fdt_setprop_string(fdt, cpu_offset, "riscv,isa", new_isa);
+				sbi_free(new_isa);
+			}
+		}
+
+		isa = fdt_getprop(fdt, cpu_offset, "riscv,isa-extensions", &len);
+		if (isa) {
+			idx = fdt_stringlist_search(fdt, cpu_offset, "riscv,isa-extensions",
+						    "svadu");
+			has_svade = fdt_stringlist_contains(isa, len, "svade");
+
+			if (idx >= 0 && has_svade) {
+				const char *p;
+				int len1, len2;
+
+				new_isa = sbi_calloc(sizeof(char), len - 6);
+				p = fdt_stringlist_get(fdt, cpu_offset, "riscv,isa-extensions",
+						       idx, &len1);
+				len2 = p - isa;
+				sbi_memcpy(new_isa, isa, len2);
+
+				p = fdt_stringlist_get(fdt, cpu_offset,	"riscv,isa-extensions",
+						       idx + 1, &len1);
+
+				if (p)
+					sbi_memcpy(new_isa + len2, isa + len2 + 6,
+						   isa + len - p + 1);
+
+				fdt_setprop(fdt, cpu_offset, "riscv,isa-extensions", new_isa,
+					    len - 6);
+				sbi_free(new_isa);
+			}
+		}
 	}
 }
 
-- 
2.17.1


