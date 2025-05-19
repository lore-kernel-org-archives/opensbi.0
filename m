Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870B8C2D0CD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEP1lkYxWnYbI/LvzJ7l98ab7f2l8kQTNJkW8rIzd+I=; b=MKFTRy+VEJxgX4
	lwj4Mg2egNigDNcOJ9K9i8HYXRFs37W4otFR3YYqZzA/+SdCu3co08V/Ee9UMu0WOrbKF+A8L5Q4i
	4D6w4P2+QIaf6gN3I/7I+IHIeHzike7xXv3JUJ9wR7NPQYnpjsa9bvBEsewHUf5PUFrj4HBhgVABf
	MPhjZ7mVwPX3i+5w4lUCzGktGVxw1KE1zlMTK83HUEni5eR62Kw33EH4OksfSCWAxupV/bbvMMHZk
	uHBfMFK69sE1bGHqWPDdbxB4egVtmD1BLDo/fkNoocbP04QPxCnla701S/BL+JFF+P3WHL5vByTtq
	qRX628+R55KCcaY3B5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vw-0000000AgMM-1bVD;
	Mon, 19 May 2025 21:59:16 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vs-0000000AgFd-1hHy
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:59:13 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so5081127b3a.0
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691951; x=1748296751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/MQO68cn91KJTVl379RcXKziqrC9aH51FiQmS0H/FU=;
        b=mjwp0FZVTP86Vh/D8ordR1fPqBNhQbmNxJ7cGpKmDiCP6ItMRdVsBqusUzogpSiqbW
         IZC/5lHpmBXuuiBtqpOWeTsvpMZfsZz+NmtwRKzS6nJYQwL2Fn/aw+YPY+FFQqthXmDu
         U7GDSU+cjrYz8xG2fU3wEkINwbhLSDd+h0NdKMAkF8cc7GSALCVw17Yr2nX6INM0++LP
         /NrRsrGbb02u81BD2Ry8C0OfeQlH3nXk2yT4+uqEUKbEHhIyujkGwQLldi6awlsWoPTz
         ASfJGSzslGs3Z0Mw8TVSVQmZyTesrbTyi0kC/dZfFzFIDe/uxCRS+2MlAMIjXV4XxiFw
         37ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691951; x=1748296751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/MQO68cn91KJTVl379RcXKziqrC9aH51FiQmS0H/FU=;
        b=ObHh6VQP4/HTm+QYF7wZ84sJkb3LV0CtHDLYMsvdLbHkt2cG7leiTFhgt4Fdkkx3bF
         85zsDCXOteaCwjBRUVp5cmEzFGLwqSNQdSFexhi73bGy7rcT5ch3xx9+uKN5PPG/n7WR
         7OheRzMKEzfM6iXe/0tyQnBAF5nZS39BEmW/fgwyEiDUpXQKEGnSM+NZa7In/EK1k/BH
         y95HDrSB9ZGz6Nae0jbfK2j2JmsAxaQ9PM3PivwxCgbSV1ZCdB97Jnu5o1FQzvgnPdc8
         pisT9TnBoM8ylcV0Zr6/zH/LvnuPLJBSqK+X90EvuuMNpiWmeLIlBB25saF+sEsNWd3/
         Hb/w==
X-Gm-Message-State: AOJu0YyjuWGgf8RBAI1PKKtVnNCzoGqsaRFmS7myYphdUyK4oTddKfg6
	kjwaxDAQVBAfWAImslQrGaZINjS2Ke719nSaJTaV8N5KBnk69C28885C0//PadfB
X-Gm-Gg: ASbGnctBYx9MY7p4vHMrV8zh1g4LtVJR2KXNpIMlDVtz8Y3kg5OmUGtb/oWgmIxljG4
	/M1mF30h4GpxpyXK3cFjuO+ZzlkPhZ/zd8x6KQqSmDi44uBuMiX+zmH1qMwyoCnw+slMAuUWioe
	iA1YbP5RnFxnXB8RwqPsqa6W8WEq9jr95Mutw2B7c/oPuYjJxplvxhMkQwDSCKC7wSforeomS2/
	Jd9DnrVG87aH+9Ky1NPjo3PH8TMwZ4scc0e7c9iItq3PtHPUMJ50nQoetbIpRUmn90qF9UnEh1y
	e/clvtRHirXDSPnJEdxIEA+DRhwkPZsHT7oKtyf4IC38UNchV+qt7DfhnkpZsIANuA==
X-Google-Smtp-Source: AGHT+IHpJxKIsNY/pq+LcWXSxXfkrqX0OuU2zR9ztnIyr6CgEfJ0fiZ/U1BO4K0Bc0A/CnEaU9cqeg==
X-Received: by 2002:a05:6a21:9187:b0:218:1340:154 with SMTP id adf61e73a8af0-218134001b8mr17131809637.15.1747691951181;
        Mon, 19 May 2025 14:59:11 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm46386625ad.215.2025.05.19.14.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:59:10 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v5 09/10] platform: generic: mips: add mmio to allmem in the dts file
Date: Mon, 19 May 2025 14:58:46 -0700
Message-ID: <20250519215848.27569-10-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145912_447080_0A6BC0FA 
X-CRM114-Status: UNSURE (   9.36  )
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

After we change the fdt fixup to check mmio, we let the aplic_s node
be still there by adding mmio to allmem.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 platform/generic/mips/mips,boston-p8700.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/platform/generic/mips/mips,boston-p8700.dts b/platform/generic/mips/mips,boston-p8700.dts
index 6da646c..dd1bae5 100644
--- a/platform/generic/mips/mips,boston-p8700.dts
+++ b/platform/generic/mips/mips,boston-p8700.dts
@@ -46,6 +46,7 @@
 				compatible = "opensbi,domain,memregion";
 				base = <0x0 0x0>;
 				order = <64>;
+				mmio;
 			};
 
 			tdomain: trusted-domain {
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
