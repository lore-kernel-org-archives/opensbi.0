From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 12 Jul 2023 10:04:31 +0530
Subject: [PATCH v3 05/10] lib: utils: Add detection of Smepmp from ISA string in FDT
In-Reply-To: <20230712043436.100548-1-hchauhan@ventanamicro.com>
References: <20230706104928.3391947-1-hchauhan@ventanamicro.com>
 <20230712043436.100548-1-hchauhan@ventanamicro.com>
Message-ID: <20230712043436.100548-6-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Add function to parse ISA string in FDT.
- Set Smepmp feature bit in extensions if "smepmp" string is found in ISA string.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 include/sbi_utils/fdt/fdt_helper.h |   3 +
 lib/utils/fdt/fdt_helper.c         | 111 +++++++++++++++++++++++++++++
 platform/generic/platform.c        |   9 +++
 3 files changed, 123 insertions(+)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 39d7f3a..5c928ff 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -56,6 +56,9 @@ int fdt_parse_max_enabled_hart_id(void *fdt, u32 *max_hartid);
 
 int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq);
 
+int fdt_parse_isa_extensions(void *fdt, unsigned int hard_id,
+			     unsigned long *extensions);
+
 int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index a88a4ba..61a4100 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi/sbi_hart.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/aplic.h>
 #include <sbi_utils/irqchip/imsic.h>
@@ -313,6 +314,116 @@ int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq)
 	return 0;
 }
 
+static int fdt_get_isa_string(void *fdt, unsigned int hartid,
+			const char **isa_string)
+{
+	int err, cpu_offset, cpus_offset, len;
+	u32 c_hartid;
+	const fdt32_t *val;
+
+	if (!fdt)
+		return SBI_EINVAL;
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		return cpus_offset;
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		err = fdt_parse_hart_id(fdt, cpu_offset, &c_hartid);
+		if (err)
+			continue;
+
+		if (!fdt_node_is_enabled(fdt, cpu_offset))
+			continue;
+
+		if (c_hartid == hartid) {
+			val = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
+			if (val && len > 0) {
+				*isa_string = (const char *)val;
+				return 0;
+			}
+		}
+	}
+
+	return SBI_EINVAL;
+}
+
+#define RISCV_ISA_EXT_NAME_LEN_MAX	32
+
+int fdt_parse_isa_extensions(void *fdt, unsigned int hartid,
+			unsigned long *extensions)
+{
+	size_t i, j, isa_len;
+	char mstr[RISCV_ISA_EXT_NAME_LEN_MAX];
+	const char *isa = NULL;
+
+	if (fdt_get_isa_string(fdt, hartid, &isa))
+		return SBI_EINVAL;
+
+	if (!isa)
+		return SBI_EINVAL;
+
+	i = 0;
+	isa_len = strlen(isa);
+
+	if (isa[i] == 'r' || isa[i] == 'R')
+		i++;
+	else
+		return SBI_EINVAL;
+
+	if (isa[i] == 'v' || isa[i] == 'V')
+		i++;
+	else
+		return SBI_EINVAL;
+
+	if (isa[i] == '3' || isa[i+1] == '2')
+		i += 2;
+	else if (isa[i] == '6' || isa[i+1] == '4')
+		i += 2;
+	else
+		return SBI_EINVAL;
+
+	/* Skip base ISA extensions */
+	for (; i < isa_len; i++) {
+		if (isa[i] == '_')
+			break;
+	}
+
+	while (i < isa_len) {
+		if (isa[i] != '_') {
+			i++;
+			continue;
+		}
+
+		/* Skip the '_' character */
+		i++;
+
+		/* Extract the multi-letter extension name */
+		j = 0;
+		while ((i < isa_len) && (isa[i] != '_') &&
+		       (j < (sizeof(mstr) - 1)))
+			mstr[j++] = isa[i++];
+		mstr[j] = '\0';
+
+		/* Skip empty multi-letter extension name */
+		if (!j)
+			continue;
+
+#define SET_ISA_EXT_MAP(name, bit)				\
+		do {						\
+			if (!strcmp(mstr, name)) {		\
+				__set_bit(bit, extensions);	\
+				continue;			\
+			}					\
+		} while (false)					\
+
+		SET_ISA_EXT_MAP("smepmp", SBI_HART_EXT_SMEPMP);
+#undef SET_ISA_EXT_MAP
+	}
+
+	return 0;
+}
+
 static int fdt_parse_uart_node_common(void *fdt, int nodeoffset,
 				      struct platform_uart_data *uart,
 				      unsigned long default_freq,
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 86811e6..34b87f7 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -211,6 +211,15 @@ static void generic_final_exit(void)
 
 static int generic_extensions_init(struct sbi_hart_features *hfeatures)
 {
+	int rc;
+
+	/* Parse the ISA string from FDT and enable the listed extensions */
+	rc = fdt_parse_isa_extensions(fdt_get_address(), current_hartid(),
+				      &hfeatures->extensions);
+
+	if (rc)
+		return rc;
+
 	if (generic_plat && generic_plat->extensions_init)
 		return generic_plat->extensions_init(generic_plat_match,
 						     hfeatures);
-- 
2.34.1


