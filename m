Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA46C606A326
	for <opensbi@archiver.kernel.org>; Sat,  7 Nov 2026 23:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JLIk3IsS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T2G5VU5K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MK4Z+ljnhDPlrWn7ZwSMaKJX3+7vgE7DUey/FptXPZ4=; b=JLIk3IsShWGR0xXZeKUwFNKboq
	/PMA5t41EODgP8U2xIRxls1OIkH3kxzQ9mcGOiD0OKkS5tpsVZqzyDXah15icMOLta6EFS++tAg7n
	hW9BJB7l+TX6FgGnttvxX03uO79S58W/w/QprIwVyfR/c8VLsJ8mswZPBsNOu9DvdCX1ZOfkOjVJr
	7o2vpBMnCkn1leT3EKBpdUuYbabObbDHHc8gZXaBb0Aui7hZbopC84WyBjMfg/L6/2zoiJcrKtFcT
	+tO8OAAc9XsPWGolxT4k0EiYn8UwqY1z1EMhk8IoFUI+jLiv/gYWJd9TAvSHogz1eqpxkQ16GghBw
	L4APG+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5W-0000000FW1m-2ajr;
	Sat, 07 Nov 2026 23:44:46 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5R-0000000FVyX-3nZN
	for opensbi@lists.infradead.org;
	Sat, 07 Nov 2026 23:44:44 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso215398eec.0
        for <opensbi@lists.infradead.org>; Sat, 07 Nov 2026 15:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794095081; x=1794699881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9dditCIhyY75lL209BXk3ThJr4jNjAnLNXEGLjatCrA=;
        b=T2G5VU5KuiJBIYFB8xzOGiCo9vXwsVIZ5R6KCHz51uyHTkb7XwmLmQCqU5bwkriZky
         9Z8h4vnxJeLh4iwQIb47ABePVBlf0kTG/XtY5vgcNJUTNHDKZi26+M42ehfeKlB2tTSU
         Je/lEI8XRMC7usYQv4jSwgTkvvtnHTDTNBxdqTY4tijLk+51FbazMRrfzFoYw3heTy9N
         rjt2VQBtqms2KbBeopFFJuCWgRRnH8q+LRf+O/aMLuSObRnRMQkFwJ+j4xUGr4ubaFhP
         Q1pI92KTgebGF9UyAkiaNOUTuQEkzVvz35WyPjMieq/D4uqKPKbv2seSqPj+pCKz+jJg
         1n3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794095081; x=1794699881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9dditCIhyY75lL209BXk3ThJr4jNjAnLNXEGLjatCrA=;
        b=r+lWI20muViGWg70MM5aAfAThZ+bLzwzmwZeqtUH4MC7KSoCxGIoMnu+Os05fRSXDK
         tn20+MiIfIVcZu3luYawTB4R4ZO9MYzFXGEIrTcZoOgllICeEACYfzxfu1+ktCxV1MWE
         bmFF9lakqdy7rE94HrTa29geOnxuR0oyzcIEAijyqQgW9BtRsTKtHID0C1HsG/11NKUX
         Zu+6vmqR8Xx2MALVoJ5e8QN3CkSUdgFjPx0kKCsZpQ+VPgnuV5sKLqEQdmdklCRgpnEk
         La3VAAqOiQKXgxEEyhfqT9vWHiJSbfB4hNJP8XkyVIBz+XfnWnE2uHv35D6QBmPctB42
         k9Uw==
X-Gm-Message-State: APuU4Z9pKBJpvdxXrH9MjeZYrNHT7azQg41QMp4yQ3Hv6K6IBLfLFPPC
	P51ZHQd/z9QkwTNUXpdU3UxZHjrDRISgyOxfCyfyZ8YOWEy6GDogR2Ra6NAmpQBk
