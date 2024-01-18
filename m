From: Nam Cao <namcao@linutronix.de>
Date: Thu, 18 Jan 2024 10:20:09 +0100
Subject: [PATCH v2 1/2] platform: starfive: correct system clock device tree node
Message-ID: <55183c9a19dc5fc4dd9152c0055016b076ac9c23.1705569454.git.namcao@linutronix.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Starfive names the system clock device tree node "starfive,jh7110-clkgen"
in all their git repositories. However, a different name is used in
upstream U-Boot (and also Linux): "starfive,jh7110-syscrg". Since
OpenSBI gets the device tree from U-Boot, this inconsistency leads the
problem that OpenSBI doesn't know the system clock device exists.

Correct this name to keep the consistency.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
v2: no change.

 platform/generic/starfive/jh7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index dcd6306..4b22175 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -252,7 +252,7 @@ static int starfive_jh7110_inst_init(void *fdt)
 		jh7110_inst.pmu_reg_base = addr;
 	}
 
-	noff = fdt_node_offset_by_compatible(fdt, -1, "starfive,jh7110-clkgen");
+	noff = fdt_node_offset_by_compatible(fdt, -1, "starfive,jh7110-syscrg");
 	if (-1 < noff) {
 		rc = fdt_get_node_addr_size(fdt, noff, 0, &addr, NULL);
 		if (rc)
-- 
2.39.2


