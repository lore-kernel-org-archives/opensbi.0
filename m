From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Fri, 29 Nov 2024 10:09:48 +0000
Subject: [PATCH] scripts/carray: change to using single .awk script to generate .c
Message-ID: <20241129100948.73391-1-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The shell script makes multiple call-outs to awk to get information
from the configuration file. It would be easier to just write the
whole thing in one .awk script and have the makefile altered to call
that instead.

There should be no functional difference other than the script type
and has been tested with PLATFORM=generic build. This should be both
quicker and easier to understand.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2:
  - updated with the new bits from Samuel Holland's changes
  - minor tweaks to the awk script to fix the output spacings
---
 Makefile           |   9 ++--
 scripts/carray.awk | 121 +++++++++++++++++++++++++++++++++++++++++++++
 scripts/carray.sh  |  84 -------------------------------
 3 files changed, 125 insertions(+), 89 deletions(-)
 create mode 100755 scripts/carray.awk
 delete mode 100755 scripts/carray.sh

diff --git a/Makefile b/Makefile
index dae282c..2755af7 100644
--- a/Makefile
+++ b/Makefile
@@ -501,8 +501,7 @@ compile_d2c = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     $(src_dir)/scripts/d2c.sh -i $(6) -a $(D2C_ALIGN_BYTES) -p $(D2C_NAME_PREFIX) -t $(D2C_PADDING_BYTES) > $(1)
 compile_carray = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " CARRAY    $(subst $(build_dir)/,,$(1))"; \
-	     $(eval CARRAY_VAR_LIST := $(carray-$(subst .carray.c,,$(shell basename $(1)))-y)) \
-	     $(src_dir)/scripts/carray.sh -i $(2) -l "$(CARRAY_VAR_LIST)" > $(1)
+	     $(src_dir)/scripts/carray.awk -v "SCRIPT_NAME=scripts/carray.awk" -v "CONFIG_FILE=$(shell basename $(2))" -- -l "$(CARRAY_VAR_LIST)" < $(2) > $(1)
 compile_gen_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " GEN-DEP   $(subst $(build_dir)/,,$(1))"; \
 	     echo "$(1:.dep=$(2)): $(3)" >> $(1)
@@ -531,7 +530,7 @@ $(build_dir)/%.dep: $(src_dir)/%.carray $(KCONFIG_AUTOHEADER)
 	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
 	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
 
-$(build_dir)/%.carray.c: $(src_dir)/%.carray $(src_dir)/scripts/carray.sh
+$(build_dir)/%.carray.c: $(src_dir)/%.carray $(src_dir)/scripts/carray.awk
 	$(call compile_carray,$@,$<)
 
 $(build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_AUTOHEADER)
@@ -559,7 +558,7 @@ $(platform_build_dir)/%.dep: $(platform_src_dir)/%.carray $(KCONFIG_AUTOHEADER)
 	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
 	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
 
-$(platform_build_dir)/%.carray.c: $(platform_src_dir)/%.carray $(src_dir)/scripts/carray.sh
+$(platform_build_dir)/%.carray.c: $(platform_src_dir)/%.carray $(src_dir)/scripts/carray.awk
 	$(call compile_carray,$@,$<)
 
 $(platform_build_dir)/%.dep: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
@@ -602,7 +601,7 @@ $(platform_build_dir)/%.dep: $(src_dir)/%.carray $(KCONFIG_AUTOHEADER)
 	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
 	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
 
-$(platform_build_dir)/%.carray.c: $(src_dir)/%.carray $(src_dir)/scripts/carray.sh
+$(platform_build_dir)/%.carray.c: $(src_dir)/%.carray $(src_dir)/scripts/carray.awk
 	$(call compile_carray,$@,$<)
 
 $(platform_build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_AUTOHEADER)
