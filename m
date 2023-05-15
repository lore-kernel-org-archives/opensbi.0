From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 May 2023 13:12:34 +0200
Subject: [PATCH v6 1/7] lib: sbi: Introduce register_extensions extension callback
In-Reply-To: <20230515111240.95059-1-ajones@ventanamicro.com>
References: <20230515111240.95059-1-ajones@ventanamicro.com>
Message-ID: <20230515111240.95059-2-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rather than registering all extensions on their behalf in
sbi_ecall_init(), introduce another extension callback and
invoke that instead. For now, implement each callback by
simply registering the extension, which means this patch
has no intended functional change. In later patches, extension
callbacks will be modified to choose when to register and to
possibly narrow the extension ID range prior to registering.
When an extension range needs to remove IDs, leaving gaps, then
multiple invocations of sbi_ecall_register_extension() may be
used. In summary, later patches for current extensions and the
introductions of future extensions will use the new callback to
ensure that only valid extension IDs from the initial range,
which are also available, will be registered.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_ecall.h    |  1 +
 lib/sbi/sbi_ecall.c        |  5 ++++-
 lib/sbi/sbi_ecall_base.c   | 14 +++++++++++---
 lib/sbi/sbi_ecall_cppc.c   | 16 ++++++++++++----
 lib/sbi/sbi_ecall_dbcn.c   | 16 ++++++++++++----
 lib/sbi/sbi_ecall_hsm.c    | 14 +++++++++++---
 lib/sbi/sbi_ecall_ipi.c    | 14 +++++++++++---
 lib/sbi/sbi_ecall_legacy.c | 14 +++++++++++---
 lib/sbi/sbi_ecall_pmu.c    | 16 ++++++++++++----
 lib/sbi/sbi_ecall_rfence.c | 14 +++++++++++---
 lib/sbi/sbi_ecall_srst.c   | 16 ++++++++++++----
 lib/sbi/sbi_ecall_susp.c   | 16 ++++++++++++----
 lib/sbi/sbi_ecall_time.c   | 14 +++++++++++---
 lib/sbi/sbi_ecall_vendor.c | 16 ++++++++++++----
 14 files changed, 143 insertions(+), 43 deletions(-)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index ff9bf8e2b435..fac26429cf5d 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -24,6 +24,7 @@ struct sbi_ecall_extension {
 	struct sbi_dlist head;
 	unsigned long extid_start;
 	unsigned long extid_end;
+	int (* register_extensions)(void);
 	int (* probe)(unsigned long extid, unsigned long *out_val);
 	int (* handle)(unsigned long extid, unsigned long funcid,
 		       const struct sbi_trap_regs *regs,
diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 76a1ae9ab733..3eb4f0addb02 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -154,7 +154,10 @@ int sbi_ecall_init(void)
 
 	for (i = 0; i < sbi_ecall_exts_size; i++) {
 		ext = sbi_ecall_exts[i];
-		ret = sbi_ecall_register_extension(ext);
+		ret = SBI_ENODEV;
+
+		if (ext->register_extensions)
+			ret = ext->register_extensions();
 		if (ret)
 			return ret;
 	}
diff --git a/lib/sbi/sbi_ecall_base.c b/lib/sbi/sbi_ecall_base.c
index 786d2ac67924..74f05eb26a35 100644
--- a/lib/sbi/sbi_ecall_base.c
+++ b/lib/sbi/sbi_ecall_base.c
@@ -72,8 +72,16 @@ static int sbi_ecall_base_handler(unsigned long extid, unsigned long funcid,
 	return ret;
 }
 
+struct sbi_ecall_extension ecall_base;
+
+static int sbi_ecall_base_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_base);
+}
+
 struct sbi_ecall_extension ecall_base = {
-	.extid_start = SBI_EXT_BASE,
-	.extid_end = SBI_EXT_BASE,
-	.handle = sbi_ecall_base_handler,
+	.extid_start		= SBI_EXT_BASE,
+	.extid_end		= SBI_EXT_BASE,
+	.register_extensions	= sbi_ecall_base_register_extensions,
+	.handle			= sbi_ecall_base_handler,
 };
