From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 12 Jul 2023 10:04:30 +0530
Subject: [PATCH v3 04/10] lib: sbi: Add smepmp in hart extensions
In-Reply-To: <20230712043436.100548-1-hchauhan@ventanamicro.com>
References: <20230706104928.3391947-1-hchauhan@ventanamicro.com>
 <20230712043436.100548-1-hchauhan@ventanamicro.com>
Message-ID: <20230712043436.100548-5-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Add Smepmp as extension in sbi_hart_extensions enum
- Return "smepmp" string for Smepmp extension from sbi_hart_extension_id2string

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index b97f78c..8b0e896 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -28,6 +28,8 @@ enum sbi_hart_priv_versions {
 enum sbi_hart_extensions {
 	/** HART has AIA M-mode CSRs */
 	SBI_HART_EXT_SMAIA = 0,
+	/** HART has Smepmp */
+	SBI_HART_EXT_SMEPMP,
 	/** HART has Smstateen CSR **/
 	SBI_HART_EXT_SMSTATEEN,
 	/** Hart has Sscofpmt extension */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0c27fd7..4dfa170 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -456,6 +456,9 @@ static inline char *sbi_hart_extension_id2string(int ext)
 	case SBI_HART_EXT_ZIHPM:
 		estr = "zihpm";
 		break;
+	case SBI_HART_EXT_SMEPMP:
+		estr = "smepmp";
+		break;
 	default:
 		break;
 	}
-- 
2.34.1


