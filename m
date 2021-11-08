From: Atish Patra <atish.patra@wdc.com>
Date: Mon,  8 Nov 2021 10:53:06 -0800
Subject: [PATCH v5 11/12] lib: utils: Rename the prefix in PMU DT properties
In-Reply-To: <20211108185307.389145-1-atish.patra@wdc.com>
References: <20211108185307.389145-1-atish.patra@wdc.com>
Message-ID: <20211108185307.389145-12-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As per the DT schema rules, the prefix should be vendor. As the PMU
properties are generic for all vendors, change the prefix to riscv
instead of pmu.

Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 docs/pmu_support.md     | 12 ++++++------
 lib/utils/fdt/fdt_pmu.c | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/docs/pmu_support.md b/docs/pmu_support.md
index 6533c99f8997..a60b75cf9efa 100644
--- a/docs/pmu_support.md
+++ b/docs/pmu_support.md
@@ -31,7 +31,7 @@ bindings in details.
 * **compatible** (Mandatory) - The compatible string of SBI PMU device tree node.
 This DT property must have the value **riscv,pmu**.
 
-* **pmu,event-to-mhpmevent**(Optional) - It represents an ONE-to-ONE mapping
+* **riscv,event-to-mhpmevent**(Optional) - It represents an ONE-to-ONE mapping
 between a PMU event and the event selector value that platform expects to be
 written to the MHPMEVENTx CSR for that event. The mapping is encoded in a
 table format where each row represents an event. The first column represent the
@@ -39,7 +39,7 @@ event idx where the 2nd & 3rd column represent the event selector value that
 should be encoded in the expected value to be written in MHPMEVENTx.
 This property shouldn't encode any raw hardware event.
 
-* **pmu,event-to-mhpmcounters**(Optional) - It represents a MANY-to-MANY
+* **riscv,event-to-mhpmcounters**(Optional) - It represents a MANY-to-MANY
 mapping between a range of events and all the MHPMCOUNTERx in a bitmap format
 that can be used to monitor these range of events. The information is encoded in
 a table format where each row represent a certain range of events and
@@ -49,7 +49,7 @@ represent a bitmap of all the MHPMCOUNTERx. This property is mandatory if
 event-to-mhpmevent is present. Otherwise, it can be omitted. This property
 shouldn't encode any raw event.
 
-* **pmu,raw-event-to-mhpmcounters**(Optional) - It represents an ONE-to-MANY
+* **riscv,raw-event-to-mhpmcounters**(Optional) - It represents an ONE-to-MANY
 mapping between a raw event and all the MHPMCOUNTERx in a bitmap format that can
 be used to monitor that raw event. The information is encoded in a table format
 where each raw represent a specific raw event. The first column stores the
@@ -67,12 +67,12 @@ pmu {
 	compatible 			= "riscv,pmu";
 	interrupts 			= <0x100>;
 	interrupt-parent 			= <&plic>
-	pmu,event-to-mhpmevent 		= <0x0000B  0x0000 0x0001>,
-	pmu,event-to-mhpmcounters 	= <0x00001 0x00001 0x00000001>,
+	riscv,event-to-mhpmevent 		= <0x0000B  0x0000 0x0001>,
+	riscv,event-to-mhpmcounters 	= <0x00001 0x00001 0x00000001>,
 						  <0x00002 0x00002 0x00000004>,
 						  <0x00003 0x0000A 0x00000ff8>,
 						  <0x10000 0x10033 0x000ff000>,
-	pmu,raw-event-to-mhpmcounters 	= <0x0000 0x0002 0x00000f8>,
+	riscv,raw-event-to-mhpmcounters 	= <0x0000 0x0002 0x00000f8>,
 					  <0x0000 0x0003 0x00000ff0>,
 };
 
diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
index 09c83c816f23..529ee420554f 100644
--- a/lib/utils/fdt/fdt_pmu.c
+++ b/lib/utils/fdt/fdt_pmu.c
@@ -50,9 +50,9 @@ int fdt_pmu_fixup(void *fdt)
 	if (pmu_offset < 0)
 		return SBI_EFAIL;
 
-	fdt_delprop(fdt, pmu_offset, "pmu,event-to-mhpmcounters");
-	fdt_delprop(fdt, pmu_offset, "pmu,event-to-mhpmevent");
-	fdt_delprop(fdt, pmu_offset, "pmu,raw-event-to-mhpmcounters");
+	fdt_delprop(fdt, pmu_offset, "riscv,event-to-mhpmcounters");
+	fdt_delprop(fdt, pmu_offset, "riscv,event-to-mhpmevent");
+	fdt_delprop(fdt, pmu_offset, "riscv,raw-event-to-mhpmcounters");
 	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
 		fdt_delprop(fdt, pmu_offset, "interrupts-extended");
 
@@ -75,7 +75,7 @@ int fdt_pmu_setup(void *fdt)
 	if (pmu_offset < 0)
 		return SBI_EFAIL;
 
-	event_ctr_map = fdt_getprop(fdt, pmu_offset, "pmu,event-to-mhpmcounters", &len);
+	event_ctr_map = fdt_getprop(fdt, pmu_offset, "riscv,event-to-mhpmcounters", &len);
 	if (!event_ctr_map || len < 8)
 		return SBI_EFAIL;
 	len = len / (sizeof(u32) * 3);
@@ -86,7 +86,7 @@ int fdt_pmu_setup(void *fdt)
 		sbi_pmu_add_hw_event_counter_map(event_idx_start, event_idx_end, ctr_map);
 	}
 
-	event_val = fdt_getprop(fdt, pmu_offset, "pmu,event-to-mhpmevent", &len);
+	event_val = fdt_getprop(fdt, pmu_offset, "riscv,event-to-mhpmevent", &len);
 	if (!event_val || len < 8)
 		return SBI_EFAIL;
 	len = len / (sizeof(u32) * 3);
@@ -98,7 +98,7 @@ int fdt_pmu_setup(void *fdt)
 		hw_event_count++;
 	}
 
-	event_val = fdt_getprop(fdt, pmu_offset, "pmu,raw-event-to-mhpmcounters", &len);
+	event_val = fdt_getprop(fdt, pmu_offset, "riscv,raw-event-to-mhpmcounters", &len);
 	if (!event_val || len < 8)
 		return SBI_EFAIL;
 	len = len / (sizeof(u32) * 3);
-- 
2.31.1


