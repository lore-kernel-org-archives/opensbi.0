Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AC9CD4F25
	for <opensbi@archiver.kernel.org>; Thu, 14 May 2026 22:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUvS+7+JAVvAP+rf03B2zpc1STEfcY+FldqYKbkJDsI=; b=PvHRgy2vXf0TIi
	Ajrq+N0QmYoY4Ydl+nk3o5oCtkBl+PbsqJadfUqANEPefurCTjN99MtIFLn/A+S+efzLCtOwDCrPl
	RfGR3cVWTSiuYLX3rflUdQZrOZvfs7ZYiR+6VlLc/FpiIo+g1tSWlAYSvvm6mUx7nf4tZGazIo1Wl
	5y0G9xkoXej3xYC6W5YFTIL2kycvrHtWd6yJseMhb2qvo6krZBn7JIrPw6z4neGpogyZSpb2c/V9g
	6GlxLitjpKXN6bLVzz8AWzEhpyurEC3p6m8HBmKWPNqomNgJgTgAf/LGuLSnR0qfxaEWgkv7qJsgw
	nijpDP3a/+MrkjxCE/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0m-00000006mBY-3pjp;
	Thu, 14 May 2026 22:58:36 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0i-00000006m8J-45uO
	for opensbi@lists.infradead.org;
	Thu, 14 May 2026 22:58:35 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8b62ca1d28eso77670616d6.2
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 15:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778799511; x=1779404311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xdel0L/64wKiBde3nf3Y99ReJ7QHBII3eBLTkTQ3LKU=;
        b=pKs9s4t5FlrOXyvPiHwOvkis9MjOOhKdxVQSPNHjVNwMIuPLt0NNkn9+gfV0iXz2ZZ
         b6PxyfAeyOY9hRvo7/3PfJmasV15y9esyh96oj6xcbu/2xZDnhTHXkaGCsfMiqH6C7Kb
         fOZ3whrbT2CKhbYNvjDq3CBWA+fS7TPWm/1Et8IoiH8w5Cbp2Gf8MF3JAxxklKZFeaiN
         9jQgXidGtkvkPPlRyiDwOxbcFFTkDtleKzw6nJJkI/ohXXQTQ+LMlqP9Dvaz9XUk2AAs
         Pu0DudrPFJ0yrZsztfqg8FAO0uXeSFN2ZgAesG1IDye06so8ZOim541RgAPpwaIIojVc
         b9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799511; x=1779404311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xdel0L/64wKiBde3nf3Y99ReJ7QHBII3eBLTkTQ3LKU=;
        b=Gq9SbnFRYVUO1BILKuLOscNuKVOjZHMq/G1nXSruHp92VaLFRZCe3kthDmHz7geeax
         87PGqVIm0ac/CpGhiNgbajEFfLCyFuhXoZaDlftB9Y1ol/n7eqyJW/IxgrSOQNv5OMDA
         Yi3O9j+qBVpsLM9C3DZGTU1ZYXbjoI1hQ2/FUOEqNU1Wq+f4bBTHaCagvWhlEqs36y0P
         h+oLkp+YDHz12M/4KclJjTuw7Gg8iSZmehyGuRzJHMUOUU9MIwGoyR7WctqZywOuKNo9
         JSjOv5mfV5VTSbr9NpGoYAQZN/arzNW1HbcWQ6htplgc++EXEEsD7rhEnnXFIpM5eM3M
         cgtw==
X-Gm-Message-State: AOJu0YzPBxdNWP/JZKUKjllM3qogBixq9sQONJcPGdtlmBW6F0M19H7U
	DhkDwBtxSOKj1hz7SC3R1gBX2NjrByM1h1mbijsNK4SZ7uvAFMaouASqCy6AqA==
X-Gm-Gg: Acq92OHq0nvQ+7q+gRtcgcu6zNhpnH6z7iwS90EgLZOnflhoEXVK9O0XW/NlXUbkFcD
	L4b3mYcJsJS518Dj3KPbtdkj7RFFJSTqIKKHoPKExWLCcpqIl18MMn+aA2bl0Cb7Sk+rlXK4/0W
	XaFeJWcWmrMyafvXw5vccvxaCcSD3bHGJQxgWaHuipNKNoo8IC7V3+hyQ/aOxfn21Nx7BdLWgQK
	bAKP+bzyZwrUeLDV8FRaSD1+Kdea4tiexNicfHEDIVraK4HHHtHkz4XyN17ZhSBGaYL+ODiZTpc
	lxl/FS+nYWJHYRCS/QtALWO26dpK6B7oaIMaHVCHyfOySWJSwGBj7Y1qbXsk6jzN5YrcZXqwx1x
	jhqKRzEs8tnjv22zp+/sCTlBlFso0FFgiK1k8hN9hgteOlhGc9B58cJ2dizzANPb9yXXi0gz6R6
	7gGKyVqPKU4dgXEIuxzlLe39pwCugDoiP1DJVf6AQnmUhvauOsKFPMOQuwzzfwhRkw0xJvrpt68
	X4Hl3Q32TQ=
