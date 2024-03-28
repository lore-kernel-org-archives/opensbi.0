From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 28 Mar 2024 11:33:03 +0800
Subject: [PATCH v2 2/2] sbi: sbi_domain_context: Add spinlock for updating domain assigned_harts
In-Reply-To: <20240328033303.883674-1-peterlin@andestech.com>
References: <20240328033303.883674-1-peterlin@andestech.com>
Message-ID: <20240328033303.883674-3-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add spinlock protection to avoid race condition on assigned_harts
during domain context switching.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Alvin Chang <alvinga@andestech.com>
---
Changes v2:
  - New patch
---
 lib/sbi/sbi_domain_context.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index a41dc8c7..e891c22a 100755
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -15,6 +15,8 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_domain_context.h>
 
+static spinlock_t assigned_harts_lock = SPIN_LOCK_INITIALIZER;
+
 /**
  * Switches the HART context from the current domain to the target domain.
  * This includes changing domain assignments and reconfiguring PMP, as well
@@ -34,10 +36,12 @@ static void switch_to_next_domain_context(struct sbi_context *ctx,
 
 	/* Assign current hart to target domain */
 	hartindex = sbi_hartid_to_hartindex(current_hartid());
+	spin_lock(&assigned_harts_lock);
 	sbi_hartmask_clear_hartindex(
 		hartindex, &sbi_domain_thishart_ptr()->assigned_harts);
 	sbi_update_hartindex_to_domain(hartindex, dom);
 	sbi_hartmask_set_hartindex(hartindex, &dom->assigned_harts);
+	spin_unlock(&assigned_harts_lock);
 
 	/* Reconfigure PMP settings for the new domain */
 	for (int i = 0; i < pmp_count; i++) {
-- 
2.34.1


