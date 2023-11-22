From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 22 Nov 2023 15:36:05 +0800
Subject: [PATCH v3 03/15] lib: sbi: Add Xandespmu in hart extensions
In-Reply-To: <20231122073617.379441-1-peterlin@andestech.com>
References: <20231122073617.379441-1-peterlin@andestech.com>
Message-ID: <20231122073617.379441-4-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When SBI PMU updates inhibit bits on mcyclecfg and
minstretcfg, it will check if Smcntrpmf extension
is supported, we need to check Xandespmu similarly
in the pmu_fixed_ctr_update_inhibit_bits() so add
the custom extension to hart extension list.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
Changes v2 -> v3:
  - New patch
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
index 77eef49..d372af1 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -693,6 +693,9 @@ static inline char *sbi_hart_extension_id2string(int ext)
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


