Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB45CD3424
	for <opensbi@archiver.kernel.org>; Fri,  1 May 2026 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+vNmHeyqRjElf8YpPkGq82mKo6v4km2YaXoJ0Xmdys=; b=DliMcK3cTA9H8v
	nzdxflydEgxFKSChzXhnr66xVLOj73rdT6G21OyuJUq8sn9LZ9DgZPtSDSeqen/sdWfwlMYlf39NL
	Mqezuahks8+76kl3eO9EPf8r9dPQra43TcgTw0fNq1i7d1VT+RHSO/3u8PxRbwaQXzghkuZrvCwfy
	Hn7ST7TcITQRhsootF/jOaoqFJpsfE0vHEGBVTdzBpmMFmWSb9+u1W9YmNRZ60jMkH+fvom+VLJv1
	jsYN/O2yKj5r1WVx0OkpNkf40jLQ0ZLNzA3dL0OAOKNBEC6WSuiW7cxKgK4sAK1UvWV8v7ZB3g8iD
	zrVo7Itsvzd7lWs7WVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsgl-00000007ZkD-0sSj;
	Fri, 01 May 2026 18:34:11 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsgj-00000007ZjF-1dGv
	for opensbi@lists.infradead.org;
	Fri, 01 May 2026 18:34:10 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8b5232009a6so11188456d6.1
        for <opensbi@lists.infradead.org>; Fri, 01 May 2026 11:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777660448; x=1778265248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FC8+RGF3mKTZLu1q05L9cvM/vQ89uiRie1hvwHPmJl4=;
        b=DvfPi2sHDM2hD45soJJuEsoBZj6dxc15AiUVmiegjvPo5Kpzj173LV+neKQJTpmv0w
         6nOpeHsIGXQG8Jxirfvy6tdgifBs1RlsMEZXVeCzCcaxPhowwdMzMhLpM93Fh2ZW4UH+
         B2PVRj1WnROVEletYhX0zfcYiMSt/YSF3JUuzWRi2tJ1CVXP4nTGE9qQlW+d1JLF1xVq
         Xgd8nv/Y0OEzf7gHvffGJwFcROsfHo9vH3GHbvAfEFztmiw1Sk+YaOrmG25c1C/Gu7lk
         ZNXs2CJ2nzoJ6pMkrDIcoSRWmQ0MGUxnLo+GkeY3LAVsuA9xLDuGflt040SUCNAzjej6
         gieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777660448; x=1778265248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FC8+RGF3mKTZLu1q05L9cvM/vQ89uiRie1hvwHPmJl4=;
        b=stx3CsqF/XP61tuc+k5d8/EyfCg0o4TjzdEN6HIrW0JUk8PE+HYspAczGswedqcbQm
         0yZYwLB/2cUA+5u/nPxf/Be+F9+iRie5ObEYuhZ+ncGbcgL6gUMCXJ6aaYhlLHS0MmqN
         tTAafB6ktWeDC9fY1mXfDACh+IE6Yvcov9+1YfPMJVDQbgKroR1EBw2JcAVvEiwB/EJ7
         mDm9LrV++xQznZS/SPII0f/idmfnfytKdSy711TB8ADeWyk6AnlVNrtxoEaeqLS4Rv0C
         vtSLbsXWivbLO3cm7lCAreqdviix2MsZIlsqt17WDhOQh25Ps+I9i7iiKRbgPxPhNN+w
         RGkg==
X-Gm-Message-State: AOJu0YwpGLaNT7UCZ6Zcf2TVsLJXQ9k/rdiUt5hORFpmGn839aKr30GB
	saR/cYrBExzcFTpHwc8PBplXJ6TtReJTGWOetCjoa2mXXh17P/gHUGXZo0LhSv0l
