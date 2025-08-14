Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1831CA0EE4
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxmmcbWDA3daJ9o1hoH4fNFgyvP7ViVN0fHnB/HygKs=; b=f5z4+K2xHfy/4a
	585G/SyK8bZ4xYEwIyMT1P10pFitZat7AKnz+0YqkXnyBug9zmxp1pUkV4BlvIpOU+mrFNHrTtUAO
	H/WdL1XeEQNL1vVlXkYGQooD0I4uXPCY/J2UOtrmrgsm9pp1FTxzp4vNZjdh4QmCrPzC8vyAbYIVs
	ARiiuVLxrk8ZQfw8DdqiTjQ9yBNnJT7m19HlF7Ign6CdJhoupjwdhE+5ruMqgqhA5cG69p5ToRfPz
	1Q7L5O1qajrLp4JWUUgPtT6210ra8RoiNQMZjmeoI99pyn2SIWrIxTG7SNIeHkJZ2Aov1tNnWR4ER
	XoM4mvZlprR4I4qOnuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma10-0000000HTkE-00XN;
	Thu, 14 Aug 2025 15:37:18 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVm6-0000000Gi4N-0JOL
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 11:05:39 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76e2e8bb2e5so1057853b3a.1
        for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 04:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755169537; x=1755774337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmBbDtrqZ60TDYlHd9HNZKQX9E7TuXFJMUIkqwZXkGk=;
        b=nCQyx7rjff3ycS3HCBJmyqZOxBNCwMoDhI8+wq3bpsT1f3PXDFk4iLU5o/DC79LKdl
         CCO3Api5/aL2JtBJsEIyQwq12FiLxR1sCXXKR1My57romJonaX34ZAMEbx1DB+Pm45sm
         Pfl5V356TF9en4vl1WW4YVdXZTW5pW6e5AKMJEabn5t/JBs211mlvICWH1jkYa8oLDWD
         Gx8mNGxB4qjvyFMujlfMA5fq9l19XUhqN5x+HM2N7KHIlwdtVqPo91WB2lalad1CuKlx
         6hyYiQ5gCE1olu2b7/NngIIgL0igQr8m9sBs8By7qqU9lZ3uQf8D3OOAVFgBQSsIXK6y
         OTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755169537; x=1755774337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmBbDtrqZ60TDYlHd9HNZKQX9E7TuXFJMUIkqwZXkGk=;
        b=PhY9vQtczCeOMfaF7qwAtNNbzjc3R8nlN4h3jt4WpleYfllcuqrX8nl/I/bXGVBwZq
         oBePY6UGFcRi4Xe8jTfxzFTbLkye4xmHVEnlD8DbpfbmwO+6hMDrlpdr0ysrJzdMbcWH
         lGmJX7+cE+Z5LUr3YhWbHFPZELc7GusYNH8uqcx00FCaq12N3V2O3obPtVnidpMTXCHK
         qoN/mik27dueoFvSoyr28rtzwSekMz77UQCQpsWoF9qe4cu0/4eqjIZ5qp7T/aabMxPx
         ZxIKjd2BhAZHv1Izhblvrs0d18p2cMmjN/S3Iox0yYOumuYm0ye6skDbKmYn1lOGDzbn
         P3pQ==
X-Gm-Message-State: AOJu0YxGErAo+tFWKWLmEbC1L33HQYhuw4oJlWjyvfvo7wjSaSBCaGDu
	FLN0qfwdqYN1tmL83oXdnAF03TAhX/olvNY+Eb0p9xP7KohhfRFlzeCnGohl18PxK9F7MdOMeSf
	hZvxNIt+9Xq+oAoV31aww/dnmN3+L+NibLImU/0WvX/LmmqNRTQdCzfrh8NbY6UlRVjp6g7uQxR
	bGJr5KyPUa6R00BkgPFg++1beV2mMmAgJXQ7nA1wnSlLjaLvQJKbQgng==
