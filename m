From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 14 Mar 2025 17:30:23 +0100
Subject: [PATCH 1/2] sbi: Introduce sbi_hartmask_weight
In-Reply-To: <20250314163021.154530-4-ajones@ventanamicro.com>
References: <20250314163021.154530-4-ajones@ventanamicro.com>
Message-ID: <20250314163021.154530-5-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide a function to count the number of set bits in a hartmask,
which builds on a new function for the same that operates on a
bitmask. While at it, improve the performance of sbi_popcount()
which is used in the implementation.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_bitmap.h   | 13 +++++++++++++
 include/sbi/sbi_bitops.h   | 22 +++++++++++++++-------
 include/sbi/sbi_hartmask.h | 11 +++++++++++
 3 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/include/sbi/sbi_bitmap.h b/include/sbi/sbi_bitmap.h
index 354476c9dd81..596bcc7daa87 100644
--- a/include/sbi/sbi_bitmap.h
+++ b/include/sbi/sbi_bitmap.h
@@ -130,4 +130,17 @@ static inline void bitmap_xor(unsigned long *dst, const unsigned long *src1,
 		__bitmap_xor(dst, src1, src2, nbits);
 }
 
+static inline int bitmap_weight(const unsigned long *src, int nbits)
+{
+	int i, res = 0;
+
+	for (i = 0; i < nbits / BITS_PER_LONG; i++)
+		res += sbi_popcount(src[i]);
+
+	if (nbits % BITS_PER_LONG)
+		res += sbi_popcount(src[i] & BITMAP_LAST_WORD_MASK(nbits));
+
+	return res;
+}
+
 #endif
diff --git a/include/sbi/sbi_bitops.h b/include/sbi/sbi_bitops.h
index 3ddac777d887..d7825e81ea05 100644
--- a/include/sbi/sbi_bitops.h
+++ b/include/sbi/sbi_bitops.h
@@ -125,14 +125,22 @@ static inline unsigned long sbi_fls(unsigned long word)
  */
 static inline unsigned long sbi_popcount(unsigned long word)
 {
-	unsigned long count = 0;
+	unsigned long count;
 
-	while (word) {
-		word &= word - 1;
-		count++;
-	}
-
-	return count;
+#if BITS_PER_LONG == 64
+	count = word - ((word >> 1) & 0x5555555555555555ul);
+	count = (count & 0x3333333333333333ul) + ((count >> 2) & 0x3333333333333333ul);
+	count = (count + (count >> 4)) & 0x0F0F0F0F0F0F0F0Ful;
+	count = count + (count >> 8);
+	count = count + (count >> 16);
+	return (count + (count >> 32)) & 0x00000000000000FFul;
+#else
+	count = word - ((word >> 1) & 0x55555555);
+	count = (count & 0x33333333) + ((count >> 2) & 0x33333333);
+	count = (count + (count >> 4)) & 0x0F0F0F0F;
+	count = count + (count >> 8);
+	return (count + (count >> 16)) & 0x000000FF;
+#endif
 }
 
 #define for_each_set_bit(bit, addr, size) \
diff --git a/include/sbi/sbi_hartmask.h b/include/sbi/sbi_hartmask.h
index 07a8c076bd0a..200ab6e53e4c 100644
--- a/include/sbi/sbi_hartmask.h
+++ b/include/sbi/sbi_hartmask.h
@@ -181,6 +181,17 @@ static inline void sbi_hartmask_xor(struct sbi_hartmask *dstp,
 		   sbi_hartmask_bits(src2p), SBI_HARTMASK_MAX_BITS);
 }
 
+/**
+ * Count of bits in *srcp
+ * @param srcp the hartmask to count bits in
+ *
+ * Return: count of bits set in *srcp
+ */
+static inline int sbi_hartmask_weight(const struct sbi_hartmask *srcp)
+{
+	return bitmap_weight(sbi_hartmask_bits(srcp), SBI_HARTMASK_MAX_BITS);
+}
+
 /**
  * Iterate over each HART index in hartmask
  * __i hart index
-- 
2.48.1


