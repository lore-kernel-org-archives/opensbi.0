From: Bin Meng <bmeng@tinylab.org>
Date: Fri, 30 Dec 2022 13:07:51 +0800
Subject: [PATCH] docs: domain_support: Use capital letter for privilege modes
Message-ID: <20221230050751.1966673-1-bmeng@tinylab.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The RISC-V convention for the privilege mode is capital letter, like
'M-mode', instead of 'm-mode'.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 docs/domain_support.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 8963b57..c909d4a 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -161,7 +161,7 @@ The DT properties of a domain instance DT node are as follows:
   and access permissions for the domain instance. Each list entry is a pair
   of DT node phandle and access permissions. The access permissions are
   represented as a 32bit bitmask having bits: **readable** (BIT[0]),
-  **writeable** (BIT[1]), **executable** (BIT[2]), and **m-mode** (BIT[3]).
+  **writeable** (BIT[1]), **executable** (BIT[2]), and **M-mode** (BIT[3]).
 * **boot-hart** (Optional) - The DT node phandle of the HART booting the
   domain instance. If coldboot HART is assigned to the domain instance then
   this DT property is ignored and the coldboot HART is assumed to be the
@@ -180,7 +180,7 @@ The DT properties of a domain instance DT node are as follows:
   is used as default value.
 * **next-mode** (Optional) - The 32 bit next booting stage mode for the
   domain instance. The possible values of this DT property are: **0x1**
-  (s-mode), and **0x0** (u-mode). If this DT property is not available
+  (S-mode), and **0x0** (U-mode). If this DT property is not available
   and coldboot HART is not assigned to the domain instance then **0x1**
   is used as default value. If this DT property is not available and
   coldboot HART is assigned to the domain instance then **next booting
-- 
2.34.1


