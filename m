From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Mar 2022 21:22:16 +0530
Subject: [PATCH 2/4] lib: sbi: Detect menvcfg CSR at boot time
In-Reply-To: <20220329155218.118580-1-apatel@ventanamicro.com>
References: <20220329155218.118580-1-apatel@ventanamicro.com>
Message-ID: <20220329155218.118580-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Atish Patra <atishp@rivosinc.com>

We add the menvcfg CSR as a HART feature and detect it at boot time
using traping mechanism.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hart.h | 4 +++-
 lib/sbi/sbi_hart.c     | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index a83b45b..57f80bc 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -26,9 +26,11 @@ enum sbi_hart_features {
 	SBI_HART_HAS_TIME = (1 << 4),
 	/** HART has AIA local interrupt CSRs */
 	SBI_HART_HAS_AIA = (1 << 5),
+	/** HART has menvcfg CSR */
+	SBI_HART_HAS_MENVCFG = (1 << 6),
 
 	/** Last index of Hart features*/
-	SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_AIA,
+	SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_MENVCFG,
 };
 
 struct sbi_scratch;
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index e028540..31c8f39 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -304,6 +304,9 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
 	case SBI_HART_HAS_AIA:
 		fstr = "aia";
 		break;
+	case SBI_HART_HAS_MENVCFG:
+		fstr = "menvcfg";
+		break;
 	default:
 		break;
 	}
@@ -534,6 +537,12 @@ __mhpm_skip:
 		goto __aia_skip;
 	hfeatures->features |= SBI_HART_HAS_AIA;
 __aia_skip:
+
+	/* Detect if hart has menvcfg CSR */
+	csr_read_allowed(CSR_MENVCFG, (unsigned long)&trap);
+	if (!trap.cause)
+		hfeatures->features |= SBI_HART_HAS_MENVCFG;
+
 	return;
 }
 
-- 
2.25.1