diff --git a/lib/sbi/sbi_ecall_cppc.c b/lib/sbi/sbi_ecall_cppc.c
index 91585f3b74e3..42ec744c22ba 100644
--- a/lib/sbi/sbi_ecall_cppc.c
+++ b/lib/sbi/sbi_ecall_cppc.c
@@ -55,9 +55,17 @@ static int sbi_ecall_cppc_probe(unsigned long extid, unsigned long *out_val)
 	return 0;
 }
 
+struct sbi_ecall_extension ecall_cppc;
+
+static int sbi_ecall_cppc_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_cppc);
+}
+
 struct sbi_ecall_extension ecall_cppc = {
-	.extid_start	= SBI_EXT_CPPC,
-	.extid_end	= SBI_EXT_CPPC,
-	.handle		= sbi_ecall_cppc_handler,
-	.probe		= sbi_ecall_cppc_probe,
+	.extid_start		= SBI_EXT_CPPC,
+	.extid_end		= SBI_EXT_CPPC,
+	.register_extensions	= sbi_ecall_cppc_register_extensions,
+	.probe			= sbi_ecall_cppc_probe,
+	.handle			= sbi_ecall_cppc_handler,
 };
diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
index fe7e175a64c1..58b19e4468ef 100644
--- a/lib/sbi/sbi_ecall_dbcn.c
+++ b/lib/sbi/sbi_ecall_dbcn.c
@@ -64,9 +64,17 @@ static int sbi_ecall_dbcn_probe(unsigned long extid, unsigned long *out_val)
 	return 0;
 }
 
+struct sbi_ecall_extension ecall_dbcn;
+
+static int sbi_ecall_dbcn_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_dbcn);
+}
+
 struct sbi_ecall_extension ecall_dbcn = {
-	.extid_start = SBI_EXT_DBCN,
-	.extid_end = SBI_EXT_DBCN,
-	.handle = sbi_ecall_dbcn_handler,
-	.probe = sbi_ecall_dbcn_probe,
+	.extid_start		= SBI_EXT_DBCN,
+	.extid_end		= SBI_EXT_DBCN,
+	.register_extensions	= sbi_ecall_dbcn_register_extensions,
+	.probe			= sbi_ecall_dbcn_probe,
+	.handle			= sbi_ecall_dbcn_handler,
 };
diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
index f1b41d073b22..20705c395131 100644
--- a/lib/sbi/sbi_ecall_hsm.c
+++ b/lib/sbi/sbi_ecall_hsm.c
@@ -54,8 +54,16 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
 	return ret;
 }
 
+struct sbi_ecall_extension ecall_hsm;
+
+static int sbi_ecall_hsm_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_hsm);
+}
+
 struct sbi_ecall_extension ecall_hsm = {
-	.extid_start = SBI_EXT_HSM,
-	.extid_end = SBI_EXT_HSM,
-	.handle = sbi_ecall_hsm_handler,
+	.extid_start		= SBI_EXT_HSM,
+	.extid_end		= SBI_EXT_HSM,
+	.register_extensions	= sbi_ecall_hsm_register_extensions,
+	.handle			= sbi_ecall_hsm_handler,
 };
diff --git a/lib/sbi/sbi_ecall_ipi.c b/lib/sbi/sbi_ecall_ipi.c
index f4797e117a34..a40d6b8cc8a8 100644
--- a/lib/sbi/sbi_ecall_ipi.c
+++ b/lib/sbi/sbi_ecall_ipi.c
@@ -29,8 +29,16 @@ static int sbi_ecall_ipi_handler(unsigned long extid, unsigned long funcid,
 	return ret;
 }
 
