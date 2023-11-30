From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 30 Nov 2023 20:42:01 +0800
Subject: [PATCH v4 03/15] lib: sbi: Add XAndesPMU in hart extensions
In-Reply-To: <20231130124213.2590640-1-peterlin@andestech.com>
References: <20231130124213.2590640-1-peterlin@andestech.com>
Message-ID: <20231130124213.2590640-4-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the custom extension to hart extension list.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Changes v2 -> v3:
  - New patch
Changes v3 -> v4:
  - Include RB tags
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 6ee49ff..811e5f5 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -45,6 +45,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_ZKR,
 	/** Hart has Smcntrpmf extension */
 	SBI_HART_EXT_SMCNTRPMF,
+	/** Hart has Xandespmu extension */
+	SBI_HART_EXT_XANDESPMU,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bf8792a..c948373 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -694,6 +694,9 @@ static inline char *sbi_hart_extension_id2string(int ext)
 	case SBI_HART_EXT_SMCNTRPMF:
 		estr = "smcntrpmf";
 		break;
+	case SBI_HART_EXT_XANDESPMU:
+		estr = "xandespmu";
+		break;
 	default:
 		break;
 	}
-- 
2.34.1


