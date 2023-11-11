From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Sat, 11 Nov 2023 04:26:40 +0100
Subject: [PATCH 1/1] lib: fix access to hfeatures->extensions
Message-ID: <20231111032640.38175-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We may in future have more than xlen ISA extensions supported by OpenSBI.
Commit 6259b2ec2d09 ("lib: utils/fdt: Fix fdt_parse_isa_extensions()
implementation") therefore assumes that hfeatures->extensions is an array.
We have to make this change in the rest of the code too.

Fixes: 6259b2ec2d09 ("lib: utils/fdt: Fix fdt_parse_isa_extensions() implementation")
Addresses-Coverity-ID: 1568357 Out-of-bounds access
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 include/sbi/sbi_hart.h      |  3 ++-
 lib/sbi/sbi_hart.c          | 46 ++++++++++++++++++++-----------------
 platform/generic/platform.c |  2 +-
 3 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index e60f415..9a5335a 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -10,6 +10,7 @@
 #ifndef __SBI_HART_H__
 #define __SBI_HART_H__
 
+#include <sbi/sbi_bitops.h>
 #include <sbi/sbi_types.h>
 
 /** Possible privileged specification versions of a hart */
@@ -65,7 +66,7 @@ enum sbi_hart_extensions {
 struct sbi_hart_features {
 	bool detected;
 	int priv_version;
-	unsigned long extensions;
+	unsigned long extensions[BITS_TO_LONGS(SBI_HART_EXT_MAX)];
 	unsigned int pmp_count;
 	unsigned int pmp_addr_bits;
 	unsigned long pmp_gran;
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 29d6481..c3fccb3 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -614,9 +614,9 @@ static inline void __sbi_hart_update_extension(
 					bool enable)
 {
 	if (enable)
-		hfeatures->extensions |= BIT(ext);
+		hfeatures->extensions[BIT_WORD(ext)] |= BIT_MASK(ext);
 	else
-		hfeatures->extensions &= ~BIT(ext);
+		hfeatures->extensions[BIT_WORD(ext)] &= ~BIT_MASK(ext);
 }
 
 /**
@@ -649,7 +649,7 @@ bool sbi_hart_has_extension(struct sbi_scratch *scratch,
 	struct sbi_hart_features *hfeatures =
 			sbi_scratch_offset_ptr(scratch, hart_features_offset);
 
-	if (hfeatures->extensions & BIT(ext))
+	if (hfeatures->extensions[BIT_WORD(ext)] & BIT_MASK(ext))
 		return true;
 	else
 		return false;
@@ -705,31 +705,35 @@ void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
 {
 	struct sbi_hart_features *hfeatures =
 			sbi_scratch_offset_ptr(scratch, hart_features_offset);
-	int offset = 0, ext = 0;
-	char *temp;
+	int offset = 0;
 
 	if (!extensions_str || nestr <= 0)
 		return;
 	sbi_memset(extensions_str, 0, nestr);
 
-	if (!hfeatures->extensions)
-		goto done;
-
-	do {
-		if (hfeatures->extensions & BIT(ext)) {
-			temp = sbi_hart_extension_id2string(ext);
-			if (temp) {
-				sbi_snprintf(extensions_str + offset,
-					     nestr - offset,
-					     "%s,", temp);
-				offset = offset + sbi_strlen(temp) + 1;
+	for (int word = 0; word < BITS_TO_LONGS(SBI_HART_EXT_MAX); ++word) {
+		int ext;
+
+		if (!hfeatures->extensions[word])
+			continue;
+
+		ext = word * BITS_PER_LONG;
+		for (int bit = 0; bit < BITS_PER_LONG && ext < SBI_HART_EXT_MAX;
+		     ++bit, ++ext) {
+			char *temp;
+
+			if (hfeatures->extensions[word] & BIT(bit)) {
+				temp = sbi_hart_extension_id2string(ext);
+				if (temp) {
+					sbi_snprintf(extensions_str + offset,
+						     nestr - offset,
+						     "%s,", temp);
+					offset += sbi_strlen(temp) + 1;
+				}
 			}
 		}
+	}
 
-		ext++;
-	} while (ext < SBI_HART_EXT_MAX);
-
-done:
 	if (offset)
 		extensions_str[offset - 1] = '\0';
 	else
@@ -799,7 +803,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 		return 0;
 
 	/* Clear hart features */
-	hfeatures->extensions = 0;
+	sbi_memset(hfeatures->extensions, 0, sizeof(hfeatures->extensions));
 	hfeatures->pmp_count = 0;
 	hfeatures->mhpm_mask = 0;
 
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 66a0b77..9182faa 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -215,7 +215,7 @@ static int generic_extensions_init(struct sbi_hart_features *hfeatures)
 
 	/* Parse the ISA string from FDT and enable the listed extensions */
 	rc = fdt_parse_isa_extensions(fdt_get_address(), current_hartid(),
-				      &hfeatures->extensions);
+				      hfeatures->extensions);
 
 	if (rc)
 		return rc;
-- 
2.40.1


