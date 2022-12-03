From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  4 Dec 2022 00:39:28 +0300
Subject: [PATCH RFC v2 1/2] include: sbi: endianness conversion macros
In-Reply-To: <20221203213929.206429-1-geomatsi@gmail.com>
References: <20221203213929.206429-1-geomatsi@gmail.com>
Message-ID: <20221203213929.206429-2-geomatsi@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Add basic endinness conversion macros based on compiler builtins.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 include/sbi/riscv_endian.h | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 include/sbi/riscv_endian.h

diff --git a/include/sbi/riscv_endian.h b/include/sbi/riscv_endian.h
new file mode 100644
index 0000000..fe51b4d
--- /dev/null
+++ b/include/sbi/riscv_endian.h
@@ -0,0 +1,48 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ */
+
+#ifndef __RISCV_ENDIAN_H__
+#define __RISCV_ENDIAN_H__
+
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+# define cpu_to_le16(x)		(x)
+# define cpu_to_le32(x)		(x)
+# define cpu_to_le64(x)		(x)
+# define le16_to_cpu(x)		(x)
+# define le32_to_cpu(x)		(x)
+# define le64_to_cpu(x)		(x)
+# define cpu_to_be16(x)		__builtin_bswap16(x)
+# define cpu_to_be32(x)		__builtin_bswap32(x)
+# define cpu_to_be64(x)		__builtin_bswap64(x)
+# define be16_to_cpu(x)		__builtin_bswap16(x)
+# define be32_to_cpu(x)		__builtin_bswap32(x)
+# define be64_to_cpu(x)		__builtin_bswap64(x)
+#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+# define cpu_to_le16(x)		__builtin_bswap16(x)
+# define cpu_to_le32(x)		__builtin_bswap32(x)
+# define cpu_to_le64(x)		__builtin_bswap64(x)
+# define le16_to_cpu(x)		__builtin_bswap16(x)
+# define le32_to_cpu(x)		__builtin_bswap32(x)
+# define le64_to_cpu(x)		__builtin_bswap64(x)
+# define cpu_to_be16(x)		(x)
+# define cpu_to_be32(x)		(x)
+# define cpu_to_be64(x)		(x)
+# define be16_to_cpu(x)		(x)
+# define be32_to_cpu(x)		(x)
+# define be64_to_cpu(x)		(x)
+#else
+#error "Unexpected endianness"
+#endif
+
+#if __riscv_xlen == 64
+#define cpu_to_lle cpu_to_le64
+#define lle_to_cpu le64_to_cpu
+#elif __riscv_xlen == 32
+#define cpu_to_lle cpu_to_le32
+#define lle_to_cpu le32_to_cpu
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+#endif
-- 
2.38.1


