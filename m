Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81465CDE00C
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4afdhj0FbAE+UrQkmeAAbiu1pircM9Wn6J8uhCj4B0=; b=iy3ZVYIylm9hDy
	qdjhBZOgbV8zUVvfR8n3S+DK3UvBiYan1XPZduKSRJYTn0uqrLQvpOvKs/8A2vqJgg3S48KrcFStA
	dgapdhYGWxvukBsCu1gd3cC/lmQ5bU2qxnXxdsMMKTv+OZ8wuPZEjnsMRsD0CpbOTvaf8PVk7H5sk
	mwyrRMZQe0puhVsGOQUIRo6gzbu+9w7x0fH4HuhFGREK70zhR2ShSehYmj3Q+/nTrI+QOGbBCHLco
	SkT78lD7sKsRowoUomTbdHv96UOpuMM5Rk3Q0kqq/ANQE1LVAKuJkG/7mh94v6z3g/OBCWdwQHWla
	AkKqjBffL1H+d2lOJN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cG-0000000B4S7-2y85;
	Fri, 26 Jun 2026 10:16:56 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cE-0000000B4PX-0R0g
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:16:55 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8422f395a4aso443719b3a.0
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782469013; x=1783073813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVQgD4kK0pmyfueJadaddzftANJKnCINqAltpy5ZsjE=;
        b=SlEHoVwQ8xFGGjcMvAsnxZahTCmZx/KUL0OMG34H/6oqmfbcKTgNUzxINqJuT26UQ5
         R4nEgCnYV2ICMPOwV3AGxe223gapAT6RTHOTjqZd4lm0mc8q12+QOz35lbwlOteJd5fs
         thhgcfZGUZdqIwvYeqkWsvlALfUKd2pVsseypaPMht8hPgNVcI3yBgb0wLpYu2ShquEd
         kHHtUr/GbaPKy9R8LhujlpWhXudb8hzsVEuKxMU2fQf76IAS4h61DlqIv7sncHmWUUEn
         us1T+7o+VIm9Yd7kmMhDbeOfN6pJ+fRSy9FI7w3+sJ9d0wbZ6VNb8TWiy2Qu00Zl10st
         bSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469013; x=1783073813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZVQgD4kK0pmyfueJadaddzftANJKnCINqAltpy5ZsjE=;
        b=OcZWhjTsjkZjFW7oUzEeu9T9tAFqkq/ll4YsLx7oc8Hm++6/zwLFLo2Bl2mVR7nKHH
         05rq0Ofl4Q67Dv17R725ZWBK16WPQLYXsMvDc3h62h52MTUsD+wno6josIpYvGnca5gk
         CzNMplpJBfaCzzdKpcR4oQ0wLmEOOYplbhNSVF/u+8g0gFB6Yfujx/k5MpvdN/+0/aqj
         bFbysOoGilH0sLT1oLMzXHTybFxCyWhlP9js9mmvkRYR5pMNDKSvx4CJflxwb9UQKRtA
         /eYG3i4WNxKEuCzOQuR2ATEawXshxKGnVj/92AyUhy1RYujDK1AoTb88ifnCj3aMwDX9
         NmlQ==
X-Gm-Message-State: AOJu0YzV2o5up5UsTrMia6m0ePij0ACRRczKGoG4aeSoF1OnxWQ25CM0
	DUaOuETspWxDD05vYrosDKx72PFLEV9wSmpPMVtNJRn++1KL5SBsHQlhetylN0YpEX5Lrv/Uwqn
	hiSrVRWTdH21YMdsZKcbyF6t+LOJXIl6F+G5719CEe4Ko7H5coZ65o/D3DP5aG+WsI+Wv3Q320p
	INF0sEGjVciOSvi9k5u7qYbpfno2i4T0EuS1RHsgR6Qvg13zotdf4=
X-Gm-Gg: AfdE7cm5ftS6l+TUXQy9Iz3NdgcU26yQ/79EjnRwL/bBsihjVOKMIBs1dZCO/3q+CwM
	+ke+f3MnhF/UCSk3hRQiPtNSMLBlo9WpYyu4vN5sra7Q4P8cliightMhzf9qDtLiZvQ9boaqrQ4
	RWMG71uZNf9Bg4qLOEfxuxteyrf8Kiw82Ttdazo08HwA+3Y5eb+SsWz8KFw+qXtVYtG1ZSqJmjM
	jHnylCI9coY4VKLVzlr1oeDN069HZZnFdeitsMoPnd0M5Llo7dpzBRyHSCAoHlDhik71ehcPytB
	ChbgWnPPeN9EHHA0L1/rmtwrLySb/2pj1VOhysD7/7ZE9KQLG+DYwcgAmt0JHawu/5zmum9eaVQ
	WdE+KcydIPUjlXu99lbplQ+VMvHixVxUj+dDPZ9h5QmX6am2ctxh3QBst5qg4UN0fDdJvUd5RfD
	ZFjijuKrN0ZC8UB3fZJshI3vx1F44jj6GjWXIs
X-Received: by 2002:a05:6a00:66e2:b0:845:bcab:568 with SMTP id d2e1a72fcca58-845bcab1081mr3462168b3a.20.1782469013175;
        Fri, 26 Jun 2026 03:16:53 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:16:52 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 06/12] include: sbi_types: add PRIx64 format macro
Date: Fri, 26 Jun 2026 18:14:27 +0800
Message-ID: <20260626101433.3133466-7-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031654_187769_B4DA7704 
X-CRM114-Status: UNSURE (   6.86  )
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

Adds PRIx64 for portable 64-bit hex printing. Expands to "016lx" on RV64
(long is 64-bit), "016llx" on RV32 (long long is 64-bit). Enables
consistent printf-style formatting of uint64_t values with 16-digit
zero-padded output across XLEN configurations.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_types.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index b8a7e6cb..780a4c2a 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -34,12 +34,14 @@ typedef unsigned long		u64;
 typedef long			int64_t;
 typedef unsigned long		uint64_t;
 #define PRILX			"016lx"
+#define PRIx64			"016lx"
 #elif __riscv_xlen == 32
 typedef long long		s64;
 typedef unsigned long long	u64;
 typedef long long		int64_t;
 typedef unsigned long long	uint64_t;
 #define PRILX			"08lx"
+#define PRIx64			"016llx"
 #else
 #error "Unexpected __riscv_xlen"
 #endif
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
