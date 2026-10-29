Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C5A606A31A
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I7yKZBSF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KjR81120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sZhSoV89gb2BEnyEev9fJVe/ou3j29TqMryQmdrh3rM=; b=I7yKZBSFPdnSuwkeokAcwzc5qG
	F1D79mk10z+FPp2jfoBVTs0OJxbm+g6Lt3yEXZD7jy6Mv8IhwjGxgLmJbroQpwEQzvG3Nqyb9H9Ab
	Q1gg3FIKW87k5OzWcUWXl389ddZoxW7Eu9kf9Nj2bWbVFuTu84fW+LoUpwnYs6F8lx85IPcSkHSf5
	Lx3IdFZnkhox44rZST79Ika5cm+gb0zX0aREH6SiVkPWbZZTHaGmW6EQfQBw6B6ZeCmoBOD2bTvwV
	rVjZhLMu0NbvP6rX2R3ZWVRR0DtOEu4w47WPw5VE2/yWiucg2maQ+VuewSeF+pODsYdlh6ToFCzbp
	9FPrB/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSY7-00000009ibl-0QcE;
	Thu, 29 Oct 2026 16:00:19 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSY4-00000009iYX-3pzF
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 16:00:18 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-5364d86f7f0so31714771cf.1
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 09:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289615; x=1793894415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bvly4r7tnyw8cgrcMSBlqWfdCsSAj9cDTGQX/hVIbXg=;
        b=KjR81120XxolVJ1PNo4qAIIylnKozx/atS9ir/Z87u3X0D8v5l0FlOy+ZKh2HlKQ8m
         MdxDp7Ay+FhfM/LTcR2LujpcShE2k788o3WoKH3kRYronzd5mD/PPEAWON8fMZRqB3Z7
         UOtNJFHTlOix25ko1bahhiyJFOVdJEP+bKNmh0MKwSD/HaR91K0eNcn98cj848d+SnLl
         D6SdHLS/9E7xFdX/V+QwEn89hAq7t5Tkm6ObdB0MWEjpwHqwKgFUKy34Pi1b/+JvFmwC
         o4tnl2MZXsjKA+aG+oRMUczUzd06rluU71uz1A0RxwXvfpYAAQydohpJT68q7c3DUNae
         4DvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289615; x=1793894415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bvly4r7tnyw8cgrcMSBlqWfdCsSAj9cDTGQX/hVIbXg=;
        b=rihmGwoluDlTTtM7NYcwdJ9tnK0Uh4oeW9SlTO6fpzRdHiTa5LonZnydNpnJqVbX0j
         ZNAQg06YPeE4Hntvi/wd0ug7KbWFb05K+qfL6Qrm5Z4wAegVK42yVdapQrYFJeXmBU5J
         7gtUkqYmWfgSwQONIKT9zgmewB2AeAdOA23CzQn+FTa+MSA2mOsclSx7VBsvcAXbTAsn
         7u/zAP6ePFTSvk2ehTBNg8HUcaOP4jzR6MR+HfPcsfuNbbJqNP9dAZBhIicbzaM6+682
         m52AImtXKT4yQZPr/2CuXcdi5+EPxniO9n1H+RQTJfMqf4Df3XREk4+Fl0l9/INh8zB4
         Oy8g==
X-Gm-Message-State: AFq9FYI6Z2BngexTcRMNqYSeq5+W4kQ44GbxcLxCjEZVcEnSrCKFSnlV
	tkSCfLgQaXSrE9uS5gF98uS+xbsZ/PRFAuSpW3wAybtI3Aqa4cLYBqPBcH63yw==
X-Gm-Gg: AYBFou2a+GZs3w4rb9u3j84/OsbtlcmhRTq79nWYEUg2AMLBUNWW7UHuZHXpWW5o6Hv
	ajyZCcPzYWw9kvraPxYWYy93eUzxWaZQgtK+/0B5vBX1AYHsI18FQ4Syiuv8zIXWmvvDb62aQMa
	k4oFGYU5feLdhGbxey9eGYsEn3nzAj+kiyjneSHa+82HQMa+RyV6Vr/7SOVQCkqtGaorTn7ogUY
	XkCIUocnPj6mv7pjJK8XeSimq+wrtp/Uur2/cckt2TWiOZ2gQezL9Vxxzv76+KfdylTWHcZLO4G
	WOaoXrZMZmDiTgBO93t/RSFwQHhOOq/VNWggCa8z4NHJ3bZENlOIDHH+LhkqlzJfKZ0Zrko1zSx
	Oti3+rmEIu9ArZscQN/02pMMD7mjMMrsOU8iq6g4++wJvmpJQBu43oxeR9jFNECvCzWW7+jPwnE
	KuqDr8N2ieie9KkBg5m1+UnJWmVcFW2Jln9/+0FBTDftt2jfWChrrb7fcLNgJm6awEFy0XTrzuH
	Ekmx0/oEsGq1jaZVZxG3YU8xzxcrzGIi0bKBCca/c5UdyolHkl2JN20LoTPcfHFMz+fV1Or5Xx2
	dqId29VZn7Sgtmto5rh0ReTcXgjCV1OuHEWHaB2piiKsCLP6ZRUDCtv1CAeweRQVIwLjXVHfocl
	5kbEVKiBTKrJBHQ==
