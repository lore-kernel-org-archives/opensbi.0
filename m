From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Thu,  2 Feb 2023 10:14:25 +0530
Subject: [PATCH v2 1/3] include: Add support for byteorder/endianness conversion
In-Reply-To: <20230202044427.1253816-1-rpathak@ventanamicro.com>
References: <20230202044427.1253816-1-rpathak@ventanamicro.com>
Message-ID: <20230202044427.1253816-2-rpathak@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Define macros general byteorder conversion
Define functions for endianness conversion
from general byteorder conversion macros

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Reviewed-by: Xiang W <wxjstz@126.com>
Reviewed-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 include/sbi/sbi_byteorder.h | 57 +++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 include/sbi/sbi_byteorder.h

diff --git a/include/sbi/sbi_byteorder.h b/include/sbi/sbi_byteorder.h
new file mode 100644
index 000000000000..680710fe6d91
--- /dev/null
+++ b/include/sbi/sbi_byteorder.h
@@ -0,0 +1,57 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ */
+
+#ifndef __SBI_BYTEORDER_H__
+#define __SBI_BYTEORDER_H__
+
+#include <sbi/sbi_types.h>
+
+#define EXTRACT_BYTE(x, n)	((unsigned long long)((uint8_t *)&x)[n])
+
+#define BSWAP16(x)	((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1))
+#define BSWAP32(x)	((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x, 1) << 16) | \
+			 (EXTRACT_BYTE(x, 2) << 8) | EXTRACT_BYTE(x, 3))
+#define BSWAP64(x)	((EXTRACT_BYTE(x, 0) << 56) | (EXTRACT_BYTE(x, 1) << 48) | \
+			 (EXTRACT_BYTE(x, 2) << 40) | (EXTRACT_BYTE(x, 3) << 32) | \
+			 (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
+			 (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
+
+
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__  /* CPU(little-endian) */
+#define cpu_to_be16(x)		((uint16_t)BSWAP16(x))
+#define cpu_to_be32(x)		((uint32_t)BSWAP32(x))
+#define cpu_to_be64(x)		((uint64_t)BSWAP64(x))
+
+#define be16_to_cpu(x)		((uint16_t)BSWAP16(x))
+#define be32_to_cpu(x)		((uint32_t)BSWAP32(x))
+#define be64_to_cpu(x)		((uint64_t)BSWAP64(x))
+
+#define cpu_to_le16(x)		((uint16_t)(x))
+#define cpu_to_le32(x)		((uint32_t)(x))
+#define cpu_to_le64(x)		((uint64_t)(x))
+
+#define le16_to_cpu(x)		((uint16_t)(x))
+#define le32_to_cpu(x)		((uint32_t)(x))
+#define le64_to_cpu(x)		((uint64_t)(x))
+#else /* CPU(big-endian) */
+#define cpu_to_be16(x)		((uint16_t)(x))
+#define cpu_to_be32(x)		((uint32_t)(x))
+#define cpu_to_be64(x)		((uint64_t)(x))
+
+#define be16_to_cpu(x)		((uint16_t)(x))
+#define be32_to_cpu(x)		((uint32_t)(x))
+#define be64_to_cpu(x)		((uint64_t)(x))
+
+#define cpu_to_le16(x)		((uint16_t)BSWAP16(x))
+#define cpu_to_le32(x)		((uint32_t)BSWAP32(x))
+#define cpu_to_le64(x)		((uint64_t)BSWAP64(x))
+
+#define le16_to_cpu(x)		((uint16_t)BSWAP16(x))
+#define le32_to_cpu(x)		((uint32_t)BSWAP32(x))
+#define le64_to_cpu(x)		((uint64_t)BSWAP64(x))
+#endif
+
+#endif /* __SBI_BYTEORDER_H__ */
-- 
2.34.1


