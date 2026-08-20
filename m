Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B6AC5DF81
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 13:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a3zXqXdRXKYYwJcBHsdDXffG6tW9yZqnp6qhCyrYcXc=; b=UFS4E7jvHE6I0z
	3me8jPEHjdD4CK+2cURZ8LAb8fEOe/QIb33En+A4DycRqm4iO1NzO6Fv6S/DKWv0qebhhpt69T4xE
	9buudLqwzgzeELKcS2HFAe1IcLdcH7u8M6CzTs71VRjLGGORF0Izs1VaUDv4GwOxIJi0PH9JKZaem
	jCPt/e9lz1i7RbgLuLKKRPAvFPn+UIZJavLx6l9/Z055yat7slDc0zmjnnTeACeIsRSyQs3axqiaI
	FdmVl8eCMUg9QrEkgYt77E1S2dkoFFwlBdQ9A3o77WA0hNjwgEUd6yXXiHzxFeeMtyUXZVpNbdUzN
	53aLFJbevOgertpZSN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx34W-0000000BdNr-3o9i;
	Thu, 20 Aug 2026 13:44:44 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx34T-0000000BdNT-2GoQ
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 13:44:43 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 999683F0F8
	for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1787233476;
	bh=iNVmMT5LYlk3onUuIb6OKoy9v4dei5ialtjSA/i63yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=drNvNMZoeZUPpylOPxiQStMkpOO3W2OfMJnRu4/AABePDpoflbG16Q5FOduqEQozq
	 ZP5BJm3i0gGjVu4WTwbuP6dpvqNHqK1h1ULw0Z3MnNjwAmVvFrrLMIHLQXbMIxEpbU
	 F/FgdGVbovCjrLd0NhEb0DtSwSy2Pyqfk9IFDpfGfiyHFHU7V6/K6j4JAFqwKeV86T
	 FYkJFtE2XEC3MOp+zvaaGsNAZmglWsJjfbQsifDuKeSpva7vsjCifP8rhmWT1A9pax
	 lcUXfrcjPeLeih7Q2wZ/7OHkyNeJtR5oAU1VCX637orZH9sWGFRpoFXWEgjhbgRRvl
	 fNtCPPxtKfoPK7QZAe3+WhlFVhjT1aGrshudSjDGRqvw1O57i2QXvxbV/r8w4SoNqf
	 QBJG4ZhvieyS8RgG9H8J4T5j2hxx88Up+Ivd834s+E1pCLWXFEXu5K9s4rrgLEw5XJ
	 ujNte+fNkUY0iCbmgVqnvcOUrVaClBlJOhBGQ4nrfCcUpGBma59YysKy8C/zTUec0n
	 PsC8Kd1Wl0PdZcnpAbIaQtJpD/b4qes8CqCzKOPNHIOh0gtYMXOdwZAbeGcLgHvStI
	 DM+i401e/x0xCOTCS6cefSB2GWJeyLCAhmS/ZRr0lrQsloLy8xL8qlWq10Ma6Q/jxD
	 Sw50APZ7aAJ29dNYqWtTbZ+4=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47fe23b5acdso1833868f8f.0
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 06:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787233476; x=1787838276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNVmMT5LYlk3onUuIb6OKoy9v4dei5ialtjSA/i63yw=;
        b=TsLrUoArN82M3lsekr3fDLPp1Qc7Hp8adMIzAgD9EFa9SPErlHFBDOtnwwTd1QA87t
         rLxX4ETGhdvT7LJJc6RbSV6EwNkOgdn0nUDeagwDrN9OLguk3ENocq608e6adGKz1kyb
         sLxoUtyzWj48MSIU8DnmH2SjFDl7zKbRDhsap13KVBVXfykI19p3KwOp6HnFxkZEuBPX
         gYy6YE9fUsPflMFW/lGK1BTEOqrRpqo5mgz37WHgIApieL1vAnSSTQ5oOXeTzYNh4sl7
         kZtEt3mcGkhdG6Bqj+gsoQMLUxt8A9NaSOcsy2YshCNVpQIkYumztRSV9c8YS1zpJO8L
         v8ww==
X-Gm-Message-State: AFuF++lk7O0HyWaatwi3EbAcP7PPv+ZFMP1ns4AWSOL01OGKXyYDstRn
	BwwQWm0tPxrrMgKIyHJbElvceiUtcQgsbbqsleGRiAOEWKxJjJ8YW15BFo7NL22tISI6ei28OhS
	GdcVZ4eFy0Z5kVoegZbKd8eFAyvRlsOz1D7KhnTJtV8zqEB5WaIgR+VCpFpi89mEsXEXDhO6i7b
	3NlanA
X-Gm-Gg: AR+sD13zqyCfw21oL+nH80AG1grZ22oMnxjyGxIrHcJmfA4UpWvJrr4zy3/HpRy0uO6
	F0RyWgBLMxxw0aK6ljsLCA3MDlRK1HW4VlH0B914pirs425RqI53BCG4YxQ2nS2H0etYrXAAl/d
	AQUrvY1kXdt7uwRw4D5E5/IO1FltFfR3oKA2/hUYu7jJwP1hjPB8xKTaAfnzGEghkfcKAakFJFX
	dEdFQgYdKkP0WsfPr5kIBLJDnest6GhifOOOsUGov0qWOAMRcCpMiJtvFKzFSgGrgFYHV/HF2ic
	A61bIwfv1Ej6TQ4R1lLDDKVIP/Yi5grLUAFdijhZOU2FY6TS8hkaMUcSWLc56QtHGhqkGTnDxqA
	0igVZSzpqu5FCW+gHWGx2TCp89Z8MSqZbAv3Njsqs6zAFuDLEJEvvTD4=
X-Received: by 2002:a05:6000:491a:b0:47f:7f95:8a1e with SMTP id ffacd0b85a97d-482b1e84859mr23662499f8f.5.1787233476200;
        Thu, 20 Aug 2026 06:44:36 -0700 (PDT)
X-Received: by 2002:a05:6000:491a:b0:47f:7f95:8a1e with SMTP id ffacd0b85a97d-482b1e84859mr23662427f8f.5.1787233475805;
        Thu, 20 Aug 2026 06:44:35 -0700 (PDT)
Received: from workstation5 ([2a02:908:1242:30e0:cba:879e:28f0:3c57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482bab42f8esm5376154f8f.28.2026.08.20.06.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:44:34 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] lib: sbi_irqchip: error handling in sbi_irqchip_raw_handler_default()
Date: Thu, 20 Aug 2026 15:44:30 +0200
Message-ID: <20260820134431.167336-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_064442_026084_2A2D9614 
X-CRM114-Status: UNSURE (   9.64  )
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

sbi_irqchip_find_handler() may return NULL.
Check the return value before dereferencing.

Addresses-Coverity-ID: 1677408 Dereference null return value
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_irqchip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index b490a3ad..1664bd2d 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -185,6 +185,9 @@ int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq)
 		return SBI_EINVAL;
 
 	h = sbi_irqchip_find_handler(chip, hwirq);
+	if (!h)
+		return SBI_EINVAL;
+
 	if (h->callback)
 		rc = h->callback(hwirq, h->priv);
 
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
