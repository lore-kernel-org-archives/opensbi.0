From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 30 Aug 2024 08:49:12 -0700
Subject: [PATCH 08/12] lib: sbi: Update __sbi_hsm_hart_get_state() to take a hart index
In-Reply-To: <20240830154929.3971790-1-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com>
Message-ID: <20240830154929.3971790-9-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This removes some hartindex conversions in sbi_system_suspend(), but is
mostly intended to support refactoring sbi_hsm_hart_interruptible_mask()
to work exclusively with struct sbi_hartmask.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_hsm.h |  2 +-
 lib/sbi/sbi_hsm.c     | 12 ++++++++----
 lib/sbi/sbi_system.c  |  9 ++++-----
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index 4b5601ba..d8ca459d 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -72,7 +72,7 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
 			 ulong raddr, ulong rmode, ulong arg1);
 bool sbi_hsm_hart_change_state(struct sbi_scratch *scratch, long oldstate,
 			       long newstate);
-int __sbi_hsm_hart_get_state(u32 hartid);
+int __sbi_hsm_hart_get_state(u32 hartindex);
 int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid);
 int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
 				    ulong hbase, ulong *out_hmask);
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index ab11b119..5af3c4af 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -60,12 +60,12 @@ bool sbi_hsm_hart_change_state(struct sbi_scratch *scratch, long oldstate,
 	return __sbi_hsm_hart_change_state(hdata, oldstate, newstate);
 }
 
-int __sbi_hsm_hart_get_state(u32 hartid)
+int __sbi_hsm_hart_get_state(u32 hartindex)
 {
 	struct sbi_hsm_data *hdata;
 	struct sbi_scratch *scratch;
 
-	scratch = sbi_hartid_to_scratch(hartid);
+	scratch = sbi_hartindex_to_scratch(hartindex);
 	if (!scratch)
 		return SBI_EINVAL;
 
@@ -75,10 +75,12 @@ int __sbi_hsm_hart_get_state(u32 hartid)
 
 int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid)
 {
+	u32 hartindex = sbi_hartid_to_hartindex(hartid);
+
 	if (!sbi_domain_is_assigned_hart(dom, hartid))
 		return SBI_EINVAL;
 
-	return __sbi_hsm_hart_get_state(hartid);
+	return __sbi_hsm_hart_get_state(hartindex);
 }
 
 /*
@@ -120,6 +122,7 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
 {
 	int hstate;
 	ulong i, hmask, dmask;
+	u32 hartindex;
 
 	*out_hmask = 0;
 	if (!sbi_hartid_valid(hbase))
@@ -131,7 +134,8 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
 		if (!(dmask & hmask))
 			continue;
 
-		hstate = __sbi_hsm_hart_get_state(hbase + i);
+		hartindex = sbi_hartid_to_hartindex(hbase + i);
+		hstate = __sbi_hsm_hart_get_state(hartindex);
 		if (hstate == SBI_HSM_STATE_STARTED ||
 		    hstate == SBI_HSM_STATE_SUSPENDED ||
 		    hstate == SBI_HSM_STATE_RESUME_PENDING)
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index f3c49bbd..8e624fdd 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -142,9 +142,9 @@ int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	void (*jump_warmboot)(void) = (void (*)(void))scratch->warmboot_addr;
-	unsigned int hartid = current_hartid();
+	unsigned int hartindex = current_hartindex();
 	unsigned long prev_mode;
-	unsigned long i, j;
+	unsigned long i;
 	int ret;
 
 	if (!dom || !dom->system_suspend_allowed)
@@ -163,9 +163,8 @@ int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
 		return SBI_EFAIL;
 
 	spin_lock(&dom->assigned_harts_lock);
-	sbi_hartmask_for_each_hartindex(j, &dom->assigned_harts) {
-		i = sbi_hartindex_to_hartid(j);
-		if (i == hartid)
+	sbi_hartmask_for_each_hartindex(i, &dom->assigned_harts) {
+		if (i == hartindex)
 			continue;
 		if (__sbi_hsm_hart_get_state(i) != SBI_HSM_STATE_STOPPED) {
 			spin_unlock(&dom->assigned_harts_lock);
-- 
2.45.1


