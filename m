Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C51C606A321
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3r+JB2bB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGesohqd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cJlcxMYnJoJZ+IRbucMIyafI63jTEnEGmVrvsjeztpU=; b=3r+JB2bBCwChpj0VfF3uc5TaIE
	x/G9VvqBHtDyVZ6fwpmJQKn6llHsveHfplwuSoo2fk4D0ppawxhoTUn/Us3BQlC/eMrML8FJRir8u
	VI+xtXqa2AMOod1tm2yzH4vtCWy+G6m8ka8y18a7SfQwANxXY4sKNAE4OMPl570BcAIoElEe62wM9
	j7gymaFdPvDopZxTve6PYbRrEGPecoLyDAtR1xYKDC/ZPJXHjXka8MxCAcGxmhY/uFkkACeCbrHW4
	cx2yRJNeq3j8ek3E6X2jrYa8/HbBjV8Glt3maV3sQY2yniIDljX3EYzvwiUhBu8MEbhQGbGPXzuTc
	KmUp1BXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpxn-00000006XzH-3Mgy;
	Tue, 24 Nov 2026 12:49:35 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpxl-00000006Xyi-2rFf
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 12:49:34 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-491971ac844so4087616f8f.2
        for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 04:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795524571; x=1796129371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4x7WWD+gDJYITbhKrzYn6xAW4BbOvyaFVQbzbYyn5GE=;
        b=bGesohqdFKZdpVexR1FDx6xDK/KYoHzcIt0AMml8ocpDrfw57BdTsxvUIEJr6YGkX/
         I5xZBAUNKjR8PinxQ8S+WdauNU9opJvb/AmktYOx4aVcjHnzHW8cReD1+o5QIKR1EWzT
         m7hwvQ3kMMxV0vrBPX3XRAn8mLS9Ifd7Glbong/vDv3VSZj8FqEGtKAXLVGjoN37zrHU
         7mWojq6E1nkcaZ7eOAdvigF+RGvKdJg0+nLrVsJQMQDNHkWqE8PN8MqpltCu3gNtnXrS
         5ktnSa4wfp+zosKCpEl/DEnW6QWDjU5G1k7/9pfUjugWCeQBu6aA7F+Icm8D1mB3qPSe
         1diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524571; x=1796129371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4x7WWD+gDJYITbhKrzYn6xAW4BbOvyaFVQbzbYyn5GE=;
        b=kX84nTUAhl4dYRTh3DsUKsJec1i+4UPwrDVfllPiGbnWwOX+7zVYOA5515V30uF5Hs
         Watw9+4DqsqwBuOn1n0AO55hwPpYsPB9oreN1MA5EstzoWJMZuPnq9DuHI4jOfeFbDXW
         kUquiTMM4PfH0PTw5BdW4+ACbekL5LdcBmSurvKo0SD1/aThIchhmsuC7rneixBOW8wU
         53owmtAjVfjqH3pqozjMMClSStbyfZ7KYJq25P3HZqCnMy0oZs7/AQKYviIKlfKEpCkZ
         wMb+ykQyXYQ136xRiNwjwNEo7kMirFoYA6D4s1Y+B5oFdWVela2pCVVwFgSkTDPpXSoh
         FipA==
X-Gm-Message-State: APuU4Z93JKNYb9PQxssPGoq55lbt4rE00Q7YbuPNGbGkHz4DCVyI00rz
	TyTwIdyepEBehB5c4ttfPTirpUvTrJyhnuzvR+9sX5FhNGmz3d28lek8B8pjG890
X-Gm-Gg: AZFdTZcrmEzziJjtohfvuTzuhnil2XsSFg9gtlaYCT4OvyFtFzRfN1rk7E08H7t8lNU
	UBaWaQBlwtCl8pHIsdaN1XxdftLhbzV+VcFr+CGaCvPNep5qbPeOEZSR1ofZu5oTEi7A974kwop
	KDIuN8ax4VgSWcMLM3ffnUVKgHPDv+QwpfIvzYY8i9yQZZNmmvIAJQ6g6IMzzUJWLJSmQoYicq9
	ZFCKoJNbqnaKbLTFQzxNlmzB6/dPUemuEX1CwWOuttuWAben4HrfaQX1q/NP+jBG8/taParGijv
	WkZZ5hxM4LWw0vUtn7rcVaxYfSMXuJce+SsXd1iQeUUOJ/eKl+6YlcefRLHkvL5bAmNHCsITI9d
	X57gQHGRfJsgvb9vtK9rfv8IMVUHrgXVDoCaDDH3eeI+GKhuj+xWfl7rBCtGV1FPxDEvklNGulZ
	YXUw5xUcyy3g9Uwmfw76fas6S8KnUeeZj5JZOb10nvp3ZGJk8Y43jsPfRDiQtN+zvyQ00Z7OdIz
	ETL4EttLXbPw7Qs6sSKOtdRhtClN9FcbbVYbI1o73MUd6TYBR8mXGiJ79+ph+hOPzaxux5vgvTa
	u8MGitk4EvIiuSqXeD53tEhKA3DIVkVUvIN9JeyAWmSkyHq1Mn2ZaMr+ZrakDfzjyZ6SXKxc2s4
	ZymYwubI=
X-Received: by 2002:a05:6000:604:b0:48e:47e6:fdfb with SMTP id ffacd0b85a97d-4abb0c5d588mr27376327f8f.13.1795524571508;
        Tue, 24 Nov 2026 04:49:31 -0800 (PST)
Received: from imamay-pc.yadro.com (mail.raidix.com. [185.53.20.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm28619615f8f.48.2026.11.24.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:49:31 -0800 (PST)
From: Ilya Mamay <mmamayka01@gmail.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Ilya Mamay <mmamayka01@gmail.com>
Subject: [PATCH 1/2] lib: sbi: fix uninitialized return value on trap in sbi_get_insn()
Date: Tue, 24 Nov 2026 15:48:59 +0300
Message-ID: <20261124124900.92404-1-mmamayka01@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_044933_727332_12CACB4F 
X-CRM114-Status: GOOD (  10.24  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In sbi_get_insn(), the `insn` variable is initialized to 0, but its
inline assembly output constraint is specified as write-only ("=&r").
If one of the `lhu` instructions causes an exception,
`sbi_hart_expected_trap` redirects execution directly to the `2:`
label, skipping the writes to `insn`. As a result, `sbi_get_insn()`
returns an uninitialized garbage value from a register or the stack.

Change the constraint for `insn` from "=&r" to "+&r" so the compiler
preserves the initial zero value across the assembly block.

Signed-off-by: Ilya Mamay <mmamayka01@gmail.com>
---
 lib/sbi/sbi_unpriv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
index 1550d111..3fd9d9ff 100644
--- a/lib/sbi/sbi_unpriv.c
+++ b/lib/sbi/sbi_unpriv.c
@@ -227,7 +227,7 @@ ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
 	    "csrw " STR(CSR_MTVEC) ", %[mtvec]"
 	    : [mstatus] "+&r"(mstatus), [mtvec] "+&r"(mtvec),
 	      [tinfo] "+&r"(tinfo), [ttmp] "+&r"(ttmp),
-	      [insn] "=&r"(insn)
+	      [insn] "+&r"(insn)
 	    : [mprv] "r"(MSTATUS_MPRV | MSTATUS_MXR),
 	      [taddr] "r"((ulong)trap), [addr] "r"(mepc)
 	    : "memory");
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
