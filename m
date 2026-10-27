Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E44606A32F
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y37s/H6w;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=RUuFB3JB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bzT1clmHN3vIX9Gg/jvJcZuYDda0WJUNUpbYroANq3s=; b=y37s/H6wv0pEbxBCNHtnJkzoPs
	WCEZpM/UqehC/U2sw51iSFqdTCnXLWu0gpVEiR/ExRfwVALzj2+WnJTWM5iWtEFyTeu/g3TRarPXU
	01HqyxGQJFnToTeCPe9dDkpONptR6s8b4EPg1Et8CCdEM8q5BCF6GPOTKJAkP5446Ioy9YsuU5CIm
	a+TKSxIL7H/ugIhSgFzHDpuC0Muz5ALVQbVavFbFyqhRnzcx3LMBGDpQ8jsNBK0yfdEZblNi9FUiq
	0TiLX5mzsks7msh5whkE0mgvd/946VSTi/KLKucceKjVXJPHk/ltOgHTty9/hJ19DvX33qS9vrTdJ
	H+BTz2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcfK-000000042oF-1Mgv;
	Tue, 27 Oct 2026 08:36:18 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcfG-000000042ky-0qII
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 08:36:17 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so2560071a12.0
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 01:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793090173; x=1793694973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUkNxr4kojPbLJn+zg5CTTWJXJGTfzHKedyEO6X9CxM=;
        b=RUuFB3JB4FoBYtKLDKr+SsXMSUWBNr+JYWOiYiSyiyCpczE6aeAIuhz9gcpLLdvDQF
         wdSoT6D9/w7P554KX/XvJs88pYAvgrLtEAiIFgFmIIiCjK/DQ1t+6RsS3bDkn8ikQV8l
         2SnoH21SLpx0FaawRm3XVNUW2CeFprVBlDwS++kvh6cT+205AoQEWWnAA/RaAYbDIbjq
         TvMNyBHTnq5R8Q8h3+fgGZhC5ZsWVXfo0VhWlxTHzsM0C8wTePh1WNzK+xkHmr87PJia
         8/hS0R48mj1v0qA0DqZoBLIkfIyp7mcAvGGn0mrRBFGvPiA/gb174Q26i8Y4fyhkvhqz
         gRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090173; x=1793694973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JUkNxr4kojPbLJn+zg5CTTWJXJGTfzHKedyEO6X9CxM=;
        b=aqVLbbORN957PnaCCQPFd2azCMwHeMy7FR47HNM4v/7bqYmntmI7s6wpc/5Oh5MarN
         BYHqW8gQnkBVQBu/b3hg1h6RwuvVYF6NkfEIbmwEsYHxBcpIcvZDzNc3Ae+txoilmvVU
         gk078iBD+BwKVViszDu0SBWrTR+HmU1yOwb4K9eabpxt8nSd5g3/smdBGjMqYj1oI1mS
         z68+R04C++EC4Ze3IIHSpgY04FIgTMxX06K2cq9o4KLyMG7XL/HWvUgcyB5+3CNf4fhs
         if3x9jgezXBPH6XWlPOj6piPEacjdR3IfAyE+cpfH5/KpsA93emlUXYXJ4BUjPDxOJyJ
         phwA==
X-Gm-Message-State: AFq9FYIxNSJ8dxT2b0q1vbSB+Rt4FRaj9cwJkPdMohjmvCHlHF7izuSi
	TbeVbrvuB0gUdMtXrizujGXj6xcHEllduRr3DC0CwBy9D4AarB0yGedEOjHZXz2GJ94vZrq+/sD
	YzJGOTgXH1XIbulEfg++5NKsqvIKUmNU3tx++Obt2DwoT8a8c9qKJ0GG13pAXqmlgHcC3Fst65x
	4vK+ecReC4FJwvWJZraeRXxUTwZRo44Lf8ES0dIOEI37GmsYnL7BY=
