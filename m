From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Mar 2023 21:29:24 +0530
Subject: [PATCH 2/2] lib: sbi_hsm: Fix sbi_hsm_hart_start() for platform with hart hotplug
In-Reply-To: <20230320155924.950465-1-apatel@ventanamicro.com>
References: <20230320155924.950465-1-apatel@ventanamicro.com>
Message-ID: <20230320155924.950465-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It possible that a platform supports hart hotplug (i.e. both hart_start
and hart_stop callbacks available) and all harts are start simultaneously
at platform boot-time. In this situation, the sbi_hsm_hart_start() will
call hsm_device_hart_start() for secondary harts at platform boot-time
which will fail because secondary harts were already started.

To fix above, we call hsm_device_hart_start() from sbi_hsm_hart_start()
only when entry_count is same as init_count for the secondary hart.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_hsm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 16e3846..b261410 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -301,7 +301,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 		       const struct sbi_domain *dom,
 		       u32 hartid, ulong saddr, ulong smode, ulong arg1)
 {
-	unsigned long init_count;
+	unsigned long init_count, entry_count;
 	unsigned int hstate;
 	struct sbi_scratch *rscratch;
 	struct sbi_hsm_data *hdata;
@@ -325,6 +325,8 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 		return SBI_EINVAL;
 
 	init_count = sbi_init_count(hartid);
+	entry_count = sbi_entry_count(hartid);
+
 	rscratch->next_arg1 = arg1;
 	rscratch->next_addr = saddr;
 	rscratch->next_mode = smode;
@@ -350,7 +352,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 		goto err;
 	}
 
-	if (hsm_device_has_hart_hotplug() ||
+	if ((hsm_device_has_hart_hotplug() && (entry_count == init_count)) ||
 	   (hsm_device_has_hart_secondary_boot() && !init_count)) {
 		rc = hsm_device_hart_start(hartid, scratch->warmboot_addr);
 	} else {
-- 
2.34.1


