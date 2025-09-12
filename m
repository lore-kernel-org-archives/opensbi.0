Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4A8CAC582
	for <opensbi@archiver.kernel.org>; Fri, 12 Sep 2025 05:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9kozKbARNiETAQojrN3v0K2WWQ4DYtTGPvnvFs36oQ=; b=riFNrF/YkaMPhr
	aQ4cW1bJC8FEfKDCL2IE6prpWckJ9khf7qwQ8H+VO2o0cV/mKtR7Sy4t40okUMieAGp8QOw7kVEvM
	aP4EgPmL9V6ZHkk1s4/OQraSfCzX5mQGU4RqsP/Vpy1Mdl0aPmhVKh/T4d6o5Ug50FaNn0F4pUHur
	v71ge57MRQxLGg9dmY9zUA0MVfWSIshIVO22uGrC1JJThrt7oEQgLgEWjdHmlfNvKntcPK/OOi20i
	TdZr1QAxHu1ymsfDlF+rbNlFLIzbgWW00LRKhrxilFU+KJ49IwmpVF8ARgd6iFRKp9QqB/rGopZ1+
	H1ag0lfwWgObG7IZ/zbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwRl-00000007CoB-2I5D;
	Fri, 12 Sep 2025 05:35:45 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwRi-00000007Clp-0WiV
	for opensbi@lists.infradead.org;
	Fri, 12 Sep 2025 05:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Subject:From:To:Date:Content-Type:
	MIME-Version; bh=yzqwlHWG4SlrQjsJ5tyECx14WX2auLjniwlI/fUu8ao=;
	b=CugZ8PqkRnrpxRtaAT6rjs5MPfTEx+Os45Y5GE3Xs6PWCmAp+KxdjBtrIrRZTe
	bMWPX/hiJZz9JPu9nFxu6jXfNWm6toLvx5FXm4nT5gIFvOkGIQRyb91xjKHrpj1L
	ehj73YgL1NCeyuHAZfAklrJZ2709QQjTeHAs2RKQukoco=
Received: from [127.0.0.1] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3r3EkscNobhUGAw--.30536S2;
	Fri, 12 Sep 2025 13:35:33 +0800 (CST)
Message-ID: <52640a46085aa6bc8075365165c15d73b8e06009.camel@126.com>
Subject: [PATCH v3] lib: utils: fdt_helper: simplify
 fdt_parse_isa_extensions() helper
From: Xiang W <wxjstz@126.com>
To: Peter Lin <peter.lin@sifive.com>, Samuel Holland
 <samuel.holland@sifive.com>
Cc: zong.li@sifive.com, greentime.hu@sifive.com, opensbi@lists.infradead.org
Date: Fri, 12 Sep 2025 13:35:32 +0800
In-Reply-To: <CAHZsQ-PMbs3rTSWrdLw-D1BFME_wSQ1jT2fTbNvbfhDmX3nv2Q@mail.gmail.com>
References: <20250906072656.5525-1-peter.lin@sifive.com>
	 <f37ccb84-ef5f-4aed-8149-78c65e229165@sifive.com>
	 <CAHZsQ-PMbs3rTSWrdLw-D1BFME_wSQ1jT2fTbNvbfhDmX3nv2Q@mail.gmail.com>
Autocrypt: addr=wxjstz@126.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CM-TRANSID: _____wD3r3EkscNobhUGAw--.30536S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKrW5tr1kuFyrXr4rXr4ktFb_yoW7CrWxpF
	nrKrWxtrs7tFy8u3yktr4DZr4xAwn2qw47tFZ3tw1SyF9xAw13Wr40kr109a4Ut340g3W5
	A39agFyDuF45Xa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UwJ57UUUUU=
X-Originating-IP: [153.35.241.45]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1xXGOmjDnu3LvgAAsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_223542_505081_758CC596 
X-CRM114-Status: GOOD (  11.45  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

The fdt_isa_bitmap was previously used as a temporary array
to store ISA extensions when parsing device-tree.
To reduce scratch space consumption, set the ISA bitmap
directly in hfeature->extensions, allows us to remove the
fdt_parse_isa_all_harts() as fdt_parse_isa_extensions() can
now handle the task directly.

Signed-off-by: Xiang W <wxjstz@126.com>
Co-authored-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi_utils/fdt/fdt_helper.h |  3 +-
 lib/utils/fdt/fdt_helper.c         | 58 ++++++------------------------
 platform/generic/platform.c        |  3 +-
 3 files changed, 13 insertions(+), 51 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 04c850cc..2ece7f5e 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -54,8 +54,7 @@ int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long  *c
 
 int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 
-int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
-			     unsigned long *extensions);
+int fdt_parse_isa_extensions(const void *fdt);
 
 int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 0f4859c1..8685d9fc 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -324,9 +324,7 @@ int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq)
 
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
 
