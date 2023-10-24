From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 24 Oct 2023 10:11:43 +0000
Subject: [PATCH v2 3/5] lib: sbi: Using one array to define the name of extensions
In-Reply-To: <20231024101145.32000-1-yongxuan.wang@sifive.com>
References: <20231024101145.32000-1-yongxuan.wang@sifive.com>
Message-ID: <20231024101145.32000-4-yongxuan.wang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Define an array sbi_hart_ext to map extension ID and name , and use it
for ISA parsing and printing out the supported extensions.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 include/sbi/sbi_hart.h     |  7 ++++
 lib/sbi/sbi_hart.c         | 72 ++++++++++++--------------------------
 lib/utils/fdt/fdt_helper.c |  5 ++-
 3 files changed, 34 insertions(+), 50 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index e60f415..33bf327 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -47,6 +47,13 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_MAX,
 };
 
+struct sbi_hart_ext_data {
+	const unsigned int id;
+	const char *name;
+};
+
+extern const struct sbi_hart_ext_data sbi_hart_ext[];
+
 /*
  * Smepmp enforces access boundaries between M-mode and
  * S/U-mode. When it is enabled, the PMPs are programmed
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 1589111..add0155 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -652,42 +652,22 @@ bool sbi_hart_has_extension(struct sbi_scratch *scratch,
 		return false;
 }
 
-static inline char *sbi_hart_extension_id2string(int ext)
-{
-	char *estr = NULL;
-
-	switch (ext) {
-	case SBI_HART_EXT_SMAIA:
-		estr = "smaia";
-		break;
-	case SBI_HART_EXT_SMSTATEEN:
-		estr = "smstateen";
-		break;
-	case SBI_HART_EXT_SSCOFPMF:
-		estr = "sscofpmf";
-		break;
-	case SBI_HART_EXT_SSTC:
-		estr = "sstc";
-		break;
-	case SBI_HART_EXT_ZICNTR:
-		estr = "zicntr";
-		break;
-	case SBI_HART_EXT_ZIHPM:
-		estr = "zihpm";
-		break;
-	case SBI_HART_EXT_SMEPMP:
-		estr = "smepmp";
-		break;
-	case SBI_HART_EXT_SMCNTRPMF:
-		estr = "smcntrpmf";
-		break;
-	default:
-		break;
-	}
-
-	return estr;
+#define __SBI_HART_EXT_DATA(_name, _id) {	\
+	.name = #_name,				\
+	.id = _id,				\
 }
 
+const struct sbi_hart_ext_data sbi_hart_ext[] = {
+	__SBI_HART_EXT_DATA(smaia, SBI_HART_EXT_SMAIA),
+	__SBI_HART_EXT_DATA(smepmp, SBI_HART_EXT_SMEPMP),
+	__SBI_HART_EXT_DATA(smstateen, SBI_HART_EXT_SMSTATEEN),
+	__SBI_HART_EXT_DATA(sscofpmf, SBI_HART_EXT_SSCOFPMF),
+	__SBI_HART_EXT_DATA(sstc, SBI_HART_EXT_SSTC),
+	__SBI_HART_EXT_DATA(zicntr, SBI_HART_EXT_ZICNTR),
+	__SBI_HART_EXT_DATA(zihpm, SBI_HART_EXT_ZIHPM),
+	__SBI_HART_EXT_DATA(smcntrpmf, SBI_HART_EXT_SMCNTRPMF),
+};
+
 /**
  * Get the hart extensions in string format
  *
@@ -702,8 +682,8 @@ void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
 {
 	struct sbi_hart_features *hfeatures =
 			sbi_scratch_offset_ptr(scratch, hart_features_offset);
-	int offset = 0, ext = 0;
-	char *temp;
+	int offset = 0;
+	size_t i;
 
 	if (!extensions_str || nestr <= 0)
 		return;
@@ -712,20 +692,14 @@ void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
 	if (!hfeatures->extensions)
 		goto done;
 
-	do {
-		if (hfeatures->extensions & BIT(ext)) {
-			temp = sbi_hart_extension_id2string(ext);
-			if (temp) {
-				sbi_snprintf(extensions_str + offset,
-					     nestr - offset,
-					     "%s,", temp);
-				offset = offset + sbi_strlen(temp) + 1;
-			}
+	for (i = 0; i < SBI_HART_EXT_MAX; i++) {
+		if (hfeatures->extensions & BIT(sbi_hart_ext[i].id)) {
+			sbi_snprintf(extensions_str + offset,
+				     nestr - offset,
+				     "%s,", sbi_hart_ext[i].name);
+			offset = offset + sbi_strlen(sbi_hart_ext[i].name) + 1;
 		}
-
-		ext++;
-	} while (ext < SBI_HART_EXT_MAX);
-
+	}
 done:
 	if (offset)
 		extensions_str[offset - 1] = '\0';
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 9ae7f09..9cef68a 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -375,7 +375,10 @@ static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
 				continue;			\
 			}
 
-		set_multi_letter_ext("smepmp", SBI_HART_EXT_SMEPMP);
+		for (j = 0; j < SBI_HART_EXT_MAX; j++) {
+			set_multi_letter_ext(sbi_hart_ext[j].name,
+					     sbi_hart_ext[j].id);
+		}
 #undef set_multi_letter_ext
 	}
 
-- 
2.17.1


