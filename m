Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815C9D2D8FD
	for <opensbi@archiver.kernel.org>; Tue, 27 Jan 2026 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tqkT6BLhomfzW0ncVr8JfzpgevahFY8TSsyb/ciSCSo=; b=RAGiGpBQf/JAMI
	85lNaZHSTZJzh9IKN/GkQiXSwthv+L8CMS+Ouaxhg6GQ2R6hi467zMj8BEiOjWiTTXBNJwMPuGDoO
	vuL7rVFI5+MXyZfDZSFWHvrLTs5yvWSMSuKKOTrQIUDcLWchjK95G+k5SnFxaMXFaqrJbhuGwEc+r
	CwITL31uZ+88kuijLwWLNl14wf4deeDJbjf3/nMkAZBp4SLqaH4Txnj/jCgL7lQNH1VqhTRbLIGdG
	27IjDjGbkNeMFjaxYgzd7IY6JDLNq5UYBmk7wmAi6fSwVwNjhZvQYp7UJSyVSrXgvpjHrjzwgFmN8
	edwTe+kSCQAjxfn0aIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkv8-0000000EXig-3lDC;
	Tue, 27 Jan 2026 15:23:58 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkv4-0000000EXhR-0MsS
	for opensbi@lists.infradead.org;
	Tue, 27 Jan 2026 15:23:57 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5029af2b4bcso30086381cf.0
        for <opensbi@lists.infradead.org>; Tue, 27 Jan 2026 07:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769527432; x=1770132232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ljZNcRt/7wcQvMRB0AsY4bNdMht4F4vw1aI5sMXqPb0=;
        b=KaKQX5SeL/NBwz2TPXVGgPOUqk0+nTqaFTn2GNLCNEhYl2ktUUdBfleEG1fkoeJ8oJ
         MAIxzH3zdwgW4gU67JGJZE9dHW+4ikeB8b3oSN97np2qnVwPcoTRP8+HUns6ssiF5ZrH
         SgFaJrkEBRsAzBtRUmsZ3K9HEP18p4LhnZPy5rJszXhRxf+ChX3v0Wn5lMT8No8n6heo
         Ufo7W3ck7MGcIBxc3nYou+l0aY4LO7ABX00+GvG23ur+/DVyXsmA+FOYToVO8Pdtduwc
         Wca0OF4othrN9Czw/nQLNvWsXpHiI1EjhPlHum0+LVz/sw2DHf7LekaWQUhMp0GiLz05
         LAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527432; x=1770132232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljZNcRt/7wcQvMRB0AsY4bNdMht4F4vw1aI5sMXqPb0=;
        b=lIW529H7QXd76YY+2lSaHXbHzxXKrInBvCkxPyA/S31G1zTNO5VqyKIY/Eu9ltlrs0
         gAPopjlRMgxZdIn6fGGWgAk+ddQ6KdzOKhx6iDKdYKn/X4+oRTNtTfrNNQxfnZOJ79H9
         A9u/kUr1U6AW0S+Oy3lFxINY0J+pZjCCjKuAOE3LYX3eWBq7BmhTDYdyHGyOPPsirCFC
         V4ngSsWFqxZBZzD1V0VWJM/2K7ojyTJoPbGEraRXUwWCHBvomxEy7CXjVuq6yXD4vUKz
         Fox9ScLSkGXlCsEDU1DBspaBDFSlLHR14hw+Hma5F4CmTQrkAju3YBMnJGHCXhSPDwgL
         7nQw==
X-Gm-Message-State: AOJu0YxhPl7jpOK/munMOaBC6K7SHo1OZYJr69G+aeASth/MzovnwYDU
	Oml5Nzk8ZnLKuOjKHnpWkU7+TcGHqOGrNndrIb5Ruorist+hngoz8Sq2SThWyg==
X-Gm-Gg: AZuq6aKG8G90eGKfyEuUOb7k6PxZU5rr28MNKXZUtzto127uaFkIS3rLtYEle8WNibt
	1eIyDBHTKKW5OZYCWOrKcecUZVdNb/F0Xs5X/lBxqaM6/fQGg8HOXdzIBVq3BTsv+a4Q7yyGUWg
	VhoGUCI0HOJrFgZoQYYKCBcSe/OP8VVlnF/OZzfDsEI6SxUgj0xIqGCJ98BEVepSPPqUCtj7PIs
	5k9je1gcoJ9HVLietvQKHhgUr/rAtBQELmCFGZpwlt/t5I1D7/ge2p3saWm4o0j6zMbOEaHNszt
	7i+SC1JAn1PljWydl5j0C6lJj2f0PWyGXMt6OsAhiyx2Rg/BlEy6MZjLweyIWierMS72k/+dz+x
	uzl5DgpNJeNUOULDvk/78h9Em8li6cNzPXAxWq/Mr23kftf8mjmjmyRGVlEjZnYyd6yoyhT4cuN
	T0nD/M1h6yUjeig+8SaTQB7b5fU2fwGIyJ1RdFoa0mrTcz3h269bW1KJJgI8OfIBGhXHwQsnY=
X-Received: by 2002:a05:622a:241:b0:501:4a86:f5f1 with SMTP id d75a77b69052e-5032fa16e97mr23916551cf.71.1769527431790;
        Tue, 27 Jan 2026 07:23:51 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5030032c987sm119710161cf.32.2026.01.27.07.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:23:51 -0800 (PST)
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
Subject: [RFC PATCH 0/2] Introduce INTC and VIRQ layer prototypes
Date: Tue, 27 Jan 2026 10:23:40 -0500
Message-Id: <20260127152342.1231995-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_072354_127993_3DB485A2 
X-CRM114-Status: UNSURE (   7.39  )
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

This RFC introduces INTC and VIRQ layers for APLIC wired interrupt
support in OpenSBI.

In the current OpenSBI implementation, APLIC support primarily focuses
on initialization and delegation, while external interrupt handling
for wired interrupts remains largely stubbed. As a result:
- There is no generic mechanism for OpenSBI drivers or platforms to
  register handlers for wired interrupt lines.
- Interrupt dispatch remains tightly coupled to specific irqchip
  implementations.

The goal is to introduce a small, extensible abstraction INTC
(Interrupt Controller) layer to hide the HW details and provide
abstract operations like interrupt provider registration,
claim/complete/mask/unmask operations with IRQ number mapping to avoid
exposure of hwirq.

VIRQ (Virtual IRQ) layer is on top of INTC, providing IRQ state
management via per-(domain,hart) IRQ pending queue, with courier
dispatching and interface to enqueue/pop/complete an IRQ.

Raymond Mao (2):
  lib: sbi: introduce INTC abstraction for wired interrupts
  lib: sbi: Add VIRQ layer

 sbi_intc.h | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 sbi_virq.h | 71 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 170 insertions(+)
 create mode 100644 sbi_intc.h
 create mode 100644 sbi_virq.h

-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
