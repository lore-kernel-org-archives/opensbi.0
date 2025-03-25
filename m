From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 16:43:25 -0700
Subject: [PATCH 02/10] platform: rzfive: Call andes_pma_setup_regions() only during cold boot
In-Reply-To: <20250325234342.711447-1-samuel.holland@sifive.com>
References: <20250325234342.711447-1-samuel.holland@sifive.com>
Message-ID: <20250325234342.711447-3-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This function accesses the FDT blob, which means it is only valid to
call during cold boot, before a lower privilege level has an opportunity
to clobber that memory.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 platform/generic/renesas/rzfive/rzfive.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
index 59084c41..db523088 100644
--- a/platform/generic/renesas/rzfive/rzfive.c
+++ b/platform/generic/renesas/rzfive/rzfive.c
@@ -27,8 +27,16 @@ static const struct andes_pma_region renesas_rzfive_pma_regions[] = {
 static int renesas_rzfive_final_init(bool cold_boot, void *fdt,
 				     const struct fdt_match *match)
 {
-	return andes_pma_setup_regions(fdt, renesas_rzfive_pma_regions,
-				       array_size(renesas_rzfive_pma_regions));
+	int rc;
+
+	if (cold_boot) {
+		rc = andes_pma_setup_regions(fdt, renesas_rzfive_pma_regions,
+					     array_size(renesas_rzfive_pma_regions));
+		if (rc)
+			return rc;
+	}
+
+	return 0;
 }
 
 static int renesas_rzfive_early_init(bool cold_boot, const void *fdt,
-- 
2.47.2


