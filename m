From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 25 Jun 2020 02:36:39 -0700
Subject: [PATCH] lib/utils: fdt: Update FDT expand size to 1024 for reserved
 memory node
Message-ID: <1593077799-16270-1-git-send-email-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bin Meng <bin.meng@windriver.com>

Currently 256 bytes is used for the FDT expand size when fixing up
reserved memory node. Increase it to 1024 bytes with an estimated
size of 64 bytes per PMP memory region by 16 regions in total.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 lib/utils/fdt/fdt_fixup.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index adf1be3..a3bccae 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -151,8 +151,14 @@ int fdt_reserved_memory_fixup(void *fdt)
 	int na = fdt_address_cells(fdt, 0);
 	int ns = fdt_size_cells(fdt, 0);
 
-	/* expand the device tree to accommodate new node */
-	err  = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 256);
+	/*
+	 * Expand the device tree to accommodate new node
+	 * by the following estimated size:
+	 *
+	 * Each PMP memory region entry occupies 64 bytes.
+	 * With 16 PMP memory regions we need 64 * 16 = 1024 bytes.
+	 */
+	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 1024);
 	if (err < 0)
 		return err;
 
-- 
2.7.4


