Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FD7106FD7D
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YIbbd8hlK8SWE0j3dgpJTYeNALkwZgH0BC7FfKkND9Q=; b=2BqKN+LBDjvFEL
	BlzP/YbGLAklKytCF/xXbqrAF18Gt90cZn+JKWxgu8nA/pv5C/ihttOJyaQCD8aX9xx+vSoKjefA/
	Gbw2dXObi8bV1ddtG79Tpkl8O6sGVQKObn6WXi4KjAiTQEgN0+2raR5V3CaCL3tpeOxtfOfXyA2ZU
	0CDpNeo7YoyMv9eKNQBNkL/A8VBOxRLqQKVmKAt93KtWpg/0bC5XEgCE+IE3O+g2eHKFNK9FnnUiE
	A5eqV3D1pdlY33j/2wMokcZ+yCdJM4/zYGhIhh2rt3JVXXm2q3gViBBoAKAvMya0/NQaMau/g4X28
	fV3o0ocPyZJxU9nf56+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwy-0000000GcBG-3w4R;
	Fri, 13 Mar 2026 05:20:40 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uww-0000000Gc9Y-1liR
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:39 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-359ff894f0dso682419a91.1
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379237; x=1773984037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2YzAfAMAnCeq+B0Od0t+Iv+BAqQeNcpBYJTp6kRXSA=;
        b=B7u5aNFs6GwZ13z06ftWeZ7+s/Wvsl/nNl42orAo1dtXt4IgR7xLdzg6HRnRqY7BXA
         PnIDGGhZLuhAekBHt47ZkRMKLFUOjn/e+QPg6cHoqHqMjp6f2D95BTAP8VRFpX1X4RNZ
         /pJs5iDBXiXF4YOc7mSRTVgMbISAYP9OKCnXuixAQlp8bMq5B/ehv0V/jAyjhvQ+sVZw
         AsCtEfPNarwy8wC2rHpuxw0Xs+4Kz8P0Qa3FCbg8lkRr2B06BZG5060GruUQkEyZ0OJ9
         Nhd0V6zZvf2RNs8MEy0AlC/NoW45I7YaveWcpT5UGwB9TZ5cLemBwK1ewT5tdYSw8JCj
         ESkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379237; x=1773984037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2YzAfAMAnCeq+B0Od0t+Iv+BAqQeNcpBYJTp6kRXSA=;
        b=nsfpkC1XMdGUPszc+lD49DOVwvhSe1XPFny4KzswnX0BRMGNVaBQda9mA5glBYcI4/
         KWWHd1QIlrquIRF1r5TGxdNWoKLYm6f+Q60LV5v5x00xQJiQt2eDTIyKp03pmJXjv3BS
         sHvcBZpqKWBlnEwBb4MKjaHAURIzmmS2/d1mFzPPvBIshEJKHKrF47KkItnslRTxXNIh
         A6pqXPavdZYX75hIZLPdZtj7U7L71o98npowi7gmFGOE0qWUbcAeTGXUzrsBGSb5IDH6
         15mg4jd7jZhkjlxMohYT36NI4/RQQ9dlvhynu4/lZC9pK1W43/65Jx+CmsNxLnJ+MBI5
         rsnA==
X-Gm-Message-State: AOJu0YwVgc73yJqR1gyA3SvvHrJZ7bqjwmBOQAmOAyynziVOqxI4tvjD
	FtC0GQPw3/rPWPfhqVwEXvjZxbhfnodvDi2Zvj2GB9aZLMTu0zbdx/eDPKPtXw==
X-Gm-Gg: ATEYQzy6Zb0jVIZk/RwHiOlHp6MSkqa4t+mhHyiw0mVkHDywE/QxmK+ZtiUW1QKFMxX
	62R2e99uBUJbAsCScCaAQtPNrmYEjd4hG5i08Q2NSzzgi3MM1/mtZO6t3tA3CgBusvaaPHXHI7F
	unKKqTKJNwzQYwPUDaU/co/zLZZNg7npza2FFUXW10bi7M0f5BN+XuylZQQjvT7y/z0HaUa3uyn
	C7G+N1sSI+zd7BUKA8ail+aGChaT2tsOZVGj5RTc8wrSEcFGazftsIDYK2/H/cIe/k47QuIRcqJ
	9gE4hR+NpBtw4h4EzLNkZ951rUhO9MzBbL9zM0wjq+7mCAouHyYtLhtYMh9D9q3c00G7dsbTY4t
	ZJleKm3EI1USymR0Hcin7OwzPC7EdHjWBGz/KLbWevzGuTc5H6weQ4H01xOeYkfP7CtpyHpT7Ou
	akt2Hdx1haOSwDKnqhLFqZcpa/945pN+7bg5GDRqtl0B7sjkxcypeQgDwb8nwygrsNG/o1
X-Received: by 2002:a17:90b:1f8c:b0:359:8d70:c4e6 with SMTP id 98e67ed59e1d1-35a21e485e2mr1847959a91.1.1773379237313;
        Thu, 12 Mar 2026 22:20:37 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 07/18] dbtr: Check for invalid and unsupported triggers in update
Date: Fri, 13 Mar 2026 15:19:36 +1000
Message-ID: <20260313051948.4017134-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222038_460389_E0816CBC 
X-CRM114-Status: GOOD (  10.49  )
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

Update triggers does not check supported or valid, so it permits tdata1.m
and tdata1.dmode bits being set.

Fix update to test that triggers are valid and supported.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index d2845fec..3925170f 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -749,7 +749,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 
 	/* Check requested triggers configuration */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		unsigned long trig_idx, tdata1;
+		unsigned long trig_idx, tdata1, type;
 
 		trig_idx = entry->id.idx;
 		if (trig_idx >= hs->total_trigs) {
@@ -769,7 +769,23 @@ int sbi_dbtr_update_trig(unsigned long smode,
 
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		tdata1 = lle_to_cpu(recv->tdata1);
-		if (TDATA1_GET_TYPE(tdata1) != TDATA1_GET_TYPE(trig->tdata1)) {
+		type = TDATA1_GET_TYPE(tdata1);
+
+		if (!dbtr_trigger_supported(type, tdata1)) {
+			*out = _idx;
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
+			return SBI_ERR_NOT_SUPPORTED;
+		}
+
+		if (!dbtr_trigger_valid(type, tdata1)) {
+			*out = _idx;
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
+			return SBI_ERR_INVALID_PARAM;
+		}
+
+		if (type != TDATA1_GET_TYPE(trig->tdata1)) {
 			*out = _idx;
 			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
