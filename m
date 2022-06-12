From: Bohdan Fedorov <misterjdrg@gmail.com>
Date: Sun, 12 Jun 2022 20:18:22 +0300
Subject: [PATCH 2/2] lib: utils/serial: Check all compatible devices for driver
In-Reply-To: <20220612171822.148906-1-misterjdrg@gmail.com>
References: <20220612171822.148906-1-misterjdrg@gmail.com>
Message-ID: <20220612171822.148906-2-misterjdrg@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

System can have multiple virtio,mmio compatible devices.

We need check all of them to choose serial with emergency
write feature.

Signed-off-by: Bohdan Fedorov <misterjdrg@gmail.com>
---
 lib/utils/serial/fdt_serial.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
index 1a4bf9e..761d567 100644
--- a/lib/utils/serial/fdt_serial.c
+++ b/lib/utils/serial/fdt_serial.c
@@ -76,19 +76,24 @@ int fdt_serial_init(void)
 	for (pos = 0; pos < fdt_serial_drivers_size; pos++) {
 		drv = fdt_serial_drivers[pos];
 
-		noff = fdt_find_match(fdt, -1, drv->match_table, &match);
-		if (noff < 0)
-			continue;
+		noff = -1;
+		do {
+			noff = fdt_find_match(fdt, noff, drv->match_table, &match);
 
-		if (drv->init) {
-			rc = drv->init(fdt, noff, match);
-			if (rc == SBI_ENODEV)
-				continue;
-			if (rc)
-				return rc;
-		}
-		current_driver = drv;
-		break;
+			if (noff < 0)
+				break;
+
+			if (drv->init) {
+				rc = drv->init(fdt, noff, match);
+				if (rc == SBI_ENODEV)
+					continue;
+				if (rc)
+					return rc;
+			}
+
+			current_driver = drv;
+			goto done;
+		} while (noff >= 0);
 	}
 
 done:
-- 
2.36.1


