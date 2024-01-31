From: Nam Cao <namcao@linutronix.de>
Date: Wed, 31 Jan 2024 14:09:06 +0100
Subject: [PATCH 4/5] platform: starfive: return error if needed devices are not present
In-Reply-To: <cover.1706705649.git.namcao@linutronix.de>
References: <cover.1706705649.git.namcao@linutronix.de>
Message-ID: <f06c9c0343b85bb992869add6dff25a18ffee4d7.1706705649.git.namcao@linutronix.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jh7110's reset driver needs power management device and clock controller
device to work. Currently, the driver proceed anyway without these
devices, and invalid addresses (jh7110_inst.pmu_reg_base and
jh7110_inst.clk_reg_base) are used during reboot, which causes
unpredictable broken behaviors.

If these devices are not present, return -SBI_ENODEV.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 platform/generic/starfive/jh7110.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index cb8c48d..f9942d3 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -246,6 +246,8 @@ static int starfive_jh7110_inst_init(void *fdt)
 		if (rc)
 			goto err;
 		jh7110_inst.pmu_reg_base = addr;
+	} else {
+		return -SBI_ENODEV;
 	}
 
 	noff = fdt_node_offset_by_compatible(fdt, -1, "starfive,jh7110-clkgen");
@@ -254,6 +256,8 @@ static int starfive_jh7110_inst_init(void *fdt)
 		if (rc)
 			goto err;
 		jh7110_inst.clk_reg_base = addr;
+	} else {
+		return -SBI_ENODEV;
 	}
 
 	if (pmic_inst.adapter) {
-- 
2.39.2


