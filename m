From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Mon, 21 Mar 2022 10:45:28 +0530
Subject: [RFC PATCH v1 3/3] lib: sbi: configure mstateen
In-Reply-To: <20220321051528.20143-1-mchitale@ventanamicro.com>
References: <20220321051528.20143-1-mchitale@ventanamicro.com>
Message-ID: <20220321051528.20143-4-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When mstateen registers are implemented, the AIA related
configurations need to be done in mstateen for the IMSIC
initialization to succeed.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 9d0c435..f5c44e1 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -80,6 +80,15 @@ static void mstatus_init(struct sbi_scratch *scratch)
 			mstateen_val |= (1UL << SMSTATEEN0_HSENVCFG);
 		else
 			mstateen_val &= ~(1UL << SMSTATEEN0_HSENVCFG);
+
+		if (sbi_hart_has_feature(scratch, SBI_HART_HAS_AIA))
+			mstateen_val |= (1UL << SMSTATEEN0_AIA |
+					1UL << SMSTATEEN0_SVSLCT |
+					1UL << SMSTATEEN0_IMSIC);
+		else
+			mstateen_val &= ~(1UL << SMSTATEEN0_AIA |
+					1UL << SMSTATEEN0_SVSLCT |
+					1UL << SMSTATEEN0_IMSIC);
 		csr_write(CSR_MSTATEEN0, mstateen_val);
 	}
 
-- 
2.17.1