X-Received: by 2002:a0c:f08f:0:b0:8ac:a5bc:a6b4 with SMTP id 6a1803df08f44-8ca0f6f9a59mr24611586d6.36.1778799511386;
        Thu, 14 May 2026 15:58:31 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c16366csm34974426d6.40.2026.05.14.15.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:58:31 -0700 (PDT)
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
Subject: [PATCH 10/10] docs: domain: document sysirq VIRQ mapping and routing rules
Date: Thu, 14 May 2026 18:57:56 -0400
Message-Id: <20260514225756.2255758-11-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514225756.2255758-1-raymondmaoca@gmail.com>
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155833_050314_53C8A77A 
X-CRM114-Status: GOOD (  14.53  )
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

Document the DT binding semantics for opensbi,mpxy-sysirq nodes,
including how interrupts-extended entry order determines per-channel
VIRQ numbers and how opensbi,domain selects the destination OpenSBI
domain.
Add a rpmi_sysirq_intc example under /chosen/opensbi-domains.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 docs/domain_support.md | 63 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 93186c4a..8d474e50 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -198,6 +198,48 @@ The DT properties of a domain instance DT node are as follows:
 * **system-suspend-allowed** (Optional) - A boolean flag representing
   whether the domain instance is allowed to do system suspend.
 
+### Domain SysIRQ / VIRQ Routing Node
+
+The domain configuration DT node can also contain sysirq routing nodes for
+describing how a physical interrupt source should be mapped to a VIRQ and
+routed to a target domain. In local DTS overlays this node is often labeled
+`rpmi_sysirq_intc`, but OpenSBI matches it by compatible string rather than
+by node name or label.
+
+The DT properties of a domain sysirq routing DT node are as follows:
+
+* **compatible** (Mandatory) - The compatible string of the sysirq routing
+  node. This DT property should have value *"opensbi,mpxy-sysirq"*
+* **interrupt-controller** (Mandatory) - Marks the node as an interrupt
+  controller for child references.
+* **#interrupt-cells** (Mandatory) - Number of cells used by this interrupt
+  controller. Current examples use value **<1>**.
+* **interrupts-extended** (Mandatory) - The list of routed physical interrupt
+  sources. Each entry is `<&irqchip hwirq flags>`. OpenSBI interprets the
+  entry order as the VIRQ number within the selected MPXY channel, starting
+  from zero:
+  VIRQ 0 maps to entry 0, VIRQ 1 maps to entry 1, and so on.
+* **opensbi,mpxy-channel-id** (Mandatory) - The MPXY channel identifier used
+  as the VIRQ number space for this sysirq node.
+* **opensbi,domain** (Mandatory) - Phandle to the target domain instance DT
+  node. All physical interrupts listed in **interrupts-extended** are routed
+  to this domain after being mapped to VIRQs.
+
+The resulting VIRQ rule for a sysirq node is:
+
+* **mapping** - `(irqchip phandle, hwirq, entry index)` from
+  **interrupts-extended** becomes `(channel-id, virq)`
+* **routing** - `opensbi,domain` selects the destination OpenSBI domain for
+  all VIRQs created from that sysirq node
+
+In other words, a node labeled `rpmi_sysirq_intc` typically means:
+
+* the physical interrupt source is described by one **interrupts-extended**
+  entry
+* the VIRQ number is the position of that entry in the list
+* the VIRQ namespace is selected by **opensbi,mpxy-channel-id**
+* the destination domain is selected by **opensbi,domain**
+
 ### Assigning HART To Domain Instance
 
 By default, all HARTs are assigned to **the ROOT domain**. The OpenSBI
@@ -270,6 +312,27 @@ be done:
                 possible-harts = <&cpu1 &cpu2 &cpu3 &cpu4>;
                 regions = <&tmem 0x0>, <&tuart 0x0>, <&allmem 0x3f>;
             };
+
+            rpmi_sysirq_intc: interrupt-controller {
+                compatible = "opensbi,mpxy-sysirq";
+                interrupt-controller;
+                #interrupt-cells = <1>;
+
+                /*
+                 * VIRQ numbers are assigned from zero in
+                 * interrupts-extended order.
+                 */
+                interrupts-extended =
+                    <&aplic_m 10 4>, /* VIRQ 0 */
+                    <&aplic_m 20 4>, /* VIRQ 1 */
+                    <&aplic_m 21 4>; /* VIRQ 2 */
+
+                /* Select the VIRQ namespace / MPXY channel. */
+                opensbi,mpxy-channel-id = <4>;
+
+                /* Route all VIRQs from this node to udomain. */
+                opensbi,domain = <&udomain>;
+            };
         };
     };
 
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
