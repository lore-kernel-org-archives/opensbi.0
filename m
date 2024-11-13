From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Wed, 13 Nov 2024 07:49:30 +0000
Subject: [PATCH] scripts/carray: change to using single .awk script to generate .c
In-Reply-To: <d57b7c17-6f7e-4f72-bf02-fe89dcc21206@codethink.co.uk>
References: <d57b7c17-6f7e-4f72-bf02-fe89dcc21206@codethink.co.uk>
Message-ID: <20241113074930.3123185-1-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The shell script makes multiple call-outs to awk to get information
from the configuration file. It would be easier to just write the
whole thing in one .awk script and have the makefile altered to
call that.

There should be no functional diffences to this other than the
way the script is called, to make it more awk efficient.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 Makefile           |  8 ++---
 scripts/carray.awk | 90 ++++++++++++++++++++++++++++++++++++++++++++++
 scripts/carray.sh  | 78 ----------------------------------------
 3 files changed, 94 insertions(+), 82 deletions(-)
 create mode 100755 scripts/carray.awk
 delete mode 100755 scripts/carray.sh

diff --git a/Makefile b/Makefile
index dae282c..807d815 100644
--- a/Makefile
+++ b/Makefile
@@ -502,7 +502,7 @@ compile_d2c = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 compile_carray = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " CARRAY    $(subst $(build_dir)/,,$(1))"; \
 	     $(eval CARRAY_VAR_LIST := $(carray-$(subst .carray.c,,$(shell basename $(1)))-y)) \
-	     $(src_dir)/scripts/carray.sh -i $(2) -l "$(CARRAY_VAR_LIST)" > $(1)
+	     $(src_dir)/scripts/carray.awk -v "SCRIPT_NAME=scripts/carray.awk" -v "CONFIG_FILE=$(2)" -- -l "$(CARRAY_VAR_LIST)" < $(2) > $(1)
 compile_gen_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " GEN-DEP   $(subst $(build_dir)/,,$(1))"; \
 	     echo "$(1:.dep=$(2)): $(3)" >> $(1)
@@ -531,7 +531,7 @@ $(build_dir)/%.dep: $(src_dir)/%.carray $(KCONFIG_AUTOHEADER)
 	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
 	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
 
-$(build_dir)/%.carray.c: $(src_dir)/%.carray $(src_dir)/scripts/carray.sh
+$(build_dir)/%.carray.c: $(src_dir)/%.carray $(src_dir)/scripts/carray.awk
 	$(call compile_carray,$@,$<)
 
 $(build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_AUTOHEADER)
@@ -559,7 +559,7 @@ $(platform_build_dir)/%.dep: $(platform_src_dir)/%.carray $(KCONFIG_AUTOHEADER)
 	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
 	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
 
-$(platform_build_dir)/%.carray.c: $(platform_src_dir)/%.carray $(src_dir)/scripts/carray.sh
+$(platform_build_dir)/%.carray.c: $(platform_src_dir)/%.carray $(src_dir)/scripts/carray.awk
 	$(call compile_carray,$@,$<)
 
 $(platform_build_dir)/%.dep: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
@@ -602,7 +602,7 @@ $(platform_build_dir)/%.dep: $(src_dir)/%.carray $(KCONFIG_AUTOHEADER)
 	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
 	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
 
-$(platform_build_dir)/%.carray.c: $(src_dir)/%.carray $(src_dir)/scripts/carray.sh
+$(platform_build_dir)/%.carray.c: $(src_dir)/%.carray $(src_dir)/scripts/carray.awk
 	$(call compile_carray,$@,$<)
 
 $(platform_build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_AUTOHEADER)