X-Received: by 2002:a05:622a:1a88:b0:535:1393:a82e with SMTP id d75a77b69052e-53fcbee1fcamr98191291cf.23.1793289614865;
        Thu, 29 Oct 2026 09:00:14 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.09.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:00:14 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 11/12] docs: domain: document sysirq VIRQ mapping and routing rules
Date: Thu, 29 Oct 2026 11:59:28 -0400
Message-Id: <20261029155929.586597-12-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029155929.586597-1-raymondmaoca@gmail.com>
References: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_090016_968253_1AE87FAE 
X-CRM114-Status: GOOD (  12.38  )
X-Spam-Score: -2.1 (--)
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

From: Raymond Mao <raymond.mao@riscstar.com>

Document the DT binding semantics for opensbi,mpxy-sysirq nodes,
including how interrupts-extended entry order determines per-channel
VIRQ numbers and how opensbi,domain selects the destination OpenSBI
domain.
Add a SYSIRQ node example under /chosen/opensbi-domains.

Describe DT-driven courier registration and delivery to the owning
domain's boot hart. Summarize interrupt notification, claiming,
completion and deferred return domain switches.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 docs/domain_support.md | 55 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 51737218..a2d40024 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -325,3 +325,58 @@ be done:
         ...
     };
 ```
+
+### SYSIRQ Node
+
+The SYSIRQ node describes physical interrupts delivered to a domain through
+an RPMI SYSTEM_IRQ channel over SBI MPXY. It should be placed under the
+domain configuration node.
+
+The DT properties of a SYSIRQ node are as follows:
+
+* **compatible** (Mandatory) - The compatible string of the SYSIRQ node.
+  This DT property should have value *"opensbi,mpxy-sysirq"*.
+* **interrupt-controller** (Optional) - Marks the node as a virtual interrupt
+  controller when it is referenced by other DT nodes.
+* **#interrupt-cells** (Optional) - Must be <1> when the node is used as an
+  interrupt controller. The interrupt specifier is the VIRQ number.
+* **interrupts-extended** (Mandatory) - The physical interrupt sources,
+  specified as <&irqchip hwirq flags> entries.
+* **opensbi,mpxy-channel-id** (Mandatory) - The unique SBI MPXY channel ID.
+  Each channel has its own VIRQ namespace.
+* **opensbi,domain** (Mandatory) - The phandle of the destination domain
+  instance node.
+
+Each interrupts-extended entry maps a physical interrupt to a VIRQ number
+starting from zero, in entry order. All entries in the node belong to the
+specified domain. Physical sources are identified by the interrupt controller
+and HWIRQ number; the same HWIRQ number on different controllers denotes
+different sources. Each physical source can belong to only one channel.
+The physical specifier must contain one HWIRQ cell and one flags cell.
+Physical delivery targets the domain's finalized boot HART. The current
+registration path supports wired M-mode interrupt controllers with masking
+and affinity operations. The interrupt controller must be configured to
+deliver these sources to M-mode rather than delegate them to S-mode.
+
+OpenSBI establishes the channel mappings and routing rules, then selects
+domain boot HARTs before enabling physical delivery. It notifies the
+destination domain through SEIP and switches to that domain if required.
+The payload claims pending interrupts through SYSIRQ_CLAIM and handles the
+device sources before completing them through the next CLAIM or the optional
+Yield ECALL. Return to a previously interrupted domain is permitted only
+after pending and claimed interrupts are drained. This completion and
+return-switch convention is specific to OpenSBI's domain courier.
+
+For example, the following node maps physical interrupt 10 to VIRQ 0 in
+channel 4 and delivers it to the boot HART of tdomain:
+
+```dts
+sysirq {
+    compatible = "opensbi,mpxy-sysirq";
+    interrupt-controller;
+    #interrupt-cells = <1>;
+    opensbi,mpxy-channel-id = <4>;
+    opensbi,domain = <&tdomain>;
+    interrupts-extended = <&aplic_m 10 4>;
+};
+```
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
