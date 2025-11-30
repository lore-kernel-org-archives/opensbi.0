Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F02D116F7
	for <opensbi@archiver.kernel.org>; Sun, 30 Nov 2025 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+UWMN/c8N2SAM5H0uYyAkam48/uRNQpI2W2zkbYvlI=; b=ME02mB7T9ZFriA
	Uvf7w/UgptOzJ3lHEsZfShEclcq+Vuvy8OaUn8USt0TVHW31QLyEzJCbJ8RovGcqc06q1KzJDvqiG
	G/wF19RDu/r5ElVNH2FR+dMMNGtAm/VDlgh2lzZGwN59kWdgAWziDhtNjb692S3Fajrnz6krJ13nR
	zB02eleKKajMxaXOmdksbr1zcDIKFMEphsP05uHAril1keYSmXxBs7hieuJ/pimO76rSqrF9kqloM
	eK6IfStjN9Y5hIUXRQyY5DVboNlNKg+UaN0zDYeATu6oLa5eWKPkEgpUIYhMvUMN9UAfhc1sW7Fn2
	1SziFgyStu0IbA+1ESOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQM-00000002FCA-3EtQ;
	Sun, 30 Nov 2025 11:17:02 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQK-00000002FAb-1iOt
	for opensbi@lists.infradead.org;
	Sun, 30 Nov 2025 11:17:01 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7b80fed1505so3889815b3a.3
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 03:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764501419; x=1765106219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjrVZ8847thmLMMiGLQTw2tBYXbwnlhGejq977xRoks=;
        b=Hhf/JqdD0nZjbjI3CUQn5OzkMyWa7wKnG9n4urpBPIl8rc9PEsJT40ZQszpKEshZF3
         6rko5Ji5EZ//+0eD4edqf0DAdyNif/4jLB/IkG6jTknkWpfHyvDm/rHL2QkeJ9YC5umA
         b3tJqr3EC260DjvTFIoAdsGX9Iivwjpj3E2zvkb8V5KVTriBd3VALEw67g6NFsQa+mXK
         XkBUfITck73jilTYm4cfcU0+Pidu16gN1p9R5gn83+pdF7gxNuIPHCmh/ykKydsP61ZI
         rMt4EOxC9LVCg58GyQL3ixGMsOQc4C9oOnHxHU2p3qWxrYrwcUwpiWaiJBu5NM0valsH
         NKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764501419; x=1765106219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjrVZ8847thmLMMiGLQTw2tBYXbwnlhGejq977xRoks=;
        b=sR/KY+US3GvH6mwCk4lU6hVNJ7XNo/gwpwrNPIESOWmCwY6Lv9f6iYzGGuyYXyo11/
         k7ZVxTYF20UBuAFt682DzRscDpqb8c3q+ilTAGJgeH/ofi+F7Xj39XZnryjgW9sQdMSr
         KHmVOn02Zl2Q8HmbgQBgZl12yQpYfIQKFxMs/EthkW3rGowXOOWLBlsRzw4cCv9mnrEB
         X6CaIL94+ya3KaFHuM70kH8zyQXYlzr3mjWe0FqhVXnuFWcLyyAvoOoh6Nq180VaF4s1
         GFoN8fEDGhtIVQW/Etst99iLQrh7K13RKsCRUNgeYHsDxqhiPLDe2t1GxyHKQX+REIyf
         xyCw==
X-Gm-Message-State: AOJu0YxwtZvaIID7vrnroYaUqmFGJB+OYuhpxT27SufEqkqscN8Z3nZR
	qhuDqImSGspjuQEKC5SqhIbyA1ZwcjE/SYX+dcGxCqC9WXVIjDqYtXZo+67SrDmovzMJBMvvTKL
	xv8hJZGj7eQPvqIvrtAC/mOHnJuvPjwGRzgpRGuP16ugT+/citVXmZikheTNRAVwNIFVjnXFEI1
	2LHK0GnxAJsy8u3AogEGEX5wOjoAgmwWCjqThUAg9zCMnpo8f2
X-Gm-Gg: ASbGncvkjpxy19rBAuAv9lvGrbFzzCxZM/uIlS3zSy27z3tl9Yu9ug43V7UcOvggCXd
	t7LtabU//U/D1WPv7+uBsrOj+EXpggpsYOh+adaBahudpPof9FXGrUcUj+Ho9B1XY6Txk7ON7my
	47W0tFGnw59Mc4S47TgVpsoN+nlGqp/2MwCIJ1AnGvP+Q/5fgHk4mUE6PfrYVeaQrvxOlcYhbfd
	BaF6sSMfkwLHtWKu8aCnTzD6g1UU5XeeVshNMxJDKd8mBgFl6UD7tlN3iHMjepmn5cltAqnyF/L
	GaiGCX9AirdbHXi/YpIo/7ZUiZYHb6KY1C76sBSBIYCAE52yJhjVa4zA671br/fAx5KlKabuLiG
	b7HwkW8TOzlTsramyYdA/KbwUbKkjD1oHuT0YCwVQ7NagBvRkCGEcYiGKmF+AfbuDJ1fsAHFI3K
	ojyJIcBG0m6ajwzxxuVo/TXe/69drk/ovPGUmjXzBY8YiW3A==
X-Google-Smtp-Source: AGHT+IFeQ8akFF09bU0QTyHEi3YZMXFyfgl02yvDqqTbmG7z3xi9e/BR3n2JGILhK/q4PucEu7t6Zg==
X-Received: by 2002:a05:6a20:6a10:b0:34f:b660:770d with SMTP id adf61e73a8af0-3614eddc713mr37118813637.55.1764501418636;
        Sun, 30 Nov 2025 03:16:58 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1819277c5sm10027050b3a.4.2025.11.30.03.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 03:16:58 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 5/6] lib: sbi: sbi_init: call sbi_hart_init() earlier
Date: Sun, 30 Nov 2025 19:16:42 +0800
Message-ID: <20251130111643.1291462-6-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251130111643.1291462-1-peter.lin@sifive.com>
References: <20251130111643.1291462-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_031700_449966_FDA4066A 
X-CRM114-Status: UNSURE (   7.64  )
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

Move sbi_hart_init() earlier in the initialization
sequence, the function initializes reserved PMP regions
before platform-specific early initialization. This
allows platforms to call reserved_pmp_alloc() in their
early_init hooks.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index bb449d49..88c2720e 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -262,11 +262,11 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 */
 	wake_coldboot_harts(scratch);
 
-	rc = sbi_platform_early_init(plat, true);
+	rc = sbi_hart_init(scratch, true);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_init(scratch, true);
+	rc = sbi_platform_early_init(plat, true);
 	if (rc)
 		sbi_hart_hang();
 
@@ -421,11 +421,11 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_platform_early_init(plat, false);
+	rc = sbi_hart_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_init(scratch, false);
+	rc = sbi_platform_early_init(plat, false);
 	if (rc)
 		sbi_hart_hang();
 
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
