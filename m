From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue,  3 Sep 2024 13:53:10 -0700
Subject: [PATCH] Makefile: Separate libsbi objects for each platform
Message-ID: <20240903205345.2088737-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since commit 22f38ee6c658 ("lib: sbi_ecall: Add Kconfig option for each
extension"), the libsbi object file contents depend on the Kconfig
configuration, so these files may be different across platforms. As a
result, each platform should get a separate copy of these object files,
corresponding to that platform's configuration.

This change also allows building for multiple platforms in parallel.

Fixes: 22f38ee6c658 ("lib: sbi_ecall: Add Kconfig option for each extension")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---
Note that Kconfig is not used for the generic (no PLATFORM set) libsbi
build. But this is actually equivalent to all Kconfig options being
disabled. As a result, since the referenced commit, the generic libsbi
only supports the base SBI extension and none of the others. I don't
know how we want to fix this -- does anyone even use libsbi anymore?

 Makefile | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e5a0f19e..ccb2e138 100644
--- a/Makefile
+++ b/Makefile
@@ -264,11 +264,13 @@ include $(libsbiutils-object-mks)
 include $(firmware-object-mks)
 
 # Setup list of objects
-libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(build_dir)/lib/sbi/$(obj))
 ifdef PLATFORM
+libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(platform_build_dir)/lib/sbi/$(obj))
 libsbiutils-objs-path-y=$(foreach obj,$(libsbiutils-objs-y),$(platform_build_dir)/lib/utils/$(obj))
 platform-objs-path-y=$(foreach obj,$(platform-objs-y),$(platform_build_dir)/$(obj))
 firmware-bins-path-y=$(foreach bin,$(firmware-bins-y),$(platform_build_dir)/firmware/$(bin))
+else
+libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(build_dir)/lib/sbi/$(obj))
 endif
 firmware-elfs-path-y=$(firmware-bins-path-y:.bin=.elf)
 firmware-objs-path-y=$(firmware-bins-path-y:.bin=.o)
@@ -504,9 +506,10 @@ compile_gen_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " GEN-DEP   $(subst $(build_dir)/,,$(1))"; \
 	     echo "$(1:.dep=$(2)): $(3)" >> $(1)
 
-targets-y  = $(build_dir)/lib/libsbi.a
 ifdef PLATFORM
 targets-y += $(platform_build_dir)/lib/libplatsbi.a
+else
+targets-y  = $(build_dir)/lib/libsbi.a
 endif
 targets-y += $(firmware-bins-path-y)
 
@@ -565,6 +568,11 @@ $(platform_build_dir)/%.dep: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
 $(platform_build_dir)/%.o: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
 	$(call compile_cc,$@,$<)
 
+ifeq ($(BUILD_INFO),y)
+$(platform_build_dir)/lib/sbi/sbi_init.o: $(libsbi_dir)/sbi_init.c FORCE
+	$(call compile_cc,$@,$<)
+endif
+
 $(platform_build_dir)/%.dep: $(platform_src_dir)/%.S
 	$(call compile_as_dep,$@,$<)
 
-- 
2.45.1


