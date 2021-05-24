From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Mon, 24 May 2021 15:19:53 +0200
Subject: [RFC 1/1] lib/utils: consider ':' in stdout-path
Message-ID: <20210524131953.200555-1-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The value of the /chosen/stdout-path devicetree property is used to
determine the UART used by openSBI. According to the devicetree
specification the value may contain a hyphen, e.g.

	chosen {
????????????????stdout-path = "/serial at f00:115200";
????????};

If the character ':' is present, it terminates the path of the device.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
Is it allowable to temporarily change the device-tree here?
Or should we use sbi_scratch_alloc_offset() and copy the string?
---
 lib/utils/serial/fdt_serial.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
index 25982ec..d1b762c 100644
--- a/lib/utils/serial/fdt_serial.c
+++ b/lib/utils/serial/fdt_serial.c
@@ -46,8 +46,16 @@ int fdt_serial_init(void)
 	coff = fdt_path_offset(fdt, "/chosen");
 	if (-1 < coff) {
 		prop = fdt_getprop(fdt, coff, "stdout-path", &len);
-		if (prop && len)
+		if (prop && len) {
+			char *s;
+
+			s = strchr(prop, ':');
+			if (s)
+				*s = 0;
 			noff = fdt_path_offset(fdt, prop);
+			if (s)
+				*s = ':';
+		}
 	}

 	/* First check DT node pointed by stdout-path */
--
2.30.2


