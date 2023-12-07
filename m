From: Yangyu Chen <cyy@cyyself.name>
Date: Fri,  8 Dec 2023 06:04:11 +0800
Subject: [PATCH 7/7] lib: sbi: show the number of PMP Reserved
In-Reply-To: <tencent_A2668222DA598E42B87A318A214D8DBD7C08@qq.com>
References: <tencent_A2668222DA598E42B87A318A214D8DBD7C08@qq.com>
Message-ID: <tencent_0278C145ED7EC7275CC998B890DA46273E07@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some PMPs may be locked before OpenSBI starts. Mark index 0 to the
highest locked index of PMPs as reserved and show the number of PMPs
being reserved in Boot HART details to let the user know.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 lib/sbi/sbi_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index e723553..0d02186 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -174,6 +174,8 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	sbi_printf("Boot HART Base ISA        : %s\n", str);
 	sbi_hart_get_extensions_str(scratch, str, sizeof(str));
 	sbi_printf("Boot HART ISA Extensions  : %s\n", str);
+	sbi_printf("Boot HART PMP Reserved    : %d\n",
+		   sbi_hart_pmp_reserved(scratch));
 	sbi_printf("Boot HART PMP Count       : %d\n",
 		   sbi_hart_pmp_count(scratch));
 	sbi_printf("Boot HART PMP Granularity : %lu\n",
-- 
2.43.0


