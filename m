From: Anup Patel <apatel@ventanamicro.com>
Date: Thu,  6 Jul 2023 09:45:40 +0530
Subject: [PATCH v2 2/4] lib: sbi: Add Zihpm as a HART ISA extension
In-Reply-To: <20230706041542.1069059-1-apatel@ventanamicro.com>
References: <20230706041542.1069059-1-apatel@ventanamicro.com>
Message-ID: <20230706041542.1069059-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Recently ratified Zihpm ISA extension covers all [m]hpm* CSRs
so we add Zihpm as a HART ISA extension in OpenSBI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 8 ++++++++
 2 files changed, 10 insertions(+)

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
index c470482..ff6f582 100644
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
@@ -706,6 +709,11 @@ __mhpm_skip:
 	if (rc)
 		return rc;
 
+	/* Extensions implied by other extensions and features */
+	if (hfeatures->mhpm_count)
+		__sbi_hart_update_extension(hfeatures,
+					SBI_HART_EXT_ZIHPM, true);
+
 	/* Mark hart feature detection done */
 	hfeatures->detected = true;
 
-- 
2.34.1


