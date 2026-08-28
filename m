Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA15C61DB9
	for <opensbi@archiver.kernel.org>; Fri, 28 Aug 2026 21:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=leIDKq139uhIBVK3KYcSuaHqXoxPghpg3ExMAzmgMKY=; b=r43RKn1zQ0ij0c
	DQVUseE8qCdaiHgYkSGRbWahjIlWfLqqX6IeQG/2nhRNzKV3fss3ij4Dq+1k4uGWGAPL+g325rFX1
	0p53CMMhlU5nHbDFr8YpMEpYXJxtqQKer2IvQdelEl04X3muLjpE7551tMp3wFc0wxGBDzOk7UXzI
	fmfZ0CVlxUld3shIhAjJ1YwdwMTKI6GbxXf0ok2lciVgtgbiSuNeeE7bfcS7A6vL1A8iI35jXIUdx
	UX4rffHczc3lzj0XFp2Yo6cPBLvd8c/HvhoptoOp8ZKsecY2Y6FPIVmRNzp0ITVTBYH8sONCTX6xe
	dgZw3HunvudypDqXlKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x04AP-00000006RtH-0qAQ;
	Fri, 28 Aug 2026 21:31:17 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x04AN-00000006Rsz-2Js8
	for opensbi@lists.infradead.org;
	Fri, 28 Aug 2026 21:31:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1470282a91.1
        for <opensbi@lists.infradead.org>; Fri, 28 Aug 2026 14:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787952674; x=1788557474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wwwp+xuMqTO9glvVpvPacR1zEjft/doJRglBoA9dT+4=;
        b=MWjkzC6wIxvTCB1yG/5NVjTVy3aNBf4O64//3VFGGT7mHBx23LLK1CwGsNq7dY7T/I
         LGP3KLOxwO12kIk9/xehmHPcBT0yI89n32MzmyyfCMH4n0vOBFOSdSagtC+7dpKj8sH2
         z5aJQrHUiwJtfb9TY6wPTXSG6ymkr2nRPKhhFA0csUybXTx/SXFuQjhPU0k2xa1QqYtG
         Jfrcj8lQhw0nwUio4g0FRIE9EivhK6T8hRp7GW67PAopzqlQs1y1s/pwpIaU51sHZrYo
         uedBgMVlU7M+dlVh7QYV8i7dT+J28dE8Zqtwn6v6mejx6cYWkjG4+K/DC1u85oqtZcRx
         myoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787952674; x=1788557474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wwwp+xuMqTO9glvVpvPacR1zEjft/doJRglBoA9dT+4=;
        b=RFwrwViPmbXMQ3N8NjRbF8y9WYqd9eo3cNlbT4neX90VyJf9dyslgps3G+Apv0kBbd
         1k8fxLdeP9SfGTQ0HHeez0/0HA2+K79OGeH5M5wFt0oK1iUgvtesJe+uW3uvLDNCxHgY
         pGKl6VkKX2sAJgTNeGLtJbDkUmyNaqYfOU032612BaTlfPNDUxbtVFwPb0KawsiLEMes
         uHBqkitOmYBHMOOCSIHc66VAzxR41pWZVmxnRXXQOgDATxTDMQfCo32Qam1wS71d2scy
         U85awFtk/nOIvCQBLaDKCNyMFWWtKAnCroJ5Ej/5OvIs+iHwv1cNbJTOkkHUi/VJ1veT
         rh9A==
X-Gm-Message-State: AFuF++lj61PfN7PVHQEnewpWoyb7a+YCqf4En7cS+oheQkP8Qw/Wh4c8
	38mF0jMFpNkTcUlDew+ut7+Ae9UPhCGEKrS7RdtTpSHHtSvdqEdVpfiIGpk3oA==
X-Gm-Gg: AYBFou0MzNJk/Bk+dftTfu0ReIFgML44gwV0I42zy68bJh6/eUrfxQ0Q6BAwGpY1JBd
	v6pOyOsj/vOstFlEskRCUFuVTy6YC6xwR0GRWrbOLxPtqeSX2hQNRjHDLLMiif/pQNIEveELOt+
	QZd5JmHVRX6Y1ARGx1JfoFpPrnYkFBJGqi86vISJAlwOBVD4Dg4dd0sFE4gFhiu3h1ssSrhbipm
	z74M8lTbM4jTZsqKENO+Yjmnn9rGNeTd2wOeAHkczg+xIM3TktiwiYFla9JZ95RXA+JUvc0Dee6
	nsxn44O67Q3bmtQQv44hUi3uUztwWP/vr4FVcFcx1SC3mQpMXbFqDCNJvePF3f5TJias593kGm0
	Eyk2cABl7C6BEzQiYREb0K9n7JUK9v8IomLADA3JgzcI3bB1Ao0oiQJuFVNsRjRSn9IJXMojHpQ
	aUroCR/kpEbA43JSI/0dz2j6LBNuaPv6N0x/BCUdA/6ibeu91mXKs0ZTc3B6xovQ5tjVYJQPNK9
	w1fDpgyDM7lQL1TQddxyFbnEfGdClUHBGwiw7AWffbUx95+1dH/wRtZjaN/IkVbYO9hqRXocdOl
	YQ==
X-Received: by 2002:a17:90b:5405:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-396d0de4c19mr17803324a91.6.1787952674208;
        Fri, 28 Aug 2026 14:31:14 -0700 (PDT)
Received: from aster-MS-7D31.scai.dhcp.asu.edu (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm9868015eec.16.2026.08.28.14.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:31:13 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: whensun <theodoruswensanfebruanto025@gmail.com>
Subject: [PATCH] lib: sbi: Fix FP state enable in sbi_fp_save
Date: Fri, 28 Aug 2026 14:31:04 -0700
Message-ID: <20260828213104.84490-1-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_143115_593102_1E27E9AA 
X-CRM114-Status: UNSURE (   8.77  )
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

sbi_fp_save() currently sets mstatus.VS before executing floating-point
store instructions. VS controls vector state and does not enable
floating-point instructions.

Set mstatus.FS instead, matching sbi_fp_restore(), so floating-point
state can be saved when FS was previously Off.

Fixes: 718e1d194f5a ("lib: sbi: Add floating-point context save/restore support.")

Signed-off-by: whensun <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_fp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_fp.c b/lib/sbi/sbi_fp.c
index c8941252..38fb7a01 100644
--- a/lib/sbi/sbi_fp.c
+++ b/lib/sbi/sbi_fp.c
@@ -20,7 +20,7 @@ void sbi_fp_save(struct sbi_fp_context *dst)
 	if (!dst)
 		return;
 
-	mstatus_orig = csr_read_set(CSR_MSTATUS, MSTATUS_VS);
+	mstatus_orig = csr_read_set(CSR_MSTATUS, MSTATUS_FS);
 
 	asm volatile(
 #if defined(__riscv_d)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
