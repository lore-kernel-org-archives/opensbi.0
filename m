From: Anup Patel <anup.patel@wdc.com>
Date: Wed,  3 Mar 2021 17:25:06 +0530
Subject: [PATCH v3 05/11] lib: sbi: Fix error codes returned by HSM start()
 and stop() functions
In-Reply-To: <20210303115512.470786-1-anup.patel@wdc.com>
References: <20210303115512.470786-1-anup.patel@wdc.com>
Message-ID: <20210303115512.470786-6-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_hsm_hart_start() and sbi_hsm_hart_stop() functions should
only return error codes as defined by the SBI specification.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_hsm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 10099c2..63fa8c2 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -202,7 +202,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 		return SBI_EINVAL;
 	if (dom && !sbi_domain_check_addr(dom, saddr, smode,
 					  SBI_DOMAIN_EXECUTE))
-		return SBI_EINVAL;
+		return SBI_EINVALID_ADDR;
 
 	rscratch = sbi_hartid_to_scratch(hartid);
 	if (!rscratch)
@@ -251,7 +251,7 @@ int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
 	if (oldstate != SBI_HSM_STATE_STARTED) {
 		sbi_printf("%s: ERR: The hart is in invalid state [%u]\n",
 			   __func__, oldstate);
-		return SBI_EDENIED;
+		return SBI_EFAIL;
 	}
 
 	if (exitnow)
-- 
2.25.1


