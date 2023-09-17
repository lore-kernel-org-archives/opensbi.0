From: Vivian Wang <dramforever@live.com>
Date: Mon, 18 Sep 2023 01:52:51 +0800
Subject: [PATCH 3/3] Makefile: Add --exclude-libs ALL to avoid .dynsym
In-Reply-To: <TYYP286MB1439495D0B19A0ECFD89BDABC6F4A@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439495D0B19A0ECFD89BDABC6F4A@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <TYYP286MB1439270F179A98FEE6178EDEC6F4A@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since everything is statically linked, we don't need to expose symbols
for dynamic linking.

For a default build this saves about 2 KiB of useless read only data in
.dynsym, .dynstr, .hash, .gnu.hash sections.

Signed-off-by: Vivian Wang <dramforever@live.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index ca70949..de4e73a 100644
--- a/Makefile
+++ b/Makefile
@@ -375,6 +375,7 @@ ASFLAGS		+=	$(firmware-asflags-y)
 ARFLAGS		=	rcs
 
 ELFFLAGS	+=	$(USE_LD_FLAG)
+ELFFLAGS	+=	-Wl,--exclude-libs,ALL
 ELFFLAGS	+=	-Wl,--build-id=none
 ELFFLAGS	+=	$(platform-ldflags-y)
 ELFFLAGS	+=	$(firmware-ldflags-y)
-- 
2.41.0


