Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EE7CA0EFE
	for <opensbi@archiver.kernel.org>; Wed, 20 Aug 2025 03:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PavbvA+T0rTiuQKb7JBpCmpfKpqguWRXWKNRYCcUG68=; b=h5ak7XWsJlNMTpg2hLdlFHVd30
	yVZ6a/F4LZZIL4NemmzeNXzn44MZvN3hwe5GfEs1IRJbH1ENmWo8bwsItJpVVuWMWxRt+cQcuFUmO
	NZw/67q+qdNudo3PAzLoN1rpUBXcW5hhtTSjCQ4cH2MEdGILrjxQsaFvCWBz3RCqTD2hkIeNei2sL
	7xhFciONXWyufBnMG43ubuHTIAiZHgfpOx8yW9/SdKnWte797BJ4Uy9unDf2oKx8eDBb3AyID7Dha
	vq+F2Sh11YoHZjoloQVFFmjPsIa9V2mIBW6bgITWB2HwnX0bSyca/56GmG05eH/YdjmqJZA7+NXYo
	OhyLC3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZbK-0000000CHRN-2c33;
	Wed, 20 Aug 2025 03:35:02 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZZZ-0000000CHDR-0P6Q
	for opensbi@lists.infradead.org;
	Wed, 20 Aug 2025 03:33:14 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24458298aedso51409315ad.3
        for <opensbi@lists.infradead.org>; Tue, 19 Aug 2025 20:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755660792; x=1756265592; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r/up7Pe8wYXCG+K8+JBdGI0hFtJ64CnzUgTs7yMymeM=;
        b=PQYJFP5Tly/xL5Gf86Gn+8CSI9vC91DMDG0joj9j3FSh7ecDjmnVTkH3g4gLwveZ3C
         tD9+MygT8M1wY9kHM3ofJ/sgWDLBIEBOPlw1iIXMY+Nf6hGXsTrrpIhFiqXUXDYAuG/v
         DEUW4B++ekjGsne3xyDXcB5xFuAmPHqykLg6AecgELcIGpvlgOe75zBCqJE51dKfDw+B
         XP8RL0AZRxzIHPNVnA7aqYd2fAREdo9tECS1RtBiIj3yIeoHfl0lWqS+iRkOqFB0Y/do
         y2Gb7CEkpSCal27mili0r4R5us7o4ofmB2RDMTO0xJepBmMLvRtrSk03if1fTJcewCml
         TBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755660792; x=1756265592;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/up7Pe8wYXCG+K8+JBdGI0hFtJ64CnzUgTs7yMymeM=;
        b=t9euPWq2YRTU79xAXuufT+S+0chlmyDo1ML/B60d+eZvJdOVcP+hvaGW2VZXpNvdgx
         ixOeqpiZUDSGL7GsaUozsXErnL3JsZJJ3I8GCpZEY2+gIA/pq0TN2elJp5a/6KUheZqx
         sooCT3N3MSHJJe+XHJjkZhhXUYRttIR4qv6oNXio9kTyBRUalhUmeWVvu734CXEYLA9a
         FYcNWLpfKZK1jKdnputX9aSe6P2eKzVJ8mXoVGgxu4vzixGWYFnLil4MHiao5HvWxgfQ
         PCnHdLOc7chGwYZmaOS4n9Pnm7hFQNbgoyK8JEMMW05ZCwYwdtB4z9DKhHoHBrJg59WE
         1guw==
X-Gm-Message-State: AOJu0YxW7AQsGtC/xg6eVNGcEDyZ0vno5iUBz+N5PqJyRrlfaX28wVTT
	ZUocnYTBoD1HOiaLLkwcDfPvGkT6lJGEmlixTM664CAf5FejVV/NFeK/NBrzFEWBpC2krR0qgfa
	uw24/sHno0+jdXHzPu6zUKyCZ8ZLmOXUGV70/5bLzVtd7g3MiAHQI25Oy8XaoTA9/y/73WV6DG5
	eP6sofVSH6YnU+XL9MN7UwykILDoTxHebGU3Zk7elCTFXoxQ==
X-Gm-Gg: ASbGnctZpFiJuprKcYZpzrUdRcO8AuuRTndElWXJ3Lu2pjy4Frv8Npok/C2eC6Kn8Tb
	Yl45UzxQljjyMn0IsCSJcAv/kUtyRrXlAOAI9ldHhEV5Pa5Wdjvv/tHmdo06+Y/jeAfJ/mPM60j
	r2mKJxBF/jFq9S+TDRalpRG03OWZY1lWKJXKpbYlC3s7cnbBHsF07hP4RjJYU3RzYP+OVogSbKx
	fNzDE3y7Lwj0+vz4anCGOplw8nWruvjEXjjpDgyzWRtcgDD5PXxoCVGFvwqjjdTJ0Yab5fxz8ca
	2B109b2U15hvl8CBrD482r17akq6z3WCY97xvI2xeq8hYWvQ+shbAKkuyeeUjc8utuP60Mncy6T
	Eqj01K9p56stdnnW7KroobTgK6EZVuz9VzZi2ieBUZ0bh
X-Google-Smtp-Source: AGHT+IHhu3Lt+bTj4+YGPmLP5Wg9OCAW8VikSyst3mpmf2WSJyNSHzNyZiIhdJG38dmMq2G7bP1UxA==
X-Received: by 2002:a17:903:19cc:b0:235:f143:9b16 with SMTP id d9443c01a7336-245ef25d1f9mr15647905ad.41.1755660792023;
        Tue, 19 Aug 2025 20:33:12 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e252ea41sm738430a91.9.2025.08.19.20.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 20:33:11 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v4 06/11] lib: sbi: Add SiFive proprietary xsfcease
Date: Wed, 20 Aug 2025 11:32:45 +0800
Message-Id: <20250820033250.544-7-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250820033250.544-1-nick.hu@sifive.com>
References: <20250820033250.544-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203313_135625_6DAF42A2 
X-CRM114-Status: UNSURE (   8.37  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Using ISA string "xsfcease" to detect the support of the custom
instruction "CEASE".

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index fdcf400a..ff682fb4 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -83,6 +83,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSSTATEEN,
 	/** Hart has Xsfcflushdlone extension */
 	SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1,
+	/** Hart has Xsfcease extension */
+	SBI_HART_EXT_XSIFIVE_CEASE,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4160ad6c..2519f3f0 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -716,6 +716,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
 	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
+	__SBI_HART_EXT_DATA(xsfcease, SBI_HART_EXT_XSIFIVE_CEASE),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
