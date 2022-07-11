From: Ben Dooks <ben.dooks@sifive.com>
Date: Mon, 11 Jul 2022 08:18:03 +0100
Subject: [PATCH v2] lib: sbi: add check for ipi device for hsm start
Message-ID: <20220711071803.408024-1-ben.dooks@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the ecall SBI_EXT_HSM_HART_START is called it might try to wake the
secondary hart using sbi_ipi_raw_send() to send an IPI to the hart.
This can fail if there is no IPI device but no error is returned from
sbi_ipi_raw_send() so the ecall returns as if the action completed and
the caller continues without noticing (in the case of Linux it just hangs
waiting for the secondary hart to become active)

Fix this by changing sbi_ipi_raw_send() to return and error, and if an
error is returned, then return it via SBI_EXT_HSM_HART_START call.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
--
Fixes for v2:
- fixed title by adding lib: prefix
- change two if() to one compound if()
---
 include/sbi/sbi_ipi.h | 2 +-
 lib/sbi/sbi_hsm.c     | 4 +++-
 lib/sbi/sbi_ipi.c     | 9 ++++++---
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index fb7d658..f6ac807 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -75,7 +75,7 @@ int sbi_ipi_send_halt(ulong hmask, ulong hbase);
 
 void sbi_ipi_process(void);
 
-void sbi_ipi_raw_send(u32 target_hart);
+int sbi_ipi_raw_send(u32 target_hart);
 
 const struct sbi_ipi_device *sbi_ipi_get_device(void);
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 1165acc..836008f 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -289,7 +289,9 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	   (hsm_device_has_hart_secondary_boot() && !init_count)) {
 		return hsm_device_hart_start(hartid, scratch->warmboot_addr);
 	} else {
-		sbi_ipi_raw_send(hartid);
+		int rc = sbi_ipi_raw_send(hartid);
+		if (rc)
+		    return rc;
 	}
 
 	return 0;
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 1014909..7aafbbd 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -208,10 +208,13 @@ skip:
 	};
 }
 
-void sbi_ipi_raw_send(u32 target_hart)
+int sbi_ipi_raw_send(u32 target_hart)
 {
-	if (ipi_dev && ipi_dev->ipi_send)
-		ipi_dev->ipi_send(target_hart);
+	if (!ipi_dev || !ipi_dev->ipi_send)
+		return SBI_EINVAL;
+
+	ipi_dev->ipi_send(target_hart);
+	return 0;
 }
 
 const struct sbi_ipi_device *sbi_ipi_get_device(void)
-- 
2.35.1


