From: Nam Cao <namcao@linutronix.de>
Date: Thu, 22 Feb 2024 09:16:18 +0100
Subject: [PATCH v5 5/6] platform: starfive: return error if needed devices are not present
In-Reply-To: <20240222081619.275869-1-namcao@linutronix.de>
References: <20240222081619.275869-1-namcao@linutronix.de>
Message-ID: <20240222081619.275869-6-namcao@linutronix.de>
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
Tested-by: Minda Chen <minda.chen@starfivetech.com>
---
 platform/generic/starfive/jh7110.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index b0b1e35..6990425 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -243,6 +243,8 @@ static int starfive_jh7110_inst_init(void *fdt)
 		if (rc)
 			goto err;
 		jh7110_inst.pmu_reg_base = addr;
+	} else {
+		return -SBI_ENODEV;
 	}
 
 	noff = fdt_node_offset_by_compatible(fdt, -1, "starfive,jh7110-syscrg");
@@ -251,6 +253,8 @@ static int starfive_jh7110_inst_init(void *fdt)
 		if (rc)
 			goto err;
 		jh7110_inst.clk_reg_base = addr;
+	} else {
+		return -SBI_ENODEV;
 	}
 
 	if (pmic_inst.adapter) {
-- 
2.39.2


