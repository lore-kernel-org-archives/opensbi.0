From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 30 Aug 2024 08:49:05 -0700
Subject: [PATCH 01/12] lib: sbi_init: Remove obsolete hartid check
In-Reply-To: <20240830154929.3971790-1-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com>
Message-ID: <20240830154929.3971790-2-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This check has been obsolete since commit c51f02cf143b ("include:
sbi_platform: Introduce HART index to HART id table"). It originally
filtered out harts that were disabled in the FDT, but those harts are
omitted from the hart_index2id table, so they will hang in fw_base.S
after the "Find HART index" loop and never enter sbi_init().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/sbi/sbi_init.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index d80efe97..7443010e 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -500,21 +500,11 @@ static atomic_t coldboot_lottery = ATOMIC_INITIALIZER(0);
  */
 void __noreturn sbi_init(struct sbi_scratch *scratch)
 {
-	u32 i, h;
-	bool hartid_valid		= false;
 	bool next_mode_supported	= false;
 	bool coldboot			= false;
 	u32 hartid			= current_hartid();
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
-	for (i = 0; i < plat->hart_count; i++) {
-		h = (plat->hart_index2id) ? plat->hart_index2id[i] : i;
-		if (h == hartid)
-			hartid_valid = true;
-	}
-	if (!hartid_valid)
-		sbi_hart_hang();
-
 	switch (scratch->next_mode) {
 	case PRV_M:
 		next_mode_supported = true;
-- 
2.45.1


