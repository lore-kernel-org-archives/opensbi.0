Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26266106FD7E
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBBpF1igoYfhPuYGK1YiAj4O+Irarop6ZLDuZV24ly0=; b=t2wUQbzG/wo7in
	xKx4URrVc5BdxvzPCz/pgsskExJGTtxDpYLQE6cl7THfkgnh+P6PXFIsd732ZbgIj/tVxWMPE1AFB
	4xabEn7hJXahicpg4F9/VoNngB9n7tQ34I3DVcROboTYS2f63UreOgkzEnzh5up3i89uGe0Ls4Tyc
	h6ISYLZKBXFd8PDyjJ1vVFHSBh1ZgVXDf4rTxVp6adSNAMzvTKP2KTG+mWevV/ejipw9En4MrouAN
	HdMLQ8x3wjQSMZftu8Knh+dKpeH537pwi/uxss2B9b0QpkbXOSahPmxPlpGjQr5BOoj0H96qpqzoU
	B4k5mpGv045gDR7TY/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwi-0000000Gc0V-2RFQ;
	Fri, 13 Mar 2026 05:20:24 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwe-0000000GbyL-3ZmG
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:22 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35a08ce49dcso1659173a91.2
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379219; x=1773984019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvXMAp1lDoCzDPzTZBRMvBtydQpkBRyZipL/w7ClPlM=;
        b=DUr2LX6NhXZM/EKw7SAaOYXFx8NKEqJS6Q/RFpoDT/aLvip92DAqIY+pfXcaT7gUJe
         Hwj8qxIRKBVPjuTueGZ4OVxLQzTUUsgabWYxWUTmpLKcjFgkZ25F1OcCMVKCiqt43TQd
         NXfRuo37vIePcNhd/fKAklelhrxUZ+5nQA+knpwQ3Y52Y4g3OktCjo0VSULo+Wm8+Dxi
         QmBn49XqnpApIVVnZ1d2dk7rXIGpqgs2TWuarYdrUHdG6kmbJydMcvd4kzfelR+9ul+h
         tjyBBfVSRg6oaLY8ZTVntE0zoVlPBtTpZQYKFhf/1L9q0hME4ne50nfm9JyKUx/VGmFB
         9F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379219; x=1773984019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EvXMAp1lDoCzDPzTZBRMvBtydQpkBRyZipL/w7ClPlM=;
        b=XbuhNfkRPwcSotJxu4/cFtqnJ5eKVTtSnH9NFcmLUhw3AOGDUMxNYXm7LR8QqWCVpX
         Q9yNsmBg0YkGVyqAGeCV/Z6xrKKcuGbeP7r1tvUR/sldqBdC2ZzNSsrPb9S8OR61VgJG
         rxk/dk+QWFemLB6kljTDITviIa0mulN3iunOhjky5vdkdltiQw39Ig73JELp1Pezf4uA
         PRoQNhfYgmfnozx2EtSw1BML3f+Cfo3Yp955ZWihojPaWmgbn4qfZUA7WOqga1iSlHwy
         8bshp5iIFj8VVMXyHbDINJWdMHfeazvkKZudi+HGC29oiK7QlrpU35RM7o64/n2STDm7
         0nMA==
X-Gm-Message-State: AOJu0Yzko1vBR5hPPAbPiz8XrfM4HTVOgZzB3UEhCp7egZc9JEQ56aBK
	3ImEpRIfk63nJFf2KKy5+60nwSouSxBvGV3oEoTlBA3LtG9yefWplA9noI/QOw==
X-Gm-Gg: ATEYQzxRPZ1d1f3nvqVB6hbmTU1AL7b8P7AMubjRaUzhKSsy6fHoGKwHP33z0rrAlNc
	MiIiWxABWWIbjXh2CTmYRJu5YfPzJyGDhP+A8tHVmMcXmdAeczgVmHP4HVg2PYVdshneOYLbMd/
	Qa3kmKznSnD9px6Zw6wCyJcnUBXScIp5l1SJTf3iTRzk3UnNfM1i+XV0rz2a9jafL/ZPzCSetOk
	9nFM2uHEd3A95aOlpsTQXQ2+w7baZcu2puZeNqbUQ8xjukVWdayeNk71nlcNP6nFiJhMtE4YqMr
	i2GNX3kD3Y1WAYqnVrOnE2XbyAbSMVASCIUGLyFs9S8u98OXVjHC5kxhmGw4LXW+SmWWFtclFsG
	DIzpXPtZnCOYBQxWDHLDHbNyYi+L+jhdoEkabyQHQH4DoSFfJvonAtA02yvugTOinytA0yuvxpJ
	6JNJEL/ehZxIRgFPO349QTr6c48CU0x8+LddqxBpR5hN2YFtSVqCrw3YPHlTKI0rPje2CM
X-Received: by 2002:a17:90b:1d8f:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-35a220ba921mr1818686a91.28.1773379219192;
        Thu, 12 Mar 2026 22:20:19 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 02/18] dbtr: Trigger update should set sbiret.value on failure
Date: Fri, 13 Mar 2026 15:19:31 +1000
Message-ID: <20260313051948.4017134-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222021_357117_A337A9CC 
X-CRM114-Status: GOOD (  11.31  )
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

According to RISC-V SBI specification, trigger updates should return the
value of the problem trigger index on failure.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/sbi/sbi_dbtr.h   | 2 +-
 lib/sbi/sbi_dbtr.c       | 4 +++-
 lib/sbi/sbi_ecall_dbtr.c | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
index 5e0bf84e..b8b5c9ab 100644
--- a/include/sbi/sbi_dbtr.h
+++ b/include/sbi/sbi_dbtr.h
@@ -115,7 +115,7 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
 int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 			 unsigned long trig_idx_mask);
 int sbi_dbtr_update_trig(unsigned long smode,
-			 unsigned long trig_count);
+			 unsigned long trig_count, unsigned long *out);
 int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
 			  unsigned long trig_idx_mask);
 
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index b0160163..8f59e407 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -714,7 +714,7 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 }
 
 int sbi_dbtr_update_trig(unsigned long smode,
-			 unsigned long trig_count)
+			 unsigned long trig_count, unsigned long *out)
 {
 	unsigned long trig_idx;
 	struct sbi_dbtr_trigger *trig;
@@ -740,6 +740,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 
 		if (trig_idx >= hs->total_trigs) {
 			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+			*out = _idx;
 			return SBI_ERR_INVALID_PARAM;
 		}
 
@@ -747,6 +748,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 
 		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
 			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+			*out = _idx;
 			return SBI_ERR_FAILED;
 		}
 
diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
index 40a437ee..f3196feb 100644
--- a/lib/sbi/sbi_ecall_dbtr.c
+++ b/lib/sbi/sbi_ecall_dbtr.c
@@ -43,7 +43,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_dbtr_enable_trig(regs->a0, regs->a1);
 		break;
 	case SBI_EXT_DBTR_TRIGGER_UPDATE:
-		ret = sbi_dbtr_update_trig(smode, regs->a0);
+		ret = sbi_dbtr_update_trig(smode, regs->a0, &out->value);
 		break;
 	case SBI_EXT_DBTR_TRIGGER_DISABLE:
 		ret = sbi_dbtr_disable_trig(regs->a0, regs->a1);
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
