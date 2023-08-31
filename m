From: Xiang W <wxjstz@126.com>
Date: Thu, 31 Aug 2023 11:39:29 +0800
Subject: [RFC PATCH 1/2] ilib: sbi: add sbi_platform_hart_index2id
In-Reply-To: <20230831033930.694299-1-wxjstz@126.com>
References: <20230831033930.694299-1-wxjstz@126.com>
Message-ID: <20230831033930.694299-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add sbi_platform_hart_index2id to find hart index by hartid.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_platform.h | 10 ++++++++++
 lib/sbi/sbi_platform.c     |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 3e9616f..6df5d8b 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -268,6 +268,16 @@ _Static_assert(
  */
 u32 sbi_platform_hart_index(const struct sbi_platform *plat, u32 hartid);
 
+/**
+ * Get HART id for the given index
+ *
+ * @param plat porinter to struct sbi_platform
+ * @param index HART index
+ *
+ * @return -1U is invalid value
+*/
+u32 sbi_platform_hart_index2id(const struct sbi_platform *plat, u32 index);
+
 /**
  * Get the platform features in string format
  *
diff --git a/lib/sbi/sbi_platform.c b/lib/sbi/sbi_platform.c
index 445a8c1..25bbf99 100644
--- a/lib/sbi/sbi_platform.c
+++ b/lib/sbi/sbi_platform.c
@@ -88,3 +88,12 @@ u32 sbi_platform_hart_index(const struct sbi_platform *plat, u32 hartid)
 
 	return hartid;
 }
+
+u32 sbi_platform_hart_index2id(const struct sbi_platform *plat, u32 index)
+{
+	if (!plat || index >= plat->hart_count)
+		return -1U;
+	if (plat->hart_index2id)
+		return plat->hart_index2id[index];
+	return index;
+}
-- 
2.40.1


