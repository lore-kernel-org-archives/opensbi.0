From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu,  6 Jul 2023 16:19:24 +0530
Subject: [PATCH v2 4/8] lib: sbi: Add smepmp in hart extensions
In-Reply-To: <20230706104928.3391947-1-hchauhan@ventanamicro.com>
References: <20230620143212.2701598-1-hchauhan@ventanamicro.com>
 <20230706104928.3391947-1-hchauhan@ventanamicro.com>
Message-ID: <20230706104928.3391947-5-hchauhan@ventanamicro.com>
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
index 95b40e7..9957565 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -36,6 +36,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SMSTATEEN,
 	/** HART has Sstc extension */
 	SBI_HART_EXT_SSTC,
+	/** HART has Smepmp */
+	SBI_HART_EXT_SMEPMP,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 6e52cbd..7b9d5dc 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -453,6 +453,9 @@ static inline char *sbi_hart_extension_id2string(int ext)
 	case SBI_HART_EXT_SMSTATEEN:
 		estr = "smstateen";
 		break;
+	case SBI_HART_EXT_SMEPMP:
+		estr = "smepmp";
+		break;
 	default:
 		break;
 	}
-- 
2.34.1