X-Gm-Gg: AeBDievLuLuXRRThq+8fgkYtCqvmQAHJlaxSq6glY1zgOPwfiIjLgB4yDbbOa+25001
	sSXwCznsMqMuebxqzXLLSg854ANm7ze9W2KQxtaY9j/VdLP5XMp/9nPcAp5yGo5/iQDBINXzH5/
	aHsMsogJV2kfZZcDJAO7gwGVROiBLZvbTPO5zVYcrqRn/vi9KZRV/rHGCpoJ88r9P7/FZGW4n6p
	ygZndhCdogu5wy6HxCbap67D1lFWlOAGAlOxog7vb8QKsl3a8Y34hx4bvOngHVHkkEllfkvCoA+
	DbV4WNQd5x/F6YyaehoQzL8A+6T79TXnOQhE6PjfiZs4NVR9ELIBkyI41mBK3xpf25/+ke4W3/A
	TFSg8QEz4oFhW67aq0lRp7F1C1gW9rDrl072e7wzWRMOO34mMdBLaWYHNAyWLT6v/flVT/wGVzz
	ma5TIHkEWY3GTxxrH8H8s56HbWkmFB76MDVml/aYhgufOPpd5A9yW0fnQobWfLROlaoNPbSe7kd
	tlyDYVRYcpxIB8BcHg+0w==
X-Received: by 2002:a05:6214:3d11:b0:8b3:f6ae:b01e with SMTP id 6a1803df08f44-8b6666e633amr9835326d6.16.1777660447816;
        Fri, 01 May 2026 11:34:07 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dceddsm29696886d6.30.2026.05.01.11.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:34:07 -0700 (PDT)
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
Subject: [RFC PATCH 1/3] hart: add WorldGuard CSR IDs and hart extension flags
Date: Fri,  1 May 2026 14:33:44 -0400
Message-Id: <20260501183346.1596027-2-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260501183346.1596027-1-raymondmaoca@gmail.com>
References: <20260501183346.1596027-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_113409_455633_63A507DB 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Define the WorldGuard-related CSR numbers and claim smwg / sswg hart
extensions so platform code can probe support before programming
MLWID, MWIDDELEG and SLWID.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/riscv_encoding.h | 3 +++
 include/sbi/sbi_hart.h       | 4 ++++
 lib/sbi/sbi_hart.c           | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 46bbeed0..48304132 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -331,6 +331,7 @@
 
 /* Supervisor Protection and Translation */
 #define CSR_SATP			0x180
+#define CSR_SLWID			0x190
 
 /* Supervisor Indirect Register Alias */
 #define CSR_SISELECT			0x150
@@ -454,6 +455,7 @@
 /* Machine Configuration */
 #define CSR_MENVCFG			0x30a
 #define CSR_MENVCFGH			0x31a
+#define CSR_MLWID			0x390
 
 /* Machine Trap Handling */
 #define CSR_MSCRATCH			0x340
@@ -680,6 +682,7 @@
 /* Machine Security Configuration CSR (mseccfg) */
 #define CSR_MSECCFG			0x747
 #define CSR_MSECCFGH			0x757
+#define CSR_MWIDDELEG			0x748
 
 #define MSECCFG_MML_SHIFT		(0)
 #define MSECCFG_MML			(_UL(1) << MSECCFG_MML_SHIFT)
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index cc78eec6..2c725ae2 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -63,6 +63,10 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCSRIND,
 	/** Hart has Ssccfg extension */
 	SBI_HART_EXT_SSCCFG,
+	/** Hart has Smwg extension */
+	SBI_HART_EXT_SMWG,
+	/** Hart has Sswg extension */
+	SBI_HART_EXT_SSWG,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 3d136944..6fc03a59 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -666,6 +666,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(sdtrig, SBI_HART_EXT_SDTRIG),
 	__SBI_HART_EXT_DATA(smcsrind, SBI_HART_EXT_SMCSRIND),
 	__SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
+	__SBI_HART_EXT_DATA(smwg, SBI_HART_EXT_SMWG),
+	__SBI_HART_EXT_DATA(sswg, SBI_HART_EXT_SSWG),
 };
 
 /**
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
