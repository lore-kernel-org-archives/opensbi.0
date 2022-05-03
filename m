From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  3 May 2022 09:07:49 +0530
Subject: [PATCH 01/11] Makefile: Allow generated C source to be anywhere in
 build directory
In-Reply-To: <20220503033759.544156-1-apatel@ventanamicro.com>
References: <20220503033759.544156-1-apatel@ventanamicro.com>
Message-ID: <20220503033759.544156-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generated C source could be anywhere within build directory so
let us update the make rule to comple generated C source accordingly.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index fc1ea13..30f7c46 100644
--- a/Makefile
+++ b/Makefile
@@ -437,6 +437,9 @@ $(build_dir)/%.dep: $(src_dir)/%.c
 $(build_dir)/%.o: $(src_dir)/%.c
 	$(call compile_cc,$@,$<)
 
+$(build_dir)/%.o: $(build_dir)/%.c
+	$(call compile_cc,$@,$<)
+
 ifeq ($(BUILD_INFO),y)
 $(build_dir)/lib/sbi/sbi_init.o: $(libsbi_dir)/sbi_init.c FORCE
 	$(call compile_cc,$@,$<)
@@ -463,9 +466,6 @@ $(platform_build_dir)/%.dep: $(platform_src_dir)/%.c
 $(platform_build_dir)/%.o: $(platform_src_dir)/%.c
 	$(call compile_cc,$@,$<)
 
-$(platform_build_dir)/%.o: $(platform_build_dir)/%.c
-	$(call compile_cc,$@,$<)
-
 $(platform_build_dir)/%.dep: $(platform_src_dir)/%.S
 	$(call compile_as_dep,$@,$<)
 
-- 
2.34.1


