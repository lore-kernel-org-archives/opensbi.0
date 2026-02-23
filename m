Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89009EA4FCE
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ryRVsehRMuSuajaV/uFBzaF5uEFNmhyjbt6BFxcy7s=; b=okceFxTe+EDPwI
	OfeZSiKi0oc1jKL3thKF0eNSUzGQ6em4G/4LELpbBYki6cSZQ+3DOoM++MP1k27XiBK7no2PlOiVW
	k3jQQpK34NTNs0aaMi61P3TZA31omJjziY6fJJNmb3sIeW4quWQzxPZnitwRtl8rF0/4AUD0XF1Zk
	6Ovfg6ySPjz5oxZAq+y8L5xGHFX8HM9GqMW2PY+ax4ZkSqftI5dhgAQKgnaSdELD19pQ81ufWNJT5
	X/9UoduMorbdnOmvI5zpDb3T+z46aUnY1Apqxdxk19EU73t4iKV6ITde6a+pKlaKIIq9t2/Ed9J30
	wzir/x2GBL5R/AxBi87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLQ-00000000VZY-2DMb;
	Mon, 23 Feb 2026 14:55:32 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLN-00000000VVn-2rqg
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858527; x=1803394527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RNFXa1uM8AbHjqAWHuGqRg+Xm/De4PcMP/IAUTAcbfE=;
  b=AFYaZxVwbVfWiky75b3ZzPd/pt+4Jzp9piB61dC5q6KVYV3YTtz9wNRi
   ijEf5LpJnvB6dY6W0zAgiHzk3Kob3sJfoVB+RP/DHDpRxya1yH7xTJlBi
   wkPuRpMulf5yNHiWZnywVgWf86OXSjjqV4jcSbR1ODsVAOtf+R5r8S+ej
   UNMJlk3TehEKyBec3PtXhwG5aa94B4LiOTqWrnu2/bnrzcpv5Va7lzkJp
   +G9HbKWVwpHlIc/fNphQOvSRvppUbXZC+F9SbA4QQTwS1hsobpOCc4l/9
   TO2KUeQt2+rYf4SMKjPWxf9vhvHi7/yeSiSZCD/A9ozfd5lPEcaAYICsg
   Q==;
X-CSE-ConnectionGUID: qI7r+ZoDSMW1Btie+JMykQ==
X-CSE-MsgGUID: X0sDx7KjSE+16QtTKcI9Qg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:23 +0200
X-CSE-ConnectionGUID: MOE804WcS0ijYhfyzbCD7w==
X-CSE-MsgGUID: zVDBPZZ8QTSa1ghCjvIvcg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 23 Feb 2026 16:57:58 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:24 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 03/23] platform: generic: mips p8700: improve CM access
 tracing
Date: Mon, 23 Feb 2026 16:54:42 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-3-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065530_003143_0F5922AE 
X-CRM114-Status: UNSURE (   7.32  )
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
