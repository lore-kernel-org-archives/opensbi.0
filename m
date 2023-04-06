From: Tan En De <ende.tan@starfivetech.com>
Date: Thu, 6 Apr 2023 14:26:22 +0800
Subject: [1/1] lib: utils/fdt: Parse for UART "clocks" property if "clock-frequency" is absent
Message-ID: <20230406062622.1484-1-ende.tan@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For UART node, current implementation of fdt_parse_uart_node_common() checks for "clock-frequency" property only.
However, for UART node that uses more than one clock,
"clock-frequency" may need to be parsed from the phandle specified in "clocks" property.
So, this commit adds in logic to parse "clocks" property if "clock-frequency" is absent.

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
Signed-off-by: Tan Jun Liang <junliang.tan@starfivetech.com>
---
 include/sbi_utils/fdt/fdt_helper.h |  6 +++
 lib/utils/fdt/fdt_helper.c         | 65 +++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 39d7f3a..d84040e 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -32,6 +32,12 @@ struct platform_uart_data {
 	unsigned long reg_shift;
 	unsigned long reg_io_width;
 	unsigned long reg_offset;
+	/*
+	 * For multi-clock UART node.
+	 * clock_index shall be set to zero-indexed main clock's index in the "clocks" list,
+	 * from which freq will be obtained for baud calculation.
+	 */
+	unsigned long clock_index;
 };
 
 const struct fdt_match *fdt_match_node(void *fdt, int nodeoff,
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 48bc2fe..d68d886 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -313,6 +313,62 @@ int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq)
 	return 0;
 }
 
+/*
+ * For multi-clock UART node.
+ * Parse "clocks" property in UART node to set uart->freq.
+ * "clocks" property is an array of clock phandle and clock specifier pairs.
+ * Before calling this function, uart->clock_index shall be set with
+ * the index of the pair containing the main UART clock's phandle,
+ * which baudrate calculation will be based on.
+ * Return 0 on success, else return -1.
+ */
+static int fdt_parse_uart_clocks_prop(void *fdt, int nodeoffset,
+				struct platform_uart_data *uart)
+{
+	const fdt32_t *clocks_val, *clock_cells_val, *clock_frequency_val;
+	uint32_t clock_phandle, cell_index, clock_cells;
+	int clocks_len, clock_offset, clock_cells_len, clock_frequency_len;
+	unsigned long clock_index = uart->clock_index;
+
+	/* clocks_val is a flattened array of values, made from the phandle and specifier pairs. */
+	clocks_val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "clocks", &clocks_len);
+	if (!(clocks_len > 0 && clocks_val))
+		return -1;
+
+	cell_index = 0; /* index into the clocks_val */
+	for (int i = 0; i <= clock_index; i++) {
+		/* In case of out-of-bound access to the clocks_val array, return -1. */
+		if (cell_index + 1 > clocks_len)
+			return -1;
+		/* Else, parse the phandle */
+		clock_phandle = fdt32_to_cpu(clocks_val[cell_index]);
+		clock_offset = fdt_node_offset_by_phandle(fdt, clock_phandle);
+		/*
+		 * "#clock-cells" is a required property,
+		 * it tells how many cells the clock specifier takes.
+		 */
+		clock_cells_val = (fdt32_t *)fdt_getprop(fdt, clock_offset, "#clock-cells", &clock_cells_len);
+		if (clock_cells_len > 0 && clock_cells_val)
+			clock_cells = fdt32_to_cpu(*clock_cells_val);
+		else
+			return -1;
+		/*
+		 * Advance clock_index to get cell index to next phandle.
+		 * Each phandle and clock specifier pair consists of
+		 * 1 phandle and clock_cells number of specifiers.
+		 */
+		cell_index += 1 + clock_cells;
+	}
+	/* Finally, obtain the uart->freq from "clock-freqeuncy" property */
+	clock_frequency_val = (fdt32_t *)fdt_getprop(fdt, clock_offset, "clock-frequency", &clock_frequency_len);
+	if (clock_frequency_len > 0 && clock_frequency_val)
+		uart->freq = fdt32_to_cpu(*clock_frequency_val);
+	else
+		return -1;
+
+	return 0;
+}
+
 static int fdt_parse_uart_node_common(void *fdt, int nodeoffset,
 				      struct platform_uart_data *uart,
 				      unsigned long default_freq,
@@ -338,8 +394,13 @@ static int fdt_parse_uart_node_common(void *fdt, int nodeoffset,
 	val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "clock-frequency", &len);
 	if (len > 0 && val)
 		uart->freq = fdt32_to_cpu(*val);
-	else
-		uart->freq = default_freq;
+	else {
+		/* If "clock-frequency" property is absent, try parse for "clocks" property */
+		rc = fdt_parse_uart_clocks_prop(fdt, nodeoffset, uart);
+		/* Fall back to default frequency in case of failure to parse */
+		if (rc < 0)
+			uart->freq = default_freq;
+	}
 
 	val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "current-speed", &len);
 	if (len > 0 && val)
-- 
2.34.1


