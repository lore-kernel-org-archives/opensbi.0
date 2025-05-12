Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D2FC3ABBC
	for <opensbi@archiver.kernel.org>; Mon, 12 May 2025 07:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0aO+XLgnahuVWO1w9iPaGCT6phsQfyIpFpFtoipObtM=; b=fYlJrzV2ZNfZ5Y
	38aMaM3BdVS8KCjxqw5CYhRxA3cHrHemFrPUAm//cIWbM7gGQpHW80HEXzf6+rbmT3D50OvDe6o+V
	2b6r0CrcgtllJ0wjoQSojPAP/9Jnif4b3ZXk2geXtnueV2Jx4V28cPzpwtuNNzFdV5guqdm9K5sIS
	Q5EQJjQciekSalwjxt2TJR+cee1RMW1xaqTTO3AOWL4RPRaVilNvFiH7/CYAmgXXeIew4MlBOJVPn
	9Xsvp1ZHEWdhtFLVrkvw4GXCcEfyPNp7jrQY6B8M+LfLHn1jXX6glwOyXFqCj71SKZjfkhF2ccw2t
	V3QQuiIdCKOZ463jJ1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENPH-00000008bjs-2PUw;
	Mon, 12 May 2025 07:16:59 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENPF-00000008bjU-2Ger
	for opensbi@lists.infradead.org;
	Mon, 12 May 2025 07:16:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso724706b3a.0
        for <opensbi@lists.infradead.org>; Mon, 12 May 2025 00:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747034216; x=1747639016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fnEVyq5pyU/PIj3UVNKg7K5vkEA7G17xSYQv2iHrpzo=;
        b=Fs25RiIzTZiHVN+gj7lrxdA3ejVfVHwaApAifq6qKu/Ejt8Aa8o8bs8WA2j74Ev95j
         b3s7ODVj2cPOmp9vDnNopolz4EWS4hrEiuMw8nk9Ldx0gtGXztYJ21DGDc5O+oSabJnk
         ytQEWs2O0XZbU++mlcFkWwDit43JBQRDFYMxKhFTW4vWeA6ySICwkCV/U7fDXIakdm3s
         Cw4uwW+PwC33KSmmPts2u4qF3FSfGP4QPOd/9zPx7KGkD19l41tZpHpB9vcmy1iIlV1F
         FjP44lfv7MIEclED1GukENegwiCKLydvGD2a2g4zskBxx2Ft2g7XnTpzevxbiKjlpP13
         NlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747034216; x=1747639016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnEVyq5pyU/PIj3UVNKg7K5vkEA7G17xSYQv2iHrpzo=;
        b=M5/DiMAq3KahmnQ+4HY/dLe6fwrbuFPja9PC3/tVYSoVKop2F2M1HwUmu0juNBBbdb
         KCmMtE38S3FftA28dwpsGTOjc72AcGiUcixv6rFYWli2aVnaVgV9cr6l8XWHD12mL1bl
         qExiC3YixQ0Rm513O09aWgMmSSmjPrjj4FRqOfwBk2a5GNUKrRNK/+CPvugd9jgdwSSm
         grN7ZXxi+4g2IX9pBIcVVQzpGmGCoNE2vhV/zT/ewE20PSz0nn4u98ujJ1/vwyPs3h+W
         gXVuYALJm9OiNruSEgYZlsjUVOwdNvxsbJkRLk7DuAz6SX9q/ZsQKFUAqO5eAvcEebwC
         qh4w==
X-Gm-Message-State: AOJu0YxgWzfyc1psiYzF0ChI3+iNsUoVGuTJ3zOXj06v9dzGISNORPqS
	tXYj22wZpBwGwKkMYdCbyWrMeNCGS59nsxWBWSnobwVc2wPPgo4+1OQJLVCU
X-Gm-Gg: ASbGncvuPGGwCx8grxmEjzCwS20asZyOPaPaBfFq23ZdptqbDKoRrP3otw7ahL1cp62
	PzOgRlDpTn5HuqWEgybDywIhQ+rICoMOS/RtEtrqll+1XGZXxf4njbahm4PnsSYKeSw5awPSb/6
	7vVzV33yiWfBeh76l+B9YIsNBYi0vdrqwXs9lxyNO6tlaIowJ54w9sgWasaqg26Lj9mKVa1eEh4
	DKJ4rGaXhOY32MFzsdwzlbnBfu+24LS488pznTjCAoiEfr3dYKctuOzXGETdam8RHbe7YcXhz8T
	zCmi2I+JWpOTPR3YYdcudahYhUZM+QhEB6OVN63CzJNyLfjYARjmTw10vL8FOXEw6P82SH0z2mQ
	HkeNJ
X-Google-Smtp-Source: AGHT+IG7HUIO1AnVWYqAtxmluQ42/ZsOevoTwbVWX2ErnToy+tB56Dym/pFojzO1akpshv/MDBs5fA==
X-Received: by 2002:a05:6a00:9286:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-7423c032792mr18223443b3a.19.1747034215764;
        Mon, 12 May 2025 00:16:55 -0700 (PDT)
Received: from JRT-PC.. (bb121-6-174-130.singnet.com.sg. [121.6.174.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a386a9sm5416612b3a.128.2025.05.12.00.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 00:16:55 -0700 (PDT)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [PATCH] lib: sbi: pmu: Return SBI_EINVAL if cidx_mask is 0 in ctr_cfg_match
Date: Mon, 12 May 2025 15:16:48 +0800
Message-ID: <20250512071648.89151-1-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_001657_575733_F68290B0 
X-CRM114-Status: UNSURE (   9.95  )
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

When configuring a matching counter, if the cidx_mask value being passed
in is 0, return the SBI_ERR_INVALID_PARAM error code.

This also aligns OpenSBI's behavior with KVM's.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/sbi/sbi_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 5983a78..62ce770 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -840,7 +840,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 	u32 event_code;
 
 	/* Do a basic sanity check of counter base & mask */
-	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
+	if (!cidx_mask || ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs))
 		return SBI_EINVAL;
 
 	event_type = pmu_event_validate(phs, event_idx, event_data);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
