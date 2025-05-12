Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81571C3ABBC
	for <opensbi@archiver.kernel.org>; Mon, 12 May 2025 09:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VwP+3pNO5A1IW3S0ZJPGCjGpNbf5N2i46VXGiQEDWuU=; b=r64xHFV6SK5mo5
	YDgWge/AoTSRwdJH9CLzUGB9vzpO4qy1OkSGqfx2PlPQX0YPwVKRg7OM0Uq19g0uTAkp8uTGnqZ/i
	29hQl6VhA4RAS2EmD+YRpYfpPN2oF+qgM+OttTFCcczFhhPcROwChy/BnmxFTAi2yheKqd1PZZYTl
	F1MpTXGUy4a1pWfGkIXjmx4wG+SlA/RS/NER4PKcDsMP3J4e5UfWSNsGSBRrPHtyUobmIJe/zHqiP
	8pE7mIfIwUVfth8+cSB9agsVM21AKcn4sp9Os/hv5y2V/mP+IWd/p3PgyicIeVkvB1AkAoOY5O+Iv
	5VSI1LIuL19wYLhTHYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPJ1-00000008tXJ-0r92;
	Mon, 12 May 2025 09:18:39 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPIy-00000008tWc-3dEs
	for opensbi@lists.infradead.org;
	Mon, 12 May 2025 09:18:38 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so3847213a91.3
        for <opensbi@lists.infradead.org>; Mon, 12 May 2025 02:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747041515; x=1747646315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PIBwFT0hiJoDMggsd0b3IKCrDfHiIXxJgZRPJ4LGieg=;
        b=BwA6T06wHDw+0wka2ltjmTCXZXGl6mqyjnS2RgqAw/jukZd71P8MnVpsC6b3Ggd94A
         sqJly44eLmUj8jzgXnBvZd6jR8HEH25pm042FIqZhZgo5k77QGZdj5uVMkrM4ZFu1RpM
         /ji97Pfh310k7E9Awp3Nu1MnqMBjJqB66CmcL1ysB+RBezpmftNeggY8N+sesJAVRgqR
         KiciPYTLSFox73SeP+iGG/6MvXtsA8NP9iYztjv5iY+a+wdUOlykC4MnL8BbDI2tvsBE
         mpZluLNj46ZHYp/HcKPXzDrbVKxUCvTXWc56O2LIg6n/xANi2+1PpEzoEx1w3dixYar6
         VrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747041515; x=1747646315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIBwFT0hiJoDMggsd0b3IKCrDfHiIXxJgZRPJ4LGieg=;
        b=g95H3V28QLJDZOg5oL4akRlLDke3KIMM+WIKv0BMJl60KiLxSUhoHiU8ZkwAlznbTA
         f6N/5Tkz8RI6s766/CaHRK2KpkzA+fgltZKwH+Ozjbe5kUGKGvcQRFdA4/AzD+odUBur
         B43L/JNP57PMX6r37EVWJHUuGUiT7RbZiLof+qk3rhrkUbXZeed1HC7+bj0WZApS1UEx
         wz1lyy3kKyDkuKMtGkpEEnPVxDzttx/8tabIiHgJus9JSxJ4z0QMqRSbjuz8eeLXdNhS
         cjoa/ou3M5ALFrmaj1sZUHxAJMJIc/PTkeDc21ePHO1QSUYTggZT9TrlGGrl2XlXT/78
         h8gA==
X-Gm-Message-State: AOJu0YzORzupbWsFZe59mM436YwJdhm7vNezMc6PPJH1trwazUhMohCk
	ESXR6Q00RHSK4+LIAcea8xwOq2P7k5vLlb7qLLrumLZCQfBjWmLDW94kst9V
X-Gm-Gg: ASbGncujT99lX0GZkRsNe7Z9PiN3Q+jvl4monaC+CbCiK92e4jJXi3d5GLtsAwNt+E3
	59xRhZwxG5m0+xnus9VE5uWdvjT/ZBjWJiBjs44/O7Gk7b9uVAn5jyb4Tdely2X0f7TVyLQb5DJ
	MI7ArPenF/ixrUlFuKNydvnVxoySg4CRkGxTM6uG41wBfgbctEUIQcUBCUtaIH0gUYy1MG3HaTc
	2EDFTQ4V+FGRVG8c2+OXkuaCvRx9Io4IfFYixDCJp2Rv3qZfPV1p1N6MoOzXoNd9x+5hFcjJF6s
	DgvBiw/6Hgitv/Q6RrrOkXmfgAyPZxjqrhMkuvvRNCORcg7oUZE3shi7prp0c/fS46GimfX6Jgp
	SV8mO
X-Google-Smtp-Source: AGHT+IE7h51xtC5sKG0DCWHVmEhbVyiOz9gXVdVtPndYtst/k2GuHJ6GmndC4jTtIudW49OzvA+gSg==
X-Received: by 2002:a17:90b:5103:b0:305:5f28:2d5c with SMTP id 98e67ed59e1d1-30c3d3e8415mr21143105a91.15.1747041515143;
        Mon, 12 May 2025 02:18:35 -0700 (PDT)
Received: from JRT-PC.. (bb121-6-174-130.singnet.com.sg. [121.6.174.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dd4359sm6216146a91.16.2025.05.12.02.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 02:18:34 -0700 (PDT)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [PATCH v2] lib: sbi: pmu: Return SBI_EINVAL if cidx_mask is 0 in ctr_cfg_match
Date: Mon, 12 May 2025 17:18:29 +0800
Message-ID: <20250512091829.76556-1-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_021836_909417_7B1D685B 
X-CRM114-Status: GOOD (  13.53  )
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

Currently, when configuring a matching programmable HPM counter with
Sscofpmf being present, cidx_base > 2, and cidx_mask == 0 to monitor
either the CPU_CYCLES or INSTRUCTIONS hardware event, ctr_cfg_match will
succeed but it will configure the corresponding fixed counter instead of
the counter specified by the cidx_base parameter.

During counter configuration, the following issues may arise:
- If the CLEAR_VALUE flag is set, the corresponding fixed counter will
be reset, which could be considered unexpected behavior.

- If the AUTO_START flag is set, ctr_start_hw will silently start the
fixed counter, even though it has already started. From the supervisor's
perspective, nothing has changed, which could be confusing. The
supervisor will not see the SBI_ERR_ALREADY_STARTED error code since
ctr_cfg_match does not return the error code of ctr_start_hw.

The only way to detect these issues is to check the counter_idx return
value of ctr_cfg_match and compare it with cidx_base.

Fix these issues by returning the SBI_ERR_INVALID_PARAM error code if
the cidx_mask parameter value being passed in is 0 since an invalid
parameter should not lead to a successful ctr_cfg_match but with
unexpected side effects. This also aligns OpenSBI's behavior with KVM's.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/sbi/sbi_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 5983a78..62ce770 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -840,7 +840,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 	u32 event_code;
 
 	/* Do a basic sanity check of counter base & mask */
-	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
+	if (!cidx_mask || ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs))
 		return SBI_EINVAL;
 
 	event_type = pmu_event_validate(phs, event_idx, event_data);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
