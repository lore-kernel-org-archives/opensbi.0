From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 4 Jan 2023 14:29:27 +0800
Subject: [PATCH 6/6] lib: sbi_hsm: Introduce hart_secondary_boot() callback
In-Reply-To: <20230104062927.15628-1-peterlin@andestech.com>
References: <20230104062927.15628-1-peterlin@andestech.com>
Message-ID: <20230104062927.15628-7-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When platform supports hotplug, i.e. both hart_start() and hart_stop()
callbacks are provided, the former doesn't need to be performed at
the boot-time. Thus, add a callback for the case of secondary boot.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 include/sbi/sbi_hsm.h |  7 +++++++
 lib/sbi/sbi_hsm.c     | 22 +++++++++++++---------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index 1e23884..94b3bbb 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -49,6 +49,13 @@ struct sbi_hsm_device {
 	 * non-retentive suspend.
 	 */
 	void (*hart_resume)(void);
+
+	/**
+	 * Perform platform-specific actions on non-boot harts at boot-time
+	 *
+	 * For successful secondary boot, the call will return 0.
+	 */
+	int (*hart_secondary_boot)(u32 hartid, ulong saddr);
 };
 
 struct sbi_domain;
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index b89253b..c9ab6a3 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -152,11 +152,18 @@ static bool hsm_device_has_hart_hotplug(void)
 
 static bool hsm_device_has_hart_secondary_boot(void)
 {
-	if (hsm_dev && hsm_dev->hart_start && !hsm_dev->hart_stop)
+	if (hsm_dev && hsm_dev->hart_secondary_boot)
 		return true;
 	return false;
 }
 
+static int hsm_device_hart_secondary_boot(u32 hartid, ulong saddr)
+{
+	if (hsm_dev && hsm_dev->hart_secondary_boot)
+		return hsm_dev->hart_secondary_boot(hartid, saddr);
+	return SBI_ENOTSUPP;
+}
+
 static int hsm_device_hart_start(u32 hartid, ulong saddr)
 {
 	if (hsm_dev && hsm_dev->hart_start)
@@ -284,16 +291,13 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	rscratch->next_addr = saddr;
 	rscratch->next_mode = smode;
 
-	if (hsm_device_has_hart_hotplug() ||
-	   (hsm_device_has_hart_secondary_boot() && !init_count)) {
+	if (hsm_device_has_hart_secondary_boot() && !init_count)
+		return hsm_device_hart_secondary_boot(hartid, scratch->warmboot_addr);
+
+	if (hsm_device_has_hart_hotplug() && init_count)
 		return hsm_device_hart_start(hartid, scratch->warmboot_addr);
-	} else {
-		int rc = sbi_ipi_raw_send(hartid);
-		if (rc)
-		    return rc;
-	}
 
-	return 0;
+	return sbi_ipi_raw_send(hartid);
 }
 
 int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
-- 
2.34.1


