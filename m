From: Xiang W <wxjstz@126.com>
Date: Sun, 19 Feb 2023 17:28:31 +0800
Subject: [PATCH] lib: utils: fdt_fixup: Fix compile error
In-Reply-To: <20230219063335.30952-1-peterlin@andestech.com>
References: <20230219063335.30952-1-peterlin@andestech.com>
Message-ID: <ce307b4bb7b3f46ba601ead6bd74915d0e51c961.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-02-19???? 14:33 +0800?Yu Chien Peter Lin???
> When building with GCC-10 or older versions, it throws the following
> error:
> 
> ?CC-DEP??? platform/generic/lib/utils/fdt/fdt_fixup.dep
> ?CC??????? platform/generic/lib/utils/fdt/fdt_fixup.o
> lib/utils/fdt/fdt_fixup.c: In function 'fdt_reserved_memory_fixup':
> lib/utils/fdt/fdt_fixup.c:376:2: error: label at end of compound statement
> ? 376 |? next_entry:
> ????? |? ^~~~~~~~~~
> 
> Thus move the label "next_entry" to the beginning of the for loop.
> Fixed issue#288 [1]
> 
> [1]: https://github.com/riscv-software-src/opensbi/issues/288
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> ?lib/utils/fdt/fdt_fixup.c | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index 619e4f5..9dac98a 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -345,6 +345,7 @@ int fdt_reserved_memory_fixup(void *fdt)
> ?
> ????????i = 0;
> ????????sbi_domain_for_each_memregion(dom, reg) {
> +next_entry:
> ????????????????/* Ignore MMIO or READABLE or WRITABLE or EXECUTABLE regions */
> ????????????????if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
> ????????????????????????continue;
> @@ -373,7 +374,6 @@ int fdt_reserved_memory_fixup(void *fdt)
> ????????????????filtered_base[i] = reg->base;
> ????????????????filtered_order[i] = reg->order;
> ????????????????i++;
> -???????next_entry:
> ????????}
I suggest to remove goto. 

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 619e4f5..e23517d 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -361,19 +361,22 @@ int fdt_reserved_memory_fixup(void *fdt)
                        return SBI_ENOSPC;
                }
 
+               int overlap = 0;
                addr = reg->base;
                for (j = 0; j < i; j++) {
                        if (addr == filtered_base[j]
                            && filtered_order[j] < reg->order) {
+                               overlap = 1;
                                filtered_order[j] = reg->order;
-                               goto next_entry;
+                               break;
                        }
                }
 
-               filtered_base[i] = reg->base;
-               filtered_order[i] = reg->order;
-               i++;
-       next_entry:
+               if (!overlap) {
+                       filtered_base[i] = reg->base;
+                       filtered_order[i] = reg->order;
+                       i++;
+               }
        }
 
        for (j = 0; j < i; j++) {



Regards,
Xiang
> ?
> ????????for (j = 0; j < i; j++) {
> -- 
> 2.34.1
> 
> 


