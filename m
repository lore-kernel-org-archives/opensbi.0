Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8C7CFD376
	for <opensbi@archiver.kernel.org>; Sun, 30 Nov 2025 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5q96gpa5+tCaXMhqRY0FVSu+y9hRa1yvZgRbJzq7zQ=; b=wqdhtZYX8EYRd3
	YYJ99QNPv7S6+S+rYI0sc6sGdvxbTotw1enRZCNZXDkEojNflRrFCgc3M1qjapD42CBhh5IcAV91s
	0993iZLSD4Niug6yeTDvIYEciDPIlpGPfKxGERNo+530zBefDMmGCUcxhPhRN5d8Jhc00RJw3ozly
	btYlgzyIGylQj7zuuLdiji+NfR+G1M49GTBKABtSx/TRlqZ8iVxAVNaRaNbyoI8nBaug8mq1W0OYd
	5TsKvr3cuLDuBEGftdjtFwy9cKckwoU6aW2OS2VUP25LdiQn+UgJHOos/SwfwJ7s7vQfkSfILKaOE
	0gaoCIJlmV3opplh4zSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQH-00000002F9Q-0PXy;
	Sun, 30 Nov 2025 11:16:57 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQE-00000002F8M-3QJS
	for opensbi@lists.infradead.org;
	Sun, 30 Nov 2025 11:16:55 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7aad4823079so2717655b3a.0
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 03:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764501414; x=1765106214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2K/DM9m5h9l9iIVTbzgC8xy6M0vcGUoDtw8u6byowc=;
        b=X5cNWNDvjQWIyH+cF3p6DjfAOTUEdse2CGGbQY+psZ0uzi1Jy6nuVmDfez6xQbT5yh
         QiT/6Y+K71Ur2WHQxfh3lsCIELtWQBCpfR8vqmqLaJ4e6yOkfgTZT2/OfdRKWbMVVGmG
         d98iL2WeHJdZEv3siE64uS4pSfidFkN9a8Bf1NwwEnRyC7XoFLNDs90efK5DgGDUMzxI
         Uz36Wfj+FHEBgJKEqTSh/dTsuC+8HJ9VbBFvE2k4VypJjDj9OaIzs6ZB6jbYK32549in
         UfeLFgkr0Hc/w9hYHVMY5Dw9WlrvRSJxv5/+u1y1yO9s5zPvs0AvxPesWPxnbv0oZpT6
         yMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764501414; x=1765106214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2K/DM9m5h9l9iIVTbzgC8xy6M0vcGUoDtw8u6byowc=;
        b=AM4Xc57W3PsE6IQmX+8yEpoJXp987ADt9fGLEZDi75f6bPFgb5bcAp6vpsgBd2mkLq
         JNQm2cDWRouBw5vmUbTMJtLePrn8j1WltkDw7K1/dxIaR4qzdRkM33M/5Xbt603RL5bM
         Oefl0UbEz13HTDEzgVfEK05LOOcof1SPPmXK63mXyolQTsQZQVWFpfLX1PcptDTCOtu9
         pI/lJVI2dL3LYQoD4Axu/iE9g6olXGHf1WN3u+1Ffje/XBbg2prAOAOtwvk66pLbvo1g
         Wd1367I6L+2dPSg25a/2+wuI7gSYSFp/qg9E3sCT5Y/pnfbrEfT6ttSFDfv6peMljS9k
         Q18A==
X-Gm-Message-State: AOJu0YzTbxb2xYHPj9Cenbm31uZviKD1jspN0NgnMX3ol2TcYzKJKUJ0
	eZri2SekBsEgdHOWWIgVNgp3u9R694KK13U41lS1i0WRattdecUtKIfyGHKiUU/yapCDXizWhD3
	d3s8m2Ctr6UwqhlIvo9oMIdERmbm+Xpvhr0e04Lk1P/3riPfuaxV3rEBISVqHY3aEaODdN/NTfe
	GKm0xixE+ZFE1n4zdsZpC8qlRsWFMhrWPXaFCBVOLiUtcpKAil
X-Gm-Gg: ASbGncusWw1h1XVhbZ//OZjB+Ijo+1lTFb1pBrbCbd6QhHsbXUz/GhFLyKwyr/JhEZm
	nODw0L7TUbK2lWQQojGerrHfRHTv3jK/i349gI45EUfnpUrRelNf2hhIF5A4aWUsrtM57CdVqJK
	WEsUc9qLCpY/2Bp2Z2XJyLJ1CGBza4Rkbd7fCc3YdDEd0CcWzULSatgR0pUxMu10tpa7wIgS915
	GkLDuboN8sJFb5XbvFBPKmAfD/v+pl+JaqB3lyuQb41zGScY9lyNPN6VqKLwTLrAN91yRuU+QEM
	EFAZRdA/XWO/iPcd5nFDXFtoNR1xsal1bjFQW4jTt6LVt6rfj49ogXPeXoLDS90ohXqzt1nU1E3
	ek4zFPXCpTbBBgmoTLuG9UH/Jqu9ku1aJ/5X1H3o0gef8qEa+yo3gH8iDUaLPuQZKLocFde+qvf
	xyhzM9iYTjMH+Lmj3ZQvXC2SZs8EdU2Sn29f0=
X-Google-Smtp-Source: AGHT+IEWG9slAKcMZgtN/c35ML0NdLxU+1ZwOfes5ISHQ+xotxGFnMQrSjdgFf4Qwu+1AFdEq7hAxA==
X-Received: by 2002:a05:6a00:bd81:b0:7ad:4136:944f with SMTP id d2e1a72fcca58-7c58c89cbe5mr35886911b3a.8.1764501413720;
        Sun, 30 Nov 2025 03:16:53 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1819277c5sm10027050b3a.4.2025.11.30.03.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 03:16:53 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 2/6] lib: sbi_init: print total and reserved PMP counts
Date: Sun, 30 Nov 2025 19:16:39 +0800
Message-ID: <20251130111643.1291462-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251130111643.1291462-1-peter.lin@sifive.com>
References: <20251130111643.1291462-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_031654_862942_7537F2DB 
X-CRM114-Status: UNSURE (   8.03  )
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

Show both total and reserved PMP counts in boot log.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_init.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 663b486b..bb449d49 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -163,6 +163,7 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	int xlen;
 	char str[256];
 	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
 		return;
@@ -183,8 +184,10 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	sbi_printf("Boot HART Base ISA          : %s\n", str);
 	sbi_hart_get_extensions_str(scratch, str, sizeof(str));
 	sbi_printf("Boot HART ISA Extensions    : %s\n", str);
-	sbi_printf("Boot HART PMP Count         : %d\n",
-		   sbi_hart_pmp_count(scratch));
+	sbi_printf("Boot HART PMP Count         : "
+		   "%d (total), %d (reserved)\n",
+		   sbi_hart_pmp_count(scratch),
+		   sbi_platform_reserved_pmp_count(plat));
 	sbi_printf("Boot HART PMP Granularity   : %u bits\n",
 		   sbi_hart_pmp_log2gran(scratch));
 	sbi_printf("Boot HART PMP Address Bits  : %d\n",
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
