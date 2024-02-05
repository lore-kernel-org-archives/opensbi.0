From: Nam Cao <namcao@linutronix.de>
Date: Mon,  5 Feb 2024 09:49:02 +0100
Subject: [PATCH v4 7/7] platform: starfive: call starfive_jh7110_inst_init() in pm_reset_init()
In-Reply-To: <cover.1707122766.git.namcao@linutronix.de>
References: <cover.1707122766.git.namcao@linutronix.de>
Message-ID: <f868f77b9e776c53086e9d01352c60b04fe7102f.1707122766.git.namcao@linutronix.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The function starfive_jh7110_inst_init() initialize some power
management unit address and clock addresses, needed for the reset
driver. It doesn't do anything else, and also the reset driver doesn't
work without calling this function. Thus, it does not make much sense
that this function is independent from pm_reset_init().

Delete the separate call to starfive_jh7110_inst_init(), and instead
just call this function inside pm_reset_init().

Doing this also fixes another problem: if starfive_jh7110_inst_init()
returns an error code, it gets propagated to final_init() and OpenSBI
hangs. This hang is not necessary, because failures within
starfive_jh7110_inst_init() only mean OpenSBI cannot perform reboot or
shutdown, but the system can still function normally.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 platform/generic/starfive/jh7110.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 6990425..c25e645 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -190,6 +190,8 @@ static struct sbi_system_reset_device pm_reset = {
 	.system_reset = pm_system_reset
 };
 
+static int starfive_jh7110_inst_init(void *fdt);
+
 static int pm_reset_init(void *fdt, int nodeoff,
 			 const struct fdt_match *match)
 {
@@ -215,6 +217,10 @@ static int pm_reset_init(void *fdt, int nodeoff,
 
 	pmic_inst.adapter = adapter;
 
+	rc = starfive_jh7110_inst_init(fdt);
+	if (rc)
+		return rc;
+
 	sbi_system_reset_add_device(&pm_reset);
 
 	return 0;
@@ -278,7 +284,6 @@ static int starfive_jh7110_final_init(bool cold_boot,
 
 	if (cold_boot) {
 		fdt_reset_driver_init(fdt, &fdt_reset_pmic);
-		return starfive_jh7110_inst_init(fdt);
 	}
 
 	return 0;
-- 
2.39.2


