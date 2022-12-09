From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Fri,  9 Dec 2022 11:43:35 +0530
Subject: [PATCH v2] scripts: use env to invoke bash
Message-ID: <20221209061335.1326839-1-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Not all systems have bash at a fixed location like /bin/bash.
FreeBSD, for example, would typically have it at /usr/local/bin/bash.
When building OpenSBI on freebsd system, the build breaks.

Its advisable to use: #!/usr/bin/env bash

[v2] In this version:
* Change remaining two scripts to use env

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 scripts/carray.sh                | 2 +-
 scripts/create-binary-archive.sh | 2 +-
 scripts/d2c.sh                   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/carray.sh b/scripts/carray.sh
index 0c52bd6..13f9d36 100755
--- a/scripts/carray.sh
+++ b/scripts/carray.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 function usage()
 {
diff --git a/scripts/create-binary-archive.sh b/scripts/create-binary-archive.sh
index 261a45a..63781e1 100755
--- a/scripts/create-binary-archive.sh
+++ b/scripts/create-binary-archive.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 function usage()
 {
diff --git a/scripts/d2c.sh b/scripts/d2c.sh
index 33a3ccf..c411fcd 100755
--- a/scripts/d2c.sh
+++ b/scripts/d2c.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 function usage()
 {
-- 
2.38.1


