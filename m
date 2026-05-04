Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEB9CD3427
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HF7UQxdaUxvlz6zoUfIAsk+K3p3qyunJw3mn8cbBuI=; b=saBDQYasCPea7t
	BWWyHn7zUa2XYJqiNO73r0pRUFXAMgL/Gh5xg7qx/sIiiXn6MTnoSkZQNTHgeAP6sXFAp6dUW+rwU
	YjzQEgDM9Lcs9ePQcOOSFQCetaU0IEgSWx/W8zBhktWTN68IsKdOj2+qmEclnh82l1lf2dxbS9fYI
	Wg9a12Gj74ucOnAIieuGdbHIGEF0zBJ50qOWp7r21V4pmo2HW906NIiFif4FR0c78KUrxMZPS2Mic
	d5aoTFUp+yJy6fkOWCVfTzG5ZKD7tcnuCAHOUG942k9/kzkdiTWN4SeTZds5I1t5ip9+q/kmdI1aA
	lzjOmwbULuvlKOY066Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwrq-0000000Do3G-2GYA;
	Mon, 04 May 2026 17:14:02 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwrn-0000000Do1B-3sjS
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 17:14:01 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-50fbd79350dso42718721cf.3
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 10:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777914838; x=1778519638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OpKhF7v0veecnKjbGBugILaGD4WV2r6Nl33+nrBSIA=;
        b=BjJhQ/v6lHylGHR5eYEf+Iki3sLmsxkP7FItiTew8klo5G057IKggcuyeYI4PjgAq0
         nD02KtmnNZLbMlUGKjIoQIr2CzED9s2k75OvhwDmq253q7ONaNv1jAvYDlKhJ4+U0DOt
         +oV03dGlI6K7ViyUp3BH00wkoEVwxhFXOOPQsw6CHQ5xCUZ7r8BZtQhollBKjf/8KKA/
         m3ICo+1nxwAZgVuhnR4DN22gK43CFffG2fBM3LHMETM7xPCOoPGmTimT53TZkw+bxAv3
         /QnXzW61FjJp6BaggZWTqYHhpFGunDVMtTeWGnD1Ed2+BG9MHjMUaeRR2TsM59vmy/EC
         al9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914838; x=1778519638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9OpKhF7v0veecnKjbGBugILaGD4WV2r6Nl33+nrBSIA=;
        b=JcEF89poS0akm1yASl74MF4LyZ7+SL/LHtSYorTpgfD292zOXiBfKAxgTSo9LHSRrk
         6ArtB8XUhqF9PoTA0VQ67dVzDqStrMmnP5jspArF3dVZwx1HtxbCZVUQAoyzKql4K7a+
         UJfzJ8Ph7NG7OKpcMq2VeW6riJQtFRluiT4W/IO3kBJtBRmW/Jgs4KWmiWCbYdmhiXL8
         EhB378p6C86Ao3voIb6TXDg6Vf1NFwyxHtVbewSs4iRHkuAQ6qu06L3LqbOcyY0edJz+
         SR7VtlKiMZrsIY7t63CeFhoMOpQUrYbu+6by9WH29/WaBMIOHSt/ACFs8IxdI3A1BXdT
         1cmQ==
X-Gm-Message-State: AOJu0Yyvda1Kkm56IeR7hBf1tQx6KuV1SqGKerJKMCZpTx+JV8G/x0AP
	Z8lvEnU61GXCCRvGDxRf8ATnT+4b/xYPZgk01SGeUIyXc4JWXiFKIvJqZhgtqgaopJc=
