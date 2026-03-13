Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20649106FD7E
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SY3HHO7TBFT/3fey6wfuMcNxg0fYGSj/jk8kb6DWnpU=; b=1vHIPmy8yVIZFx
	p+ki3kwywvYI2tqhAEDb/bPQYfBXwHW7zsuujIzmNwpmAksYk47E/ZUmEV3VMouDuqs+v3Qmv0T/V
	yzrAOIW9e1znNg4zoX/YUpHKtPX0FQpZQC5ZFQCQ1uoAUidcXX3lgb8kZh+3rtTklguSozm/s7ZZZ
	Wfd6hvFJ/Wru5xyb0mpPq7NRGzI4niakVcLtq6Y63xAvDZseBz8pRkx9s9A7xKBpMaOr0PJrY+6An
	woNA6jFOqba5es53yK2GFqROS22Imo3AuJih5JVLxrCvxWspCP414puku3ufuSYsQ/80bGk+HmNy3
	VaMC4yukf8xKxDreX+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxf-0000000GctV-31FF;
	Fri, 13 Mar 2026 05:21:23 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxa-0000000Gcom-0MNi
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:21:21 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3598cab697eso1254502a91.1
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379277; x=1773984077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ac5hGA+MDodYCrqo/gPoxGEApxaRW30OOA7CBlGJNhg=;
        b=MZn5XI4t6qkHNdzo2wBC1BL+SVbzDX+2XaFSNjZ95USH/hxV1L+q3ztUQCDCajSEUq
         XSQ7HlJ5K2ssROlB2dxhNDQ4JQsrMAE3JmRqs88KTXgsZjD9YJ0ev7P5eG+oa0NvRlnR
         QMsckgr3+YtMrIgZHe1V4OXMqWPkAWf60k/mAfcOVYMEK8OiasAowboRVBc1Tqwaggd2
         4SjrWcxLIor2hZ0c0EceBXqx+eAM1eGKJwEDNl1+g/AxQbFAnp4CfQ0YxVDkJcDPU5mQ
         Ln6ehbN9jHOReEBg7AMHQP9tXr6qQur6hvX3TJnlhTo0OfPcEMsA1l6casDuSX0yZQDH
         el+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379277; x=1773984077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ac5hGA+MDodYCrqo/gPoxGEApxaRW30OOA7CBlGJNhg=;
        b=oNhlRVJbS4YCLoZ43vdV65SAJpM5EE4qf0t8FRJjTAKqmCDI2i8aDxlU9O+b9DgoDB
         GcDNmLfR2H9FjG00jzc3Z2D+0Z+QMjJKiiEFd0zsfSeVm+tFRJ61HPuC3B/RVaTisZFL
         TKPfO84fwiMVRSY0/XGD+lA3b8l1AIyHz6kUueQgLsmEngkQklWYtbHqaTdzHWVC4tyK
         5SwL7crUA3gVF0s7dakkxhJSqC5x7eHQ5lYiB4JbSYbHIqNhXT/QPJzbyJbkqqG2QV79
         ls/kTi7SEuDNOUfuMPDdMPIPferzPRx0deEZVCyDsDATJJUP6Nmzk6odg/3pUFhUd/Er
         d0MA==
X-Gm-Message-State: AOJu0YypcW00Ox5TxTXrXO6Nj8T/BjSiNNgEMn56v4YKRROsrg/AkSNO
	5t2NGVpoS9dNi9sGUPxaiFeGeK4QxQ6vOK1iVjY1U0qTdIltWbWdELLNwcIBpA==
X-Gm-Gg: ATEYQzxAR0cmijJFgOZCcy5xX4Zs/NOSrrfpscZ9ZbLrzXmwzDZK3u86whhVXjJXIMk
	1/e8LGoE07V/csj4xgHJ/c7K+0Bji3R0kZOh2jCWDPpA5X3COJ1daVF2T9E/buSlS5I5zLz1qe5
	Vxacbwzwls3Bt2aY4KYgSe33bB47lG3T3rV5nXayCF3FfC0bxhyKPaOW+CK5FzP8wpEgtK1GVTb
	LSmyBA+P4XG3c+NCpC4EKsF3FqsRR7Y95UuKXsbffFzE4+Z2E+pNKqsUTT2GkfvhCcjcB6M+2Fc
	XTn5runRzmlVIdlfqtSOSoX8kT5LlXwBaFrvt8a8N4o2N9a88gq4WaALKO7XMDnnBIE+2rbTA/v
	xSH6zXhDIYkSQwTF7YIZsMqjpIB+0SfcOlbxAlmXqm1jPlriDWkfwjtLXJnME/ecIrUZ/0jRgBr
	t3NwwBPilTX4zvFuz/LSpmCyyUK+pEso5VF6U/+lG/1/6fcSnb370MXkU8fXF12FBXj+PR
X-Received: by 2002:a17:90b:580c:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-35a21fd7ac6mr1537955a91.9.1773379276867;
        Thu, 12 Mar 2026 22:21:16 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:21:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 18/18] dbtr: Work around specification bug in range checks
Date: Fri, 13 Mar 2026 15:19:47 +1000
Message-ID: <20260313051948.4017134-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222118_136696_F3EDB340 
X-CRM114-Status: UNSURE (   8.87  )
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

The SBI spec appears to have an off-by-one / inequality error in range
testing, reported here:

https://github.com/riscv-non-isa/riscv-sbi-doc/issues/257

This change updates range checking accordingly.

Note: may want to hold off this change until upstream spec confirms.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index f3186993..2edec1f5 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -689,12 +689,9 @@ int sbi_dbtr_read_trig(unsigned long smode,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
-	if (trig_count >= hs->total_trigs)
-		return SBI_ERR_BAD_RANGE;
-
 	if (trig_idx_base >= hs->total_trigs ||
-	    trig_idx_base + trig_count >= hs->total_trigs)
-		return SBI_ERR_INVALID_PARAM;
+	    trig_idx_base + trig_count > hs->total_trigs)
+		return SBI_ERR_BAD_RANGE;
 
 	if (sbi_dbtr_shmem_disabled(hs))
 		return SBI_ERR_NO_SHMEM;
@@ -752,7 +749,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
-	if (trig_count >= hs->total_trigs)
+	if (trig_count > hs->total_trigs)
 		return SBI_ERR_BAD_RANGE;
 
 	if (sbi_dbtr_shmem_disabled(hs))
@@ -934,7 +931,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
-	if (trig_count >= hs->total_trigs)
+	if (trig_count > hs->total_trigs)
 		return SBI_ERR_BAD_RANGE;
 
 	if (sbi_dbtr_shmem_disabled(hs))
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
