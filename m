Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ABAC83F26
	for <opensbi@archiver.kernel.org>; Tue, 29 Jul 2025 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JkOutfHucdQ5rM2CZ9x3J8D+1M0hXbE48Jk22vFWEOA=; b=zPpiKOZxvTRvZL
	cs4BQzSNJ7jcXoY2Wpv+1c83p/kQ2w8qrzgN7ty8WcRYTvL0oQR6D+TKH5z4hIyR7Qhsk+iL6je6O
	gwUP1QCv0dEbfYY0IAYQfpcdYD8FvfX/xC6njrj2BxHPuOIL5WWetHPKZDFgGdNGPO+/0FwFvsH8c
	lKlXiaLxDfE71rhSONvEZI7wJXtx6hjxceKZ+BrRRkuX4WEoKLPBWlG0wYjs2xYzUn2kKWUDUS7hg
	MIf5oOwFt/0DUkXqS9enhZj0G+mMx8XTwCEmH/pNC8puGsJ+mXJg9ibDV7+7ULu+LdrEWs6+Ro+AQ
	JGivYHsZmf9ELyAlufbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoFI-0000000HNC4-0UvX;
	Tue, 29 Jul 2025 17:36:12 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoFA-0000000HNBe-45ua
	for opensbi@lists.infradead.org;
	Tue, 29 Jul 2025 17:36:10 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b31d489a76dso6073621a12.1
        for <opensbi@lists.infradead.org>; Tue, 29 Jul 2025 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753810564; x=1754415364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VaZhizKmtxxu5oj1LiWa1PcGsXGbSHfMMC7ovn975AU=;
        b=nUG+65t4wM0KSTm40mXgl01JQ1qZnszUaSwpio8KsJCPazBcTovDRKW73A1PcWC1YL
         s2S89rr8nHMprgTFL9PP4/6YSIUmCe2z1Lgd+wTzhTVxXffzQnna6cE+ds638my8m5RB
         eismpyFJ/MPk0wCVYrBR08JfVGh+S+m38RbYic/U04FIoiSAOZ4b63PiKX7UQ9Tit1S6
         39oN0iUidOX1FtgI0EBlfEP9z/R+sjzheO/wrU7ys++WKBJvFh3OCutfwX1lgth0+l8F
         MpOESmxwa/zFOrRnV16mm5ALkYMn69jTn120slsTcc4PwamFwpRvaa3SXunwIWrJD0sG
         fSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753810564; x=1754415364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaZhizKmtxxu5oj1LiWa1PcGsXGbSHfMMC7ovn975AU=;
        b=AiAvJT4J1TXQ+k2HMwGLKNGkp8r2hQnFBbAup911qqCxEHCwTQMj3YO8yUaKSnRKIx
         eXZaiW3NJYJ22sZi3PnPQPAbNA3FozsofXwcjKvmNEDHWc4Reia0o9zTT6BDGkr5tuK6
         ZSz3gV7js/AMlBlJ/B3L2hqUS3l+hPL/aha8QiK/KduR7kydp4oMO4Vuj7PEWJmrMwSn
         r27O5ocVJcJFtghdyr+5sEI9wrYF04jVroS72G3gcwJOOU05nG7dVuqrKpVEVeSlqROv
         TYyqb5y9ObTPHRENAQ/I0terHdk1NkYNj8H9gchptMEnY4aWmMYGMNUiKApsVxxLrueo
         ua2Q==
X-Gm-Message-State: AOJu0YwGqvcC72lP8HA1zQs7eBig1h3LQyc1vukbVC9htry/I+m73RJw
	ra1FTDWVNbwgPMi9pPLTrqbC9dW9jOxPb11Oz4hmyoabYNqjlPo1z63Jv3FGttvKCBQcPdF6wKq
	CEW0T
X-Gm-Gg: ASbGncsJ3NaVXfej5dCg6Xjd9f7u894bhxOthb0xpzdFgAwXn+zVRRKvUW3ynC4A7pm
	XohsyhBVJcN/d4bF0pLBJoPnHVG9ByT34aGCb/+R64g2yQvFxe1Ugy9uVJHUECtkgALLfE0NSyj
	tFy2HTAV+uhZRW3GF/c5FQrLtdj9zbFJdwa2y6EgfkxSJRCqAleqsGgQzBz1xMAjEPBjUxbDqeM
	qcjDcnb3JGe/bMml6eYLMH1WI4esvSIX6jRCZN45jsuq8KfCwWPBIVAwPVxaGhhyoTOIChR3UCK
	pDZ1c1IaoL97ZMVxKTVqfx8pSYFCoElxUag53NDSnmbuogu2ltnqd3sQr9JM41EMyeTK08oigK+
	J2yX76gSAlFj9/0ObejjOOK/LHRVFWw1au9k=
X-Google-Smtp-Source: AGHT+IGXvdlZ6VoVF+Sai9hpxvcYsj2X2AXTXLJSIF+YsLAuHT5eOlLc0CTZx9UcTk8SL1+CvRMhdg==
X-Received: by 2002:a17:90b:288b:b0:31e:fac5:5d3f with SMTP id 98e67ed59e1d1-31f5de54b78mr468294a91.16.1753810563599;
        Tue, 29 Jul 2025 10:36:03 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66270f48sm12602908a91.10.2025.07.29.10.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 10:36:03 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>
Subject: [PATCH] Clarify sbi_debug_read_triggers return values
Date: Tue, 29 Jul 2025 10:36:01 -0700
Message-ID: <20250729173601.2098669-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_103605_251403_3C153CF6 
X-CRM114-Status: UNSURE (   9.71  )
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

Clarify that `sbi_debug_read_triggers` must read the configuration
from CSRs.

Closes: #213
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 src/ext-debug-triggers.adoc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/ext-debug-triggers.adoc b/src/ext-debug-triggers.adoc
index 2a5bcf9..3fd9093 100644
--- a/src/ext-debug-triggers.adoc
+++ b/src/ext-debug-triggers.adoc
@@ -133,8 +133,9 @@ struct sbiret sbi_debug_read_triggers(unsigned long trig_idx_base,
                                       unsigned long trig_count)
 ----
 
-Read the debug trigger state and configuration into shared memory for a range of debug
-triggers specified by the `trig_idx_base` and `trig_count` parameters on the calling hart.
+Read the saved debug trigger software state and read the current configuration
+from their respective CSRs into shared memory for a range of debug triggers
+specified by the `trig_idx_base` and `trig_count` parameters on the calling hart.
 
 For each debug trigger with index `trig_idx_base + i` where `-1 < i < trig_count`, the
 debug trigger state and configuration consisting of four XLEN-bit words are written in
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
