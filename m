Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9024DC4450A
	for <opensbi@archiver.kernel.org>; Sun, 19 Jul 2026 10:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TDFioSMOBUmH8u1jPpkCB+Eg0iljME+CGeR38ISL4/8=; b=sEtGUOTWMoElYO
	sW2e780Scb96GXogOlx/tthYQ1dERHhOFewcL2x+8rEoGvQLlncyfactXT1qYuCt9afUyc1oWgOEo
	Lo1qskTRcLZ5TYDv95I2eJoBm4XD0EwJBsGaan5af/OemXIYFiEqE55H3y7cS8HtNnxRDxO8CVx5L
	OQfkszWPVV7aDKTW+Gpmz/TlqKl4+yY0Hn8dGZSVegAX/i+rqo50CWNPdKzsmEDgM2JFu6weJM5F1
	Zodqkp1pYD8/oY+KHfrZC0UEl96bLXJa86CblEKY8G//8m20O7BY3Q+PHin31yyAM1hvvnYJ2Hnol
	CBkVuWXzcCAuEnbTiy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlOXl-00000004uS8-3wTR;
	Sun, 19 Jul 2026 10:14:45 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlOXj-00000004uRh-15Z7
	for opensbi@lists.infradead.org;
	Sun, 19 Jul 2026 10:14:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ccdce28edeso15772315ad.0
        for <opensbi@lists.infradead.org>; Sun, 19 Jul 2026 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784456082; x=1785060882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AGEeH+uspB29bl8lKzSiJ68NPmpCKg7sBpEJvjj28Y=;
        b=jXqOfCkZQ8uktFUPyukF6Pm5+M7sQ6q4Kp/Hxk3e7Wx7SLPv1ul6xq5yNEhPElkpVy
         jA4IFER3zo/rzYxeg3Q3aH69pZnP9EmmjyqwqZV7k09pDQ/Pf3AdbCH6ET+28L8VRpOX
         kmjtEYNKtdJWkxBxc47lYSogERs87HkdvfPfcryVXm4NOaQwy24cr649uPDWRVH6I+89
         pUPNaYaZi2sCtlKQMmK8AJwEafGmyCeWJUDEpbaLKNVY1zHfoRddR82y28CY8Q7TX8P2
         DUQJ1cRaKqU3i7WYOdSwVXOA+p28KWMILHNhgbGq9uJFOn6TSDQOm76JljTtjxolEvRS
         KLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784456082; x=1785060882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AGEeH+uspB29bl8lKzSiJ68NPmpCKg7sBpEJvjj28Y=;
        b=dd4GDHSeW5qi5+lpnafbdQ89WR+J0F+JQEEUztS6GrMkvbHUM47CGnGF4/dmdbJoxN
         SatejmMjHfAlTHDMOzciwxME6Fw2Zed4G6Xva7Q2INqW9BPiBTY2gRNUXbB8H41OxwSK
         vR3d66oCAnYKKDZ104ekUepfoQh//NVj6iZsJ/QeA7yLCX1Ason8EsutdPrBqMjHFaVW
         d3zS5h1ZABK8HvoO4QG/O7re/IFzyMwOAr1YkhwfLJz+LK6hfKAp6w+4KSzpwWwF3E/e
         QPVEwh83ZFc0gFR4tIo/m3sFr/UqfRuTteMhSpntW5Dz9kHc3zxI4I1R7k4JEgKibGD/
         iumA==
X-Gm-Message-State: AOJu0Yx2USn0Mhfq5df+PCrxkUPwkxkZb8RQopmdmg9AvH+BWo5XR9oC
	2NiOtiKUCyD/wPEEi1MincyPy52mspd2uDxcDOEuc3pyMHbW3pT7LUgl30osBYQN
X-Gm-Gg: AfdE7cmk+iqfii+EeXRjum8m+xvQLQ+o0VjNUrHlEUYX98e4+euBoOFrYWACl1n8iXe
	KVuwSnnNH5hD07K30sMAKd83dPbsuSOHXWZIW3LHGRT9SOO2nwocm3H1pmvK2K5U9fKwsH+HXNl
	hyRmOYtZqU9bt0sO5wsZuaZ8DiEtKCt2oWKQJiZW/SzJCD9jo8J7iVubXMrRojd4+nifjViI8/K
	2zV1wC0XU/gxRH90Hf963qS/f7R2nF6JMRbE1Xc1rKkxUQWbuoknv8NJwyS4o4Kpg0dy6YCwIuA
	2fLp91HlbyKqIxPAn5nGkvj7+LBYyHSpzFqPG7/SvGaCVDPtZMJj54SfHZDKRJ/op/nZDFsJQOU
	eAU+QbpJQz8QWk7DmtIUvMJr1i10sjqBQH+8zCZpF5SJkQxNhKEiKZpfLwmJKmVCI+QEOJNb2wJ
	JM/vPIqdz7Xko=
X-Received: by 2002:a05:6a20:9397:b0:3c3:a17c:1f70 with SMTP id adf61e73a8af0-3c3ad8fc609mr7644302637.3.1784456081889;
        Sun, 19 Jul 2026 03:14:41 -0700 (PDT)
