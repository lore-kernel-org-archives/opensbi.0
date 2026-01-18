Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ED4D4A5F4
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ryRVsehRMuSuajaV/uFBzaF5uEFNmhyjbt6BFxcy7s=; b=gmZYy9rpDU0LGj
	F7rBhsgdbjfIyajgsKaU/2zCZ2GP4tLKtKQcHfXZqt795R03Frol9UxgUPs0/ZYZTW6GAxZzv6mGg
	Xmi/2Y1PbuNrV2B9vQP0PPnwEB3KG2aO1mtWOdeiNtXdtxkJXqevZe6MevcbbmIGdUfbM7FnWJxiK
	X4Sr3dG7UJqvCcgEipvZcOXWfHIhySqzRGOGhAYVjdLpQ459tC5NpFBQotwaK8DbQkVdejX2qzz7N
	7SoZmj8gRahI7XD+irJ+vJT89wTx4LPrPxC/zD2NNGPd0xVXy9XXfGCzRii60r6D1czFvbUj70Lms
	I1jcNp9GmtfI5r9IYxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6r-0000000HSuR-2GyW;
	Sun, 18 Jan 2026 11:38:21 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6k-0000000HSog-22Xm
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736294; x=1800272294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RNFXa1uM8AbHjqAWHuGqRg+Xm/De4PcMP/IAUTAcbfE=;
  b=qUQ5tF+zr2AeTFFAmjaJnVaPFhkS/btjoS2ExOnb74qSO1V8PiHRCZRC
   6iSKdl1hDH8uTdoejI7O1lXQvvxzSz9rnejUIh40k+mbkuAZhS0KiAJPn
   WCaZflcwJKyTPKeCYAXAFbUfb/3zd1OLEYBO02YH/B90nKEUiI6zgSbgu
   7mg8nV5QhHEoEG30i9ySJ3Jyr5mOOcEccep0d7yqNCbrhUby28tR/Wr4J
   rqeb/EeGmnC+VxRnw5KESgwMIaKgMk8mTsbNFCAp5k1Mn065LfjRjPvfG
   OMEyBJrc9SNsP3487+DZHKKLQhTxG+dnkGeYDqL5+yAENzsRCwJua8Aae
   g==;
X-CSE-ConnectionGUID: mJl/ZFTTRemUf5dsypgi7g==
X-CSE-MsgGUID: D5eJT7B+QMaYl3/B9uDEgg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:07 +0200
X-CSE-ConnectionGUID: 6+DZYbjwRwuW0RvG8R1vlw==
X-CSE-MsgGUID: mAk3lZ24TA+FQQ/3TDWwmA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 18 Jan 2026 13:39:54 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:06 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 02/20] platform: generic: mips p8700: improve CM access
 tracing
Date: Sun, 18 Jan 2026 13:37:44 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-2-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033814_827446_7A90F770 
X-CRM114-Status: UNSURE (   7.42  )
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
index 419e8407d3facc5c1eeefb08c177aa39b69480aa..6985e42b217fa8946027c94b08af01fee5bfd134 100644
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
