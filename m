Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6A71062894
	for <opensbi@archiver.kernel.org>; Wed, 11 Mar 2026 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iMYnRA/u7y2Q+OHKWd/S4DHEMZ7jWeiycKac7gyE2d4=; b=vhOZJknuLKbhD/
	DuFezURulh+zmc12iMvZRRkFZOEtBdJuHE9fBinwrH5RprxFD6DQAHq2veu452EGd/iX7BsKIyKn6
	7iuhzFKdmGQJ3kbxVarZoi7nEBzZ8SETdS4b3gb+9fBUvnfzF1wManFl2yA/L6rmhL2j92hPq73KY
	4hNxuKZrUmHQ9XeK9vbFwOpViySWYS3JdIuy3Mok4CrRimGh31PLC8+NpVtoexuFOQKuxRIlSOUXC
	N0/8L3OYLfVf2hKPX/a2roSop2qa7950oSfK7HBzSR4fNXh54R2mwaa0f3MIH9iogLCE1mw94aPD0
	2sRoA21BRnCMmQTVNdkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J29-0000000Bay8-35ti;
	Wed, 11 Mar 2026 12:51:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J27-0000000Bax3-0hVa
	for opensbi@lists.infradead.org;
	Wed, 11 Mar 2026 12:51:28 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso46991495e9.2
        for <opensbi@lists.infradead.org>; Wed, 11 Mar 2026 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773233484; x=1773838284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=prjVAUXUQF5m01dsLHVoo30QnyVI1I5w5WABtZ7ioMM=;
        b=Wyb4VJP0sJNxu7h8TeFphQqZ2efEYqjlFAFnuguUBBtvgt/WJSvp/kIQqNZTEpQcu8
         hE8Ppk1tkkf0Dv0TfQINST59jgH+KXAa5AfxWOcW5jP3av+rYkriQArLh6TnDaTrjmZc
         +H7DCEeWlV5Xwr3nCSxf18KU9IUxtfyr04jFdfw9VUfUqOGvMSXR4sr8v69yYcp8aXzS
         7HbzZ7o/692Df8dyUhRAEFuo2Col8Y5M/4Ys2ms6YaQfA77OP2mSJoNICmuftYEm3h7w
         9UJRr1+77hTZSh25CrgJvTfqDLDS6QnBIkioAXtROtdsvQ1v8cv/5xaeMgcN/kail2L2
         9R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773233484; x=1773838284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prjVAUXUQF5m01dsLHVoo30QnyVI1I5w5WABtZ7ioMM=;
        b=YpC9hFqzvVgB0MMWVSFA7CbUU6j8UKQ9YL1P7u72MFNYE+8GqqK8mzPyj1a24aqg1R
         2OlUo0D4+MGJOCY7wI2ay6pUkH+atq1xhU+1eGfrPhlPLrM+f87r/+l6AJWAzs135Hoe
         3xmJKinAQIKrRjeyZoP4AzhNYjkoohBp9PIATE64DyaEXpvph0bGm85DEBmtNlkjbntZ
         62HtxYXT+KT8NMoE3vxTKsnEGKdkKl2kynmEXOmaBXARiZqv3FwsK/O6wWpyiiyDo84O
         dsClA8z7mCjIe17Awui53kxiRKl1H/ZzcBUKJQVu3pIl+pEAqji73fyf49vgX0b4NF+L
         nkPg==
X-Gm-Message-State: AOJu0Yw5FUbuq3YqmUPqT0J9ct0SCjixSI6d7z9bRSd6SK9Oiud1/gEI
	oLGN4mXp9XjdxjnuRZ0fY/J96MxqAvZFq9Bg6HDpGVgDztMjptuIwVWaFsSuhD2t3sGurCbj8J/
	e0lKM+7LrFXnPohOMH25KHJGE9mbdtvTs378Yj4gpJV3ZYnARkDPaHoiDnmRR29+lG+Tig1W90t
	QgI9qTYVfy3CG/lFkNGX1K8GTRXufLWC1xCfGDhb2J4TimwrZcoIw=
X-Gm-Gg: ATEYQzz0zpI5lgyuMJYZRc1KJtzbnYcMOzhd//OFBAKONyaTJqJwY1YAZ5AzOKIAIhk
	a6hsEILprEJfu3Essgo+u9oeehQYuf91XkCgj/xtp3enufdpD47UkfsVjjAA1GR4QQdYTV8nyet
	niX3Gu6E4ittXLbUmtObgBEHVgm4NSozHAln60SmEP7Z9/ZRALiTtx6xVVENTY11Wi0LObyqoe5
	k7ZMuF8OD2nNHL9Yon7+7FZLw7T7TgV9tu1T3kzzYaQAG8IdixuQ4BxTiGegM9aVOR/6n3hoeIp
	iDH3vSvp9cVlwnZyM5LsRGSPj8EXWDY4OowL9bs6AqBbOUXJPRp6v8ATuUlJve/OG28alXoOh/t
	91PfHBGiw0gq3O9jIiI2ekjkCPLASMBJG0rYfTUA01w+Xj7cSsBLhPhRYjM+h1GwzD3Znx+Hc64
	SZjgVV2fSiWI66m64cpdrfg2UCG+cy5QCAe+dNTq27E61F6sg=
X-Received: by 2002:a05:600c:630d:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-4854b10cdb3mr40419075e9.26.1773233484339;
        Wed, 11 Mar 2026 05:51:24 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dcf2asm27463495e9.8.2026.03.11.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:51:23 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 1/2] include: sbi_bitmap: add bitmap_empty() function
Date: Wed, 11 Mar 2026 20:51:15 +0800
Message-ID: <20260311125116.1401002-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_055127_210812_196730D3 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

Add bitmap_empty() to check if bitmap has no bits set.

Unlike bitmap_weight() which calls sbi_popcount() on every word,
bitmap_empty() uses simple non-zero comparisons with early exit.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_bitmap.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/sbi/sbi_bitmap.h b/include/sbi/sbi_bitmap.h
index 596bcc7d..80d3fe3b 100644
--- a/include/sbi/sbi_bitmap.h
+++ b/include/sbi/sbi_bitmap.h
@@ -143,4 +143,20 @@ static inline int bitmap_weight(const unsigned long *src, int nbits)
 	return res;
 }
 
+static inline bool bitmap_empty(const unsigned long *src, int nbits)
+{
+	if (nbits == 0)
+		return true;
+
+	if (small_const_nbits(nbits))
+		return !(*src & BITMAP_LAST_WORD_MASK(nbits));
+	else {
+		size_t i, len = BITS_TO_LONGS(nbits);
+		for (i = 0; i < len - 1; i++)
+			if (src[i])
+				return false;
+		return !(src[len - 1] & BITMAP_LAST_WORD_MASK(nbits));
+	}
+}
+
 #endif
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
