From: Dong Du <Dd_nirvana@sjtu.edu.cn>
Date: Fri, 27 Aug 2021 17:35:03 +0800
Subject: [PATCH] lib: sbi: protect dprintf output with spinlock
Message-ID: <20210827093503.16916-1-Dd_nirvana@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Avoid getting messages from multiple harts (using dprintf and printf) concurrently
with a spinlock serializaing calls to sbi_dprintf() with sbi_printf() and sbi_puts()

Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
---
 lib/sbi/sbi_console.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index b54f7a2..850af04 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -386,10 +386,12 @@ int sbi_dprintf(const char *format, ...)
 	int retval = 0;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
+	spin_lock(&console_out_lock);
 	va_start(args, format);
 	if (scratch->options & SBI_SCRATCH_DEBUG_PRINTS)
 		retval = print(NULL, NULL, format, args);
 	va_end(args);
+	spin_unlock(&console_out_lock);
 
 	return retval;
 }
-- 
2.31.1


