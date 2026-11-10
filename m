Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A34606B9D2
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oD+/Mfzc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ec7KvEK9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BU5knm1mXSVNPAqhksfjP+/XzelDxe6x7azYtSOLvNU=; b=oD+/MfzcZV5zTUEKxpow5OFSps
	V+tJbAbb1+Nt37oskXnVhmDwyIIhir/kq4nBazcY6BElkKul++HVkif8oEMhBtSoRIfaxJdyTQR8U
	o5CRlHcq+kt3KI6fdfaLVLoJJyEUwpnfGaA1HhxCP+c53rXXxiLCGH+XY0Tfxx8VYBfycIckkacT6
	baVU1tynVnhp6nhUTz0O1JdVhNt/vwWRiNgHI6U0fc1Mk51dx9irlaoygkoqqs4ldAuwefyJddi1a
	RPH4YQMY2Cy4T4sO4Wm2FUV7k3B0mx7IvrYWOLOM4imwlytgWJ6yvrRtdNm9y8AcaUiwsQp5BYRuR
	DPIEhTVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiVP-00000003LjI-3VgW;
	Tue, 10 Nov 2026 09:51:07 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiVH-00000003LbZ-3Uht
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 09:51:07 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2e9d7791b00so15370325ad.0
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 01:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794304259; x=1794909059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNWNMMUM5AajDQN4+kLNZ/oDVK0VKTjX+MJuCX2I8ek=;
        b=ec7KvEK9k1fVx+eIJErNshF/yC4P0M59SUS3X9v4O7R7DWZP3JxLLWBYko0ll8pFv5
         T8t+AQhnd9gXsAz/OtITyWUuE4xhAMcOIwBpY/jNimOipVDGDzSHm0JsdVbq5Ulj6Wjb
         2jtN9CY71zIXeF8wabnC5YoqHFjtIknuHR5qJ3YVdqctcCD1zj2s/UIn2l1wrgB4JH69
         mZIeMuVUosbjMGi7G2uyJYD6NN6yxPIbo9+DkSXnKt1RKrPKTR4W1oSU2IkpMf57xnvM
         /WP4PNiz5ahsRdRK/x9Vdnr8bgEoAwQfKtF2QPA7u9j/E8ULC955o3rpPlCvgQ0ieafr
         dkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304259; x=1794909059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNWNMMUM5AajDQN4+kLNZ/oDVK0VKTjX+MJuCX2I8ek=;
        b=flYF1H4v0144LiYJR330x3A2QoHELI5XzcKJw/7QCNVxZ9Cissf1Y6QOOKhpUHTO7U
         3ZS4sMzw4IgosgNqQBZSTlr8wUC333sGjkzz2pQ3TFXtosJ97/RIlZf+EbSVV/o/BamJ
         aq4u3a2V7b/hqeu65KftAwJ8QIGJOn/T3qtIwSDpUz28VBCxlfg0xBOpi3JpxEMZ+ESk
         d00I9oyERt1EEJtHm9RLrSqLSyCUT8Ppil/9z9l8WxcQov2GLWjize6gIgLua/2uYps5
         N4dBhxznpu/jSQLksHH7Qp3Vwrvoq//qlRbnlKrY/hpDtRK89yIOT44qFdg/M72AOXSW
         5GTg==
X-Gm-Message-State: APuU4Z/k865jgVmcBhH51ExoznK6sZ9VleG2GY9LOy8IzxR9WzlRjwYQ
	kSRpuJIVLEn0vZ2GJ1mm2fWP7xK2Kqm/m2tv90etGb+k83XY10JBmZgjIubH02P0idSZBYqO/9Z
	4kV1Vo9cD/LDav19kJzJLyMj/caO1JsUTbb0dcWKZLmFIBdF64VlYc7Kegb+0L2F1nN+Lr6pMH+
	U/sJ2aTwH3ppQ6lTT6ihykAe5QXMdIivcFfW1L+u9C+IgXwmAIE9Y=
X-Gm-Gg: AYBFou1v4Yq/5FlFXzQNA4DyjZAD44YL5Gy4COAh8fAT03v8rbti6rBcaKg+6hXgPhu
	cf0VrUu4YnxfLNycPsZmxCXrOgl5V7mKJ9W1IWwExfTwRo/EWZJuCyIrLN9ZAs/mVCvHCU3t5PA
	h+cLnJifclzXfvp/5N6vGWMHcZMTqlFU1NSaguNSf5tvIWnmTGuUjHn/5knIBZ4DObf5u6H6jDo
	WWH5U5prMK91hwhMMXs/l9pc1e6XSgOgauygXQGOqsIvxF0AOIqp8bZNejG2ieHlQ1s4QeXj94E
	+eUJm6/xMEKxIIshWWAI29LFuDdOBf+5pd3mnyCGWPEAOO/kIaB6lDGJFSo3/2U5DGnTmqtg6xy
	YHXtzbh9vMypeKeH+7aX7ea7Txo6cHx2+inUOpcpsC8l4SLW17D9vEtKDuqoIx1tEqS+QFcnxcC
	KZ//I+1FMFIvBBEZMOMAy5+QEUIYzjImQ+oePbjOmrIMRv8X/7oIOnDg47dgtzpzO781QpFWLKj
	VNfkwJYbJqRiarhwSMOWsnGH00njDqEpHikSlUkZyDLFTy7fBIWNULrqwPGGcFB7L39pKJDE1rV
	T0CvbYY1l3b7KTBSBIvoD6oo7caZ
