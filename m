From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 15 Oct 2020 13:42:11 +0530
Subject: [PATCH 5/5] platform: kendryte/k210: Add some padding for FDT fixups
In-Reply-To: <20201015081211.1956554-1-anup.patel@wdc.com>
References: <20201015081211.1956554-1-anup.patel@wdc.com>
Message-ID: <20201015081211.1956554-6-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Kendryte K210 platform has built-in DTB and does not provides
FW_PAYLOAD_FDT_ADDR. This means the FDT fixups will be done on
the built-in DTB in absence of FW_PAYLOAD_FDT_ADDR. This patch
adds some padding in built-in DTB for FDT fixups.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 platform/kendryte/k210/objects.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/platform/kendryte/k210/objects.mk b/platform/kendryte/k210/objects.mk
index 106f9f2..b74da74 100644
--- a/platform/kendryte/k210/objects.mk
+++ b/platform/kendryte/k210/objects.mk
@@ -11,3 +11,4 @@ platform-objs-y += platform.o
 
 platform-objs-y += k210.o
 platform-varprefix-k210.o = dt_k210
+platform-padding-k210.o = 2048
-- 
2.25.1


