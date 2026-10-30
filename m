Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2068F606A31D
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 10:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rxdlMl1c;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BPnQzVHy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Fynu2DrA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p3InbfrMdxu8ipE56XDxJx1q8eNovCIHQcIDY6ai9Fw=; b=rxdlMl1cwQ9U2u4f6ck4u08yNj
	RD590gorhOm5qmImDmcNZDsall761wLJAk9exrVD3rxOOKmsd8lVux39kiaNACHnFfATxSkfwbpoA
	LiKqJ6sA6BJtJO2NhdNXOt6Gz1Sz5lvyln47zvKofAuJXPquuCRxRru8PwxF4eGhCUyUvqQ9n6Hg2
	16ZKiOH6OmMInQg4DyPRmAGvVkqUpK0LhL07/WgmlvgtOWfmOKFBwo061lqH87Aw4LDncUveJwUR9
	mcZB2ZMaQ154NBo+b3EAI4HiyEy0EEaaB9JPSIF/m2s+IQEF1UnQVpsm1Wtd4959aqCyC4lD5I75N
	6g6Ps7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7W-0000000BQzR-3e14;
	Fri, 30 Oct 2026 10:46:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7U-0000000BQx0-3SmD
	for opensbi@bombadil.infradead.org;
	Fri, 30 Oct 2026 10:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iU0RFfzCJVCJSGhlY/ptJv1KVomLAcofMQu/ydnXsTI=; b=BPnQzVHy96KrbCOmPvs9fRdvZ6
	cfVPNXKYV4iBLv7qSCSwWLpKY7NKUS8f1lGdqsS8n2iIJzO2A59OwWh8j8J5U4djMRkFVbnqhC3Pt
	Os2nRPmCBUo6kZmQsx2SDO1ZEFO/8sieOUXyCQfw0Q58sKSQjHEM1aHgyaMW+1fw87JBZXpM+MHzN
	lFzLOtD2z01zd038iamIvun2oakJG+6WMRPOrgAxF6jRzrBd5nlejXlQeOO4oSD0L7mtAw7VAqNlb
	7EOA6cA7N6ZWAAiAeWyqFqEbPtcgqruwI+9aZHfhyFlhWafkmt2B9nvIps6NTDCqALA5Ybq+rEsvj
	vZ8gsynw==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7R-00000000EsY-3Oq2
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 10:45:59 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so265534a91.2
        for <opensbi@lists.infradead.org>; Fri, 30 Oct 2026 03:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793357155; x=1793961955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iU0RFfzCJVCJSGhlY/ptJv1KVomLAcofMQu/ydnXsTI=;
        b=Fynu2DrAI423ujzrAf7GcGD/76at85goj4kbUAviwtPG7dM/7xcjT3ZizF4202HPjm
         8CTERvMMqoTxxNJyCycUYxdIZa6huz0RO961rN/ehOfcAjkRxLGsIXvrACjhtljuiA8G
         h4P9sXkI4UlHnQaHkyM/1Okx0ouuGjUaxDtJlqf8KLElGUYR/X//brY35LHWwi+nY+Rk
         3jlxcItM/CT33+Fhe2nKJyKERnSB1CQ3vynQY/9k2zoNiTKp1TIfr+6zBsp44F1P2iVS
         Qj5E/VPmMOL5+0WrV9LgzTVuJC0TWwz+E4ndGaAQaT6MgQVs5F/fcWAHH6+mBx1p5VNO
         skVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357155; x=1793961955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iU0RFfzCJVCJSGhlY/ptJv1KVomLAcofMQu/ydnXsTI=;
        b=Q2ZtPFcgi79EGIDSBgjLrJ9ONmU686EqQQvRC/u1KPTlJXxO2wYSU4pYMkKXK7e8fu
         Q2UFGETDxeFruQdjUyKZ7XLmaJIf2h/Egqbt0V+Zdf9Lby3ZFBpG9f6SpEshjuVCs+QM
         PwXkVmObSjsZMxZJCX2Y4WROxZrVDMffNi8GNjPfTyOrLgPmieRNwnO9gMJCxS/Xolj/
         0OIMAPzvH8ZLcGP6bAo3iBTVeHglas6ivmpB2+XtqewfVauYMx+atI1xHGVt4Hra+ICP
         +trU+0knVG2uZa5MEgzSxjIRVklB4DfZPkYH7Ff71gKBjRI3if0Iz0TnI98tnSYInDHs
         ZXyQ==
X-Gm-Message-State: AFq9FYLldwETdlP+06IVXwqhqowglWUogs98EugmqbC9gDpiAJ/dxFgc
	zb8T8L0L03O8h3tHD0mYklOYaEb5Mh081byDDzKkgZMIvVfEurw95vCwcrh7ESdTsRKPNrjWL+w
	A7x2O9kpkZfXFBLnyG4A2udcXjcVPrGnc+gMnyi8U4PL+rmsf+6EnjpuZvbEsAgFyRwxYmBipPr
	LANNlbUFTFrpr0NJ2T1jsf/D1Gswite8jIuxcdMl2bf/h+xKwj
X-Gm-Gg: AYBFou34uO++MTni0khoXHKBIzHTZnPuxQ24x/bWzat9vIIS8I3n/JMeubU2HwCb5TG
	ELJcZTsrbe2aAsQgpUD5BSmAG13mIpnrN0qi0e9C0zoqFn8Xbzmx8pYgFvOSPgNabT18N/Pmzkh
	rSyWNxneNhQaKyFtmXZzVZOwB7WEQLbojCRWwNe1/jLabIYlYFXWK2MzJxWRbg7OO8zauBwQoOX
	+himXhg/uaXw6FBSOVQ58nrRasWnBelCgxsPoToPAn3LXB77Ujm+m5HvUuq5tcG+rnZwLJC2ouW
	YTg9ckSPMR9V/zm7h+h5EI2IxjSwqeERBZbWUxCQa2eFFrdtPKpm6geyyWgeTz4VgETsL5mFAqe
	+EyE51hc0W4VTbziPhCsyFguz0AvciGPRVByJiUoOn0JxoWAiFXlTvMrUQLQqCDdCcN5t9oU5hy
	2hpAzg4YDBBhYXRpNTBbJPApKZDguD++y1+BIL9LYyYTTB6AffEbfQGIBnrx5arB031+OpPYo9G
	EdjUWq44qDQfda8+xvjVnQRaF5d6BryybACPZmk5ueiwWQ9uLe+arYemI/otcDs9JxL8+N4pc19
	QTFX+qKcH6zy6FdBaejIEcvwOGQ=
X-Received: by 2002:a17:90b:17cf:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3ae8976a451mr1517338a91.35.1793357154141;
        Fri, 30 Oct 2026 03:45:54 -0700 (PDT)
Received: from localhost ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87fc548fsm1560903a91.4.2026.10.30.03.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:45:53 -0700 (PDT)
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
Subject: [PATCH v4 9/9] docs: document WID DT properties
Date: Fri, 30 Oct 2026 18:45:18 +0800
Message-Id: <20261030104518.3297875-10-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104518.3297875-1-peter.lin@sifive.com>
References: <20261030104518.3297875-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_104557_954939_18FFBF5B 
X-CRM114-Status: GOOD (  15.09  )
X-Spam-Score: -0.2 (/)
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
Change v3->v4:
- Make compatible string mandatory for root node
- Drop RB-tag from Oza
---
 docs/domain_support.md | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 51737218..ed62a6cd 100644
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
@@ -205,6 +226,13 @@ The DT properties of a domain instance DT node are as follows:
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
