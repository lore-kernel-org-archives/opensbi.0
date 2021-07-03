From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat,  3 Jul 2021 23:09:29 +0800
Subject: [PATCH] docs/platform: thead-c9xx: Remove FW_PIC=y
Message-ID: <20210703150929.19154-1-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

FW_PIC is on by default. Hence no need to explicitly require it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 docs/platform/thead-c9xx.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/platform/thead-c9xx.md b/docs/platform/thead-c9xx.md
index 8f1021a..c0daeb7 100644
--- a/docs/platform/thead-c9xx.md
+++ b/docs/platform/thead-c9xx.md
@@ -16,7 +16,7 @@ The *T-HEAD C9xx* does not have any platform-specific compile options
 because it use generic platform.
 
 ```
-CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic FW_PIC=y /usr/bin/make
+CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic /usr/bin/make
 ```
 
 The *T-HEAD C9xx* DTB provided to OpenSBI generic firmwares will usually have
-- 
2.25.1


