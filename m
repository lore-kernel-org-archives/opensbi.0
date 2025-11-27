Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FC0D116EA
	for <opensbi@archiver.kernel.org>; Thu, 27 Nov 2025 11:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0a4MWonPl+xnOBAvB3lxdvbrkeE+Ju9Tmqj2jHl3vCw=; b=ehZKzYzaD84LrP
	LCxr7DAtcZiR7+7PROGzMaaIKoIj7rMzk1LhinhHpFg24g9/nEBKt63OPXsF3h8g5dDvVXyWdhKqD
	siGXDLMb6P12jysg/nBP59bcQdk65UkTr3xIyA/nVQADmxRpOP4bUDJOIIHeZ0j35HMTdk4MZIjxX
	lCSG1XEQVQ6ukP/XdNEFegYTn3vOGyXodS+xZ30jFKMA0XvDaibdjBEF58k5k7sFOpiC7nGAlv+Uj
	oEDLfQ9baKFTw8djU7jrVBWYNfGWNQLjm1Tp+l7bFMGeootAhqL0WFBw4llrjFy+7Lw2Uwh6keNFb
	PWX9AdF7jECxIYiHgMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOa4E-0000000GRng-1n9D;
	Thu, 27 Nov 2025 11:21:42 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOa4C-0000000GRmq-2V5R
	for opensbi@lists.infradead.org;
	Thu, 27 Nov 2025 11:21:41 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29558061c68so10697755ad.0
        for <opensbi@lists.infradead.org>; Thu, 27 Nov 2025 03:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764242500; x=1764847300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSuWCCNaBBQN5d+PiGRxMZNhJaccHTwC/uwm54t0YBs=;
        b=SSDzsYk8SHNWp4JdlXmCMl1ZMHKLFWtjLQB5k57UQbCXg8lltZkFraacp1Y74QUVHJ
         5hsww8Nofm1dnVYBJHPGd7kG4+6p8Z3XVg3RlJGSnyPiVk12fWtXUB901P1LW8YirwDi
         bDjUaqQA6B5IIpZOJ4ZvhA/9DHhJ0fkQnfmf3x6qia9ojGQrHbixEBzVaOvzoyMYMw2o
         UTYDAbR6nJ15mRmaCzAdpMvn7Oq09AjLZhte8pzjLYHuXTwM8GbOy6YCWfhSLWic1bZN
         m1FxGQxxnziSyHY6uYcXPa3oi8UVpnwOBddhZvqwfL3RK70Cdg9fjjw7tubbr7DE8URj
         tUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764242500; x=1764847300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nSuWCCNaBBQN5d+PiGRxMZNhJaccHTwC/uwm54t0YBs=;
        b=kcjx5Izt3VZR0l5JUNiOF7DTLiL9n+pBFbCU31NnmcVGEznuFqRU15NaqJLb0YTkQB
         tcCOq3TYeg9Ob52YGYrt9j1SuT9NrYSHje6cmkKogKKZF+OEbAcnxvt0AMxrFmoqFBzx
         SWXJiBn0cuLBbVRLd0syM/m9Sgug/Ehfi1LNIJT0k3iPI8CvyAGFlmHsDJKAj+F8Yw3+
         RrRFNCxxTSyJC5SsSxe0jnc4Uh0QN4FMTk8HZKVun9Fox8BFW8RAAtLXd46Z2wr7Z4ID
         cwodzXLqk0RgZHbDaF88/zh/sg4AyWMOHZCvxhRKfr6qwQuTVWnxfG9FUvz7VKQog0Xv
         pUxw==
X-Forwarded-Encrypted: i=1; AJvYcCWlWlUJiSLazx7SIrTY96ZSKWZjbEYJu9bO0C/H7y4sOMUeGLVEJLJe5XgNRlsIdp8qbnDSTWpz@lists.infradead.org
X-Gm-Message-State: AOJu0YxhDKEf1MdF9dzO/7O5PukxQHlhqPn4Ae+C3BhKtsncctQ7bJKB
	TYOx3KmOCLJF0pSf/8qAP1d5TOtWL0L5CZ6zjEK3mpOIRtLDSkhbSFnTrvmPM6PqSHE=
