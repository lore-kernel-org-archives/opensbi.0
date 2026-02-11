Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1F9ECD6F6
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 22:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t6kdwDhlCNGInxAN3k56poSJr/UkZRpC9qEJrbuA0pE=; b=Yf5h2oWtEdtdH2
	GIX1/ixfmdxwmekUtwubnmZ3NbrGcY7IvjgksX2Thnw0WiaburkKBYPFzrHRM/BuTRvhFVwABRR/L
	3G6vsbIQVSJDeZMlGT2p0WVQCt8AbvAJCjy6UsFuGRFHg4fu+L/IwsIPl6xn9bMVH4eDehJb+Gagy
	69l19rO7D1GvuYO/0M0C3F/Lnp0B1WHhbAZwcYmjH8eNPbPU/QGagqZi2YW6MIgEpr37tnwIgSy9Q
	ZAJCRreAhX2lpMuGFlg4Ky85CKbXDRx134lA8HTb0qxacO3x2DDh5xGoOO03PJ+HahciCapc25G8Y
	QOzLVURMieprvrgwHTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqIZc-000000017w8-3hfL;
	Wed, 11 Feb 2026 22:20:40 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqIZa-000000017vm-28rq
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 22:20:39 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-506251815a3so61382441cf.0
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 14:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770848437; x=1771453237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+KQ0Gl+BWEYXH/ZRitZ8l4Lu2UQrXSUOZacqDafOdQA=;
        b=JRFK8HFNlys8rf0nYtdyGH/mk31wmPqZRalZR6zUJgzzJU907wRx4BO1UFm+wEfeiY
         wzfbd6XTFwwCoGUYpXrKiSg1TbkfqxG1AnAl/Fi33fe9wPSOUZ3k/SWAwSyrL5qprwT6
         PB/qKrgz9n2aXUKVz/8s0gY9QamDoPKMMt6tCczp0iZE0rVc5MeDPvnDlartCI3TzooD
         9FAcqNriFVVbrDDjwHXsYmdZpj/0pXRGUFJqYofoWbFfilHMFJaWv8EzKejl1LjieB96
         NGURGzPOwvJPYjr+ZHPHpZ5bfy3BLTepSFtQYrLpqqIwcsjhOdbzhhPZvFK/jUrHi2HV
         ohaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770848437; x=1771453237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KQ0Gl+BWEYXH/ZRitZ8l4Lu2UQrXSUOZacqDafOdQA=;
        b=erjCfvPBbofY1QvKgPQ+iNy5JRG1ezIShINxd8zJUbrbYX1IP7xZvakp03nckVKEPR
         23PfMGf6BJpxRzZdpx3rTFeKJygQsy6FKuCUfukanzXs6i2Wn5QPYixev08bJ60W9zs9
         ZkXq7BrzTfApyaDQVMsnfAuv8fDBJqMgA61p1On16N+FCzPAGBgi0yCjIf5UP7s64Vgt
         Dz6e6G+w25BSRTU3vtqNW8NON9rsGBGdeoNw9vvO1BlBdaks8YBABRhjVQvn7kg1auRD
         KAcY2QpvG1Q8rmShK9tn/TIthJdvfbjlpbuDokD38hNi0e5S2g52eSxM/YxopUyTHR7p
         P48A==
X-Gm-Message-State: AOJu0YyhxdjO7tJj4Jyl56h7utKoSbLOhCdK8tesLI6iqIjdDaXnbulM
	TUUe16CEeNrrvqWZ1HkmIAOQZ7mSdFgQn/eu8oqZ1bc/QaWAp5ad+osNplpcHA==
X-Gm-Gg: AZuq6aIKdkce9rceCWZXqqtXLefMQ3r1jzvnqde7JiLQQGCQSlLuhvioXPlsx/yLgiM
	wXVfgu+yOYqqLaseRoVZuUpt/TVyUiRgF3z+CtiYKI8HMltnQUzmqGq/O2aL/0y/nMk6Vot8LCF
	loARLx7ZIk90g5r+Xhm9zSI5PJ4WifYYehio+YSFK+w+Zf3840+y5hMRtGH++C19+du7sckAAoF
	ReDl4HEXheOrKt5ZoqgH9ONjnL61oeFm7vidTVXuPznIYqTMMbbrMM4m4VlEhWZjuK5RP1LYR94
	OF0x4NdeRqQXBx8QBsvG/9XpH2wDDrGUvCjUHpaAcdstzGFYY4qVmVZhKaA+2Ybt7VPAm6LV0Sq
	ts0Gn4foaAyAbKZbmiWf2uV7JHlzKM3tV0wb9m7Q8vFX+6iOq6FFJaR0hAWhYPf4yxLFOpt4I9E
	1fdwFE+sMYlv/GoHJrfiVNY9Y6oXsQNVdyCo2E4HJh4lbFvrnxmFQrHNSr+2MDk/Ft0jV8uBRwX
	LzbejdMqS4=
X-Received: by 2002:ac8:5a96:0:b0:501:467d:17e8 with SMTP id d75a77b69052e-50691c28728mr13576881cf.61.1770848436897;
        Wed, 11 Feb 2026 14:20:36 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684b6b576sm22824291cf.21.2026.02.11.14.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 14:20:36 -0800 (PST)
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
Subject: [PATCH 0/3] APLIC hwirq implementation for irqchip
Date: Wed, 11 Feb 2026 17:20:22 -0500
Message-Id: <20260211222025.2463312-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_142038_575955_BD637EC7 
X-CRM114-Status: UNSURE (   4.98  )
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

This series implements the APLIC hwirq handling (mask / unmask /
eoi / setup / process) aligned with recent irqchip framework
refactoring [1], and register them during cold init.
Moreover, it provides a minimal APLIC direct-mode configuration
and test hooks under QEMU via UART RX.

[1] [PATCH 0/8] Extend irqchip framework for M-mode interrupts
https://lists.infradead.org/pipermail/opensbi/2026-February/009407.html

Raymond Mao (3):
  lib: sbi_irqchip: Add irqchip private context pointer in
    sbi_irqchip_device
  lib: utils: irqchip: implement APLIC hwirq operation hooks
  [NOT-FOR-UPSTREAM] lib: utils: irqchip: add QEMU virt test for APLIC wired IRQs

 Makefile                  |   3 +
 include/sbi/sbi_irqchip.h |   3 +
 lib/utils/irqchip/aplic.c | 235 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 241 insertions(+)

-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
