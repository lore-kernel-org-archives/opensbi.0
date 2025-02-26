From: Chao-ying Fu <icebergfu@gmail.com>
Date: Tue, 25 Feb 2025 16:53:29 -0800
Subject: [PATCH v2 05/11] platform: generic: mips: add extra scratch space
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
Message-ID: <20250226005335.19498-5-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We need extra scratch space used by the custom exception handler.
---
 include/sbi/sbi_scratch.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 0d188d1..ff8b75e 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -44,8 +44,16 @@
 #define SBI_SCRATCH_OPTIONS_OFFSET		(13 * __SIZEOF_POINTER__)
 /** Offset of hartindex member in sbi_scratch */
 #define SBI_SCRATCH_HARTINDEX_OFFSET		(14 * __SIZEOF_POINTER__)
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+#define MIPS_P8700_STW_SIZE			34
+/** Offset of stw_tmp in sbi_scratch */
+#define SBI_SCRATCH_STW_TMP_OFFSET		(15 * __SIZEOF_POINTER__)
+/** Offset of extra space in sbi_scratch */
+#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		((15 + MIPS_P8700_STW_SIZE) * __SIZEOF_POINTER__)
+#else
 /** Offset of extra space in sbi_scratch */
 #define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(15 * __SIZEOF_POINTER__)
+#endif
 /** Maximum size of sbi_scratch (4KB) */
 #define SBI_SCRATCH_SIZE			(0x1000)
 
@@ -87,6 +95,10 @@ struct sbi_scratch {
 	unsigned long options;
 	/** Index of the hart */
 	unsigned long hartindex;
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	/** for stw */
+	unsigned long stw_tmp[MIPS_P8700_STW_SIZE];
+#endif
 };
 
 /**
-- 
2.47.1


