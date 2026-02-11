Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD05ECD6EE
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 22:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZX/r6UG6LS7OxshDAgIVPjx7XruWLZdckV8u8u3NXws=; b=IusZaCJsGnvlRr
	iIOBXoZXdno60EoS+i7cI7H2KhCey7GS9Jy66eyoEDGfeDcAEnzpPkAIToRlcb6ah08dPCU3LpQvx
	8gLD8sNvlinwf/n+/uBCFLwrVPFFhEzifTbmphLAk96lBKQykkyOn0KRC0d+PyBuUd0Tnh40jLVhv
	ybQGYuoAHGaouuRbU3wqIs46hksbBVztZXmEhKBec4lVx/gSaEFB4A+3ZVmtmub+hv8zQK3jKuD2F
	8SUwV8K5C4nqC+7NF2AQEpUerdn8mcKETC5Iry6WDNzH3rLNWmTvBDIgZBy7YjGk0UsvFIVayAcg+
	2vhCgTIcBVmkUGtG9/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqIZf-000000017wb-0c5p;
	Wed, 11 Feb 2026 22:20:43 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqIZc-000000017w7-42nj
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 22:20:42 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-506362ac5f7so53768691cf.1
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 14:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770848439; x=1771453239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIwNQ/1syVGNrDDzavJzxoaIr0RpRr/P5kdAqu/8y64=;
        b=Wh9Rtsk/278AFYr0E0/QWzGFtnNaLj4/6OA5NEFJyZdPUbJOPr8YPp8ftLZJD8TC4r
         vwNinfI3vw/uyC+X0cFS86k+Fd4hy/3hrfIm/UNz+F7iK5dOkEAzmMjMHoedLzF6cq5A
         9sXMyIs8IvCWgFvVQPFHByiSlgtNb/U7H0EdedlvRhE344WdPSWZTct94PnyTr1QQxHh
         WRULohVls7q1v/bhB79Fg0VWBKLH7FR7GTCl12yBHmr9ktES0TMJfzZvK727BcKGZvtp
         9q6zXLt09mPHUWmYW6bIvsYBf++CKNb1pLqYhwiS8kfRFUVxFcwtIHpws9BB4oVW6ppI
         FPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770848439; x=1771453239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jIwNQ/1syVGNrDDzavJzxoaIr0RpRr/P5kdAqu/8y64=;
        b=N+KRle5ZozQCdBSygFpqK+vtknV+47X2Y7phimLQbIa7bpR3r4Mr4165LMFdvaX+A1
         yrf9gZ2nNs71R5TL3JdbHMWlWHTOwcavzPiDEOIu1YLsk9OShbndoYV7OxVGrbNb3Ial
         6s4Q1f+h7Dj06S/SChd/8wBQwneX5+7Jc0RQ0RvB7yjoZOIWbKrLuvNHbhVvSvpqodk2
         EPjRzJbjkGDbd9vEQqO5a0Xryv7mXJHqKgFtJJjMPiDnxxAxAlGCtMsqFOoj5r0YyMQO
         E52XqcPEAXfHTr8RyLPOeciiIeORoCsP97S7TBCSvDOE2UirdvnT4DsxE4p0XnNXd//h
         hRqQ==
X-Gm-Message-State: AOJu0YzqJX7e7noadNJ5U2rCV+hAa7eiz5ohUJLmGURelAxmDtZAo+SF
	MNU7EqmjVSkhJ6n4LieYRnwdTvpFzEdx1NUc+KMWo5dzj3G9fa5ZCSk5Bh+riA==
X-Gm-Gg: AZuq6aIECU+EfWwCq9aY5t3oiXgwBbCfkt+RaCMK+BBmIWNqYWhCbYitWGoZzUmzHoI
	uoe01aKc+nkFyXMy38fmh/jV+Cxz0dkmkI/NBhNpdS4vlXplOO45RTCIs3qVQcO4THqYGxzUqtq
	5QyT/XrCk/ZqzR7DRFQTFeY3yVFCbOXZPbCsdNczr/xUAg1mvn6Amjqwt+dWBcHuSwPGC63XLb2
	DtB+M/hUgCSaMstr2sG3m3HubWDLwWnDALm7xcPf0/jt4lfW5HDusvORvDqcMwoidxBB8GCmRO9
	hhSHtwZgHPZa6NOrOSLy2V2Il6NgMBPI0nHkYmxIdeYzLiHoCV153jFcuWe0xQg3FQFDdymeFSb
	OQnVAK3dD865akseyNvDuF2cjGCK/90SRoaoXnnw+bJtLlztEWOfGOT7GJjWjmjpBVT9TvwVWtf
	iXA/K7bpBqcBgyvt4odxLLtWfaVXWd+qAxiz+1c5hX6jByR/M+Cfh9tT2Jwd3xZfmgN22IU9Qr4
	0q8KFMow3Y=
X-Received: by 2002:ac8:7e81:0:b0:4ee:2154:8032 with SMTP id d75a77b69052e-50691c603d9mr16401041cf.6.1770848439467;
        Wed, 11 Feb 2026 14:20:39 -0800 (PST)
Received: from ubuntu.localdomain (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684b6b576sm22824291cf.21.2026.02.11.14.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 14:20:39 -0800 (PST)
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
Subject: [PATCH 1/3] lib: sbi_irqchip: Add irqchip private context pointer in sbi_irqchip_device
Date: Wed, 11 Feb 2026 17:20:23 -0500
Message-Id: <20260211222025.2463312-2-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260211222025.2463312-1-raymondmaoca@gmail.com>
References: <20260211222025.2463312-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_142041_005904_4B57618C 
X-CRM114-Status: UNSURE (   8.25  )
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

HW specific private data is required for irqchip device operations,
for example, for APLIC, address, num_idc and num_source are needed
for mask / unmask / claim an IRQ, thus it is reasonable to add a
private HW data pointer in sbi_irqchip_device.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_irqchip.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index 77b54110..af820ec1 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -56,6 +56,9 @@ struct sbi_irqchip_device {
 
 	/** Unmask a hardware interrupt of this irqchip */
 	void (*hwirq_unmask)(struct sbi_irqchip_device *chip, u32 hwirq);
+
+	/** Irqchip device private context */
+	void *chip_priv;
 };
 
 /**
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
