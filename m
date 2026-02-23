Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C588BEA4FC7
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGb+4oBBMWGh50n/w25X8ZCStDEcE2jnXF+faNVdjKg=; b=CTNH3Yo98Qs3Fv
	EsaP0ISDJSxuHiho0u9mn1Fz89kB3PyMjpPb/zxl9v+BXdXy/ozUVdEHoCTqy68tLoA4dqfhx4sOD
	sufngPVP0X8KyDo10d56moeDU7UB0EH3DSPwr9Av3Mt+e37GWpt7ebNJcrIp3+//0TvT8QLnDx+T2
	NVsfULoPjOchOwh3BQ2b8WSGte1htQ/VrqWPytVdSKufLooo4aX5RUSaM/WI81NggPNwZpaVr8GwP
	utWJ17mkiAT2a3eEQZSa7bcCo+niS6zHS1EKfyDe+4gHEX+AE3xnU/LXHEsS1TzZP5rNBwPES1ior
	oK++Mrj9eLhbxmHezSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLQ-00000000VZ8-0v8n;
	Mon, 23 Feb 2026 14:55:32 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLN-00000000VWP-0hxd
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858529; x=1803394529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QXvGwbDi71pzawPcvXU4zn5JPwY7Rq9WGsqIVsmpCIE=;
  b=eKBmdkHqbZEGAopSyNwkjiXCAc4SBNovFgA7LX+C2p/l5zPWnAcEz+R6
   2pE8b702OLARch5Hi8/LRF4SE6o8h/WORkpEIRVAjlcLbhGxGby8Gusn8
   y1FBSObmmrm8x14gS+KqguSkKADSMw4Sqt78w1IlPErd1QLFJiJnd2eFt
   ldIFOLpvAPFUKQxhvlu1DJ/E2YjQ7MTVnINfp6s4a3XRd1Pcm2Uc2Q0Ou
   6bHvpjUme7x/D6s2IxF1EknzZG9Pr3u6czTpaDtFtN8GQfsU5wTguEkR8
   LxXVBPo1UuLflxcQ82oz5wXrqhfyFTsZmoe59mN+lWUOiKkaThQA/ChOS
   w==;
X-CSE-ConnectionGUID: ZuIz/U3nQlaiL3pKRXRY+A==
X-CSE-MsgGUID: PiA716aIRrmLO/Q4gvTGkQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:24 +0200
X-CSE-ConnectionGUID: 13CMAbPLTnq5kI2kVNrtqg==
X-CSE-MsgGUID: f3hOtRQ3SAOmz5dR6fYcgw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:06 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:23 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 02/23] lib: sbi_hart_pmp: disable unconfigured PMP
 entries
Date: Mon, 23 Feb 2026 16:54:41 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-2-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065529_591398_CB0D6392 
X-CRM114-Status: UNSURE (   7.44  )
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

Disable PMP entries not configured in domain. These entries
may contain values configured by the boot loader; disabling it
to be certain PMP configuration is exactly as configured by the
openSBI

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 lib/sbi/sbi_hart_pmp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index be459129c5272a2c70e0cf1c930a00fac98f386e..28c06b38aa46612c945bf97e04c91dbd5c4b32b2 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -204,6 +204,9 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch)
 		sbi_hart_smepmp_set(scratch, dom, reg, pmp_idx++, pmp_flags,
 				    pmp_log2gran, pmp_addr_max);
 	}
+	/* disable remaining PMP entries */
+	for(; pmp_idx < pmp_count; pmp_idx++)
+		pmp_disable(pmp_idx);
 
 	/*
 	 * All entries are programmed.
@@ -286,6 +289,9 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
 				   reg->order);
 		}
 	}
+	/* disable remaining PMP entries */
+	for(; pmp_idx < pmp_count; pmp_idx++)
+		pmp_disable(pmp_idx);
 
 	sbi_hart_pmp_fence();
 	return 0;

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
