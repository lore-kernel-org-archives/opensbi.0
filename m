From: Anup Patel <anup.patel@wdc.com>
Date: Sat,  7 Aug 2021 19:03:21 +0530
Subject: [PATCH v2 4/5] lib: utils/timer: Allow ACLINT MTIMER supporting only
 32-bit MMIO
In-Reply-To: <20210807133322.545675-1-anup.patel@wdc.com>
References: <20210807133322.545675-1-anup.patel@wdc.com>
Message-ID: <20210807133322.545675-5-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We can have ACLINT MTIMER devices which only support 32-bit MMIO
accesses on RV64 system so this patch adds a boolean DT property
"mtimer,no-64bit-mmio" to detect this from MTIMER DT node.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/utils/timer/fdt_timer_mtimer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index b08ed38..15a36ed 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -58,6 +58,9 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
 		mt->mtime_size = size[0];
 		mt->mtimecmp_addr = addr[1];
 		mt->mtimecmp_size = size[1];
+		/* Parse additional ACLINT MTIMER properties */
+		if (fdt_getprop(fdt, nodeoff, "mtimer,no-64bit-mmio", &rc))
+			mt->has_64bit_mmio = false;
 	}
 
 	rc = aclint_mtimer_cold_init(mt, mtmaster);
-- 
2.25.1