Received: from pop-os.. ([114.10.27.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcd9sm26123391eec.3.2026.07.19.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 03:14:41 -0700 (PDT)
From: Yudistira Putra <pyudistira519@gmail.com>
To: opensbi@lists.infradead.org
Cc: Yudistira Putra <pyudistira519@gmail.com>
Subject: [PATCH] lib: sbi: clamp sbi_ecall_get_extensions_str buffer offset
Date: Sun, 19 Jul 2026 06:11:25 -0400
Message-ID: <20260719101125.190314-1-pyudistira519@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_031443_304145_F70C2722 
X-CRM114-Status: GOOD (  14.55  )
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

sbi_ecall_get_extensions_str() advanced offset by the nominal extension
name length without checking remaining capacity. When the caller buffer
was smaller than the concatenated extension list, offset could pass
exts_str_size, so (exts_str_size - offset) became negative and was
passed to sbi_snprintf() as a large u32, and the trailing NUL write
could step past the caller buffer.

The helper can write beyond a caller-provided destination when the
registered extension list exceeds the supplied capacity.

Mirror the guard already used by sbi_hart_get_extensions_str(): stop
appending when the next name would not fit. Add an SBIUNIT regression
that registers several extensions into a 16-byte buffer with a redzone
and verifies no out-of-bounds write.

Closes: https://github.com/riscv-software-src/opensbi/issues/416
Signed-off-by: Yudistira Putra <pyudistira519@gmail.com>
---
 lib/sbi/sbi_ecall.c            |  2 ++
 lib/sbi/tests/sbi_ecall_test.c | 59 ++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 745fa31..65c5a55 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -66,6 +66,8 @@ void sbi_ecall_get_extensions_str(char *exts_str, int exts_str_size, bool experi
 	sbi_list_for_each_entry(t, &ecall_exts_list, head) {
 		if (experimental != t->experimental)
 			continue;
+		if (offset + sbi_strlen(t->name) + 1 > exts_str_size)
+			break;
 		sbi_snprintf(exts_str + offset, exts_str_size - offset,
 			     "%s,", t->name);
 		offset = offset + sbi_strlen(t->name) + 1;
diff --git a/lib/sbi/tests/sbi_ecall_test.c b/lib/sbi/tests/sbi_ecall_test.c
index 5b6ce37..f5c553e 100644
--- a/lib/sbi/tests/sbi_ecall_test.c
+++ b/lib/sbi/tests/sbi_ecall_test.c
@@ -40,10 +40,69 @@ static void test_sbi_ecall_register_find_extension(struct sbiunit_test_case *tes
 	SBIUNIT_EXPECT_EQ(test, sbi_ecall_find_extension(SBI_EXT_EXPERIMENTAL_START), NULL);
 }
 
+static void test_sbi_ecall_get_extensions_str_bounds(struct sbiunit_test_case *test)
+{
+	struct sbi_ecall_extension e1 = {
+		.extid_start = SBI_EXT_EXPERIMENTAL_START,
+		.extid_end = SBI_EXT_EXPERIMENTAL_START,
+		.name = "Alpha",
+		.handle = dummy_handler,
+		.experimental = false,
+	};
+	struct sbi_ecall_extension e2 = {
+		.extid_start = SBI_EXT_EXPERIMENTAL_START + 1,
+		.extid_end = SBI_EXT_EXPERIMENTAL_START + 1,
+		.name = "Bravo",
+		.handle = dummy_handler,
+		.experimental = false,
+	};
+	struct sbi_ecall_extension e3 = {
+		.extid_start = SBI_EXT_EXPERIMENTAL_START + 2,
+		.extid_end = SBI_EXT_EXPERIMENTAL_START + 2,
+		.name = "Charli",
+		.handle = dummy_handler,
+		.experimental = false,
+	};
+	char storage[16 + 16];
+	char *buf = storage;
+	char big[128];
+	int i;
+	int found_alpha = 0;
+
+	SBIUNIT_EXPECT_EQ(test, sbi_ecall_register_extension(&e1), 0);
+	SBIUNIT_EXPECT_EQ(test, sbi_ecall_register_extension(&e2), 0);
+	SBIUNIT_EXPECT_EQ(test, sbi_ecall_register_extension(&e3), 0);
+
+	for (i = 16; i < 32; i++)
+		storage[i] = (char)0xA5;
+
+	/* Undersized buffer must not write past the caller-provided size. */
+	sbi_ecall_get_extensions_str(buf, 16, false);
+	SBIUNIT_EXPECT_EQ(test, buf[15], '\0');
+	for (i = 16; i < 32; i++)
+		SBIUNIT_EXPECT_EQ(test, (unsigned char)storage[i], 0xA5);
+
+	/* Negative control: room for the full list, including registered names. */
+	sbi_ecall_get_extensions_str(big, sizeof(big), false);
+	SBIUNIT_EXPECT_NE(test, sbi_strlen(big), 0);
+	for (i = 0; big[i] != '\0'; i++) {
+		if (sbi_strncmp(&big[i], "Alpha", 5) == 0) {
+			found_alpha = 1;
+			break;
+		}
+	}
+	SBIUNIT_EXPECT_EQ(test, found_alpha, 1);
+
+	sbi_ecall_unregister_extension(&e1);
+	sbi_ecall_unregister_extension(&e2);
+	sbi_ecall_unregister_extension(&e3);
+}
+
 static struct sbiunit_test_case ecall_tests[] = {
 	SBIUNIT_TEST_CASE(test_sbi_ecall_version),
 	SBIUNIT_TEST_CASE(test_sbi_ecall_impid),
 	SBIUNIT_TEST_CASE(test_sbi_ecall_register_find_extension),
+	SBIUNIT_TEST_CASE(test_sbi_ecall_get_extensions_str_bounds),
 	SBIUNIT_END_CASE,
 };
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
