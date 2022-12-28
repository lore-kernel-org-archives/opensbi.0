From: Samuel Holland <samuel@sholland.org>
Date: Wed, 28 Dec 2022 13:11:23 -0600
Subject: [PATCH 1/2] lib: utils: Add fdt_add_cpu_idle_states() helper function
Message-ID: <20221228191125.37584-1-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since the availability and latency properties of CPU idle states depend
on the specific SBI HSM implementation, it is appropriate that the idle
states are added to the devicetree at runtime by that implementation.

This helper function adds a platform-provided array of idle states to
the devicetree, following the SBI idle state binding. It makes some
assumptions for simplicity, but these could be relaxed if needed.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 include/sbi_utils/fdt/fdt_fixup.h | 23 +++++++++
 lib/utils/fdt/fdt_fixup.c         | 80 +++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/include/sbi_utils/fdt/fdt_fixup.h b/include/sbi_utils/fdt/fdt_fixup.h
index fb076ba..cab3f0f 100644
--- a/include/sbi_utils/fdt/fdt_fixup.h
+++ b/include/sbi_utils/fdt/fdt_fixup.h
@@ -9,6 +9,29 @@
 #ifndef __FDT_FIXUP_H__
 #define __FDT_FIXUP_H__
 
+struct sbi_cpu_idle_state {
+	const char *name;
+	uint32_t suspend_param;
+	bool local_timer_stop;
+	uint32_t entry_latency_us;
+	uint32_t exit_latency_us;
+	uint32_t min_residency_us;
+	uint32_t wakeup_latency_us;
+};
+
+/**
+ * Add CPU idle states to cpu nodes in the DT
+ *
+ * Add information about CPU idle states to the devicetree. This function
+ * assumes that CPU idle states are not already present in the devicetree, and
+ * that all CPU states are equally applicable to all CPUs.
+ *
+ * @param fdt: device tree blob
+ * @param states: array of idle state descriptions, ending with empty element
+ * @return zero on success and -ve on failure
+ */
+int fdt_add_cpu_idle_states(void *dtb, const struct sbi_cpu_idle_state *state);
+
 /**
  * Fix up the CPU node in the device tree
  *
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 41f6cbb..d9aa0b2 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -18,6 +18,86 @@
 #include <sbi_utils/fdt/fdt_pmu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
+int fdt_add_cpu_idle_states(void *fdt, const struct sbi_cpu_idle_state *state)
+{
+	int cpu_node, cpus_node, err, idle_states_node;
+	uint32_t count, phandle;
+
+	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 1024);
+	if (err < 0)
+		return err;
+
+	err = fdt_find_max_phandle(fdt, &phandle);
+	phandle++;
+	if (err < 0)
+		return err;
+
+	cpus_node = fdt_path_offset(fdt, "/cpus");
+	if (cpus_node < 0)
+		return cpus_node;
+
+	/* Create the idle-states node and its child nodes. */
+	idle_states_node = fdt_add_subnode(fdt, cpus_node, "idle-states");
+	if (idle_states_node < 0)
+		return idle_states_node;
+
+	for (count = 0; state->name; count++, phandle++, state++) {
+		int idle_state_node;
+
+		idle_state_node = fdt_add_subnode(fdt, idle_states_node,
+						  state->name);
+		if (idle_state_node < 0)
+			return idle_state_node;
+
+		fdt_setprop_string(fdt, idle_state_node, "compatible",
+				   "riscv,idle-state");
+		fdt_setprop_u32(fdt, idle_state_node,
+				"riscv,sbi-suspend-param",
+				state->suspend_param);
+		if (state->local_timer_stop)
+			fdt_setprop_empty(fdt, idle_state_node,
+					  "local-timer-stop");
+		fdt_setprop_u32(fdt, idle_state_node, "entry-latency-us",
+				state->entry_latency_us);
+		fdt_setprop_u32(fdt, idle_state_node, "exit-latency-us",
+				state->exit_latency_us);
+		fdt_setprop_u32(fdt, idle_state_node, "min-residency-us",
+				state->min_residency_us);
+		if (state->wakeup_latency_us)
+			fdt_setprop_u32(fdt, idle_state_node,
+					"wakeup-latency-us",
+					state->wakeup_latency_us);
+		fdt_setprop_u32(fdt, idle_state_node, "phandle", phandle);
+	}
+
+	if (count == 0)
+		return 0;
+
+	/* Link each cpu node to the idle state nodes. */
+	fdt_for_each_subnode(cpu_node, fdt, cpus_node) {
+		const char *device_type;
+		fdt32_t *value;
+
+		/* Only process child nodes with device_type = "cpu". */
+		device_type = fdt_getprop(fdt, cpu_node, "device_type", NULL);
+		if (!device_type || strcmp(device_type, "cpu"))
+			continue;
+
+		/* Allocate space for the list of phandles. */
+		err = fdt_setprop_placeholder(fdt, cpu_node, "cpu-idle-states",
+					      count * sizeof(phandle),
+					      (void **)&value);
+		if (err < 0)
+			return err;
+
+		/* Fill in the phandles of the idle state nodes. */
+		for (uint32_t i = 0; i < count; ++i)
+			value[i] = cpu_to_fdt32(phandle - count + i);
+	}
+
+	return 0;
+}
+
 void fdt_cpu_fixup(void *fdt)
 {
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-- 
2.37.4


