Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA1CCA0EE8
	for <opensbi@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skWi7ZaKRUwXO3HJs+U82Scsu29ot/hw8gM/42mEuvw=; b=E8acDcWST6K+6z
	JvsPxKdwF+0q3c1LC46ONeWW74N3z/4kQj7/r6lmndYPiYdNCSJlXf1r0Jw8fc+LMyun1OUAqlOMQ
	QYbaYKZh+L2tDJakzSSNswKGj5zzCQJa2XhaU1i58+5dOnA5GOkACjffTMlcNjqlBv9IFuDPvIsQO
	tiIefsA5SuLqJHNi22t8tq/lacTgY0w2+txPxR6hXz0Pt5kZSgj5kca+eQb7q/Re0riOMnEAkjzMG
	FbIHsE+f15DNnevHavGsglT6TYks7WV9KagPL2SOUcWz/wVKdUX1CeQRiT6/p34gi53dDYXxVUkim
	iiWZUanLaBo0X2Facu2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuGZ-00000002YLE-2ip3;
	Fri, 15 Aug 2025 13:14:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrFd-000000028kA-2gz4
	for opensbi@lists.infradead.org;
	Fri, 15 Aug 2025 10:01:34 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-24457f53d2eso21466285ad.0
        for <opensbi@lists.infradead.org>; Fri, 15 Aug 2025 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755252093; x=1755856893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRQmE+EVaIiMH/V0QfLjfNUf8pGNEIlDX5IJa9ZMcE4=;
        b=VyPcNCWV4prjJtaloYcdQzqgqlv1mTVJ12LL4Wj9F1gaFEHk5dRujJPW8tOvTsbZjH
         j4lR4RJLGyePYyv1U+BoS7xMA5xOax1GTxPUmzAzlhZLiIrXLHkMCib6AfjNLHh3pAe6
         VfQ7hcDE8+APQEDmXKIshz9ASaz5RMUx/TFiDEsXCLtcptxgAzM/xoTAXqbJF2JmLQTZ
         xBdtTfaeTPO5bXbGRWhl8DGhFwydt9u3RhTgLipi4O1Z1FeeBxg4Mkmx9L5hX/+wlWtM
         d40uYzKkmPIzxKDFN1t+pSHKRdLnEltoh1hk8f8i4PWpIFOhLtU4urI+Pw29VK8WjTv7
         VmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755252093; x=1755856893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRQmE+EVaIiMH/V0QfLjfNUf8pGNEIlDX5IJa9ZMcE4=;
        b=YD67/mlT7C0m/ASPuFTS5d0zDt0cM07NFyl8dMBFOTiqrdsMszgqGytoMG8xaxi2Dh
         jPL9ztwBfdUOcczAIckde6z9H8NEpmTZc3UWqdSDMEY7bInYiCWv5oEVLJV0XY0/AQIP
         suvrP5eKp2IplYPgE7Gmr+SPctai5w5ea0ZYAAe2BpTEpkPUeaDksLG+wGmwwT2v8rJa
         5ggi4F7EhMXOt0UDlmrbyfsSYedCm8+afc55v3GMPDP7vfFQePYId7HIvFfh48qqnSpo
         zwZdwGAuDxX2I/fE225urolzM92J3WLPnwVzZHLFtb6pa7mo0PnwOAv0wmPOBUStZv52
         pQcw==
X-Gm-Message-State: AOJu0YyqGXfgH4LxjZrmO1MoT8/ayA1G92ZKkBnXQzPLZCF/4J/O+vtg
	WVYTq+V0ifgH306nmL9nQTydi80UxpdVoGIQT0n0/sJg+IIfMY+0HLQsfVzEVq7ohKGYjORksni
	/bM89mvcMibuEb7XMSaaNqzIOeBiZ/AzJl3eifXpGtVgReu6546hdjhfFpfDskxrqm2XTnkpy7g
	QwdUms4hXoZ4HQSgUzx5XrUwlXgyWCToxr2uSfwkrg3/Y41fZ+4grOKQ==
X-Gm-Gg: ASbGnctgkuiyWMRjxcT4gkvn53Kihnix4CEsBD6yPE5xLpV98v4ooGQtNrqs+CLxe/8
	qOfmSXlMrisECg6/Mty8823AX5rxb/PG60gw9XCvkbeeYqUH/XLLN1taDSGyTOrjz7EaPExKHs7
	0jCxuct0zTKsBl3+fiYsxCiVoXj5b/wSOMgTqSlg383B2utoRcZbKkqLrssThQhCWrVfC1BnEvs
	nfFTtGfcbmd/hvGiz/H+tP2Zl6UkFQpiLGOKC4mpjxPBfEta+QhXJV002ihdTkSI4CWLvMx1tJY
	u77cz+dAfO1gJmTgPh9Hx5bh4bqzh4LFbQ2MZOwfcflhDD7+vM30IgSSR/6xzwisv3k/+qQtuhF
	5WnN40fjpeFUzDfbM1eKg+OS6ZTHhW+OZTijAizeF9kfv1zI=
X-Google-Smtp-Source: AGHT+IGivZFPFPzW1Y0xHFAzHWigwBBM7hrOPh0kOunR018h5MC0eYM6/JsRROzyy3EA0Bl2wPrWmg==
X-Received: by 2002:a17:902:d485:b0:242:c66f:9f75 with SMTP id d9443c01a7336-2446d9827b2mr21825175ad.55.1755252092619;
        Fri, 15 Aug 2025 03:01:32 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5a7a40sm879220a12.9.2025.08.15.03.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 03:01:32 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH 4/7] lib: sbi_init: print total and reserved PMP counts
Date: Fri, 15 Aug 2025 18:01:12 +0800
Message-ID: <20250815100116.27776-5-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250815100116.27776-1-peter.lin@sifive.com>
References: <20250815100116.27776-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_030133_699909_C8D8BF9D 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: greentime.hu@sifive.com, Yu-Chien Peter Lin <peter.lin@sifive.com>, zong.li@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Show both total and reserved PMP counts in boot log.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_init.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 84a63748..367476f0 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -163,6 +163,7 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	int xlen;
 	char str[256];
 	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
 		return;
@@ -183,8 +184,9 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	sbi_printf("Boot HART Base ISA          : %s\n", str);
 	sbi_hart_get_extensions_str(scratch, str, sizeof(str));
 	sbi_printf("Boot HART ISA Extensions    : %s\n", str);
-	sbi_printf("Boot HART PMP Count         : %d\n",
-		   sbi_hart_pmp_count(scratch));
+	sbi_printf("Boot HART PMP Count         : "
+		   "%d (total), %d (reserved)\n",
+		   sbi_hart_pmp_count(scratch), plat->reserved_pmp_count);
 	sbi_printf("Boot HART PMP Granularity   : %u bits\n",
 		   sbi_hart_pmp_log2gran(scratch));
 	sbi_printf("Boot HART PMP Address Bits  : %d\n",
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
