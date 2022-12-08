From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu,  8 Dec 2022 19:08:20 +0530
Subject: [PATCH] scripts: use env to invoke bash
Message-ID: <20221208133820.1082271-1-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Not all systems have bash at a fixed location like /bin/bash.
FreeBSD, for example, would typically have it at /usr/local/bin/bash.
When building OpenSBI on freebsd system, the build breaks.

Its advisable to use: #!/usr/bin/env bash

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 scripts/carray.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/carray.sh b/scripts/carray.sh
index 0c52bd6..13f9d36 100755
--- a/scripts/carray.sh
+++ b/scripts/carray.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 function usage()
 {
-- 
2.38.1


