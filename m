From: Evgenii Shatokhin <e.shatokhin@yadro.com>
Date: Wed, 22 Feb 2023 00:08:51 +0300
Subject: [PATCH v2 2/2] lib: sbi: Clear IPIs before init_warm_startup in non-boot harts
In-Reply-To: <20230221210851.3145840-1-e.shatokhin@yadro.com>
References: <20230221210851.3145840-1-e.shatokhin@yadro.com>
Message-ID: <20230221210851.3145840-3-e.shatokhin@yadro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since commit 50d4fde1c5a4 ("lib: Remove redundant sbi_platform_ipi_clear()
calls"), the IPI sent from the boot hart in wake_coldboot_harts() is not
cleared in the secondary harts until they reach sbi_ipi_init(). However,
sbi_hsm_init() and sbi_hsm_hart_wait() are called earlier, so a secondary
hart might enter sbi_hsm_hart_wait() with an already pending IPI.

sbi_hsm_hart_wait() makes sure the hart leaves the loop only when it is
actually ready, so a pending unrelated IPI should not cause safety issues.
However, it might be inefficient on certain hardware, because it prevents
"wfi" from stalling the hart even if the hardware supports this, making the
hart needlessly spin in a "busy-wait" loop.

This behaviour can be observed, for example, in a QEMU VM (QEMU 7.2.0) with
"-machine virt" running a Linux guest. Inserting delays in
sbi_hsm_hart_start() allows reproducing the issue more reliably.

The comment in wait_for_coldboot() suggests that the initial IPI is needed
in the warm resume path, so let us clear it before init_warm_startup()
only.

To do this, sbi_ipi_raw_clear() was created similar to sbi_ipi_raw_send().

Signed-off-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
---
 include/sbi/sbi_ipi.h | 2 ++
 lib/sbi/sbi_init.c    | 6 ++++--
 lib/sbi/sbi_ipi.c     | 6 ++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index f6ac807..f384e74 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -77,6 +77,8 @@ void sbi_ipi_process(void);
 
 int sbi_ipi_raw_send(u32 target_hart);
 
+void sbi_ipi_raw_clear(u32 target_hart);
+
 const struct sbi_ipi_device *sbi_ipi_get_device(void);
 
 void sbi_ipi_set_device(const struct sbi_ipi_device *dev);
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index e353c33..a9a4084 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -438,10 +438,12 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 	if (hstate < 0)
 		sbi_hart_hang();
 
-	if (hstate == SBI_HSM_STATE_SUSPENDED)
+	if (hstate == SBI_HSM_STATE_SUSPENDED) {
 		init_warm_resume(scratch);
-	else
+	} else {
+		sbi_ipi_raw_clear(hartid);
 		init_warm_startup(scratch, hartid);
+	}
 
 	sbi_hart_switch_mode(hartid, scratch->next_arg1,
 			     scratch->next_addr,
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 1bcc2e4..b9f6205 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -217,6 +217,12 @@ int sbi_ipi_raw_send(u32 target_hart)
 	return 0;
 }
 
+void sbi_ipi_raw_clear(u32 target_hart)
+{
+	if (ipi_dev && ipi_dev->ipi_clear)
+		ipi_dev->ipi_clear(target_hart);
+}
+
 const struct sbi_ipi_device *sbi_ipi_get_device(void)
 {
 	return ipi_dev;
-- 
2.34.1



