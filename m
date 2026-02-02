Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6E1E7DEF0
	for <opensbi@archiver.kernel.org>; Mon,  2 Feb 2026 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PQZGcq2JurKx4cgJykUI0mljZBsU4ZZBJj3senjZ56M=; b=V/H5MX1BZgw9vD
	py3t4LsvfEzLCUsbq+tSBHuO0JfjnOKQcxYz+2JvkR4ZUa2tiR26ScgHyz6kAyfmtb77zYODFoJAw
	xNG9P5GhYwfibaide5qQ/PGT6zGNSypo7MX8Ffa4GfJeQkvjJJmejHKJEjXIvCq8wtRSrkSjZQash
	iS472d3aBKDHI0ScLVUfPsdzUckY87N2yXsxfeJ21wEu2eIq1YFuxJJI3TzFWxCEHRlFi8cYEpDwL
	5b/yR/NLCzAQoQFteUiGzKKa9BJ68J21E/gjcWm05P0pF9cj8wnQRGTPwLwSqzrf2REGRra4NyAqx
	QXUrH3arnSGwjmtc/7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvRX-0000000597c-2b0a;
	Mon, 02 Feb 2026 15:02:23 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvRV-0000000596S-1af1
	for opensbi@lists.infradead.org;
	Mon, 02 Feb 2026 15:02:22 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8c6aaf3cd62so498940185a.3
        for <opensbi@lists.infradead.org>; Mon, 02 Feb 2026 07:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770044540; x=1770649340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBdonQU4uvcfOKRuH+n+1ykHrJjhqJTpCUQniqTRa3E=;
        b=QVYqMBLH6EtEYnnisgblUNB0nHnnCID4MHKGmTDPHoQzGr4wrPAsQ3GvvZ4SnpIVEu
         jqnwRIdK3FwMiFDh9PWOtA/CF81k4LYbKK41dX8/vvLCKvUFIQP8HvZY44rY39Od0s8h
         xE9SFWbyKxHkHy1ML8asUc0XLtRPVeOV8hakdmOR/fUVK4dNqrcFEEGDTYvLAxy8nnL4
         v+FSpT30/j4FnYXPknIyZRLiidTk9AgJebjSGsKVcNG6K3TDX/N3KiAsQVU7aGHr6rzu
         wkyxUA1AfGt2G3QuVDqXBQNPl+HIzvdQD326leghngs3ZLZVXNnYupW7kuURXSMuwg5u
         WupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044540; x=1770649340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBdonQU4uvcfOKRuH+n+1ykHrJjhqJTpCUQniqTRa3E=;
        b=wexbPQT3BisftvHpSqovM3sRwIRkGIAIu0KQWDokGCrFhP/J80dnKRTdHPcjkH+A/e
         rzem71RHS0/m0FJE04iyohe70jUnaYytoIhP4qZBMFxrX8m/W99QStkQskD9fMxnhOf8
         v6g3eTbbgOoSPMc21tWNK9Vt6wrZ1L6gUdx1KPljgxs0KdJlj/ENqjGOaunFew6sHXW+
         atK5TgrfCLwIuhnYvcL3IyCVZZB0gIUFQzO/0gSNMC/QwvQ0Dwi4lmo/Yo0QxDsmmvl3
         sbiqFAfsvKJE/wok+r7HN/B0os2iaS2OpJwPjBEW6jRXsBY/rFYofAULgbVFgyh6gzHz
         xpAA==
X-Gm-Message-State: AOJu0YwA9D9V0PiiYb5/NeH4u3wgBRTQ6HLPgVVEGr3ERlwBVMyMZ5aN
	FGAfTXhFK/jz9qzYKy9KLur2RJlxl1k0V1mkq/1GH7EvQx8m1f/qu4V24kwVpw==
X-Gm-Gg: AZuq6aIizkXIVhQi70a5MGb2PyLj+mepRA3zPvM9zgroQ6TlYQ51e2tdddfo6UmIA+b
	GMY02J9f2De9CffFE6PCnakJWOLDJypAHKfsiKA0hH1/L3iCzZcVC+AHK6jEVNisjVyv0LKRnk5
	iOifRRcqs/r48UdEtOlgYRE2zpSfJHaO2WVyPC9TvJ/6Z2/WtBT93WtxLGRTOfs94c0vGCAyrTI
	w/wlUdhXYcYxkZHwTGqbfTpGEwD+4vux0m88MLTqdgfde/RHdCUfBw/iOggc+NtFN/d2vuCDBpp
	mI3gUiYENITfCNa8TvINwNXXKXvfn/4oGUptmsRWE0mdeQ/qMuvJwG1/KhgggVAfUTqjff+hB0f
	3kbKB6GwxtTnhLu9niu0EoMHzfOHyeH2/nda3oY+byF7tIr7UYY36VNH8w4gySva4VV/ksycA/V
	v9dCN4Qi36qr5bZcVlJ57oVU2QA4BTJFPx65Sx6V73woiAx9mTuaCPKBKF12M2gWmcxq9jzhI=
X-Received: by 2002:a05:620a:2544:b0:8c7:995:b961 with SMTP id af79cd13be357-8c9eb2dffc6mr1523105485a.58.1770044539152;
        Mon, 02 Feb 2026 07:02:19 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c71b29f796sm1136907485a.22.2026.02.02.07.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:02:18 -0800 (PST)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [RFC v2 PATCH 0/2] Introduce irqchip and VIRQ layer prototypes
Date: Mon,  2 Feb 2026 10:02:05 -0500
Message-Id: <20260202150207.1331811-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_070221_706962_AB820BFE 
X-CRM114-Status: UNSURE (   7.69  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

This RFC introduces irqchip abstraction and VIRQ layers for APLIC
wired interrupt support in OpenSBI.

In the current OpenSBI implementation, APLIC support primarily focuses
on initialization and delegation, while external interrupt handling
for wired interrupts remains largely stubbed. As a result:
- There is no generic mechanism for OpenSBI drivers or platforms to
  register handlers for wired interrupt lines.
- Interrupt dispatch remains tightly coupled to specific irqchip
  implementations.

The goal is to introduce a small, extensible abstraction for irqchip
to hide the HW details and provide abstract operations like interrupt
provider registration, claim/complete/mask/unmask operations.

VIRQ (Virtual IRQ) layer is on top of INTC, providing IRQ state
management via per-(domain,hart) IRQ pending queue, with courier
dispatching and interface to enqueue/pop/complete an IRQ and map hwirq
to virtual IRQ number to avoid exposure of hwirq.

Raymond Mao (2):
  lib: sbi: introduce abstraction for wired interrupt handling
  lib: sbi: Add VIRQ interrupt abstraction

Changes in v2:
- Move INTC to irqchip
- Move hwirq mapping to VIRQ
- Remove get_caps and pass in max_src during provider registration
- All irqchip interface use hwirq as parameter

 include/sbi/sbi_irqchip.h | 52 ++++++++++++++++++++++
 include/sbi/sbi_virq.h    | 90 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 include/sbi/sbi_virq.h

-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
