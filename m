From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Mon,  1 Nov 2021 15:45:22 +0300
Subject: [PATCH] [PoC] add init like system
Message-ID: <20211101124522.17399-1-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

Hello All,

That's not an even RFC this is just a PoC.

Heinrich, you already sent some prototype for adding lists at compile
time, https://github.com/xypron/linker_generated_lists, you mentioned
some problems with linker:

https://sourceware.org/bugzilla/show_bug.cgi?id=28398

Well the problem is that we are linking with archive, adding
--whole-archive during linker will preserve our init section in object files,
however linking payloads will fail, for for obvious reasons.

We can link the resulting elf files using the object files, preserving
the build of *.a intact, with this approuch we can also benefit from,
-ffunction-sections -fdata-sections, --gc-sections.

The other way is like Anup suggested is to parse object files and place
calls to functions mentioned in init section's in a separate generated
file.

Heinrich, Anup what do you think about this ?

Welcoming all people involed opinions.
---
 Makefile                                |  5 ++-
 firmware/fw_base.ldS                    | 15 ++++++-
 include/sbi/sbi_init.h                  | 58 +++++++++++++++++++++++++
 include/sbi_utils/reset/fdt_reset.h     |  7 +++
 lib/sbi/sbi_init.c                      | 24 ++++++++++
 lib/utils/reset/fdt_reset.c             | 46 +++++++-------------
 lib/utils/reset/fdt_reset_gpio.c        |  5 +++
 lib/utils/reset/fdt_reset_htif.c        |  2 +
 lib/utils/reset/fdt_reset_sifive_test.c |  2 +
 lib/utils/reset/fdt_reset_sunxi_wdt.c   |  2 +
 lib/utils/reset/fdt_reset_thead.c       |  2 +
 platform/generic/config.mk              |  2 +-
 12 files changed, 137 insertions(+), 33 deletions(-)

diff --git a/Makefile b/Makefile
index 8623c1c..e162368 100644
--- a/Makefile
+++ b/Makefile
@@ -435,8 +435,11 @@ $(build_dir)/%.o: $(src_dir)/%.S
 $(platform_build_dir)/%.bin: $(platform_build_dir)/%.elf
 	$(call compile_objcopy,$@,$<)
 
+comma:= ,
+
+# $(call compile_elf,$@,$@.ld,$< -Wl$(comma)--whole-archive $(platform_build_dir)/lib/libplatsbi.a -Wl$(comma)--no-whole-archive)
 $(platform_build_dir)/%.elf: $(platform_build_dir)/%.o $(platform_build_dir)/%.elf.ld $(platform_build_dir)/lib/libplatsbi.a
-	$(call compile_elf,$@,$@.ld,$< $(platform_build_dir)/lib/libplatsbi.a)
+	$(call compile_elf,$@,$@.ld,$< -Wl$(comma)--whole-archive $(platform_build_dir)/lib/libplatsbi.a -Wl$(comma)--no-whole-archive)
 
 $(platform_build_dir)/%.ld: $(src_dir)/%.ldS
 	$(call compile_cpp,$@,$<)
diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 220c043..93fd5bf 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -19,13 +19,24 @@
  	{
 		PROVIDE(_text_start = .);
 		*(.entry)
-		*(.text)
+		*(.text*)
+		*(.init.text*)
 		. = ALIGN(8);
 		PROVIDE(_text_end = .);
 	}
 
 	. = ALIGN(0x1000); /* Ensure next section is page aligned */
 
+        . = ALIGN(0x1000);
+        .init :
+        {
+                PROVIDE(__initcall_start = .);
+                *(.init)
+                PROVIDE(__initcall_end = .);
+        }
+        . = ALIGN(0x1000);
+
+
 	/* End of the code sections */
 
 	/* Beginning of the read-only data sections */
@@ -40,6 +51,8 @@
 		PROVIDE(_rodata_end = .);
 	}
 
+	. = ALIGN(0x1000); /* Ensure next section is page aligned */
+
 	/* End of the read-only data sections */
 
 	/* Beginning of the read-write data sections */
diff --git a/include/sbi/sbi_init.h b/include/sbi/sbi_init.h
index 74eb1c0..5851def 100644
--- a/include/sbi/sbi_init.h
+++ b/include/sbi/sbi_init.h
@@ -20,4 +20,62 @@ unsigned long sbi_init_count(u32 hartid);
 
 void __noreturn sbi_exit(struct sbi_scratch *scratch);
 