diff --git a/scripts/carray.awk b/scripts/carray.awk
new file mode 100755
index 0000000..77e7ad0
--- /dev/null
+++ b/scripts/carray.awk
@@ -0,0 +1,121 @@
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
+function get_fields(start, end)
+{
+    result = $start;
+
+    for (nr = start+1; nr <= end; nr++) {
+	result = result " " $nr
+    }
+    return result;
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
+xs
+/^HEADER:/	{ TYPE_HEADER = $2 }
+
+/^TYPE:/	{ TYPE_NAME = get_fields(2, NF); }
+
+/^NAME:/	{ ARRAY_NAME = $2}
+
+/^MEMBER-NAME:/	{ MEMBER_NAME = $2 }
+
+/^MEMBER-TYPE:/ { MEMBER_TYPE = get_fields(2, NF); }
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
+    if (length(MEMBER_NAME) > 0 && length(MEMBER_TYPE) == 0) {
+	print "Must specify MEMBER-TYPE: when using MEMBER-NAME:" < "/dev/stderr"
+	usage() > "/dev/stderr"
+    }
+
+    printf "// Generated with %s from %s\n", SCRIPT_NAME, CONFIG_FILE
+    printf "// DO NOT EDIT THIS FILE DIRECTLY\n"
+    printf "\n"
+    printf("#include <%s>\n\n", TYPE_HEADER)
+
+    for (v in VAR_LIST) {
+	printf("extern %s %s;\n", TYPE_NAME, VAR_LIST[v])
+    }
+    print ""
+
+    if (length(MEMBER_TYPE) > 0) {
+	TYPE_NAME = MEMBER_TYPE;
+    }
+
+    if (length(MEMBER_NAME) > 0) {
+	VAR_SUFFIX = "." MEMBER_NAME;
+    } else {
+	VAR_SUFFIX = ""
+    }
+
+    printf("%s *const %s[] = {\n", TYPE_NAME, ARRAY_NAME)
+    for (v in VAR_LIST) {
+	printf("\t&%s%s,\n", VAR_LIST[v], VAR_SUFFIX)
+    }
+    printf("\tNULL\n");
+
+    printf("};\n");
+}
diff --git a/scripts/carray.sh b/scripts/carray.sh
deleted file mode 100755
index fb985c8..0000000
--- a/scripts/carray.sh
+++ /dev/null
@@ -1,84 +0,0 @@
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
-TYPE_HEADER=$(awk '{ if ($1 == "HEADER:") { printf $2; exit 0; } }' "${CONFIG_FILE}")
-if [ -z "${TYPE_HEADER}" ]; then
-	echo "Must specify HEADER: in input config file"
-	usage
-fi
-
-TYPE_NAME=$(awk '{ if ($1 == "TYPE:") { printf $2; for (i=3; i<=NF; i++) printf " %s", $i; exit 0; } }' "${CONFIG_FILE}")
-if [ -z "${TYPE_NAME}" ]; then
-	echo "Must specify TYPE: in input config file"
-	usage
-fi
-
-ARRAY_NAME=$(awk '{ if ($1 == "NAME:") { printf $2; exit 0; } }' "${CONFIG_FILE}")
-if [ -z "${ARRAY_NAME}" ]; then
-	echo "Must specify NAME: in input config file"
-	usage
-fi
-
-MEMBER_NAME=$(awk '{ if ($1 == "MEMBER-NAME:") { printf $2; exit 0; } }' "${CONFIG_FILE}")
-MEMBER_TYPE=$(awk '{ if ($1 == "MEMBER-TYPE:") { printf $2; for (i=3; i<=NF; i++) printf " %s", $i; exit 0; } }' "${CONFIG_FILE}")
-if [ -n "${MEMBER_NAME}" ] && [ -z "${MEMBER_TYPE}" ]; then
-	echo "Must specify MEMBER-TYPE: when using MEMBER-NAME:"
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
-printf "%s *const %s[] = {\n" "${MEMBER_TYPE:-${TYPE_NAME}}" "${ARRAY_NAME}"
-for VAR in ${VAR_LIST}; do
-	printf "\t&%s,\n" "${VAR}${MEMBER_NAME:+.}${MEMBER_NAME}"
-done
-	printf "\tNULL\n"
-printf "};\n"
-- 
2.37.2.352.g3c44437643


