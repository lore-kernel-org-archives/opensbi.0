From: Anup Patel <anup.patel@wdc.com>
Date: Wed,  3 Mar 2021 17:25:05 +0530
Subject: [PATCH v3 04/11] lib: sbi: Remove redundant sbi_hsm_hart_started()
 function
In-Reply-To: <20210303115512.470786-1-anup.patel@wdc.com>
References: <20210303115512.470786-1-anup.patel@wdc.com>
Message-ID: <20210303115512.470786-5-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_hsm_hart_started() function is only used by sbi_hsm_hart_stop()
for checking state of calling HART and current domain assignment.

The atomic_cmpxchg() called by sbi_hsm_hart_stop() will check state of
calling hart anyway and domain assignment can be checked by other domain
function such as sbi_domain_is_assigned_hart().

This means sbi_hsm_hart_started() is redundant and can be removed.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_hsm.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index a81b821..10099c2 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -54,14 +54,6 @@ int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid)
 	return __sbi_hsm_hart_get_state(hartid);
 }
 
-static bool sbi_hsm_hart_started(const struct sbi_domain *dom, u32 hartid)
-{
-	if (sbi_hsm_hart_get_state(dom, hartid) == SBI_HSM_STATE_STARTED)
-		return TRUE;
-	else
-		return FALSE;
-}
-
 /**
  * Get ulong HART mask for given HART base ID
  * @param dom the domain to be used for output HART mask
@@ -247,12 +239,12 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
 {
 	int oldstate;
-	u32 hartid = current_hartid();
+	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
-	if (!sbi_hsm_hart_started(sbi_domain_thishart_ptr(), hartid))
-		return SBI_EINVAL;
+	if (!dom)
+		return SBI_EFAIL;
 
 	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STARTED,
 				  SBI_HSM_STATE_STOP_PENDING);
-- 
2.25.1


