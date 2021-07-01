From: Green Wan <green.wan@sifive.com>
Date: Thu,  1 Jul 2021 15:39:56 +0800
Subject: [RFC PATCH 2/4] lib: utils: add GPIO and poweroff parsing
In-Reply-To: <20210701073958.15558-1-green.wan@sifive.com>
References: <20210701073958.15558-1-green.wan@sifive.com>
Message-ID: <20210701073958.15558-3-green.wan@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for GPIO and 'gpio-poweroff' in DT.

Signed-off-by: Green Wan <green.wan@sifive.com>
---
 include/sbi_utils/fdt/fdt_helper.h | 21 ++++++++++++
 lib/utils/fdt/fdt_helper.c         | 51 +++++++++++++++++++++++++++++-
 2 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 871f9b9..1c50368 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -12,6 +12,17 @@
 
 #include <sbi/sbi_types.h>
 
+enum gpio_output_type {
+	GPIO_ACTIVE_HIGH = 0,
+	GPIO_ACTIVE_LOW,
+};
+
+struct poweroff_gpio {
+	unsigned int act_delay;			/* in ms */
+	int gpio;				/* GPIO No */
+	enum gpio_output_type output_type;	/* output type */
+};
+
 struct fdt_match {
 	const char *compatible;
 	void *data;
@@ -25,6 +36,10 @@ struct platform_uart_data {
 	unsigned long reg_io_width;
 };
 
+struct platform_gpio_data {
+	unsigned long addr;
+};
+
 const struct fdt_match *fdt_match_node(void *fdt, int nodeoff,
 				       const struct fdt_match *match_table);
 
@@ -67,4 +82,10 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
 int fdt_parse_compat_addr(void *fdt, unsigned long *addr,
 			  const char *compatible);
 
+int fdt_parse_gpio_pwroff(void *fdt, struct poweroff_gpio *pwroff,
+			  const char *compatible);
+
+int fdt_parse_gpio_node(void *fdt, int nodeoffset,
+			struct platform_gpio_data *gpio);
+
 #endif /* __FDT_HELPER_H__ */
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index de77196..a7e8f58 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -5,7 +5,6 @@
  *
  * Copyright (C) 2020 Bin Meng <bmeng.cn@gmail.com>
  */
-
 #include <libfdt.h>
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_console.h>
@@ -503,3 +502,53 @@ int fdt_parse_compat_addr(void *fdt, unsigned long *addr,
 
 	return 0;
 }
+
+int fdt_parse_gpio_pwroff(void *fdt, struct poweroff_gpio *pwroff,
+			  const char *compatible)
+{
+	int pwroff_offset;
+
+	pwroff_offset = fdt_path_offset(fdt, compatible);
+	if (pwroff_offset >= 0) {
+		int len;
+		const char *pwroff_cmpt;
+
+		pwroff_cmpt = fdt_getprop(fdt, pwroff_offset, "compatible", &len);
+
+		if (pwroff_cmpt && !sbi_strcmp("gpio-poweroff", pwroff_cmpt)) {
+			const fdt32_t *val;
+
+			val = fdt_getprop(fdt, pwroff_offset,
+					  "active-delay-ms", &len);
+			if (val)
+				pwroff->act_delay = fdt32_to_cpu(*val);
+
+			val = fdt_getprop(fdt, pwroff_offset, "gpios", &len);
+			if (val) {
+				pwroff->gpio = fdt32_to_cpu(val[1]);
+				pwroff->output_type = fdt32_to_cpu(val[2]);
+
+				return 0;
+			}
+		}
+	}
+
+	return SBI_EINVAL;
+}
+
+int fdt_parse_gpio_node(void *fdt, int nodeoffset,
+			struct platform_gpio_data *gpio)
+{
+	int rc;
+	unsigned long reg_addr, reg_size;
+
+	if (nodeoffset < 0 || !gpio || !fdt)
+		return SBI_ENODEV;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
+	if (rc < 0 || !reg_addr || !reg_size)
+		return SBI_ENODEV;
+	gpio->addr = reg_addr;
+
+	return 0;
+}
-- 
2.17.1