X-Gm-Gg: AYBFou1ZVpiUrb3OKzIdmbindU1K3QllIRngVXX86SYKlBQABhS3e+zgZYqapcaNc5e
	LMwOB3qQQ/55HTMZQrnjDHk+NUM3vlRGaCz17SIYyW2wsd54VEB7fP08xj70xdTWEcW2Sg7a7hR
	dOt95ALSwcmfSwKsM3E7WeBX3R6tqsbCoDquhrlivv7hj4fjfLor98jzhpvVp7//17QD7iRQDSL
	AVmy+okKUAtGXZ2gnXKomn7XReD87ut4uDu4TNk/Wv9GwVqqbaHec/YuUQRJf65jheVzaswz7H/
	rY/6WOQSOFOM7c7DBnoglKCFDKjxZs62L7950LiSJkXlFw11OSG2svXPzd4sWsqFvoIJvBb6NTD
	SFoiDOWcBQ/lHoGuA9lrQqmznMu/ioiaHXcgm1vX/VZYXWwk+Am4UZ6FnQDmF44TBLNSlr7t61g
	5pZatR9tdYCff6R270Dbb+sgsHE5t3+SpXWr35AXDvGt/ywyI4mPg4VkEOO1+cbY3viYgVgFCVu
	xcq5itYMcCLiZLn7SAL/kBoPl+z/o6n0ld7HhDWooXSAhOupGnxeA==
X-Received: by 2002:a17:90b:2688:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3adea899125mr7039642a91.19.1793090172996;
        Tue, 27 Oct 2026 01:36:12 -0700 (PDT)
Received: from localhost ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406153fesm2756254a91.5.2026.10.27.01.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:36:12 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v3 9/9] docs: document WID DT properties
Date: Tue, 27 Oct 2026 16:35:09 +0800
Message-Id: <20261027083509.1076577-10-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027083509.1076577-1-peter.lin@sifive.com>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013614_288123_E4DAA27A 
X-CRM114-Status: GOOD (  15.37  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
Change v2->v3:
- Mark 'wid' property as mandatory when Smlwid is present for both root
  and domain instance nodes.
- Remove mention of M-mode WID fallback when 'wid' is absent.
---
 docs/domain_support.md | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 51737218..54327e8d 100644
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
@@ -131,6 +135,22 @@ The DT properties of a domain configuration DT node are as follows:
 * **compatible** (Mandatory) - The compatible string of the domain
   configuration. This DT property should have value *"opensbi,domain,config"*
 
+### Root Domain Node
+
+The root domain WID configuration is described in a **root** subnode under
+the domain configuration DT node. This subnode does not have a compatible
+string.
+
+The DT properties of the root domain node are as follows:
+
+* **wid** (Mandatory if Smlwid is present) - The 32-bit World ID for
+  lower-privilege modes (S/U-mode) for the ROOT domain. If the hart
+  supports the Smlwid extension, this property must be provided.
+* **widdeleg** (Optional) - The 64 bit World ID delegation bitmask for
+  the ROOT domain. If present, OpenSBI writes this value to **mwiddeleg**
+  when entering the ROOT domain (requires Smwiddeleg extension). If absent,
+  clears **mwiddeleg** to disable S-mode WID delegation.
+
 ### Domain Memory Region Node
 
 The domain memory region DT node describes details of a memory region and
@@ -205,6 +225,13 @@ The DT properties of a domain instance DT node are as follows:
   whether the domain instance is allowed to do system reset.
 * **system-suspend-allowed** (Optional) - A boolean flag representing
   whether the domain instance is allowed to do system suspend.
+* **wid** (Mandatory if Smlwid is present) - The 32-bit World ID for
+  lower-privilege modes (S/U-mode) for the domain instance. If the hart
+  supports the Smlwid extension, this property must be provided.
+* **widdeleg** (Optional) - The 64 bit World ID delegation bitmask for
+  the domain instance. If present, OpenSBI writes this value to **mwiddeleg**
+  on context switch into this domain (requires Smwiddeleg extension). If absent,
+  clears **mwiddeleg** to disable S-mode WID delegation.
 
 ### Assigning HART To Domain Instance
 
@@ -260,6 +287,11 @@ be done:
                 order = <64>;
             };
 
+            root {
+                wid = <3>;
+                widdeleg = <0x0 0x0>;
+            };
+
             tdomain: trusted-domain {
                 compatible = "opensbi,domain,instance";
                 possible-harts = <&cpu0>;
@@ -268,6 +300,8 @@ be done:
                 next-arg1 = <0x0 0x0>;
                 next-addr = <0x0 0x80100000>;
                 next-mode = <0x0>;
+                wid = <1>;
+                widdeleg = <0x0 0x6>;
                 system-reset-allowed;
                 system-suspend-allowed;
             };
@@ -276,6 +310,8 @@ be done:
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
