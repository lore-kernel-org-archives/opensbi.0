From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 30 Aug 2024 08:49:14 -0700
Subject: [PATCH 10/12] lib: sbi: Update sbi_domain_is_assigned_hart() to take a hart index
In-Reply-To: <20240830154929.3971790-1-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com>
Message-ID: <20240830154929.3971790-11-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This removes redundant hartid to hartindex conversions from four call
sites and provides a net reduction in code size.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_domain.h  | 4 ++--
 lib/sbi/sbi_dbtr.c        | 3 +--
 lib/sbi/sbi_domain.c      | 6 +++---
 lib/sbi/sbi_hsm.c         | 9 +++++----
 lib/sbi/sbi_sse.c         | 5 +++--
 lib/utils/fdt/fdt_fixup.c | 5 +++--
 6 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 639f9e57..306783e7 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -231,10 +231,10 @@ extern struct sbi_domain *domidx_to_domain_table[];
 /**
  * Check whether given HART is assigned to specified domain
  * @param dom pointer to domain
- * @param hartid the HART ID
+ * @param hartindex the HART index
  * @return true if HART is assigned to domain otherwise false
  */
-bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid);
+bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartindex);
 
 /**
  * Get the assigned HART mask for given domain
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 5ca29c70..f0e91285 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -243,10 +243,9 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 			 unsigned long shmem_phys_lo,
 			 unsigned long shmem_phys_hi)
 {
-	u32 hartid = current_hartid();
 	struct sbi_dbtr_hart_triggers_state *hart_state;
 
-	if (dom && !sbi_domain_is_assigned_hart(dom, hartid)) {
+	if (dom && !sbi_domain_is_assigned_hart(dom, current_hartindex())) {
 		sbi_dprintf("%s: calling hart not assigned to this domain\n",
 			   __func__);
 		return SBI_ERR_DENIED;
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 58cd9aaa..92be334d 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -62,7 +62,7 @@ void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom)
 	sbi_scratch_write_type(scratch, void *, domain_hart_ptr_offset, dom);
 }
 
-bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
+bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartindex)
 {
 	bool ret;
 	struct sbi_domain *tdom = (struct sbi_domain *)dom;
@@ -71,7 +71,7 @@ bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
 		return false;
 
 	spin_lock(&tdom->assigned_harts_lock);
-	ret = sbi_hartmask_test_hartid(hartid, &tdom->assigned_harts);
+	ret = sbi_hartmask_test_hartindex(hartindex, &tdom->assigned_harts);
 	spin_unlock(&tdom->assigned_harts_lock);
 
 	return ret;
@@ -448,7 +448,7 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
 		j = sbi_hartindex_to_hartid(i);
 		sbi_printf("%s%d%s", (k++) ? "," : "",
-			   j, sbi_domain_is_assigned_hart(dom, j) ? "*" : "");
+			   j, sbi_domain_is_assigned_hart(dom, i) ? "*" : "");
 	}
 	sbi_printf("\n");
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index e25dd161..e7e31ad5 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -77,7 +77,7 @@ int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid)
 {
 	u32 hartindex = sbi_hartid_to_hartindex(hartid);
 
-	if (!sbi_domain_is_assigned_hart(dom, hartid))
+	if (!sbi_domain_is_assigned_hart(dom, hartindex))
 		return SBI_EINVAL;
 
 	return __sbi_hsm_hart_get_state(hartindex);
@@ -300,6 +300,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 		       const struct sbi_domain *dom,
 		       u32 hartid, ulong saddr, ulong smode, ulong arg1)
 {
+	u32 hartindex = sbi_hartid_to_hartindex(hartid);
 	unsigned long init_count, entry_count;
 	unsigned int hstate;
 	struct sbi_scratch *rscratch;
@@ -309,13 +310,13 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	/* For now, we only allow start mode to be S-mode or U-mode. */
 	if (smode != PRV_S && smode != PRV_U)
 		return SBI_EINVAL;
-	if (dom && !sbi_domain_is_assigned_hart(dom, hartid))
+	if (dom && !sbi_domain_is_assigned_hart(dom, hartindex))
 		return SBI_EINVAL;
 	if (dom && !sbi_domain_check_addr(dom, saddr, smode,
 					  SBI_DOMAIN_EXECUTE))
 		return SBI_EINVALID_ADDR;
 
-	rscratch = sbi_hartid_to_scratch(hartid);
+	rscratch = sbi_hartindex_to_scratch(hartindex);
 	if (!rscratch)
 		return SBI_EINVAL;
 
@@ -355,7 +356,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	   (hsm_device_has_hart_secondary_boot() && !init_count)) {
 		rc = hsm_device_hart_start(hartid, scratch->warmboot_addr);
 	} else {
-		rc = sbi_ipi_raw_send(sbi_hartid_to_hartindex(hartid));
+		rc = sbi_ipi_raw_send(hartindex);
 	}
 
 	if (!rc)
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 365a878f..ab03b9c7 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -323,7 +323,7 @@ static int sse_event_set_hart_id_check(struct sbi_sse_event *e,
 	if (!sse_event_is_global(e))
 		return SBI_EBAD_RANGE;
 
-	if (!sbi_domain_is_assigned_hart(hd, new_hartid))
+	if (!sbi_domain_is_assigned_hart(hd, sbi_hartid_to_hartindex(hartid)))
 		return SBI_EINVAL;
 
 	hstate = sbi_hsm_hart_get_state(hd, hartid);
@@ -810,7 +810,8 @@ int sbi_sse_disable(uint32_t event_id)
 int sbi_sse_inject_from_ecall(uint32_t event_id, unsigned long hartid,
 			      struct sbi_ecall_return *out)
 {
-	if (!sbi_domain_is_assigned_hart(sbi_domain_thishart_ptr(), hartid))
+	if (!sbi_domain_is_assigned_hart(sbi_domain_thishart_ptr(),
+					 sbi_hartid_to_hartindex(hartid)))
 		return SBI_EINVAL;
 
 	return sse_inject_event(event_id, hartid);
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 974b1b88..9e013dfa 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -110,7 +110,7 @@ void fdt_cpu_fixup(void *fdt)
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	int err, cpu_offset, cpus_offset, len;
 	const char *mmu_type;
-	u32 hartid;
+	u32 hartid, hartindex;
 
 	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
 	if (err < 0)
@@ -134,8 +134,9 @@ void fdt_cpu_fixup(void *fdt)
 		 * 2. MMU is not available for the HART
 		 */
 
+		hartindex = sbi_hartid_to_hartindex(hartid);
 		mmu_type = fdt_getprop(fdt, cpu_offset, "mmu-type", &len);
-		if (!sbi_domain_is_assigned_hart(dom, hartid) ||
+		if (!sbi_domain_is_assigned_hart(dom, hartindex) ||
 		    !mmu_type || !len)
 			fdt_setprop_string(fdt, cpu_offset, "status",
 					   "disabled");
-- 
2.45.1


