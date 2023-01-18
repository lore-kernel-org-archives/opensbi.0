From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 18 Jan 2023 15:53:17 +0800
Subject: [PATCH v3 2/6] lib: sbi_hsm: handle failure when hart_stop returns SBI_ENOTSUPP
In-Reply-To: <20230118075321.19447-1-peterlin@andestech.com>
References: <20230118075321.19447-1-peterlin@andestech.com>
Message-ID: <20230118075321.19447-3-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make use of generic warm-boot path when platform hart_stop callback
returns SBI_ENOTSUPP, in case certain hart can not turn off its
power domain, or it detects some error occured in power management
unit, it can fall through warmboot flow and wait for interrupt in
sbi_hsm_hart_wait().

Also improves comment in sbi_hsm_hart_wait().

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_hsm.h | 8 ++++++--
 lib/sbi/sbi_hsm.c     | 7 +++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index c2a728a4..1170127b 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -21,8 +21,12 @@ struct sbi_hsm_device {
 	int (*hart_start)(u32 hartid, ulong saddr);
 
 	/**
-	 * Stop (or power-down) the current hart from running. This call
-	 * doesn't expect to return if success.
+	 * Stop (or power-down) the current hart from running.
+	 *
+	 * Return SBI_ENOTSUPP if the hart does not support platform-specific
+	 * stop actions.
+	 *
+	 * For successful stop, the call won't return.
 	 */
 	int (*hart_stop)(void);
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index c0a55054..d4cce4ac 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -116,7 +116,7 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
 	/* Set MSIE and MEIE bits to receive IPI */
 	csr_set(CSR_MIE, MIP_MSIP | MIP_MEIP);
 
-	/* Wait for hart_add call*/
+	/* Wait for state transition requested by sbi_hsm_hart_start() */
 	while (atomic_read(&hdata->state) != SBI_HSM_STATE_START_PENDING) {
 		wfi();
 	};
@@ -228,9 +228,8 @@ void __noreturn sbi_hsm_exit(struct sbi_scratch *scratch)
 		goto fail_exit;
 
 	if (hsm_device_has_hart_hotplug()) {
-		hsm_device_hart_stop();
-		/* It should never reach here */
-		goto fail_exit;
+		if (hsm_device_hart_stop() != SBI_ENOTSUPP)
+			goto fail_exit;
 	}
 
 	/**
-- 
2.34.1