X-Gm-Gg: AeBDievlx7Zd4sEuIGAru9drtJ1b07SxyvpM424RR6gdWVIgdhddxdkAq1EiIasG/8J
	PLwQpiv+1CD3w0Z/qGcXdCXL9K53JBkgqP6H8U9BtNEc3VGe1RrzBbd51C61tFB9UGehTxUQTSN
	rJ8//bwt+4K4UbMQrE3wCyTJ2hxhrhyDCVxkyzIUS+ENeiiab4NfjQXX6LYLcwSVGKQz6z3wEms
	p1oux8JfSjmFosCfJQjAQyUZKnRq9ycLrnbujMlr8t27zCXZNWMznI/Ua8QtHla5K5TUjsJfHNj
	EeXQrufmFO0jXm3oQ/a/46L9x2phjDZShEAuNNxJm22i+b6wFR3Y2bdnNgRfkAw9/Ix0dYpZuak
	gVNhJ7CcyyFQ6SnIy5tJ80iDyElF4g+LnV7FBQ2OfgVXPxbog6VW9eCXw2IkcOMClawQ1EwpmQS
	1NMZnVFF60kS5GsEqj8/aA1wzwYP9IUj5ROVMKQKSWsl350wlQNpEH6pT8lLDv3ICxNv8VkQtSd
	SCiNXTWAaJJN/gFEdl7VQ==
X-Received: by 2002:a05:622a:208:b0:50f:783f:31a8 with SMTP id d75a77b69052e-5104bf428eamr152963271cf.28.1777914838181;
        Mon, 04 May 2026 10:13:58 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040927789sm102332871cf.11.2026.05.04.10.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:13:57 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH v2 3/3] [NOT-FOR-UPSTREAM] platform: generic: virt: add APLIC M-mode IRQ test overlay
Date: Mon,  4 May 2026 13:13:42 -0400
Message-Id: <20260504171342.1655882-3-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260504171342.1655882-1-raymondmaoca@gmail.com>
References: <20260504171342.1655882-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_101359_974919_4FCB6277 
X-CRM114-Status: GOOD (  13.63  )
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

Stock QEMU virt,aia=aplic delegates all wired IRQs from the M-mode
APLIC to its child S-mode APLIC, which prevents the local
APLIC_QEMU_WIRED_TEST path from exercising M-mode wired IRQ delivery.

Add a DT overlay that changes the M-mode APLIC delegation ranges from
1..96 to 1..9 and 11..96, leaving hwirq 10 local to the M-mode APLIC.
This matches the local test path, which uses UART RX on hwirq 10.

The overlay is intended to be applied on top of a base DTB dumped from
the same QEMU virt,aia=aplic command line, so the embedded child
phandle matches that dumped base DTB.

Usage:
- dump the base DTB from the target QEMU command line
- compile this file as a DT overlay and apply it to the dumped base DTB
- boot QEMU with the merged DTB and APLIC_QEMU_WIRED_TEST=y to verify
  M-mode wired IRQ delivery

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 .../virt/aplic_mmode_wired_irq_test.dts       | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 platform/generic/virt/aplic_mmode_wired_irq_test.dts

diff --git a/platform/generic/virt/aplic_mmode_wired_irq_test.dts b/platform/generic/virt/aplic_mmode_wired_irq_test.dts
new file mode 100644
index 00000000..8fb976b5
--- /dev/null
+++ b/platform/generic/virt/aplic_mmode_wired_irq_test.dts
@@ -0,0 +1,28 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target-path = "/soc/interrupt-controller@c000000";
+		__overlay__ {
+			/*
+			 * Stock QEMU virt,aia=aplic delegates all wired IRQs from
+			 * the M-mode APLIC to its child S-mode APLIC:
+			 *
+			 *   <child-phandle 1 96>
+			 *
+			 * Keep hwirq 10 local to the M-mode APLIC by delegating
+			 * only 1..9 and 11..96 to the child APLIC. This matches
+			 * the local OpenSBI APLIC_QEMU_WIRED_TEST path, which
+			 * exercises wired IRQ delivery via hwirq 10 (UART RX).
+			 *
+			 * This overlay is intended to be applied on top of a base
+			 * DTB dumped from the same QEMU virt,aia=aplic command
+			 * line. The child phandle value below therefore matches
+			 * that dumped base DTB.
+			 */
+			riscv,delegate = <0x04 0x01 0x09 0x04 0x0b 0x60>;
+			riscv,delegation = <0x04 0x01 0x09 0x04 0x0b 0x60>;
+		};
+	};
+};
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