-static unsigned long fdt_isa_bitmap_offset;
-
-static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
+static int fdt_parse_isa_one_hart(struct sbi_scratch *scratch, const char *isa)
 {
 	size_t i, j, isa_len;
 	char mstr[RISCV_ISA_EXT_NAME_LEN_MAX];
@@ -379,7 +377,8 @@ static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
 
 #define set_multi_letter_ext(name, bit)				\
 			if (!strcmp(mstr, name)) {		\
-				__set_bit(bit, extensions);	\
+				sbi_hart_update_extension(	\
+					scratch, bit, true); 	\
 				continue;			\
 			}
 
@@ -393,27 +392,25 @@ static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
 	return 0;
 }
 
-static void fdt_parse_isa_extensions_one_hart(const char *isa,
-					      unsigned long *extensions,
-					      int len)
+static void fdt_parse_isa_extensions_one_hart(struct sbi_scratch *scratch,
+					      const char *isa, int len)
 {
 	size_t i;
 
 	for (i = 0; i < SBI_HART_EXT_MAX; i++) {
 		if (fdt_stringlist_contains(isa, len, sbi_hart_ext[i].name))
-			__set_bit(sbi_hart_ext[i].id, extensions);
+			sbi_hart_update_extension(scratch, sbi_hart_ext[i].id, true);
 	}
 }
 
-static int fdt_parse_isa_all_harts(const void *fdt)
+int fdt_parse_isa_extensions(const void *fdt)
 {
 	u32 hartid;
 	const fdt32_t *val;
-	unsigned long *hart_exts;
 	struct sbi_scratch *scratch;
 	int err, cpu_offset, cpus_offset, len;
 
-	if (!fdt || !fdt_isa_bitmap_offset)
+	if (!fdt)
 		return SBI_EINVAL;
 
 	cpus_offset = fdt_path_offset(fdt, "/cpus");
@@ -432,13 +429,10 @@ static int fdt_parse_isa_all_harts(const void *fdt)
 		if (!scratch)
 			return SBI_ENOENT;
 
-		hart_exts = sbi_scratch_offset_ptr(scratch,
-						   fdt_isa_bitmap_offset);
-
 		val = fdt_getprop(fdt, cpu_offset, "riscv,isa-extensions", &len);
 		if (val && len > 0) {
-			fdt_parse_isa_extensions_one_hart((const char *)val,
-							  hart_exts, len);
+			fdt_parse_isa_extensions_one_hart(scratch,
+							(const char *)val, len);
 			continue;
 		}
 
@@ -446,7 +440,7 @@ static int fdt_parse_isa_all_harts(const void *fdt)
 		if (!val || len <= 0)
 			return SBI_ENOENT;
 
-		err = fdt_parse_isa_one_hart((const char *)val, hart_exts);
+		err = fdt_parse_isa_one_hart(scratch, (const char *)val);
 		if (err)
 			return err;
 	}
@@ -454,36 +448,6 @@ static int fdt_parse_isa_all_harts(const void *fdt)
 	return 0;
 }
 
-int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
-			unsigned long *extensions)
-{
-	int rc, i;
-	unsigned long *hart_exts;
-	struct sbi_scratch *scratch;
-
-	if (!fdt_isa_bitmap_offset) {
-		fdt_isa_bitmap_offset = sbi_scratch_alloc_offset(
-					sizeof(*hart_exts) *
-					BITS_TO_LONGS(SBI_HART_EXT_MAX));
-		if (!fdt_isa_bitmap_offset)
-			return SBI_ENOMEM;
-
-		rc = fdt_parse_isa_all_harts(fdt);
-		if (rc)
-			return rc;
-	}
-
-	scratch = sbi_hartid_to_scratch(hartid);
-	if (!scratch)
-		return SBI_ENOENT;
-
-	hart_exts = sbi_scratch_offset_ptr(scratch, fdt_isa_bitmap_offset);
-
-	for (i = 0; i < BITS_TO_LONGS(SBI_HART_EXT_MAX); i++)
-		extensions[i] |= hart_exts[i];
-	return 0;
-}
-
 static int fdt_parse_uart_node_common(const void *fdt, int nodeoffset,
 				      struct platform_uart_data *uart,
 				      unsigned long default_freq,
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 47e771ad..7e3417b0 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -251,8 +251,7 @@ int generic_final_init(bool cold_boot)
 int generic_extensions_init(struct sbi_hart_features *hfeatures)
 {
 	/* Parse the ISA string from FDT and enable the listed extensions */
-	return fdt_parse_isa_extensions(fdt_get_address(), current_hartid(),
-					hfeatures->extensions);
+	return fdt_parse_isa_extensions(fdt_get_address());
 }
 
 int generic_domains_init(void)
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