X-Gm-Gg: AYBFou0LEPDWjLd+UVO65OIWzdJinGOmrNcezaslTEmYR916Buulj3wToGt07t3K696
	t/SM9xSFC4AVzM7xpptB1X6l1eFm33HIbkkzm9Gcg6Bwsv1zt2IaDpyPSkQAE9UzZpEod2kAxcP
	4DutXcXja67/1e3j3oG7bVTDVDtIg5DexGEn24RbQLA+4RLoMeihSaBNE/9ZIy2eLaiBYGSDPx5
	m2mBlZ+4lPer9ij/Ts37mFrRgP0nepUcUhuVxanj+azJWI4TXGPTEnl7cEcYORfU+FGKwEgPTvl
	cWAoLsJDrFWvzcgPiVl2cPpqgFvWq5jkLL13t9zpW4BbSwSZfj9oD57vor4qv/UssQqzAV2dGin
	jVXvuAET4zsibF8UYsoA8VwWLCJw7SRW6XmOfZ3wE4A8PUZjG/VM19xq9mxuP7C2tvnmIqGy4PB
	VlBRgoeYp++XH/0apmtBfubU20WiBAwO9kVKoGe5g6uIOjc6vW2rLWX8SGhPVpsUZhvlnt1m/A7
	tIVVA4oZYB+YzdyBVaDY0CMjy5ooZ3+J23WxJ+uW3e+I/HfcVmQmJpQskrJRzk4Kq3ZzW7jV98q
	3uQZJ1kev1yys+LWozyZooDw6wXVIN4cHIyGTgjoUNVOpRUWP5zl1n+1TmH99Ptmo6LMaYDY38r
	IVcPfwPD1jbBTEq+H+xOwToqvx643GXs=
X-Received: by 2002:a05:7022:1709:b0:184:992:c9ec with SMTP id a92af1059eb24-1b39fecbba5mr60991c88.38.1794095080717;
        Sat, 07 Nov 2026 15:44:40 -0800 (PST)
Received: from aster-MS-7D31.scai.dhcp.asu.edu (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm1819730c88.6.2026.11.07.15.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:44:40 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: samuel.holland@sifive.com
Subject: [RFC PATCH v4 5/5] lib: sbi: Preserve vl and vtype during domain switches
Date: Sat,  7 Nov 2026 16:44:21 -0700
Message-ID: <20261107234421.137100-6-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107234421.137100-1-theodoruswensanfebruanto025@gmail.com>
References: <20261107234421.137100-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_154441_972588_B0644FCD 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Save vl and vtype as part of the Vector domain context.

Restore both CSRs using vsetvl after restoring the Vector register
file. Restore vstart after vsetvl because Vector configuration
instructions reset vstart.

Link: https://github.com/riscv-software-src/opensbi/issues/434
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 include/sbi/sbi_vector.h |  2 ++
 lib/sbi/sbi_vector.c     | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
index c14f3174..480f9ac3 100644
--- a/include/sbi/sbi_vector.h
+++ b/include/sbi/sbi_vector.h
@@ -15,6 +15,8 @@
 struct sbi_vector_context {
 	unsigned long vcsr;
 	unsigned long vstart;
+	unsigned long vl;
+	unsigned long vtype;
 
 	/* size depends on VLEN */
 	uint8_t vregs[];
diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
index 1f9e01cf..53c2e5a7 100644
--- a/lib/sbi/sbi_vector.c
+++ b/lib/sbi/sbi_vector.c
@@ -33,6 +33,8 @@ void sbi_vector_save(struct sbi_vector_context *dst)
 	/* Step 2: Save CSRs */
 	dst->vcsr = csr_read(vcsr);
 	dst->vstart = csr_read(vstart);
+	dst->vl = csr_read(vl);
+	dst->vtype = csr_read(vtype);
 
 	/* Step 3: Save vector registers */
 #define SAVE_VREG(i)							\
@@ -86,6 +88,15 @@ void sbi_vector_restore(const struct sbi_vector_context *src)
 
 	/* Step 3: Restore CSR's last */
 	/* Restore CSRs first */
+	asm volatile(
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"vsetvl zero, %0, %1\n\t"
+		".option pop\n\t"
+		:
+		: "r"(src->vl), "r"(src->vtype)
+		: "memory");
+
 	csr_write(vcsr,   src->vcsr);
 	csr_write(vstart, src->vstart);
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
