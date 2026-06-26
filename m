Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF6CCD4F26
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRgqQvC5RpxIg2eBU1dbQdFOoyoI7HTOtv4J2bZ6in0=; b=ldaP0cHo00mA59
	cZKKbffGlUynlEE0kkhMVxNSfHaidrqK211tI29X4UmvPy2X4wkYSdX25xQxWDgyOWOEwl+5PsBAi
	dnel+di+8TYAuSXF2O31qgd7TXTjADz/lC39knrxIFm/bNpgsMwpdAq80VHxWpIayeH8F9ewdsqcu
	Qq3/l++eT4cp14PR/vm8R96yBo4Pa96DBm1VlLFJ+cM9TU3Z4qmwlG2Wu3WT8Ad8yOsXGZaVf/UFA
	xW2qKX9SDSgtBWwbokVtbbVqfC7QZMQKz/8z0Yt+1slCN+bGy8P+HKLdJLXHqd3iwi9+PKdBoQgxz
	CgG1a9UV4n5Nx1OQo3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cK-0000000B4WV-3dSb;
	Fri, 26 Jun 2026 10:17:00 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cH-0000000B4Sl-19jU
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:16:59 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-842358aaf36so320438b3a.2
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782469017; x=1783073817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBe+Lra2sE+CWK19HbsDpMcmYiFPistZHnUo50AqciY=;
        b=E9XWpybWpRBauPiwU9EV3c+4X1pXXJPNUljmZ2P8uYkZ1O7VDo06hpK8uYbq/5wJLp
         1H4lszn8Fa50ffBPX8wJmgaUK2fprDLY2kKfYz1h32VUdUZ6OxAwwJgkhuPOnozQmRx/
         dWzGRP7UKGkUjrrWnBKJuBTEEbIm4nw9SUyvtyZssceteZeejseYbjEXe6mgfE2cxoi5
         kEl/ytrd+9hUupRMkqx0IkBXO9zrvBaKhsn8BVfvKSHaWeb6vvcnD/QBKyRCMx1tA+5H
         Z41oCg3OnMCBeFgdedQpxVsecZ6tNbNNntz/0bTTCis12UgROs7ighpXvCDqRL3GFAvn
         2t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469017; x=1783073817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SBe+Lra2sE+CWK19HbsDpMcmYiFPistZHnUo50AqciY=;
        b=HVvfsvPLvMUE26iUU8eiQGb2p4tyTkjDiTCRU2VStvXQNh+0RmR4YwZKbjKRqPcXQQ
         FE9o7Nbhz5LwypkBCHERlNCxPBx+iYi2DBKBFrLv2QTnochI6BqkaO25eUKyZR1Lfr4O
         JKBdK/gsUeHDCkfxiZ9Sd46UX9Kk9LL8G+o/QfAL7Q9UyiGAAlspZW7+lIYmaxfIJ2KD
         0cy+XLn6zOEHh67Zs8W3vw1qhFpAW6l/efsFFZT1aQ9Ri4vjYrvYnVJlyPfVHe7JDsn2
         D7ivzK/d4Z+Ks2Nc7ynPOjFaC2yS5CKNFsXOcuxrFysh0dXf5gmTituKaSGVdev1Owy1
         e1Dw==
X-Gm-Message-State: AOJu0YyKBA7dIX3xrIH+hEOtEAlvx71HzYBddAVjcYplEbewMUIFIBtu
	Tj9GKslNjS9lhVNlnO6cwMMumUh32RuBSo+PkDyMTjozM3TNr5V7L4ipGh+o/P1HV3cfdhEZ6kW
	KMPspcLvpoib22bI/L4psmf1TY7qSJxSOL2a3fk2E0QbkzBdguWZg5lKpphk6AYbq6Pe7VkWWiN
	J/8Cz2sQPsJ0vj/wIxE2Vcjh5fU75qu1+aoaA+3QIA6Nhcz4gWdxc=
X-Gm-Gg: AfdE7ckITK1fBewChcVG4DUZXda90WfTY4lLVKLYVuU9z8ymNCeEojwMm2GUFSEVOFt
	r15iOwB0vvKMVI7kXuh2zkO7kzmRRtG0MxQJInvQ2iTINdCjXcxLBVs7tsRhc8gpwc09GEUouNr
	XRyC2ljtUxdRWg7fZCfmXQiq49cC6nYrfltzjp5DNwHzOltM0YdFXJexRYHQNo+jZBVOtKkWIkE
	57goGMjMoV7y6Z1rWAv5zYN2hdmUM3CwxzYSEDTT1ycMzhQVzf1HNRFq9gdb4jNT2zhX4yO1Jk7
	728KSeNH1AyXSg2bMg1iPppEYFTVB/XyvS/Kj7O+9Cc0aGb6CG6p7FYtCtfyXuJYjekguy67ZGn
	q4xT378zjLZY+Zi9RhEAIgTfUCef5CjitSgu+MqcapzVJjPUVN8925OvGZ1OVel4yH6zdJAXwpK
	GCX67wquQHWQPDu6T+P0Gsx1Ylffpv9dg5rVaC
X-Received: by 2002:a05:6a00:91d3:b0:845:b736:c468 with SMTP id d2e1a72fcca58-845b736c6bbmr5358181b3a.48.1782469016368;
        Fri, 26 Jun 2026 03:16:56 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:16:55 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 07/12] lib: sbi_domain: print World ID config at boot
Date: Fri, 26 Jun 2026 18:14:28 +0800
Message-ID: <20260626101433.3133466-8-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031657_365024_37913BFF 
X-CRM114-Status: UNSURE (   9.46  )
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

Extends sbi_domain_dump() to display World ID configuration
(next_wid and next_widlist) for each domain at boot. Provides
boot-time diagnostic visibility for debugging and verification.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_domain.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index fa69170b..443aa60b 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -10,6 +10,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
@@ -608,6 +609,31 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 		break;
 	}
 
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_SMLWID)) {
+		if (dom->has_next_wid)
+			sbi_printf("Domain%d Next Wid    %s: %u\n",
+				   dom->index, suffix, dom->next_wid);
+		else {
+			struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+			const struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
+			sbi_printf("Domain%d Next Wid    %s: %u (pmwid)\n",
+				   dom->index, suffix, hf->pmwid);
+		}
+	} else {
+		sbi_printf("Domain%d Next Wid    %s: unsupported\n",
+			   dom->index, suffix);
+	}
+
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_SMWIDDELEG)) {
+		sbi_printf("Domain%d Next Widlist%s: 0x%" PRIx64 "\n",
+			   dom->index, suffix, dom->next_widlist);
+	} else {
+		sbi_printf("Domain%d Next Widlist%s: unsupported\n",
+			   dom->index, suffix);
+	}
+
 	sbi_printf("Domain%d SysReset    %s: %s\n",
 		   dom->index, suffix, (dom->system_reset_allowed) ? "yes" : "no");
 
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
