From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Fri, 28 May 2021 12:15:49 +0200
Subject: [PATCH v2 1/1] lib/utils: consider ':' in stdout-path
Message-ID: <20210528101549.31097-1-xypron.glpk@gmx.de>
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
v2:
	add a comment describing why the DT is changed in place
---
 lib/utils/serial/fdt_serial.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
index 25982ec..83a1f95 100644
--- a/lib/utils/serial/fdt_serial.c
+++ b/lib/utils/serial/fdt_serial.c
@@ -46,8 +46,28 @@ int fdt_serial_init(void)
 	coff = fdt_path_offset(fdt, "/chosen");
 	if (-1 < coff) {
 		prop = fdt_getprop(fdt, coff, "stdout-path", &len);
-		if (prop && len)
+		if (prop && len) {
+			char *s;
+
+			/*
+			 * The device path may be followed by ':' and
+			 * parameters. Truncate the path accordingly.
+			 *
+			 * Scratch memory is very limited. As long as we cannot
+			 * free scratch memory it is preferable to avoid its
+			 * usage. Hence the devicetree is modified in place.
+			 *
+			 * TODO:
+			 * Use a copy in scratch memory once
+			 * sbi_scratch_free_offset() is properly implemented.
+			 */
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
2.32.0.rc0


