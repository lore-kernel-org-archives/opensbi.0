From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 27 Feb 2023 11:31:03 +0100
Subject: [PATCH v2 08/11] lib: sbi: Add system_suspend_allowed domain property
In-Reply-To: <20230227103106.137995-1-ajones@ventanamicro.com>
References: <20230227103106.137995-1-ajones@ventanamicro.com>
Message-ID: <20230227103106.137995-9-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Only privileged domains should be allowed to suspend the entire
system. Give the root domain this property by default and allow
other domains to be given the property by specifying it in the
DT.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 docs/domain_support.md     | 5 +++++
 include/sbi/sbi_domain.h   | 2 ++
 lib/sbi/sbi_domain.c       | 4 ++++
 lib/utils/fdt/fdt_domain.c | 7 +++++++
 4 files changed, 18 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 4ccbcff87195..e2ff896bd550 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -52,6 +52,7 @@ has following details:
 * **next_mode** - Privilege mode of the next booting stage for this
   domain. This can be either S-mode or U-mode.
 * **system_reset_allowed** - Is domain allowed to reset the system?
+* **system_suspend_allowed** - Is domain allowed to suspend the system?
 
 The memory regions represented by **regions** in **struct sbi_domain** have
 following additional constraints to align with RISC-V PMP requirements:
@@ -91,6 +92,7 @@ following manner:
 * **next_mode** - Next booting stage mode in coldboot HART scratch space
   is the next mode for the ROOT domain
 * **system_reset_allowed** - The ROOT domain is allowed to reset the system
+* **system_suspend_allowed** - The ROOT domain is allowed to suspend the system
 
 Domain Effects
 --------------
@@ -195,6 +197,8 @@ The DT properties of a domain instance DT node are as follows:
   stage mode of coldboot HART** is used as default value.
 * **system-reset-allowed** (Optional) - A boolean flag representing
   whether the domain instance is allowed to do system reset.
+* **system-suspend-allowed** (Optional) - A boolean flag representing
+  whether the domain instance is allowed to do system suspend.
 
 ### Assigning HART To Domain Instance
 
@@ -260,6 +264,7 @@ be done:
                 next-addr = <0x0 0x80100000>;
                 next-mode = <0x0>;
                 system-reset-allowed;
+                system-suspend-allowed;
             };
 
             udomain: untrusted-domain {
diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index ab1a944b474b..eaca7f093271 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -120,6 +120,8 @@ struct sbi_domain {
 	unsigned long next_mode;
 	/** Is domain allowed to reset the system */
 	bool system_reset_allowed;
+	/** Is domain allowed to suspend the system */
+	bool system_suspend_allowed;
 };
 
 /** The root domain instance */
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index dc825b0d95f6..b1cd837e4b70 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -38,6 +38,7 @@ struct sbi_domain root = {
 	.possible_harts = &root_hmask,
 	.regions = root_memregs,
 	.system_reset_allowed = true,
+	.system_suspend_allowed = true,
 };
 
 bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
@@ -467,6 +468,9 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 
 	sbi_printf("Domain%d SysReset    %s: %s\n",
 		   dom->index, suffix, (dom->system_reset_allowed) ? "yes" : "no");
+
+	sbi_printf("Domain%d SysSuspend  %s: %s\n",
+		   dom->index, suffix, (dom->system_suspend_allowed) ? "yes" : "no");
 }
 
 void sbi_domain_dump_all(const char *suffix)
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 2b51a8ebe132..33653e2f555f 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -419,6 +419,13 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	else
 		dom->system_reset_allowed = false;
 
+	/* Read "system-suspend-allowed" DT property */
+	if (fdt_get_property(fdt, domain_offset,
+			     "system-suspend-allowed", NULL))
+		dom->system_suspend_allowed = true;
+	else
+		dom->system_suspend_allowed = false;
+
 	/* Find /cpus DT node */
 	cpus_offset = fdt_path_offset(fdt, "/cpus");
 	if (cpus_offset < 0)
-- 
2.39.1


