Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B41CCF9EE
	for <opensbi@archiver.kernel.org>; Sat, 25 Oct 2025 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJN0Stof7Uk3jLjnikAvAJegHLtKrMB8fwG6wJJrQSU=; b=bzVQwfwTDMnLFD
	kOvMFmy54y2hgH360ys+wfX76hewzHm9F3Wudszn/+urpEhJCLUriF3aVNxqPhnXp4PEAWO0xU1If
	DNNZosZpYJu9X6pF/Gt8JvMXhjca46sixiW9mAd9Wim6NAmYzxw21G/pX9FDSgwkZ4nGBfS5WgBNH
	lAUepFwyWlLS4yF6GQb9/yVvprqzECl/7+GsC8bBxc4hi/MzxcP8yeJLAL4VHzugxgx9klkpxW4Hg
	Qko12/E0gtXxPz6wTUG9N0Fp6bkOjrUQlJ7GgQj9cexcdglAQSL+h+Z9kz1sZFGfI+6NbWcFRZRnK
	GoymfyRTGtzjfGDWzNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaQ3-0000000B9nJ-1FmM;
	Sat, 25 Oct 2025 09:18:39 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaQ0-0000000B9lj-0FGp
	for opensbi@lists.infradead.org;
	Sat, 25 Oct 2025 09:18:37 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7a27bf4fbcbso2362047b3a.1
        for <opensbi@lists.infradead.org>; Sat, 25 Oct 2025 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1761383915; x=1761988715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7zvoEkpT+lFYmuIhYVozNoWrQ0LxVPu0FbpLb2nuic=;
        b=PmAerO8+lwCStDIIHnsSCBRIv/29njjmP3NB4jx58Exi1efOVm4Mhyk+2M4EHVWBGG
         eV4o9rQIAPT6QkBnGe+IwNc9SbExmGlvIVEZodqF6EG2EeRqLURMmkJEDFdUU/pl6IbF
         K+dImX3tDaXEssbIIYWQ1x9B14WCumfeOoCNgTVlT1PllG/trOY0vtye//tCJVtCf2CA
         II2iuD0aiksPMptmfulQ00AStKAcH5q3VCVC5gtLwwYb+CLa09RtDdqV1S2jlHVPUpWD
         s90feqdQKCs7AZRyImIJWwYuYdQI0YGk8OesQr+97mMuJGIyjFw9zF+MatU+np7djWA4
         kr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761383915; x=1761988715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7zvoEkpT+lFYmuIhYVozNoWrQ0LxVPu0FbpLb2nuic=;
        b=BiTQPETklizHOqg5so1ShAgXCJrGZB2GvNdnB7nLW9x3PP57RuSkIiTyGJbk8pWIrA
         a24zAgEmLpxxZOt2RN4QlMmN+dWDawgjMsklNWe/bSRbmzTtMjf4aMmFTrVAwD4PBBz7
         bPHxX61GZym1a8bVcTxoY3iFwoVnuvHkFcy4si6q6qi4Wra6Dbx5HDD/0mEqn00L8bfN
         VWXbrT9nIKLtu4Ho7VaOAWH0orS9QTQaa5ce6LAnf8RwjluOnEneoLHzl+gzi3hN7oEz
         /xacgJ+NJQ6PXGnpm4RugV5G59PzijW5+FiGIJ77YiIpMQ/LJXUpqg00Sjexsgpite8c
         M4Qw==
X-Gm-Message-State: AOJu0YwQrCyzKwbhecYjk1yRgitDN3cJq2LERDcDQ0E2+7XxhwBrKpad
	uijONd9kwmDdedNJpCPLKK0U1VkFt8zAvBc5koC6SbzTg9oA6QDsNnAEgOZE0YQd02KdvK8oq4Y
	PXS7N/JH5WhDY+TUx+eWDML6UXVXMXJoKBpZNV59mwtI/742Beqx5RyL8RENjQBTYLxkHt4amMq
	sbCQ054zi2nfJlGFxc3xwcUlggFGCnuIFReBXWDqag3nQxBa35
X-Gm-Gg: ASbGncvXC9lkF7/llV+K8baunk/8wjRtE+kBb4H95Y69EvT2CP7NzgIGWyAJmcdbect
	bHIHVblm5/BZnLwToqJNZlb+uh6wMmmCAjAwimbCgTxi068HJqbEnVQBbFZVVyIJyS1GbtFBt0M
	chwmuQgaLZOXWKpbQ1JP06DKyFIjg/gR/bkSbXJvW7bAMx52OWbyztZKb3W7ould4O+9L2LibVS
	wVHjzWyY9lIdfb4j1wd1IxEmd5Q0BudV6fX4GfreLWB8WyYe6Q/Bj01i3bKaPTnFmh1GUSCQh/k
	G8Fx0oqjiUPVDvXVlqgJxDOh+6ghDmvXB1VVGfdGUgfdMO3z1hZkmmigpTjr9oTMrdpktQiB1/Y
	vCKB0bxBB71BMI4HITsWI/volULoe5rbXxHPz/To5MuKuG9gOqinO4UBJRepyeijAEfSjeMAhgj
	GM7vSt+dWDLnr+sQ9E/os8/meTSASzWhurs+s=
X-Google-Smtp-Source: AGHT+IEF6Ttnyhp2PjkuQdqb4IZjF1vutSf2i0d/TLQdgN/K54FbIDuGxf0kCVfM9X3vexaZksCG7w==
X-Received: by 2002:a05:6a20:a121:b0:341:5d9f:800a with SMTP id adf61e73a8af0-3415d9f8633mr1452249637.11.1761383914982;
        Sat, 25 Oct 2025 02:18:34 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049f20sm1702700b3a.29.2025.10.25.02.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 02:18:34 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v2 4/7] lib: sbi_init: print total and reserved PMP counts
Date: Sat, 25 Oct 2025 17:18:08 +0800
Message-ID: <20251025091811.506511-5-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251025091811.506511-1-peter.lin@sifive.com>
References: <20251025091811.506511-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_021836_099867_2E331E08 
X-CRM114-Status: UNSURE (   8.31  )
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
 lib/sbi/sbi_init.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 663b486b..bc87bee8 100644
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
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
