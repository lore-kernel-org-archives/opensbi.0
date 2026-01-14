Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1008BD31A2E
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfE/hO8ohVLZb0g/RhJO4hRlLGhUnpXWPljZ6FqL/mo=; b=WezE7TdjArHJWQ
	cMc+a3IxEgTdiusOKeSDKh99CR/JDRZNT11ekLyDpXZirDke0XkgyScz7FdQY2U03ynXnK1QSS6ff
	ZhgjJ+ipSeN0RLi1sy7CnFHtuBhvUyXoR2puW/dVKCWkLuybNhPC1infyhe/P71Fijf7/kkjhe3hW
	1tujdgjsKY3Xov2h3mIX+wf6ycaSbPon2bnTMYyzfcRLqX5dTRg1GRowDA8mQq882ehK1NLv7V19S
	uw3gyL8k71285XDdon0fiJZWRPtD+ykQk7qL7wwxpb5B/3Y+Xv3dWS23/g+vDB2MEmf7x5oy6AQFG
	y/aNAf6Qe6QcuIDz93UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4K-00000008Vl1-45C6;
	Wed, 14 Jan 2026 09:21:36 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4B-00000008Vdu-2yw4
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382487; x=1799918487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MxVkvt2vtnr/yTAXZ/4a4/jyYze+hik5rCJyvxzqIHU=;
  b=Zi53p9E5fKQsvqDZ1Cn+1m6zaMhRjMVeGGWgwk04YhC2RW2BtbSwMF0f
   Ql+Z4bt0gDhXE8bRatsa0MXNp76IUC2u07rkxMbKty/jIgLU9TxpYcr71
   6aQCv4RvVEFnAvH+Un7IAneVrY3w3YGQ06Ig+XHSaflMZzT112V9x+AHb
   X8Yme5VeYGWSv1n7X+qcF0E0tXprPhPUyrgi5aXvYku1ZT5mgmAKre6eF
   PJfMbsZqv6lGhQqbz9sRLAQXaig5X4VVj/MLSB+DbfL5Ja4NYxLbaX75x
   X/I4jQj8pxM9bUJU5b4/IRCj1jUhuSwxBKvO3ChQmyRm4WC1uf1vee/Jy
   A==;
X-CSE-ConnectionGUID: z46RAvKCTcWX/fTP+QsvEg==
X-CSE-MsgGUID: Uhz7mD9vQQaE0BQe0Zy1kQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:23 +0200
X-CSE-ConnectionGUID: ljlPIuI4TnO7UlRfj7Pj6A==
X-CSE-MsgGUID: 0S9w5NMqQ/61OgFpk44zfQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:05 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:22 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 02/22] platform: generic: mips p8700: improve CM access tracing
Date: Wed, 14 Jan 2026 11:20:58 +0200
Message-ID: <20260114092118.1315581-3-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012128_472646_8A00ED28 
X-CRM114-Status: UNSURE (   9.54  )
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

use function call like format; debug print returning value
of the "read" accessor

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/mips-cm.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/platform/generic/include/mips/mips-cm.h b/platform/generic/include/mips/mips-cm.h
index 419e8407d3fa..6985e42b217f 100644
--- a/platform/generic/include/mips/mips-cm.h
+++ b/platform/generic/include/mips/mips-cm.h
@@ -32,12 +32,14 @@ static inline u##sz read_##unit##_##name(u32 hartid, bool local_p)	\
 		  + (co << CM_BASE_CORE_SHIFT)				\
 		  + off;						\
 	if (DEBUG_CM)							\
-		sbi_printf("CM READ%d cmd_reg=%lx\n", sz, cmd_reg);	\
+		sbi_printf("CM_READ%d(0x%lx) ...\n", sz, cmd_reg);	\
 	if (sz == 32)							\
 		asm volatile("lw %0,0(%1)":"=r"(value):"r"(cmd_reg));	\
 	else if (sz == 64)						\
 		asm volatile("ld %0,0(%1)":"=r"(value):"r"(cmd_reg));	\
 	asm volatile("fence");						\
+	if (DEBUG_CM)							\
+		sbi_printf("CM_READ%d(0x%lx) -> 0x%lx\n", sz, cmd_reg, (unsigned long)value);	\
 	return value;							\
 }
 
@@ -52,7 +54,7 @@ static inline void write_##unit##_##name(u32 hartid, u##sz value, bool local_p)
 		  + (co << CM_BASE_CORE_SHIFT)				\
 		  + off;						\
 	if (DEBUG_CM)							\
-		sbi_printf("CM WRITE%d cmd_reg=%lx value=%lx\n", sz, 	\
+		sbi_printf("CM_WRITE%d(0x%lx, 0x%lx)\n", sz, 	\
 			    cmd_reg, (unsigned long)value);		\
 	if (sz == 32)							\
 		asm volatile("sw %0,0(%1)"::"r"(value),"r"(cmd_reg));	\
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