diff --git a/scripts/carray.awk b/scripts/carray.awk
new file mode 100755
index 0000000..9e4dc72
--- /dev/null
+++ b/scripts/carray.awk
@@ -0,0 +1,90 @@
+#!/usr/bin/awk -f
+
+function usage()
+{
+    echo "Usage:"
+    echo " $0 [options]"
+    echo "Options:"
+    echo "     -h                   Display help or usage"
+    echo "     -l <variable_list>   List of variables in the array (Optional)"
+    exit 1;
+}
+
+BEGIN {
+    VAR_LIST[0] = ""; delete VAR_LIST[0]
+
+    for (ArgIndex = 1; ArgIndex < ARGC; ArgIndex++) {
+	Arg = ARGV[ArgIndex];
+
+	if (Arg !~ /^-./) { continue; }
+	ARGV[ArgIndex] = "";
+
+	if (Arg == "-h") {
+	    usage();
+	} else if (Arg == "-l") {
+	    ArgIndex++;
+	    split(ARGV[ArgIndex], Args," ")
+	    for (A in Args) {
+		VAR_LIST[length(VAR_LIST)] = Args[A];
+	    }
+	    ARGV[ArgIndex] = "";
+	} else {
+	    usage() > "/dev/stderr"
+	}
+    }
+}
+
+# process items from the config file
+
+/^HEADER:/	{ TYPE_HEADER = $2 }
+
+/^TYPE:/	{ for (i = 2; i <= NF; i++) { TYPE_NAME = TYPE_NAME " " $i } }
+
+/^NAME:/	{ ARRAY_NAME = $2}
+
+# code to dump the generated .c file once config file is processed
+
+END {
+    # enable for debug
+    if (0 == 1) {
+	print "ARRAY_NAME  " ARRAY_NAME
+	print "TYPE_HEADER " TYPE_HEADER
+	print "TYPE_NAME   " TYPE_NAME
+
+	print length(VAR_LIST)
+	for (v in VAR_LIST) {
+	    print "VAR_LIST " v  " = " VAR_LIST[v]
+	}
+    }
+
+    if (length(ARRAY_NAME) == 0) {
+	print "Must specify NAME: in input config file"  > "/dev/stderr"
+	usage() > "/dev/stderr"
+    }
+
+    if (length(TYPE_NAME) == 0) {
+	print "Must specify TYPE: in input config file"  > "/dev/stderr"
+	usage() > "/dev/stderr"
+    }
+
+    if (length(TYPE_HEADER) == 0) {
+	print "Must specify HEADER: in input config file"  > "/dev/stderr"
+	usage() > "/dev/stderr"
+    }
+
+    printf "// Generated with %s from %s\n", SCRIPT_NAME, CONFIG_FILE
+    printf("#include <%s>\n\n", TYPE_HEADER)
+
+    for (v in VAR_LIST) {
+	printf("extern%s %s;\n", TYPE_NAME, VAR_LIST[v])
+    }
+    print ""
+
+    printf("%s *%s[] = {\n", TYPE_NAME, ARRAY_NAME)
+    for (v in VAR_LIST) {
+	printf("\t&%s,\n", VAR_LIST[v])
+    }
+    printf("\tNULL,\n");
+    
+    printf("};\n\n");
+}
diff --git a/scripts/carray.sh b/scripts/carray.sh
deleted file mode 100755
index 1fa2366..0000000
--- a/scripts/carray.sh
+++ /dev/null
@@ -1,78 +0,0 @@
-#!/usr/bin/env bash
-
-function usage()
-{
-	echo "Usage:"
-	echo " $0 [options]"
-	echo "Options:"
-	echo "     -h                   Display help or usage"
-	echo "     -i <input_config>    Input config file"
-	echo "     -l <variable_list>   List of variables in the array (Optional)"
-	exit 1;
-}
-
-# Command line options
-CONFIG_FILE=""
-VAR_LIST=""
-
-while getopts "hi:l:" o; do
-	case "${o}" in
-	h)
-		usage
-		;;
-	i)
-		CONFIG_FILE=${OPTARG}
-		;;
-	l)
-		VAR_LIST=${OPTARG}
-		;;
-	*)
-		usage
-		;;
-	esac
-done
-shift $((OPTIND-1))
-
-if [ -z "${CONFIG_FILE}" ]; then
-	echo "Must specify input config file"
-	usage
-fi
-
-if [ ! -f "${CONFIG_FILE}" ]; then
-	echo "The input config file should be a present"
-	usage
-fi
-
-TYPE_HEADER=`cat ${CONFIG_FILE} | awk '{ if ($1 == "HEADER:") { printf $2; exit 0; } }'`
-if [ -z "${TYPE_HEADER}" ]; then
-	echo "Must specify HEADER: in input config file"
-	usage
-fi
-
-TYPE_NAME=`cat ${CONFIG_FILE} | awk '{ if ($1 == "TYPE:") { printf $2; for (i=3; i<=NF; i++) printf " %s", $i; exit 0; } }'`
-if [ -z "${TYPE_NAME}" ]; then
-	echo "Must specify TYPE: in input config file"
-	usage
-fi
-
-ARRAY_NAME=`cat ${CONFIG_FILE} | awk '{ if ($1 == "NAME:") { printf $2; exit 0; } }'`
-if [ -z "${ARRAY_NAME}" ]; then
-	echo "Must specify NAME: in input config file"
-	usage
-fi
-
-printf "// Generated with $(basename $0) from $(basename ${CONFIG_FILE})\n"
-printf "#include <%s>\n\n" "${TYPE_HEADER}"
-
-for VAR in ${VAR_LIST}; do
-	printf "extern %s %s;\n" "${TYPE_NAME}" "${VAR}"
-done
-printf "\n"
-
-printf "%s *%s[] = {\n" "${TYPE_NAME}" "${ARRAY_NAME}"
-for VAR in ${VAR_LIST}; do
-	printf "\t&%s,\n" "${VAR}"
-done
-printf "};\n\n"
-
-printf "unsigned long %s_size = sizeof(%s) / sizeof(%s *);\n" "${ARRAY_NAME}" "${ARRAY_NAME}" "${TYPE_NAME}"
-- 
2.37.2.352.g3c44437643