+struct sbi_ecall_extension ecall_ipi;
+
+static int sbi_ecall_ipi_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_ipi);
+}
+
 struct sbi_ecall_extension ecall_ipi = {
-	.extid_start = SBI_EXT_IPI,
-	.extid_end = SBI_EXT_IPI,
-	.handle = sbi_ecall_ipi_handler,
+	.extid_start		= SBI_EXT_IPI,
+	.extid_end		= SBI_EXT_IPI,
+	.register_extensions	= sbi_ecall_ipi_register_extensions,
+	.handle			= sbi_ecall_ipi_handler,
 };
diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
index 8237498b538f..99e862e0f19f 100644
--- a/lib/sbi/sbi_ecall_legacy.c
+++ b/lib/sbi/sbi_ecall_legacy.c
@@ -117,8 +117,16 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
 	return ret;
 }
 
+struct sbi_ecall_extension ecall_legacy;
+
+static int sbi_ecall_legacy_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_legacy);
+}
+
 struct sbi_ecall_extension ecall_legacy = {
-	.extid_start = SBI_EXT_0_1_SET_TIMER,
-	.extid_end = SBI_EXT_0_1_SHUTDOWN,
-	.handle = sbi_ecall_legacy_handler,
+	.extid_start		= SBI_EXT_0_1_SET_TIMER,
+	.extid_end		= SBI_EXT_0_1_SHUTDOWN,
+	.register_extensions	= sbi_ecall_legacy_register_extensions,
+	.handle			= sbi_ecall_legacy_handler,
 };
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index 367e92774261..b0589d0ecfa1 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -88,9 +88,17 @@ static int sbi_ecall_pmu_probe(unsigned long extid, unsigned long *out_val)
 	return 0;
 }
 
+struct sbi_ecall_extension ecall_pmu;
+
+static int sbi_ecall_pmu_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_pmu);
+}
+
 struct sbi_ecall_extension ecall_pmu = {
-	.extid_start = SBI_EXT_PMU,
-	.extid_end = SBI_EXT_PMU,
-	.handle = sbi_ecall_pmu_handler,
-	.probe = sbi_ecall_pmu_probe,
+	.extid_start		= SBI_EXT_PMU,
+	.extid_end		= SBI_EXT_PMU,
+	.register_extensions	= sbi_ecall_pmu_register_extensions,
+	.probe			= sbi_ecall_pmu_probe,
+	.handle			= sbi_ecall_pmu_handler,
 };
diff --git a/lib/sbi/sbi_ecall_rfence.c b/lib/sbi/sbi_ecall_rfence.c
index 6334c001d450..22c665227826 100644
--- a/lib/sbi/sbi_ecall_rfence.c
+++ b/lib/sbi/sbi_ecall_rfence.c
@@ -79,8 +79,16 @@ static int sbi_ecall_rfence_handler(unsigned long extid, unsigned long funcid,
 	return ret;
 }
 
+struct sbi_ecall_extension ecall_rfence;
+
+static int sbi_ecall_rfence_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_rfence);
+}
+
 struct sbi_ecall_extension ecall_rfence = {
-	.extid_start = SBI_EXT_RFENCE,
-	.extid_end = SBI_EXT_RFENCE,
-	.handle = sbi_ecall_rfence_handler,
+	.extid_start		= SBI_EXT_RFENCE,
+	.extid_end		= SBI_EXT_RFENCE,
+	.register_extensions	= sbi_ecall_rfence_register_extensions,
+	.handle			= sbi_ecall_rfence_handler,
 };
diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
index 93b012ce024c..ad31537604a3 100644
--- a/lib/sbi/sbi_ecall_srst.c
+++ b/lib/sbi/sbi_ecall_srst.c
@@ -67,9 +67,17 @@ static int sbi_ecall_srst_probe(unsigned long extid, unsigned long *out_val)
 	return 0;
 }
 
