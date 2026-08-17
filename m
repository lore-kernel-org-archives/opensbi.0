Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9503C5B572
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9LOB19pMtYnmwuPLqSvjfPgbzbo2sS2VQiGxPykYek=; b=M5yFnm3kaz7ZCX
	m+gPIUYdMgDOe8ij0BMSTdLjgwR2c6DvmBMzlEf4eP2zRo0P4gtnrIW2+hYGAbknyNuMIUNnhaZ0c
	kAjMn9rh51wt17cMtmGHD5OWL/F6zzWwAA4bGP+l0xh88E0eMuGeIdFxoFjvyg3adp2DNeO4Q34ET
	1f16HyXWE8XCWmmvWTNtrdmribFPPrDQa50beBvcpoa8TCMea9h7/wnj8aZzZt1bfPLYA+8LxV3Rm
	d6liODSfombeSohnw++E3QZ4vYMv/mhmZ62I8gUro3MeEfi+STAzzFTIxbP7fL3TcntFKvsyRGjct
	zbnsDhDtD1GbdSunsKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHq-00000005lje-3HQb;
	Mon, 17 Aug 2026 09:05:42 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHn-00000005lfX-0ESI
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 09:05:41 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84e0688b859so212282b3a.0
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786957538; x=1787562338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNpFFpiVuvexmEIeBkTZF1/d8O07f+5IS6rq0Xc4raw=;
        b=MZoBEKZ93JDtTb7hTEVW0oeEAuUvgYvwbSeC1EWDu4m0JJ66Dhn3FrpoFFBqP12zNN
         Rz32E0zxicLOeaJlcx/+Bi8VEyULFXYVSpRBxSQYorFUBKNAarX1AQjxJifqVmKbe5Ad
         kl9NM4wcKaAQwS/wwfvqodPtiY46FQLI9US3005f9OoTlQEf+J/Zq6BibM6g6enYKT0l
         92w0BhEV0pjSTHdhHTL79zrAj/QzkHX4F38m1AxFfQQBZSvScA4GkfvcV57p1dwuWHfR
         Hj2eVnDtFJH+8vkbXWGqCGph4f6lfkX3dcOnOObxbLNGGoO3PSg92SuZtoQlynarw+FV
         83Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957538; x=1787562338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNpFFpiVuvexmEIeBkTZF1/d8O07f+5IS6rq0Xc4raw=;
        b=eZYKIkXcwf7ok92k5jI1lKPAp8bb/mbPsnjqsqvAoJfr1U8wyqciQJ07emJ+JrPM5B
         gZkFOO7TQ1h8o0Zu/p7ILS5RHR7KvYytBpqaVBzWr63G8mtOoxJesRSg5DxNxotOPQDg
         evRSn6lPOb3s5MK1r4rUvHaZeUCvUspeqGa5CYJePEV0usbHg2YxSBVy8tItoejX7HXW
         HA27aBqFN6PmYVldirY5jko8tfypdWF373upYkyFa2QLNSzBwGUfdP0cQuBjARRd4f5X
         MddfKAapDBfHixw7Ky7gZI3kMVduiJVLmHYP9BtsNJZUheQliky7dTFwkAm/TcyVVGSp
         Xc4A==
X-Gm-Message-State: AOJu0YxREGVYkIFWqDYdHW+hsoXFl7jeGhp6dNM4YJveyXRZgVPAmhTW
	TuiesPWQTk2gP1ce88QtnQHgefkqi72u6ch8DhAc/iXuFa69N90Aa+raIzSQLFBh9nJwp6pZSh8
	j7ks/a8W/gqV+8m6kXfDGqIrhJTHYA5fbo2ShG5lMkl9JTfly5L57zTQBOUdx2j28EqGPxzzzW7
	qF479hV0Q7FzD0B4J46ddTkkl6+hyqkkcBCETgXfQRZ3umWotCn4Q=
X-Gm-Gg: AR+sD110A3Gt6S3JNuagNx0q/UStcUh72cIwho0NplQlrhZcv1k5EuLaVnwmIQ1CwmT
	prRU8mc5qhRkDDnVUN/EQR+LTR23NG8jpwRUsVj3MxRzlmnp2B/LNm1UDWlHQaBw1Z0hOzq8gRq
	SimpSGXXm/hA9pOptI2QcEaiCeX72pYU/em1ReBpFCT2H4yGSW9Du9LTUoXi0ZluJlLobvIE/xf
	er4y2vN4Rhtw4/N+3tFGqLQA7/AHJF2sVVZcFr/iWGyFuVOObVhkJPRW+7XhOcz5mxxUSOocQfm
	0IoNRPNKcH7RAjp99A1fIo5Ua4gyBjdORtlxPhpLgOX4T9VF4eFTamssJiCvgKPibb6m3EL6ol/
	TDealwzNn6J6pF1yuWoUoLgk2SHsBvxzRgryG9U2ENWoVMjsDbk7v6Qeigv6CTUCPb0rPI2HBxd
	L1mrdiZPMm/jjVuaB0ckz2A6UbTuoWkEnsmzwshuq6OL1xLIEkW92Yn1v1G4tOHQw4zuYi46Lrc
	8lzOthQgid7
X-Received: by 2002:a05:6a00:1f03:b0:846:bc81:3e29 with SMTP id d2e1a72fcca58-84fde365255mr24561510b3a.2.1786957538279;
        Mon, 17 Aug 2026 02:05:38 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f1bsm2487386b3a.38.2026.08.17.02.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:05:37 -0700 (PDT)
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
	pawandeep.oza@oss.qualcomm.com,
	krzk@kernel.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 7/9] include: sbi_types: add PRIx64 format macro
Date: Mon, 17 Aug 2026 17:05:01 +0800
Message-ID: <20260817090503.2104998-8-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260817090503.2104998-1-peter.lin@sifive.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020539_112095_62508ACC 
X-CRM114-Status: UNSURE (   7.31  )
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

Add PRIx64 for portable 64-bit hex printing. Expands
to 016lx on RV64 and 016llx on RV32, enabling consistent
printf-style formatting of uint64_t values.

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
