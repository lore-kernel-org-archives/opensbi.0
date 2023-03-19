From: Jun Liang Tan <junliang.tan@starfivetech.com>
Date: Mon, 20 Mar 2023 02:22:52 +0800
Subject: [PATCH] Makefile: Generate Map file for each firmware
Message-ID: <20230319182252.5862-1-junliang.tan@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, OpenSBI does not generate Map file.
This patch allows OpenSBI generates Map file for each
firmware. This comes in handy in debugging process as
Map file gives detailed information about the symbols
in our program.

Signed-off-by: Jun Liang Tan <junliang.tan@starfivetech.com>
Reviewed-by: Chee Hong Ang <cheehong.ang@starfivetech.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a26a39b..e46b67a 100644
--- a/Makefile
+++ b/Makefile
@@ -445,7 +445,7 @@ compile_as = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     $(AS) $(ASFLAGS) $(call dynamic_flags,$(1),$(2)) -c $(2) -o $(1)
 compile_elf = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " ELF       $(subst $(build_dir)/,,$(1))"; \
-	     $(CC) $(CFLAGS) $(3) $(ELFFLAGS) -Wl,-T$(2) -o $(1)
+	     $(CC) $(CFLAGS) -Wl,-Map=$(basename $(1)).map $(3) $(ELFFLAGS) -Wl,-T$(2) -o $(1)
 compile_ar = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " AR        $(subst $(build_dir)/,,$(1))"; \
 	     $(AR) $(ARFLAGS) $(1) $(2)
@@ -669,6 +669,8 @@ clean:
 	$(CMD_PREFIX)find $(build_dir) -type f -name "*.bin" -exec rm -rf {} +
 	$(if $(V), @echo " RM        $(build_dir)/*.dtb")
 	$(CMD_PREFIX)find $(build_dir) -type f -name "*.dtb" -exec rm -rf {} +
+	$(if $(V), @echo " RM        $(build_dir)/*.map")
+	$(CMD_PREFIX)find $(build_dir) -type f -name "*.map" -exec rm -rf {} +
 
 # Rule for "make distclean"
 .PHONY: distclean
-- 
2.38.1