X-Gm-Gg: ASbGncsOBIXJPWYpfevsv1yKTAACJNZQGZgf+Kvr1pGok6Wnuh21EbffWl26HBwWhzl
	O8h58EJr4nwT52O/XzDtm8t6tIjRKYfAknyb9yYtmIOGBRRG0xPdWHx7i8GtSkWs7/0rikBVrWD
	IxoUQDqVENSvxc+1cY2I61naB3v+U2IArq4JR/9LIMlaz/HeXOmSEBfyqIhOSDdlxAqKPwkqXUH
	b5x72Pj3nAcSQU5zX5TzatDlMVMf8YXsvXWtGTamcAnio00UxTohMQYEBtx7JJf5tN1ilAUgWJ6
	TpsIpXROz4e5+qVR4Paweyh/esIhYNtN/iCWwlZS1Ei5OsXKxA5SjDYoizAh6Y1GjbHX6ogzSp7
	+nJRzlZ/2eFUPrxqzN++puGO70TgUH7qaVVLmw0AfJK5aJIA=
X-Google-Smtp-Source: AGHT+IGIB3QH2QMmrsb3VPyH+TEYCmlhdlnqp0SbCz29osHvf+CKYJ9XBLHdqJCHCw2kEJw9QvZ69A==
X-Received: by 2002:a05:6a20:549d:b0:23f:f431:9f77 with SMTP id adf61e73a8af0-240bd242329mr4137146637.22.1755169537032;
        Thu, 14 Aug 2025 04:05:37 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4683722179sm9624755a12.13.2025.08.14.04.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:05:36 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	alvinga@andestech.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 6/8] lib: sbi_domain: add SBI_DOMAIN_MEMREGION_FW memregion flag
Date: Thu, 14 Aug 2025 19:05:20 +0800
Message-ID: <20250814110522.18809-7-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250814110522.18809-1-peter.lin@sifive.com>
References: <20250814110522.18809-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_040538_111290_394B3167 
X-CRM114-Status: UNSURE (   9.96  )
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

Add a new memregion flag, SBI_DOMAIN_MEMREGION_FW and mark the
code and data sections of firmware.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_domain.h | 1 +
 lib/sbi/sbi_domain.c     | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 8a51f289..d71354c7 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -157,6 +157,7 @@ struct sbi_domain_memregion {
 				 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
 
 #define SBI_DOMAIN_MEMREGION_MMIO		(1UL << 31)
+#define SBI_DOMAIN_MEMREGION_FW			(1UL << 32)
 	unsigned long flags;
 };
 
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index d6566b12..ccfcc7f0 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -541,6 +541,8 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 		sbi_printf("M: ");
 		if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
 			sbi_printf("%cI", (k++) ? ',' : '(');
+		if (reg->flags & SBI_DOMAIN_MEMREGION_FW)
+			sbi_printf("%cF", (k++) ? ',' : '(');
 		if (reg->flags & SBI_DOMAIN_MEMREGION_M_READABLE)
 			sbi_printf("%cR", (k++) ? ',' : '(');
 		if (reg->flags & SBI_DOMAIN_MEMREGION_M_WRITABLE)
@@ -894,13 +896,15 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	/* Root domain firmware memory region */
 	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
 				  (SBI_DOMAIN_MEMREGION_M_READABLE |
-				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE),
+				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE |
+				   SBI_DOMAIN_MEMREGION_FW),
 				  &root_memregs[root_memregs_count++]);
 
 	sbi_domain_memregion_init((scratch->fw_start + scratch->fw_rw_offset),
 				  (scratch->fw_size - scratch->fw_rw_offset),
 				  (SBI_DOMAIN_MEMREGION_M_READABLE |
-				   SBI_DOMAIN_MEMREGION_M_WRITABLE),
+				   SBI_DOMAIN_MEMREGION_M_WRITABLE |
+				   SBI_DOMAIN_MEMREGION_FW),
 				  &root_memregs[root_memregs_count++]);
 
 	root.fw_region_inited = true;
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
