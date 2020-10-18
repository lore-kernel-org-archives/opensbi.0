From: Anup Patel <anup.patel@wdc.com>
Date: Sun, 18 Oct 2020 10:44:48 +0530
Subject: [PATCH v2 4/5] Makefile: Allow padding zeros when converting DTB to C
 source
In-Reply-To: <20201018051449.2368918-1-anup.patel@wdc.com>
References: <20201018051449.2368918-1-anup.patel@wdc.com>
Message-ID: <20201018051449.2368918-5-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Heinrich Schuchardt <xypron.glpk@gmx.de>

We extend d2c.sh to allow padding zeros in output C source when
converting DTB to C source. Using this feature, platforms can
create extra room for in-place FDT fixups on built-in DTBs.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 Makefile       | 7 +++++--
 scripts/d2c.sh | 9 ++++++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6c36f09..a231881 100644
--- a/Makefile
+++ b/Makefile
@@ -291,7 +291,10 @@ compile_dts = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     $(CPP) $(DTSCPPFLAGS) $(2) | $(DTC) -O dtb -i `dirname $(2)` -o $(1)
 compile_d2c = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " D2C       $(subst $(build_dir)/,,$(1))"; \
-	     $(src_dir)/scripts/d2c.sh -i $(4) -a $(3) -p $(2) > $(1)
+	     $(if $($(2)-varalign-$(3)),$(eval D2C_ALIGN_BYTES := $($(2)-varalign-$(3))),$(eval D2C_ALIGN_BYTES := $(4))) \
+	     $(if $($(2)-varprefix-$(3)),$(eval D2C_NAME_PREFIX := $($(2)-varprefix-$(3))),$(eval D2C_NAME_PREFIX := $(5))) \
+	     $(if $($(2)-padding-$(3)),$(eval D2C_PADDING_BYTES := $($(2)-padding-$(3))),$(eval D2C_PADDING_BYTES := 0)) \
+	     $(src_dir)/scripts/d2c.sh -i $(6) -a $(D2C_ALIGN_BYTES) -p $(D2C_NAME_PREFIX) -t $(D2C_PADDING_BYTES) > $(1)
 compile_gen_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " GEN-DEP   $(subst $(build_dir)/,,$(1))"; \
 	     echo "$(1:.dep=$(2)): $(3)" >> $(1)
@@ -361,7 +364,7 @@ $(platform_build_dir)/%.dep: $(platform_src_dir)/%.dts
 	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
 
 $(platform_build_dir)/%.c: $(platform_build_dir)/%.dtb
-	$(call compile_d2c,$@,$(platform-varprefix-$(subst .dtb,.o,$(subst /,-,$(subst $(platform_build_dir)/,,$<)))),16,$<)
+	$(call compile_d2c,$@,platform,$(subst .dtb,.o,$(subst /,-,$(subst $(platform_build_dir)/,,$<))),16,dt,$<)
 
 $(platform_build_dir)/%.dtb: $(platform_src_dir)/%.dts
 	$(call compile_dts,$@,$<)
diff --git a/scripts/d2c.sh b/scripts/d2c.sh
index 821a995..33a3ccf 100755
--- a/scripts/d2c.sh
+++ b/scripts/d2c.sh
@@ -9,6 +9,7 @@ function usage()
 	echo "     -i <input_file_path> Input binary file path"
 	echo "     -a <c_align>         Output C array alignment"
 	echo "     -p <c_prefix>        Output C array name prefix"
+	echo "     -t <num_zero_bytes>  Output padding zero bytes"
 	exit 1;
 }
 
@@ -16,8 +17,9 @@ function usage()
 INPUT_PATH=""
 OUTPUT_C_ALIGN=""
 OUTPUT_C_PREFIX=""
+NUM_ZERO_BYTES=0
 
-while getopts "hi:a:p:o:" o; do
+while getopts "hi:a:p:t:" o; do
 	case "${o}" in
 	h)
 		usage
@@ -31,6 +33,9 @@ while getopts "hi:a:p:o:" o; do
 	p)
 		OUTPUT_C_PREFIX=${OPTARG}
 		;;
+	t)
+		NUM_ZERO_BYTES=${OPTARG}
+		;;
 	*)
 		usage
 		;;
@@ -62,6 +67,8 @@ printf "const char __attribute__((aligned(%s))) %s_start[] = {\n" "${OUTPUT_C_AL
 
 od -v -t x1 -An ${INPUT_PATH} | awk '{for (i=1; i<=NF; i++) printf " 0x%s,", $i; printf "\n"; }'
 
+echo __dummy__ | awk "{for (i=1; i<=${NUM_ZERO_BYTES}; i++) { printf \" 0x00,\"; if (i % 16 == 0) printf \"\n\"; } }"
+
 printf "};\n"
 
 printf "const unsigned long %s_size = sizeof(%s_start);\n" "${OUTPUT_C_PREFIX}" "${OUTPUT_C_PREFIX}"
-- 
2.25.1


