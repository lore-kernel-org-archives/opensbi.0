From: Anup Patel <anup.patel@wdc.com>
Date: Wed,  9 Sep 2020 20:20:28 +0530
Subject: [PATCH 5/5] platform: generic: Don't mark non-MMU HARTs as invalid
In-Reply-To: <20200909145028.446794-1-anup.patel@wdc.com>
References: <20200909145028.446794-1-anup.patel@wdc.com>
Message-ID: <20200909145028.446794-6-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the generic platform fw_platform_init() marks non-MMU
HARTs (e.g. E-core on SiFive Unleashed) as invalid. This means
such non-MMU HARTs won't be allowed to go ahead by sbi_init().

The sbi_init() now has a check for next stage privilege mode when
selecting coldboot HART. This check will force non-MMU HARTS (i.e.
HARTs without S-mode) to proceed in warmboot path and wait in the
HSM STOPPED state. This means we don't need to mark non-MMU HARTs
as invalid in generic platform fw_platform_init().

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 platform/generic/platform.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index c3cf423..d902e71 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -71,7 +71,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 				unsigned long arg2, unsigned long arg3,
 				unsigned long arg4)
 {
-	const char *model, *mmu_type;
+	const char *model;
 	void *fdt = (void *)arg1;
 	u32 hartid, hart_count = 0;
 	int rc, root_offset, cpus_offset, cpu_offset, len;
@@ -101,10 +101,6 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 		if (SBI_HARTMASK_MAX_BITS <= hartid)
 			continue;
 
-		mmu_type = fdt_getprop(fdt, cpu_offset, "mmu-type", &len);
-		if (!mmu_type || !len)
-			hartid = -1U;
-
 		generic_hart_index2id[hart_count++] = hartid;
 	}
 
-- 
2.25.1


