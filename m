From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  3 May 2022 09:07:50 +0530
Subject: [PATCH 02/11] Makefile: Add support for generating C array at compile
 time
In-Reply-To: <20220503033759.544156-1-apatel@ventanamicro.com>
References: <20220503033759.544156-1-apatel@ventanamicro.com>
Message-ID: <20220503033759.544156-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Generating C array at compile time based on details provided by
objects.mk is a very useful feature which will help us compile
only a subset of drivers or modules.

We add a bash script (carray.sh) which takes array details and
object/variable list from command-line to generate a C source
containing array of object/variable pointers. We also extend
top-level makefile to use carray.sh whenever specified through
objects.mk.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 Makefile          | 11 +++++++
 scripts/carray.sh | 77 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100755 scripts/carray.sh

diff --git a/Makefile b/Makefile
index 30f7c46..f619ef7 100644
--- a/Makefile
+++ b/Makefile
@@ -404,6 +404,10 @@ compile_d2c = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     $(if $($(2)-varprefix-$(3)),$(eval D2C_NAME_PREFIX := $($(2)-varprefix-$(3))),$(eval D2C_NAME_PREFIX := $(5))) \
 	     $(if $($(2)-padding-$(3)),$(eval D2C_PADDING_BYTES := $($(2)-padding-$(3))),$(eval D2C_PADDING_BYTES := 0)) \
 	     $(src_dir)/scripts/d2c.sh -i $(6) -a $(D2C_ALIGN_BYTES) -p $(D2C_NAME_PREFIX) -t $(D2C_PADDING_BYTES) > $(1)
+compile_carray = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
+	     echo " CARRAY    $(subst $(build_dir)/,,$(1))"; \
+	     $(eval CARRAY_VAR_LIST := $(carray-$(subst .c,,$(shell basename $(1)))-y)) \
+	     $(src_dir)/scripts/carray.sh -i $(2) -l "$(CARRAY_VAR_LIST)" > $(1)
 compile_gen_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " GEN-DEP   $(subst $(build_dir)/,,$(1))"; \
 	     echo "$(1:.dep=$(2)): $(3)" >> $(1)
@@ -451,6 +455,13 @@ $(build_dir)/%.dep: $(src_dir)/%.S
 $(build_dir)/%.o: $(src_dir)/%.S
 	$(call compile_as,$@,$<)
 
+$(build_dir)/%.dep: $(src_dir)/%.carray
+	$(call compile_gen_dep,$@,.c,$<)
+	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
+
+$(build_dir)/%.c: $(src_dir)/%.carray
+	$(call compile_carray,$@,$<)
+
 $(platform_build_dir)/%.bin: $(platform_build_dir)/%.elf
 	$(call compile_objcopy,$@,$<)
 
diff --git a/scripts/carray.sh b/scripts/carray.sh
new file mode 100755
index 0000000..0c52bd6
--- /dev/null
+++ b/scripts/carray.sh
@@ -0,0 +1,77 @@
+#!/bin/bash
+
+function usage()
+{
+	echo "Usage:"
+	echo " $0 [options]"
+	echo "Options:"
+	echo "     -h                   Display help or usage"
+	echo "     -i <input_config>    Input config file"
+	echo "     -l <variable_list>   List of variables in the array (Optional)"
+	exit 1;
+}
+
+# Command line options
+CONFIG_FILE=""
+VAR_LIST=""
+
+while getopts "hi:l:" o; do
+	case "${o}" in
+	h)
+		usage
+		;;
+	i)
+		CONFIG_FILE=${OPTARG}
+		;;
+	l)
+		VAR_LIST=${OPTARG}
+		;;
+	*)
+		usage
+		;;
+	esac
+done
+shift $((OPTIND-1))
+
+if [ -z "${CONFIG_FILE}" ]; then
+	echo "Must specify input config file"
+	usage
+fi
+
+if [ ! -f "${CONFIG_FILE}" ]; then
+	echo "The input config file should be a present"
+	usage
+fi
+
+TYPE_HEADER=`cat ${CONFIG_FILE} | awk '{ if ($1 == "HEADER:") { printf $2; exit 0; } }'`
+if [ -z "${TYPE_HEADER}" ]; then
+	echo "Must specify HEADER: in input config file"
+	usage
+fi
+
+TYPE_NAME=`cat ${CONFIG_FILE} | awk '{ if ($1 == "TYPE:") { printf $2; for (i=3; i<=NF; i++) printf " %s", $i; exit 0; } }'`
+if [ -z "${TYPE_NAME}" ]; then
+	echo "Must specify TYPE: in input config file"
+	usage
+fi
+
+ARRAY_NAME=`cat ${CONFIG_FILE} | awk '{ if ($1 == "NAME:") { printf $2; exit 0; } }'`
+if [ -z "${ARRAY_NAME}" ]; then
+	echo "Must specify NAME: in input config file"
+	usage
+fi
+
+printf "#include <%s>\n\n" "${TYPE_HEADER}"
+
+for VAR in ${VAR_LIST}; do
+	printf "extern %s %s;\n" "${TYPE_NAME}" "${VAR}"
+done
+printf "\n"
+
+printf "%s *%s[] = {\n" "${TYPE_NAME}" "${ARRAY_NAME}"
+for VAR in ${VAR_LIST}; do
+	printf "\t&%s,\n" "${VAR}"
+done
+printf "};\n\n"
+
+printf "unsigned long %s_size = sizeof(%s) / sizeof(%s *);\n" "${ARRAY_NAME}" "${ARRAY_NAME}" "${TYPE_NAME}"
-- 
2.34.1


