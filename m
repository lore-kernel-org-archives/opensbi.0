From: Anup Patel <apatel@ventanamicro.com>
Date: Wed,  5 Jul 2023 17:28:03 +0530
Subject: [PATCH 2/4] lib: sbi: Add Zihpm as a HART ISA extension
In-Reply-To: <20230705115805.1054915-1-apatel@ventanamicro.com>
References: <20230705115805.1054915-1-apatel@ventanamicro.com>
Message-ID: <20230705115805.1054915-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Recently ratified Zihpm ISA extension covers all [m]hpm* CSRs
so we add Zihpm as a HART ISA extension in OpenSBI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index d48940d..938248f 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -36,6 +36,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SMSTATEEN,
 	/** HART has Sstc extension */
 	SBI_HART_EXT_SSTC,
+	/** HART has Zihpm extension */
+	SBI_HART_EXT_ZIHPM,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index c470482..435771c 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -453,6 +453,9 @@ static inline char *sbi_hart_extension_id2string(int ext)
 	case SBI_HART_EXT_SMSTATEEN:
 		estr = "smstateen";
 		break;
+	case SBI_HART_EXT_ZIHPM:
+		estr = "zihpm";
+		break;
 	default:
 		break;
 	}
@@ -637,6 +640,9 @@ __pmp_skip:
 	 */
 
 __mhpm_skip:
+	if (hfeatures->mhpm_count)
+		__sbi_hart_update_extension(hfeatures,
+					SBI_HART_EXT_ZIHPM, true);
 
 #undef __check_csr_64
 #undef __check_csr_32
-- 
2.34.1


