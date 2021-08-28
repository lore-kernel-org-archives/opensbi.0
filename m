From: Dong Du <Dd_nirvana@sjtu.edu.cn>
Date: Sat, 28 Aug 2021 14:45:02 +0800
Subject: [PATCH v2] lib: sbi: protect dprintf output with spinlock
Message-ID: <20210828064502.7227-1-Dd_nirvana@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Avoid getting messages from multiple harts (using dprintf and printf)
concurrently with a spinlock serializaing calls to sbi_dprintf(),
sbi_printf() and sbi_puts()

Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
---
 lib/sbi/sbi_console.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index b54f7a2..29eede3 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -387,8 +387,11 @@ int sbi_dprintf(const char *format, ...)
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	va_start(args, format);
-	if (scratch->options & SBI_SCRATCH_DEBUG_PRINTS)
+	if (scratch->options & SBI_SCRATCH_DEBUG_PRINTS) {
+		spin_lock(&console_out_lock);
 		retval = print(NULL, NULL, format, args);
+		spin_unlock(&console_out_lock);
+	}
 	va_end(args);
 
 	return retval;
-- 
2.31.1


