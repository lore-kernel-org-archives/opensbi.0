From: Nam Cao <namcao@linutronix.de>
Date: Fri,  2 Feb 2024 14:43:27 +0100
Subject: [PATCH v3 6/7] platform: starfive: return error if needed devices are not present
In-Reply-To: <cover.1706880734.git.namcao@linutronix.de>
References: <cover.1706880734.git.namcao@linutronix.de>
Message-ID: <4f1504484813d64f8e8190e0174c4f5802cbbd6d.1706880734.git.namcao@linutronix.de>
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
index f64e016..63baddb 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -244,6 +244,8 @@ static int starfive_jh7110_inst_init(void *fdt)
 		if (rc)
 			goto err;
 		jh7110_inst.pmu_reg_base = addr;
+	} else {
+		return -SBI_ENODEV;
 	}
 
 	noff = fdt_node_offset_by_compatible(fdt, -1, "starfive,jh7110-syscrg");
@@ -252,6 +254,8 @@ static int starfive_jh7110_inst_init(void *fdt)
 		if (rc)
 			goto err;
 		jh7110_inst.clk_reg_base = addr;
+	} else {
+		return -SBI_ENODEV;
 	}
 
 	if (pmic_inst.adapter) {
-- 
2.39.2


