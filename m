From: Inochi Amaoto <inochiama@outlook.com>
Date: Wed, 15 Nov 2023 07:30:17 +0800
Subject: [PATCH v2] lib: utils/fdt: Allow zero length mtime when parsing ACLINT
In-Reply-To: <IA1PR20MB49534DA3EEF05A947D5EF6EABBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49534DA3EEF05A947D5EF6EABBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB4953C2F395E322FEDA0BAF34BBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>Currently, the fdt_parse_aclint_node() does not allow the first reg to
>be zero length. This may cause the parser to fail when the ACLINT does
>not support mtime.
>
>To be robust, delay the check of first reg in fdt_parse_aclint_node()
>so the parser can handle ACLINT without mtime support.
>
>Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>---
> lib/utils/fdt/fdt_helper.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
>index 9ae7f09..972e529 100644
>--- a/lib/utils/fdt/fdt_helper.c
>+++ b/lib/utils/fdt/fdt_helper.c
>@@ -891,8 +891,10 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
>
> 	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> 				    &reg_addr, &reg_size);
>-	if (rc < 0 || !reg_size)
>+	if (rc < 0)
> 		return SBI_ENODEV;
>+	if (!reg_size)
>+		reg_addr = reg_size = 0;
> 	*out_addr1 = reg_addr;
> 	*out_size1 = reg_size;
>
>@@ -900,6 +902,8 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
> 				    &reg_addr, &reg_size);
> 	if (rc < 0 || !reg_size)
> 		reg_addr = reg_size = 0;
>+	if (!reg_size && *out_size1 == 0)
>+		return SBI_ENODEV;
> 	if (out_addr2)
> 		*out_addr2 = reg_addr;
> 	if (out_size2)
>--
>2.42.0
>

As Conor point out, Using "reg-name" to identify the reg of ACLINT will be
a better idea and zero-length reg is unacceptably. This patch should
be abandoned and favor the new way.

[1] https://lore.kernel.org/all/20231114-skedaddle-precinct-66c8897227bb at squawk/