X-Received: by 2002:a17:903:1ad0:b0:2ed:2475:e413 with SMTP id d9443c01a7336-2edb92f56e2mr17171345ad.74.1794304258718;
        Tue, 10 Nov 2026 01:50:58 -0800 (PST)
Received: from localhost ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm7079865ad.50.2026.11.10.01.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:50:58 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com
Cc: raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v5 9/9] docs: document WID DT properties
Date: Tue, 10 Nov 2026 17:50:29 +0800
Message-Id: <20261110095029.117504-10-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110095029.117504-1-peter.lin@sifive.com>
References: <20261110095029.117504-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015059_887033_6076C4ED 
X-CRM114-Status: GOOD (  15.08  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add "wid" and "widdeleg" properties to domain instance node
documentation and example DT. Add a "Root Domain Node" section
describing the "root" subnode under the domain configuration
node for root domain WID configuration

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v4->v5:
- Document wid as less than XLEN and widdeleg as at most XLEN bits,
  instead of fixed 32/64-bit (Radim)
- Drop RB-tag from Anup
---
 docs/domain_support.md | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 51737218..189f3ca9 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -56,6 +56,8 @@ has following details:
   domain. This can be either S-mode or U-mode.
 * **system_reset_allowed** - Is domain allowed to reset the system?
 * **system_suspend_allowed** - Is domain allowed to suspend the system?
+* **wid** - World ID for the domain
+* **widdeleg** - World ID delegation bitmask for the domain
 
 The memory regions represented by **regions** in **struct sbi_domain** have
 following additional constraints to align with RISC-V PMP requirements:
@@ -98,6 +100,8 @@ following manner:
   is the next mode for the ROOT domain
 * **system_reset_allowed** - The ROOT domain is allowed to reset the system
 * **system_suspend_allowed** - The ROOT domain is allowed to suspend the system
+* **wid** - Configurable World ID for the ROOT domain
+* **widdeleg** - Configurable World ID delegation bitmask for the ROOT domain
 
 Domain Effects
 --------------
@@ -131,6 +135,23 @@ The DT properties of a domain configuration DT node are as follows:
 * **compatible** (Mandatory) - The compatible string of the domain
   configuration. This DT property should have value *"opensbi,domain,config"*
 
+### Root Domain Node
+
+The root domain WID configuration is described in a **root** subnode under
+the domain configuration DT node.
+
+The DT properties of the root domain node are as follows:
+
+* **compatible** (Mandatory) - The compatible string of the root domain node.
+  This DT property should have value *"opensbi,domain,instance"*.
+* **wid** (Mandatory if Smlwid is present) - The World ID (must be less than XLEN) for
+  lower-privilege modes (S/U-mode) for the ROOT domain. If the hart
+  supports the Smlwid extension, this property must be provided.
+* **widdeleg** (Optional) - The World ID delegation bitmask (at most XLEN bits) for
+  the ROOT domain. If present, OpenSBI writes this value to **mwiddeleg**
+  when entering the ROOT domain (requires Smwiddeleg extension). If absent,
+  clears **mwiddeleg** to disable S-mode WID delegation.
+
 ### Domain Memory Region Node
 
 The domain memory region DT node describes details of a memory region and
@@ -205,6 +226,13 @@ The DT properties of a domain instance DT node are as follows:
   whether the domain instance is allowed to do system reset.
 * **system-suspend-allowed** (Optional) - A boolean flag representing
   whether the domain instance is allowed to do system suspend.
+* **wid** (Mandatory if Smlwid is present) - The World ID (must be less than XLEN) for
+  lower-privilege modes (S/U-mode) for the domain instance. If the hart
+  supports the Smlwid extension, this property must be provided.
+* **widdeleg** (Optional) - The World ID delegation bitmask (at most XLEN bits) for
+  the domain instance. If present, OpenSBI writes this value to **mwiddeleg**
+  on context switch into this domain (requires Smwiddeleg extension). If absent,
+  clears **mwiddeleg** to disable S-mode WID delegation.
 
 ### Assigning HART To Domain Instance
 
@@ -260,6 +288,12 @@ be done:
                 order = <64>;
             };
 
+            root {
+                compatible = "opensbi,domain,instance";
+                wid = <3>;
+                widdeleg = <0x0 0x0>;
+            };
+
             tdomain: trusted-domain {
                 compatible = "opensbi,domain,instance";
                 possible-harts = <&cpu0>;
@@ -268,6 +302,8 @@ be done:
                 next-arg1 = <0x0 0x0>;
                 next-addr = <0x0 0x80100000>;
                 next-mode = <0x0>;
+                wid = <1>;
+                widdeleg = <0x0 0x6>;
                 system-reset-allowed;
                 system-suspend-allowed;
             };
@@ -276,6 +312,8 @@ be done:
                 compatible = "opensbi,domain,instance";
                 possible-harts = <&cpu1 &cpu2 &cpu3 &cpu4>;
                 regions = <&tmem 0x0>, <&tuart 0x0>, <&allmem 0x3f>;
+                wid = <0>;
+                widdeleg = <0x0 0x1>;
             };
         };
     };
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