+/* init stuff */
+
+typedef int (*initcall_t)(void);
+
+typedef initcall_t initcall_entry_t;
+
+extern initcall_entry_t __initcall_start[];
+extern initcall_entry_t __initcall_end[];
+
+static inline initcall_t initcall_from_entry(initcall_entry_t *entry)
+{
+	return *entry;
+}
+
+#define __section(section)              __attribute__((__section__(section)))
+
+#define __init		__section(".init.text")
+
+#define ___PASTE(a, b) a##b
+#define __PASTE(a, b) ___PASTE(a, b)
+
+
+# define __used		__attribute__((used))
+
+#define __initcall_id(fn)		\
+__PASTE(__COUNTER__,			\
+__PASTE(_,						\
+__PASTE(__LINE__,				\
+__PASTE(_, fn))))
+
+#define __initcall_name(prefix, __iid)	\
+__PASTE(__,								\
+__PASTE(prefix,							\
+__PASTE(__, __iid)))
+
+#define __initcall_section ".init"
+
+#define __initcall_stub(fn)	fn
+
+#define ____define_initcall(fn, __unused, __name, __sec) \
+static initcall_t __name __used __attribute__((__section__(__sec))) = fn;
+
+#define __unique_initcall(fn, __iid)	\
+____define_initcall(fn,					\
+__initcall_stub(fn),					\
+__initcall_name(initcall, __iid),		\
+__initcall_section)
+
+#define device_initcall(fn) \
+    __unique_initcall(fn, __initcall_id(fn))
+
+#define builtin_driver(__driver, __register, ...) \
+static int __init __driver##_init(void) \
+{ \
+	return __register(&(__driver) , ##__VA_ARGS__); \
+} \
+device_initcall(__driver##_init);
+
 #endif
diff --git a/include/sbi_utils/reset/fdt_reset.h b/include/sbi_utils/reset/fdt_reset.h
index 6d58697..0c1caf9 100644
--- a/include/sbi_utils/reset/fdt_reset.h
+++ b/include/sbi_utils/reset/fdt_reset.h
@@ -11,6 +11,8 @@
 #define __FDT_RESET_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi/sbi_list.h>
+#include <sbi/sbi_init.h>
 
 struct fdt_reset {
 	const struct fdt_match *match_table;
@@ -19,4 +21,9 @@ struct fdt_reset {
 
 int fdt_reset_init(void);
 
+int fdt_reset_add_driver(struct fdt_reset *driver);
+
+#define builtin_reset_driver(__reset_driver) \
+builtin_driver(__reset_driver, fdt_reset_add_driver)
+
 #endif
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index b1c7cf0..dbaff25 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -226,6 +226,28 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 	spin_unlock(&coldboot_lock);
 }
 
+typedef int (*initcall_t)(void);
+typedef initcall_t initcall_entry_t;
+extern initcall_entry_t __initcall_start[];
+extern initcall_entry_t __initcall_end[];
+static int do_one_initcall(initcall_t fn)
+{
+    int ret = fn();
+    return ret;
+}
+
+static inline initcall_t initcall_from_entry(initcall_entry_t *entry)
+{
+    return *entry;
+}
+
+static void init_test(void)
+{
+	initcall_entry_t *fn;
+	for (fn = __initcall_start; fn < __initcall_end; fn++)
+		do_one_initcall(initcall_from_entry(fn));
+}
+
 static unsigned long init_count_offset;
 
 static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
@@ -270,6 +292,8 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_boot_print_banner(scratch);
 
+	init_test();
+
 	rc = sbi_platform_irqchip_init(plat, TRUE);
 	if (rc) {
 		sbi_printf("%s: platform irqchip init failed (error %d)\n",
diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index 168bb0c..bbcfe22 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -12,43 +12,29 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/reset/fdt_reset.h>
 
-extern struct fdt_reset fdt_poweroff_gpio;
-extern struct fdt_reset fdt_reset_gpio;
-extern struct fdt_reset fdt_reset_htif;
-extern struct fdt_reset fdt_reset_sifive_test;
-extern struct fdt_reset fdt_reset_sunxi_wdt;
-extern struct fdt_reset fdt_reset_thead;
-
-static struct fdt_reset *reset_drivers[] = {
-	&fdt_poweroff_gpio,
-	&fdt_reset_gpio,
-	&fdt_reset_htif,
-	&fdt_reset_sifive_test,
-	&fdt_reset_sunxi_wdt,
-	&fdt_reset_thead,
-};
+#include <sbi/sbi_console.h>
 
 int fdt_reset_init(void)
 {
-	int pos, noff, rc;
-	struct fdt_reset *drv;
+	return 0;
+}
+
+int fdt_reset_add_driver(struct fdt_reset *driver)
+{
+	int noff, rc;
 	const struct fdt_match *match;
 	void *fdt = sbi_scratch_thishart_arg1_ptr();
+    
+    sbi_printf("%s : added : %s\n", __func__, driver->match_table[0].compatible);
 
-	for (pos = 0; pos < array_size(reset_drivers); pos++) {
-		drv = reset_drivers[pos];
-
-		noff = fdt_find_match(fdt, -1, drv->match_table, &match);
-		if (noff < 0)
-			continue;
+	noff = fdt_find_match(fdt, -1, driver->match_table, &match);
+	if (noff < 0)
+		return 0;
 
-		if (drv->init) {
-			rc = drv->init(fdt, noff, match);
-			if (rc == SBI_ENODEV)
-				continue;
-			if (rc)
-				return rc;
-		}
+	if (driver->init) {
+		rc = driver->init(fdt, noff, match);
+		if (rc)
+			return rc;
 	}
 
 	return 0;
diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
index 4da1450..8ad04f5 100644
--- a/lib/utils/reset/fdt_reset_gpio.c
+++ b/lib/utils/reset/fdt_reset_gpio.c
@@ -10,6 +10,7 @@
  */
 
 #include <libfdt.h>
+#include <sbi/sbi_init.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_hart.h>
@@ -130,6 +131,8 @@ struct fdt_reset fdt_poweroff_gpio = {
 	.init = gpio_reset_init,
 };
 
+builtin_reset_driver(fdt_poweroff_gpio);
+
 static const struct fdt_match gpio_reset_match[] = {
 	{ .compatible = "gpio-restart", .data = (void *)TRUE },
 	{ },
@@ -139,3 +142,5 @@ struct fdt_reset fdt_reset_gpio = {
 	.match_table = gpio_reset_match,
 	.init = gpio_reset_init,
 };
+
+builtin_reset_driver(fdt_reset_gpio);
diff --git a/lib/utils/reset/fdt_reset_htif.c b/lib/utils/reset/fdt_reset_htif.c
index dd08660..3551caf 100644
--- a/lib/utils/reset/fdt_reset_htif.c
+++ b/lib/utils/reset/fdt_reset_htif.c
@@ -26,3 +26,5 @@ struct fdt_reset fdt_reset_htif = {
 	.match_table = htif_reset_match,
 	.init = htif_reset_init
 };
+
+builtin_reset_driver(fdt_reset_htif);
diff --git a/lib/utils/reset/fdt_reset_sifive_test.c b/lib/utils/reset/fdt_reset_sifive_test.c
index 7e0eba3..50d69be 100644
--- a/lib/utils/reset/fdt_reset_sifive_test.c
+++ b/lib/utils/reset/fdt_reset_sifive_test.c
@@ -34,3 +34,5 @@ struct fdt_reset fdt_reset_sifive_test = {
 	.match_table = sifive_test_reset_match,
 	.init = sifive_test_reset_init,
 };
+
+builtin_reset_driver(fdt_reset_sifive_test);
diff --git a/lib/utils/reset/fdt_reset_sunxi_wdt.c b/lib/utils/reset/fdt_reset_sunxi_wdt.c
index 6d1b5b7..a89994f 100644
--- a/lib/utils/reset/fdt_reset_sunxi_wdt.c
+++ b/lib/utils/reset/fdt_reset_sunxi_wdt.c
@@ -75,3 +75,5 @@ struct fdt_reset fdt_reset_sunxi_wdt = {
 	.match_table = sunxi_wdt_reset_match,
 	.init = sunxi_wdt_reset_init,
 };
+
+builtin_reset_driver(fdt_reset_sunxi_wdt);
diff --git a/lib/utils/reset/fdt_reset_thead.c b/lib/utils/reset/fdt_reset_thead.c
index d491687..e493599 100644
--- a/lib/utils/reset/fdt_reset_thead.c
+++ b/lib/utils/reset/fdt_reset_thead.c
@@ -132,3 +132,5 @@ struct fdt_reset fdt_reset_thead = {
 	.match_table = thead_reset_match,
 	.init = thead_reset_init
 };
+
+builtin_reset_driver(fdt_reset_thead);
diff --git a/platform/generic/config.mk b/platform/generic/config.mk
index 8151974..d21effa 100644
--- a/platform/generic/config.mk
+++ b/platform/generic/config.mk
@@ -29,7 +29,7 @@ else
   FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x200000)))
 endif
 FW_JUMP_FDT_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x2200000)))
-FW_PAYLOAD=y
+FW_PAYLOAD=n
 ifeq ($(PLATFORM_RISCV_XLEN), 32)
   # This needs to be 4MB aligned for 32-bit system
   FW_PAYLOAD_OFFSET=0x400000
-- 
2.31.1