+struct sbi_ecall_extension ecall_srst;
+
+static int sbi_ecall_srst_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_srst);
+}
+
 struct sbi_ecall_extension ecall_srst = {
-	.extid_start = SBI_EXT_SRST,
-	.extid_end = SBI_EXT_SRST,
-	.handle = sbi_ecall_srst_handler,
-	.probe = sbi_ecall_srst_probe,
+	.extid_start		= SBI_EXT_SRST,
+	.extid_end		= SBI_EXT_SRST,
+	.register_extensions	= sbi_ecall_srst_register_extensions,
+	.probe			= sbi_ecall_srst_probe,
+	.handle			= sbi_ecall_srst_handler,
 };
diff --git a/lib/sbi/sbi_ecall_susp.c b/lib/sbi/sbi_ecall_susp.c
index f20126c49a60..bfbdbe648625 100644
--- a/lib/sbi/sbi_ecall_susp.c
+++ b/lib/sbi/sbi_ecall_susp.c
@@ -40,9 +40,17 @@ static int sbi_ecall_susp_probe(unsigned long extid, unsigned long *out_val)
 	return 0;
 }
 
+struct sbi_ecall_extension ecall_susp;
+
+static int sbi_ecall_susp_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_susp);
+}
+
 struct sbi_ecall_extension ecall_susp = {
-	.extid_start = SBI_EXT_SUSP,
-	.extid_end = SBI_EXT_SUSP,
-	.handle = sbi_ecall_susp_handler,
-	.probe = sbi_ecall_susp_probe,
+	.extid_start		= SBI_EXT_SUSP,
+	.extid_end		= SBI_EXT_SUSP,
+	.register_extensions	= sbi_ecall_susp_register_extensions,
+	.probe			= sbi_ecall_susp_probe,
+	.handle			= sbi_ecall_susp_handler,
 };
diff --git a/lib/sbi/sbi_ecall_time.c b/lib/sbi/sbi_ecall_time.c
index 668cb17680c0..e79196f77adc 100644
--- a/lib/sbi/sbi_ecall_time.c
+++ b/lib/sbi/sbi_ecall_time.c
@@ -33,8 +33,16 @@ static int sbi_ecall_time_handler(unsigned long extid, unsigned long funcid,
 	return ret;
 }
 
+struct sbi_ecall_extension ecall_time;
+
+static int sbi_ecall_time_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_time);
+}
+
 struct sbi_ecall_extension ecall_time = {
-	.extid_start = SBI_EXT_TIME,
-	.extid_end = SBI_EXT_TIME,
-	.handle = sbi_ecall_time_handler,
+	.extid_start		= SBI_EXT_TIME,
+	.extid_end		= SBI_EXT_TIME,
+	.register_extensions	= sbi_ecall_time_register_extensions,
+	.handle			= sbi_ecall_time_handler,
 };
diff --git a/lib/sbi/sbi_ecall_vendor.c b/lib/sbi/sbi_ecall_vendor.c
index 8b8dab00c92d..126156f79a12 100644
--- a/lib/sbi/sbi_ecall_vendor.c
+++ b/lib/sbi/sbi_ecall_vendor.c
@@ -47,9 +47,17 @@ static int sbi_ecall_vendor_handler(unsigned long extid, unsigned long funcid,
 						out_val, out_trap);
 }
 
+struct sbi_ecall_extension ecall_vendor;
+
+static int sbi_ecall_vendor_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_vendor);
+}
+
 struct sbi_ecall_extension ecall_vendor = {
-	.extid_start = SBI_EXT_VENDOR_START,
-	.extid_end = SBI_EXT_VENDOR_END,
-	.probe = sbi_ecall_vendor_probe,
-	.handle = sbi_ecall_vendor_handler,
+	.extid_start		= SBI_EXT_VENDOR_START,
+	.extid_end		= SBI_EXT_VENDOR_END,
+	.register_extensions	= sbi_ecall_vendor_register_extensions,
+	.probe			= sbi_ecall_vendor_probe,
+	.handle			= sbi_ecall_vendor_handler,
 };
-- 
2.40.0


