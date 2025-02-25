From: Alvin Chang <alvinga@andestech.com>
Date: Tue, 25 Feb 2025 09:16:40 +0800
Subject: [PATCH v2 4/4] lib: sbi: sbi_init: Allocate MPXY state for each domain
In-Reply-To: <20250225011640.949660-1-alvinga@andestech.com>
References: <20250225011640.949660-1-alvinga@andestech.com>
Message-ID: <20250225011640.949660-5-alvinga@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Each domain need its own shared memory region. Adjust the
sbi_mpxy_init() after sbi_domain_finalize() so OpenSBI
can populate domains from device-tree and allocate their
own MPXY state.

Signed-off-by: Yong Li <yong.li@intel.com>
Tested-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Tested-by: Alvin Chang <alvinga@andestech.com>
Reviewed-by: Alvin Chang <alvinga@andestech.com>
---
 lib/sbi/sbi_init.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 62c3268..e144e61 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -313,12 +313,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 	}
 
-	rc = sbi_mpxy_init(scratch);
-	if (rc) {
-		sbi_printf("%s: mpxy init failed (error %d)\n", __func__, rc);
-		sbi_hart_hang();
-	}
-
 	/*
 	 * Note: Finalize domains after HSM initialization
 	 * Note: Finalize domains before HART PMP configuration so
@@ -331,6 +325,16 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 	}
 
+	/*
+	 * Note: Each domain needs its own MPXY shared memory region.
+	 * Note: Initialize the MPXY after sbi_domain_finalize().
+	 */
+	rc = sbi_mpxy_init(scratch);
+	if (rc) {
+		sbi_printf("%s: mpxy init failed (error %d)\n", __func__, rc);
+		sbi_hart_hang();
+	}
+
 	/*
 	 * Note: Platform final initialization should be after finalizing
 	 * domains so that it sees correct domain assignment and PMP
-- 
2.34.1


