From: Jan Remeš <jan.remes@codasip.com>
Date: Fri, 29 Apr 2022 14:05:20 +0200
Subject: [PATCH] lib: utils/fdt: check for CPU status property
Message-ID: <CALXH3=KtzYkUTR8_NxR7edRAtPE92bzj90tgUzihy0FyBUB-HQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The nodes in the FDT that have a "status" property should be
ignored when this property is not "ok" or "okay".

Signed-off-by: Jan Remes <jan.remes@codasip.com>
---
 lib/utils/fdt/fdt_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 9a35969..77dac1f 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -231,6 +231,14 @@ int fdt_parse_hart_id(void *fdt, int cpu_offset,
u32 *hartid)
        if (strncmp (prop, "cpu", strlen ("cpu")))
                return SBI_EINVAL;

+       prop = fdt_getprop(fdt, cpu_offset, "status", NULL);
+       if (prop) {
+               if (strncmp(prop, "okay", strlen("okay")) &&
+                   strncmp(prop, "ok", strlen("ok"))) {
+                       return SBI_EINVAL;
+               }
+       }
+
        val = fdt_getprop(fdt, cpu_offset, "reg", &len);
        if (!val || len < sizeof(fdt32_t))
                return SBI_EINVAL;
-- 
2.35.1

