From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 14 Jul 2023 13:07:36 +0200
Subject: [PATCH 1/1] libfdt: fix SPDX license identifiers
Message-ID: <20230714110736.50171-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

License identifiers should be machine readable.

According to the SPDX v2.3.0 specification annex E parentheses are not
used in the SPDX identifier field when specifying multiple licenses [1].

[1] https://spdx.github.io/spdx-spec/v2.3/using-SPDX-short-identifiers-in-source-files/

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/libfdt/Makefile.libfdt   | 2 +-
 lib/utils/libfdt/fdt.c             | 2 +-
 lib/utils/libfdt/fdt.h             | 2 +-
 lib/utils/libfdt/fdt_addresses.c   | 2 +-
 lib/utils/libfdt/fdt_check.c       | 2 +-
 lib/utils/libfdt/fdt_empty_tree.c  | 2 +-
 lib/utils/libfdt/fdt_overlay.c     | 2 +-
 lib/utils/libfdt/fdt_ro.c          | 2 +-
 lib/utils/libfdt/fdt_rw.c          | 2 +-
 lib/utils/libfdt/fdt_strerror.c    | 2 +-
 lib/utils/libfdt/fdt_sw.c          | 2 +-
 lib/utils/libfdt/fdt_wip.c         | 2 +-
 lib/utils/libfdt/libfdt.h          | 2 +-
 lib/utils/libfdt/libfdt_env.h      | 2 +-
 lib/utils/libfdt/libfdt_internal.h | 2 +-
 lib/utils/libfdt/version.lds       | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/lib/utils/libfdt/Makefile.libfdt b/lib/utils/libfdt/Makefile.libfdt
index b6d8fc0..f99cd12 100644
--- a/lib/utils/libfdt/Makefile.libfdt
+++ b/lib/utils/libfdt/Makefile.libfdt
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 # Makefile.libfdt
 #
 # This is not a complete Makefile of itself.  Instead, it is designed to
diff --git a/lib/utils/libfdt/fdt.c b/lib/utils/libfdt/fdt.c
index 9fe7cf4..d8f2daa 100644
--- a/lib/utils/libfdt/fdt.c
+++ b/lib/utils/libfdt/fdt.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
diff --git a/lib/utils/libfdt/fdt.h b/lib/utils/libfdt/fdt.h
index f2e6880..0d9b09a 100644
--- a/lib/utils/libfdt/fdt.h
+++ b/lib/utils/libfdt/fdt.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause */
 #ifndef FDT_H
 #define FDT_H
 /*
diff --git a/lib/utils/libfdt/fdt_addresses.c b/lib/utils/libfdt/fdt_addresses.c
index 9a82cd0..78a1226 100644
--- a/lib/utils/libfdt/fdt_addresses.c
+++ b/lib/utils/libfdt/fdt_addresses.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2014 David Gibson <david@gibson.dropbear.id.au>
diff --git a/lib/utils/libfdt/fdt_check.c b/lib/utils/libfdt/fdt_check.c
index fa410a8..7283c41 100644
--- a/lib/utils/libfdt/fdt_check.c
+++ b/lib/utils/libfdt/fdt_check.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
diff --git a/lib/utils/libfdt/fdt_empty_tree.c b/lib/utils/libfdt/fdt_empty_tree.c
index 49d54d4..5a0ac63 100644
--- a/lib/utils/libfdt/fdt_empty_tree.c
+++ b/lib/utils/libfdt/fdt_empty_tree.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2012 David Gibson, IBM Corporation.
diff --git a/lib/utils/libfdt/fdt_overlay.c b/lib/utils/libfdt/fdt_overlay.c
index 0871e26..3ba8244 100644
--- a/lib/utils/libfdt/fdt_overlay.c
+++ b/lib/utils/libfdt/fdt_overlay.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2016 Free Electrons
diff --git a/lib/utils/libfdt/fdt_ro.c b/lib/utils/libfdt/fdt_ro.c
index 17584da..fc73030 100644
--- a/lib/utils/libfdt/fdt_ro.c
+++ b/lib/utils/libfdt/fdt_ro.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
diff --git a/lib/utils/libfdt/fdt_rw.c b/lib/utils/libfdt/fdt_rw.c
index 3621d36..b3b8e73 100644
--- a/lib/utils/libfdt/fdt_rw.c
+++ b/lib/utils/libfdt/fdt_rw.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
diff --git a/lib/utils/libfdt/fdt_strerror.c b/lib/utils/libfdt/fdt_strerror.c
index b435693..15b4cfb 100644
--- a/lib/utils/libfdt/fdt_strerror.c
+++ b/lib/utils/libfdt/fdt_strerror.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
diff --git a/lib/utils/libfdt/fdt_sw.c b/lib/utils/libfdt/fdt_sw.c
index 4c569ee..90394f3 100644
--- a/lib/utils/libfdt/fdt_sw.c
+++ b/lib/utils/libfdt/fdt_sw.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
diff --git a/lib/utils/libfdt/fdt_wip.c b/lib/utils/libfdt/fdt_wip.c
index c2d7566..e90d2ac 100644
--- a/lib/utils/libfdt/fdt_wip.c
+++ b/lib/utils/libfdt/fdt_wip.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
diff --git a/lib/utils/libfdt/libfdt.h b/lib/utils/libfdt/libfdt.h
index 73467f7..be3b722 100644
--- a/lib/utils/libfdt/libfdt.h
+++ b/lib/utils/libfdt/libfdt.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause */
 #ifndef LIBFDT_H
 #define LIBFDT_H
 /*
diff --git a/lib/utils/libfdt/libfdt_env.h b/lib/utils/libfdt/libfdt_env.h
index 6ebbae0..d36eba2 100644
--- a/lib/utils/libfdt/libfdt_env.h
+++ b/lib/utils/libfdt/libfdt_env.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause */
 #ifndef LIBFDT_ENV_H
 #define LIBFDT_ENV_H
 /*
diff --git a/lib/utils/libfdt/libfdt_internal.h b/lib/utils/libfdt/libfdt_internal.h
index 16bda19..e511be0 100644
--- a/lib/utils/libfdt/libfdt_internal.h
+++ b/lib/utils/libfdt/libfdt_internal.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause */
 #ifndef LIBFDT_INTERNAL_H
 #define LIBFDT_INTERNAL_H
 /*
diff --git a/lib/utils/libfdt/version.lds b/lib/utils/libfdt/version.lds
index 7ab85f1..9c00004 100644
--- a/lib/utils/libfdt/version.lds
+++ b/lib/utils/libfdt/version.lds
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause */
 LIBFDT_1.2 {
 	global:
 		fdt_next_node;
-- 
2.40.1


