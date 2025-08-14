Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D90CA0EE6
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXqxSyiRXWSt8l3qPr+a6NwOVk/NjPW94YbWlj3hGfU=; b=KBzd6c+haME8d8
	kWTIJGWz6e0EJHcyfGQSmNp6RIjyeFOucbkCH9CzX1ZzgsF54+FaxYdfMm9u8nCZgiXxsNCNwdwn/
	wI6jHPGIQVFYUBMzCP/8KK3562EnfAO0SwZyLo1Xx/22pHUgScd76rM5KdMhS/iZjEA5tEtbhijaS
	rFJ9CzZCGoMU1DiHSBxJstZZfNCUghpAAZ+VeAnZjE7UO+HgfdyzKd3a3H+B6tRJWwUX1Uf9gyH0k
	zWv/ApHUlRqgwGJpJyUpzsnDTOOsoyw3py5j09ynLgClIr2AGTsLReKCk8P7uVf2Ps1EwuHHSe7pc
	5E1BwptC48bDS4ppqkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0x-0000000HTgv-1JfS;
	Thu, 14 Aug 2025 15:37:15 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVm4-0000000Gi44-2eFv
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 11:05:37 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e2eb6ce24so774954b3a.3
        for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 04:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755169536; x=1755774336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXzi3X35aBkj1Nvuomm7txTHkMapezuSo4QJXlMB/cY=;
        b=bJp1j7cEzFP05OG25pn5mR30RGml0JuNFvgVi+H6+ME9q+L/wTe2htW/uNl4EmtuFV
         SBi2L/nUWHfcIyssr/zpVqemzy8Q2yTgO4wQaor+SD1aHWa/vwx4qYbRkzKsFPHuFsaL
         NeJQ+Mdxj0MaHzsNOeLuKgWq9OfHFTlcu1ubkAqgrtkcmCajYaJMltCUMPbWbYnQFi8F
         aDfKw3JO8ZYqtnJERBOg29j9uk8Nf10yACgwMZXo5FEMbcujAMPWK1zq26NsgDk65T4b
         /1tmRi2EcFm6gJpA290YlGW6fgrG2D8+av83psmJL1d2W9TCs2q8WoaBU/tthgFYihiN
         4HOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755169536; x=1755774336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXzi3X35aBkj1Nvuomm7txTHkMapezuSo4QJXlMB/cY=;
        b=Cz1gjDNREzVTH9li0rRcDgegq1vOnYUTjnZY0JPsz/wYsoecxSfhqOd6wpWwI/K2CC
         BItnrM65JJQ74KUGq2kNYgnWpDklCvLSNo3NtnSfzlLS3vSexmngxNOns/o/ETwD+KXO
         2QTbqCnAYzRqrT5HN9/uB4y1X1Eqwy+TNs+YN+tOnbRJZUgq3rf8kED6gYFZx1kYWdTT
         6b2a9zNCsHFfjdB/LO7rIjJQFOAKaDyGowH98CW9KKf30Ft1Vfz7kgEP5qqQ5BLOhg48
         Mw925r+MiUgRjOpkQhNhwVrt3m9MmLRNTRN6M9bI/6gilEnm9nY/aniehbrZgwJXtiQb
         djUw==
X-Gm-Message-State: AOJu0Ywo9u7+Mv3i5feGpO9OaV2ccgqtTK+/mZ3GuRR6orAusquVg+h2
	0WuZcMDofQA4F4As5dodgTvxtmv4U0tSxOf+kK2nP44mPX7+LxhhiMXrXPVGfZtfuDr3WqjBCrE
	FIVAGlHdbqWYc4euUOQlhuitcZ4knePaLFFd4b46btxe9+ZE3gz6e2vzuN+TiMazCEU81ZBM0RJ
	YJ+jA8HuGr7VSJVEP8kKBHP35gLXwZqGhS83XLd41mKTqkIM5ltC0yvQ==
X-Gm-Gg: ASbGncszPbZIiq7MYCUxazIBm5sRjbHFS1V2r2yJrtyIs1PCLX7cf+uFWNxtRyxQ3UL
	fBNIuapoky61tgvzfdoW1ARGdD9OaKDlLi3/3+6ojQDvk8JVyHOp9lLUbCkIYTw8RwldME5WCrA
	SbcGbuPhx9k/HArCZIZIRYt+ataGEbqloCJ5kUSlG8R26pcL7xq8if2EsmyHoMMeBFGU4NjvxVg
	GM4yuXyadwfLCU2trQf8GxFlbWIR68/mWIf+fkwbCrf8iqVfdbtGeWQacT6seiNyW+OyRLHf5ZS
	VA787naNffpGOelwG+IqQ+BPeV2PJoL8kYQuUelmofj8GZrJkjIhy4KbhQV0RC1i42osoNBPZas
	LOsWJjGJ1tg8k4tUB5VRLPhTpM3pf8wcgRcddp0YxRQ1Szi0=
X-Google-Smtp-Source: AGHT+IHd4sAR9+e4iaFJun292XHr6+U6KryXuSL4dBechnMzHhgy3I3LVh8ANg2Nf0gRvVd4RAVKEw==
X-Received: by 2002:a05:6a20:1592:b0:21a:d1fe:9e82 with SMTP id adf61e73a8af0-240bd227f24mr3718874637.30.1755169535383;
        Thu, 14 Aug 2025 04:05:35 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4683722179sm9624755a12.13.2025.08.14.04.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:05:35 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	alvinga@andestech.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 5/8] lib: sbi_domain_context: skip the reserved entry during domain context switch
Date: Thu, 14 Aug 2025 19:05:19 +0800
Message-ID: <20250814110522.18809-6-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250814110522.18809-1-peter.lin@sifive.com>
References: <20250814110522.18809-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_040536_667896_B5FCDDF7 
X-CRM114-Status: UNSURE (   9.59  )
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

The reserved entry is activated to create shared region between M-mode
and S-mode, it should remain unchanged during domain context switch.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_domain_context.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index fb04d81d..1812c7c9 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -116,6 +116,11 @@ static void switch_to_next_domain_context(struct hart_context *ctx,
 
 	/* Reconfigure PMP settings for the new domain */
 	for (int i = 0; i < pmp_count; i++) {
+		/* Skip the reserved entry when SmePMP is enabled */
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP) &&
+		    (i == SBI_SMEPMP_RESV_ENTRY)) {
+			continue;
+		}
 		sbi_platform_pmp_disable(sbi_platform_thishart_ptr(), i);
 		pmp_disable(i);
 	}
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
