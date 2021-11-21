From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 21 Nov 2021 17:30:22 +0000
Subject: [PATCH] Improve fatal error handling implementation
Message-ID: <20211121173022.72172-1-jrtc27@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

BUG and BUG_ON are not informative and are rather lazy interfaces, onnly
telling the user that something went wrong in a given function, but not
what, requiring the user to find the sources corresponding to their
firmware (which may not be available) and figure out how that BUG(_ON)
was hit. Even SBI_ASSERT in its current form, which does include the
condition that triggered it in the output, isn't necessarily very
informative. In some cases, the error may be fixable by the user, but
they need to know the problem in order to have any hope of fixing it.
It's also a nuisance for developers, whose development trees may have
changed significantly since the release in question being used, and so
line numbers can make it harder for them to understand which error case
a user has hit.

This patch introduces a new sbi_panic function which is printf-like,
allowing detailed error messages to be printed to the console. BUG and
BUG_ON are removed, since the former is just a worse form of sbi_panic
and the latter is a worse version of SBI_ASSERT. Finally, SBI_ASSERT is
augmented to take a set of arguments to pass to sbi_panic on failure,
used like so (sbi_boot_print_hart's current error case, which currently
manually calls sbi_printf and sbi_hart_hang):

  SBI_ASSERT(xlen >= 1, ("Error %d getting MISA XLEN\n", xlen));

The existing users of BUG are replaced with calls to sbi_panic along
with informative error messages. BUG_ON and SBI_ASSERT were unused (and,
in the case of SBI_ASSERT, remain unused).

Many existing users of sbi_hart_hang should be converted to use either
sbi_panic or SBI_ASSERT after this commit.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 include/sbi/sbi_console.h | 22 +++++-----------------
 lib/sbi/riscv_asm.c       |  7 ++++---
 lib/sbi/sbi_console.c     | 13 +++++++++++++
 3 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
index 28b4a79..db35a2f 100644
--- a/include/sbi/sbi_console.h
+++ b/include/sbi/sbi_console.h
@@ -44,6 +44,8 @@ int __printf(1, 2) sbi_printf(const char *format, ...);
 
 int __printf(1, 2) sbi_dprintf(const char *format, ...);
 
+void __printf(1, 2) __attribute__((noreturn)) sbi_panic(const char *format, ...);
+
 const struct sbi_console_device *sbi_console_get_device(void);
 
 void sbi_console_set_device(const struct sbi_console_device *dev);
@@ -52,23 +54,9 @@ struct sbi_scratch;
 
 int sbi_console_init(struct sbi_scratch *scratch);
 
-#define BUG() do { \
-	sbi_printf("BUG: failure at %s:%d/%s()!\n", \
-		   __FILE__, __LINE__, __func__); \
-	sbi_hart_hang(); \
-} while (0)
-
-#define BUG_ON(cond) do { \
-	if (cond)	\
-		BUG();	\
-} while (0)
-
-#define SBI_ASSERT(cond) do { \
-	if (!(cond)) { \
-		sbi_printf("ASSERT: %s:%d/%s(): Assertion `%s` failed.\n", \
-			   __FILE__,__LINE__,__func__, #cond);\
-		sbi_hart_hang(); \
-	} \
+#define SBI_ASSERT(cond, args) do { \
+	if (unlikely(!(cond))) \
+		sbi_panic args; \
 } while (0)
 
 #endif
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 1642ac6..2e2e148 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -76,7 +76,8 @@ void misa_string(int xlen, char *out, unsigned int out_sz)
 			out[pos++] = '8';
 			break;
 		default:
-			BUG();
+			sbi_panic("%s: Unknown misa.MXL encoding %d",
+				   __func__, xlen);
 			return;
 		}
 	}
@@ -145,7 +146,7 @@ unsigned long csr_read_num(int csr_num)
 #endif
 
 	default:
-		BUG();
+		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
 		break;
 	};
 
@@ -213,7 +214,7 @@ void csr_write_num(int csr_num, unsigned long val)
 	switchcase_csr_write_16(CSR_MHPMEVENT16, val)
 
 	default:
-		BUG();
+		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
 		break;
 	};
 
diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 29eede3..15fad1e 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -397,6 +397,19 @@ int sbi_dprintf(const char *format, ...)
 	return retval;
 }
 
+void sbi_panic(const char *format, ...)
+{
+	va_list args;
+
+	spin_lock(&console_out_lock);
+	va_start(args, format);
+	print(NULL, NULL, format, args);
+	va_end(args);
+	spin_unlock(&console_out_lock);
+
+	sbi_hart_hang();
+}
+
 const struct sbi_console_device *sbi_console_get_device(void)
 {
 	return console_dev;
-- 
2.33.1


