From: Filip Filmar <fmil@google.com>
Date: Mon, 15 May 2023 20:52:58 +0000
Subject: [PATCH] Makefile: Dereference symlinks on install
Message-ID: <20230515205258.1854376-1-fmil@google.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adds the `-L` flag (follow symlinks) to the `cp` commands used to
install `libsbi.a` and `include/sbi/*`.

This should make no difference in regular compilation. However,
it does make a difference when compiling with bazel.  Namely,
bazel's sandboxing will turn all the source files into symlinks.
After installation with `cp` the destination files will be
symlinks pointing to the sandbox symlinks. As the sandbox files
are removed when compilation ends, the just-copied symlinks
become dangling symlinks.

The resulting include files will be
unusable due to the dangling symlink issues. Adding `-L` when
copying ensures that the files obtained by executing the `install`
targets are always dereferenced to files, rather than symlinks,
eliminating this issue.
---
 Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index a26a39b..730dbd9 100644
--- a/Makefile
+++ b/Makefile
@@ -401,10 +401,10 @@ merge_deps = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     cat $(2) > $(1)
 copy_file =  $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " COPY      $(subst $(build_dir)/,,$(1))"; \
-	     cp -f $(2) $(1)
+	     cp -L -f $(2) $(1)
 inst_file =  $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " INSTALL   $(subst $(install_root_dir)/,,$(1))"; \
-	     cp -f $(2) $(1)
+	     cp -L -f $(2) $(1)
 inst_file_list = $(CMD_PREFIX)if [ ! -z "$(4)" ]; then \
 	     mkdir -p $(1)/$(3); \
 	     for file in $(4) ; do \
@@ -413,12 +413,12 @@ inst_file_list = $(CMD_PREFIX)if [ ! -z "$(4)" ]; then \
 	     dest_dir=`dirname $$dest_file`; \
 	     echo " INSTALL   "$(3)"/"`echo $$rel_file`; \
 	     mkdir -p $$dest_dir; \
-	     cp -f $$file $$dest_file; \
+	     cp -L -f $$file $$dest_file; \
 	     done \
 	     fi
 inst_header_dir =  $(CMD_PREFIX)mkdir -p $(1); \
 	     echo " INSTALL   $(subst $(install_root_dir)/,,$(1))"; \
-	     cp -rf $(2) $(1)
+	     cp -L -rf $(2) $(1)
 compile_cpp_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " CPP-DEP   $(subst $(build_dir)/,,$(1))"; \
 	     printf %s `dirname $(1)`/  > $(1) && \
-- 
2.40.1.521.gf1e218fcd8-goog


