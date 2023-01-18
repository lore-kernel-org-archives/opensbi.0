From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 18 Jan 2023 15:42:25 +0100
Subject: [PATCH 02/11] lib: sbi_hsm: Don't try to restore state on failed change
In-Reply-To: <20230118144234.79263-1-ajones@ventanamicro.com>
References: <20230118144234.79263-1-ajones@ventanamicro.com>
Message-ID: <20230118144234.79263-3-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When a state change fails there's no need to restore the original
state as it remains the same.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_hsm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index b43f26cfe3a0..c7454499b2ba 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -429,10 +429,8 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
 
 	/* Directly move from STARTED to SUSPENDED state */
 	if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_STARTED,
-					 SBI_HSM_STATE_SUSPENDED)) {
-		ret = SBI_EDENIED;
-		goto fail_restore_state;
-	}
+					 SBI_HSM_STATE_SUSPENDED))
+		return SBI_EDENIED;
 
 	/* Save the suspend type */
 	hdata->suspend_type = suspend_type;
@@ -467,7 +465,6 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
 		jump_warmboot();
 	}
 
-fail_restore_state:
 	/*
 	 * We might have successfully resumed from retentive suspend
 	 * or suspend failed. In both cases, we restore state of hart.
-- 
2.39.0