X-Gm-Gg: ASbGncvVlC7nJiofNmqJ/87xuozcLPTS5AjidII8Z5TzhuNUTo8Epu8Io3bj7sgXERH
	3wTUnkvMC3zH6y7MBTfs90rGKb5RxiWXmnPnlbYBknWXAAld2Ooy2sB9HzsE7dAFUxPfAkFrpP3
	HmRLND4krA6IfM2fuicQShLi1yutnWJG7uxdAD7KSMlyx6Seh1SjECCrXyHaNIxKOcM60/N3QPf
	Jmhf9Gc9hmOCiV3b0ryKatYT3zcILR2So/mSr2Cmj7CPzdSupJu3EqWXh4pWm8dNn2w+pBteOT0
	B07wWibERkGuDmxWj8WbTk/tbQ8id9i0mlzxUVcY2Ta1ivL/gqYE8b1gcmnTyia1Rf8zGb6/2zB
	J1DCNa0mEf6G+3VPBQ2fKxRsx4o7pmudCYmVpHw35CfQ/qtih+caANNnc2OP4MfG0qC9gg5uBEh
	PVxnk95q4LhODfHJ+RAbZJKrWu9EBxHObnSXwIYMttmQ==
X-Google-Smtp-Source: AGHT+IHA3kQdaJQmDSbXii7Z+jNEncddlyOVsJ/0s1mdRBEFQ6cHfxLKXKNMT/9l3iIN45ZxbjeN8g==
X-Received: by 2002:a17:903:11c5:b0:298:1422:510d with SMTP id d9443c01a7336-29b6bf7c9e5mr247990905ad.48.1764242499617;
        Thu, 27 Nov 2025 03:21:39 -0800 (PST)
Received: from localhost.localdomain ([122.171.21.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb27598sm15194125ad.62.2025.11.27.03.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 03:21:39 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Andrew Waterman <andrew@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/2] lib: sbi: Flush TLBs upon FWFT ADUE change
Date: Thu, 27 Nov 2025 16:51:21 +0530
Message-ID: <20251127112121.334023-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251127112121.334023-1-apatel@ventanamicro.com>
References: <20251127112121.334023-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_032140_737800_F0D090BF 
X-CRM114-Status: GOOD (  12.25  )
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

From: Andrew Waterman <andrew@sifive.com>

A clarification has been added to the RISC-V privileged specification
regarding synchronization requirements when xenvcfg.ADUE changes.
(Refer, the following commit in the RISC-V Privileged ISA spec
https://github.com/riscv/riscv-isa-manual/commit/4e540263db8ae3a27d132a1752cc0fad222facd8)

As-per these requirements, the SBI FWFT ADUE implementation must
flush TLBs upon changes in ADUE state on a hart.

Signed-off-by: Andrew Waterman <andrew@sifive.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_fwft.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index a2aefb9a..373140b7 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -13,8 +13,10 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_hfence.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
+#include <sbi/sbi_tlb.h>
 #include <sbi/sbi_types.h>
 
 #include <sbi/riscv_asm.h>
@@ -167,7 +169,16 @@ static int fwft_adue_supported(struct fwft_config *conf)
 
 static int fwft_set_adue(struct fwft_config *conf, unsigned long value)
 {
-	return fwft_menvcfg_set_bit(value, ENVCFG_ADUE_SHIFT);
+	int res = fwft_menvcfg_set_bit(value, ENVCFG_ADUE_SHIFT);
+
+	if (res == SBI_OK) {
+		__sbi_sfence_vma_all();
+
+		if (misa_extension('H'))
+			__sbi_hfence_gvma_all();
+	}
+
+	return res;
 }
 
 static int fwft_get_adue(struct fwft_config *conf, unsigned long *value)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
