From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 28 Jun 2024 16:24:39 +0800
Subject: [RFC PATCH] lib: utils: fdt_domain: Use consistent device-tree address when next-arg1 is missing
Message-ID: <20240628082439.2873497-1-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The diagram shows the boot-flow involving OP-TEE OS initialization:

    (1)-----------+
     | U-Boot SPL |
     +------------+
         |
         v
    (2)-------------------------------------------------------------+
     | OpenSBI (fw_dynamic)                                         |
     |                (4)------------------------+                  |
     |                 | optee dispatcher driver |                  |
     +-----------------+-------^---------|-------+------------------+
M-mode   |  (coldboot domain)  |         |
---------+--(trusted domain)---+----+----+-(untrusted domain)--------
S-mode   |                     |    |    |
         v                     |    |    v
    (3)---------------------------+ |(5)----------------------------+
     | OP-TEE OS                  | | | U-Boot                      |
     +----------------------------+ | +-----------------------------+
                                    |    |
                                    |    v
                                    |(6)----------------------------+
                                    | | Linux                       |
                                    | +-----------------------------+

As OP-TEE OS has device-tree node fixups that need to be passed
through the next boot stages, such as reserved memory node shown
below:

  reserved-memory {
    #address-cells = <0x00000002>;
    #size-cells = <0x00000002>;
    ranges;
    optee_core at f1000000 {
      no-map;
      reg = <0x00000000 0xf1000000   // OP-TEE OS base address
             0x00000000 0x01000000>;
    };
    <...>
  };

Instead of using 0x0 as default value, allow identical next-arg1
to be used by non-coldboot domain (i.e., untrusted domain), when
the next-arg1 is not provided.

Also, update the document about next-arg1 of domain instance.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Alvin Chang <alvinga@andestech.com>
---
 docs/domain_support.md     | 4 +---
 lib/utils/fdt/fdt_domain.c | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index b34e43a..1a40068 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -180,9 +180,7 @@ The DT properties of a domain instance DT node are as follows:
   boot HART of the domain instance.
 * **next-arg1** (Optional) - The 64 bit next booting stage arg1 for the
   domain instance. If this DT property is not available and coldboot HART
-  is not assigned to the domain instance then **0x0** is used as default
-  value. If this DT property is not available and coldboot HART is assigned
-  to the domain instance then **next booting stage arg1 of coldboot HART**
+  is not assigned to the domain instance then **next booting stage arg1 of coldboot HART**
   is used as default value.
 * **next-addr** (Optional) - The 64 bit next booting stage address for the
   domain instance. If this DT property is not available and coldboot HART
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index fa1c357..a13daa6 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -395,8 +395,7 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 		val64 = fdt32_to_cpu(val[0]);
 		val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
 	} else {
-		if (domain_offset == *cold_domain_offset)
-			val64 = sbi_scratch_thishart_ptr()->next_arg1;
+		val64 = sbi_scratch_thishart_ptr()->next_arg1;
 	}
 	dom->next_arg1 = val64;
 
-- 
2.34.1


