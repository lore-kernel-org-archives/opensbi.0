Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F36D1CDC6
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KWDwAaaIdauvVfZxdTTBf34nxWGB67eQ9VNjkA1yTQ=; b=OZnlx8nYbTCe5n
	L61w2qnoz7+gHE+udO9Ng+MQFfDCvrenooNQiAnnkDRKvnXI2EB1/2LmpE61qiiH4S9/0eO3BreCp
	VnPWuQ6NMv4ROmp0lehvb5HWSrjc5yRst7AONpCyb88hinvSgsHT4Rts6fLJQhbgdVP3x55tuPkZN
	a9H1w4W2BFyhRzCCcOF2DB9D+C/wY2UayAHuktsQ4QsoIvPpl+CFyEVROxEblB+byOYvbtPrqp8jw
	xjP71JWApQNjFo1B9ENBP9B7JBT5w1WMB/CIzfyAFgYGfgLhbGPi5FhhDMCno8Mb36rxnWjPCjMS6
	6UnfgrGb2H1pi3RVb4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSutr-0000000E6T5-2aK4;
	Tue, 09 Dec 2025 10:24:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSutp-0000000E6S9-3FsD
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 10:24:54 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29555b384acso55781075ad.1
        for <opensbi@lists.infradead.org>; Tue, 09 Dec 2025 02:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765275892; x=1765880692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnRvXK6QxL/0r/SMoAL4Py47Rd72p1Yuy8oEKz+H1L8=;
        b=XvtbFrjhGoazu5hTyPOodSgrnwSITmT0Hzpochd76pNH83YYA2cosCRGHBST9WneRI
         KeIzsPTThoZtqsUFbGaaAjVsoHmwcbRCecvs4m1AWmC7nl7vmMm89puD2zudXoRmqAkS
         os4ztNc2axEoZTrC2OItJ4s4jLQ/832Cl8Dtt8FCxyD+GP8Nb9BsjT/LIJH6fOXXfaIK
         uOUJPTHGAVfAe2dRuBZlkxJu3ro+cjy4GU6L+rDEKVHTgvgNNPgZg3EV8U3Uu86eZGVr
         VMjp+DPol9jwMulFttJUEkuvoksf+BqPbvoBU2iIAxrKkySLqTBCp6MKRDFPzJxANAqL
         ySeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765275892; x=1765880692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VnRvXK6QxL/0r/SMoAL4Py47Rd72p1Yuy8oEKz+H1L8=;
        b=qXFpfCVIze/HlqNTshby05QuSkmu6x+xiYybyxZIRj0QR2iD8qmg0a21Yi3eV64BBH
         merDkYFZXRxwGQv27iJWIb8q13+uzyOH+EIjXoySICcq3egnUdyor3DaeX+gvDw4Od5G
         s4HOh8Dz8ejNGdzJ4vP7rp1TkL3mcBdVR3RE62rb9kU6Q7XzfvwAV5OeRDEO65c/033D
         YNIaZIGR47JIjcjgfw6xtwQ7DyMgSg3K/M1zLzMjZHaCL2llUinaHZ8o/+BOd9LPkE5w
         nDBGDI1Sjfxx4C3Y/kvDSuxo6PSo8tJy4dCHePjzxtimH5koIRwPPaiQ6N3IMpyfS4cz
         qPmQ==
X-Gm-Message-State: AOJu0YzeS3Wic5MjMGZiZ/T/Qr6/5wdLGRvWBLDyCfwUCvOMZqsH3v1j
	EPisyPJ06Mg8ZGh7g+y0/kjeBRbu6an3VeVh9aorfnYAwMBK9ke4GS7t1fQXrEmp
X-Gm-Gg: AY/fxX4XisX+SmSbfbptX1CgV7uisknZxLpZ7kngc9SjpHp6lg3yr50hIeo89ERhi3P
	xzv5nMk0Exwk33SgcjWDRbQ4i/g3bd0U0o2vYgk5f+j+3LXGPs2ZHmMjM4bw3JKvm4a738s/kaF
	nR+UtAyy8grDsCuVE0R+X+a7ZKmTmZNdxhoee10FfC1HU37jGwMhGVcCl3wGfNY3XizBhangZxF
	F7F42DyuEYEWn3OZVRdc5klu3QtMxF5dXvrAqf3t+V4Xv+AzG8Cm8oQpkMsFH+8aoTX51umGqtE
	MWdwd4/XW7JWEydt2j5LdQpKxkun6HTBzrLxoSh16FS08a67WNA1KV5Ufz+xncUMrr1Rk9GucKp
	svuFLlAkCpRODExvqsQ5vgUEqcAga/aA8lkGIOisfEFJUMnikN+7WlGRKpBxa9bnIJRc7OWdYdg
	KPsux68zIhljxN
X-Google-Smtp-Source: AGHT+IEQRpl7iAq1K955k+f+q8shxofCxvmMFEU81JP06Yc62gK05r8WzQe2N1a13+R2CPb50gbIVg==
X-Received: by 2002:a17:902:e94e:b0:29e:1415:df95 with SMTP id d9443c01a7336-29e1415e02fmr69386605ad.51.1765275892422;
        Tue, 09 Dec 2025 02:24:52 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49ca1esm149302135ad.2.2025.12.09.02.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:24:51 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v4 1/5] lib: sbi_hart_pmp: make sbi_hart_pmp_fence public
Date: Tue,  9 Dec 2025 02:22:42 -0800
Message-Id: <20251209102246.1161-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209102246.1161-1-ganboing@gmail.com>
References: <20251209102246.1161-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_022453_812020_6C16E524 
X-CRM114-Status: UNSURE (   9.28  )
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

sbi_hart_pmp_fence can now be utilized by other hart-protection
implementation.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_hart_pmp.h | 1 +
 lib/sbi/sbi_hart_pmp.c     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hart_pmp.h b/include/sbi/sbi_hart_pmp.h
index f54e8b2a..a7765d17 100644
--- a/include/sbi/sbi_hart_pmp.h
+++ b/include/sbi/sbi_hart_pmp.h
@@ -15,6 +15,7 @@ unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
+void sbi_hart_pmp_fence(void);
 int sbi_hart_pmp_init(struct sbi_scratch *scratch);
 
 #endif
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index ab96e2fa..08bc2cef 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -61,7 +61,7 @@ bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx)
 	return bitmap_test(fw_smepmp_ids, pmp_idx) ? true : false;
 }
 
-static void sbi_hart_pmp_fence(void)
+void sbi_hart_pmp_fence(void)
 {
 	/*
 	 * As per section 3.7.2 of privileged specification v1.12,
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
