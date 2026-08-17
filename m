Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56F0C5B572
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 09:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUBGyi/Gez4a5XHPcDmOXeadGK31Ib3RgqhZhjWbflA=; b=ovYuCkU4FvhKtx
	/ykBlJuz+VRN8i76vaBS4pvrpCTHym/sMOHfYqoj0upOySJY1TfXPNbIpNOGHJXF/RagD+QIhCC/R
	Jb6CDO+gRXy5nm7QifYSO12Y1Ykak1DZcqAaEPDe17Ky2aS+S+IflXXrjfiOA5EkK3/XAX64aoUYE
	71D6bsIDOA78efTUmTO7T1RECubv7iv1bM3MuW912j4pTWegIb1NnwBTu81sNIy0NlnYHKZunmxfQ
	r8GyJv0g6+G9poKtvkx2h6JN+o9Aa0zQGW53F9FjtJjJYnBqG7VhsI7vE0+ji4jF8WdNUO4792K/5
	v16wtP2BBnQDs942UI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHh-00000005lZr-18YG;
	Mon, 17 Aug 2026 09:05:33 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHe-00000005lYa-434v
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 09:05:32 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so2304223b3a.0
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 02:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786957530; x=1787562330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvOB9ju13/rPSOqib6n979Oqc6LsnoubFA3E+MvJb04=;
        b=OHDg6u1E/ndr/ETV+xvdFhTR1Af7VAWswDrylbtd4qc3lN+8nDpL4joasD6DFDPomJ
         dk2oKkC2oHr936g3PamQfeWeCM1DF2d3UWxxz9go78kXyUPOYXQpl7JYB+HcabwwZU92
         UdwKZ/JJNdTwkgsqp6TEZ9gdw3qGreeN1HT5gOFVO7e1DNNgsvp9pOg/W6RVFMwGOSEq
         j0+ta6lu19HeG91rLrf1w/3stZD8wfNEzE2ee7aYOWMi4DddKxFQrPj6Xitty4Ib2LB2
         e61yBdF7H9MV7bU+vi9DHGYRgeMyNzzByIZ0fQvzB8CtpyA3yAKUnyqy4qZ9I4h0iogK
         HMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957530; x=1787562330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvOB9ju13/rPSOqib6n979Oqc6LsnoubFA3E+MvJb04=;
        b=CdMpfYzBNup6/fvpq3hh5EchStjHmWQLUiLl2s4PLreXGBRnLJiSzi3eDy/R1/qVW2
         ezt70mhTLxddFfhc6i2Rr+ye3koqSjAhGlBMu8MnqHiFKEvlv+CXFZDQ0cPv+e8ldnfO
         csFVp1qHaZkm4d34E0D+IJK2T7Pue3GYNy53GZNVFpuv40OHNtgqQ6+LxMYM6dtnTFjG
         9wdsrSDUymd/GHbEd9E8ZlvUZO0dvI/nZTwbrNgB35F3jPn6ZvUlYzITAi/BIcZg0Et7
         wRRSwC4nTCsD/5xc3CkJrz2jKpOI+RDJvmuykL453HY6tQ8ie6SJW+0ED83Gg64lL4im
         RF9Q==
X-Gm-Message-State: AOJu0YxmnjWcROf83iPo6ouZZIyG8hG9aygzS9a6KxWWafONFOKqTTYI
	yaQzpf1sb/hyp911KX7oXJ3A2r8SbpCSqlZmA2SMNpIR1aetP/34kucFzCaNRcUe5jznY/F841Q
	OZe6yu4HglkqxVPnU3EvaCptUp3QJDQmaSkJHe6U8bTPGHo/vq49NWqwV4/Y+SO62Lq5Nbs0FSt
	4cmU7s9Q4lnrYOVfQu0hyPSJzisJe3xmT+eu05+GDOGYO5c6/S9EA=
X-Gm-Gg: AR+sD10DuqfmhYFaE83z+GB2xGR8av+QRUJW+rq+QunLm4MxpudtLc54UaGblZQGT2x
	adx28qnJp9s/ewDHjcEkP5vgjTAxpvp5TkJPSJlesGp2Nne0WZDxgpjCHcZKIvfb+jxHrO1FD0p
	PTXlXd4aMiR6CyVLzlO9MOhHLls0e8kmdh2d43DF5p3p58eLaaiwUnOfhXFTgSsc9INvqUgSJPS
	ccjP+0DULVCPbKHwBffpeTqPExoM51kyoOYOcHoetL9/chOjgUVpY5ea8bragmjFyTGYfxr0toM
	WXf1TDmnVizAQ4cbuiV+QMKkoiJ+eilrJsCKFFroXBQ0A9LcRBmV5UUGWPaD4Tj0M4jLoiX3GJD
	nQ8Tqd4rh+Hl91+UyuM/dNtRHkkdOpR6Turqteg9nhdlnKZHph96UhNCP9uCkZumqojjVdab+3G
	IyoXEXFbf4jq/WSHwgpDAeJfs3a5LhYrDmHWxnhmPbnOVXIfiDYopXMGn/5taw7hSAFZgJWYDcX
	mS7+rov8Ze8
X-Received: by 2002:a05:6a00:1f0b:b0:847:968d:b101 with SMTP id d2e1a72fcca58-84fde2c7565mr25116430b3a.21.1786957529791;
        Mon, 17 Aug 2026 02:05:29 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f1bsm2487386b3a.38.2026.08.17.02.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:05:29 -0700 (PDT)
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
	pawandeep.oza@oss.qualcomm.com,
	krzk@kernel.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
Date: Mon, 17 Aug 2026 17:04:58 +0800
Message-ID: <20260817090503.2104998-5-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260817090503.2104998-1-peter.lin@sifive.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020531_004153_A12FFF26 
X-CRM114-Status: UNSURE (   9.59  )
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

Lock the M-mode World ID (mwid) CSR during hart re-initialization
to enforce immutability of the WID established by the root-of-trust.

OpenSBI does not assign the WID value itself; it only sets MWID_LOCK
to freeze the value established by prior RoT stage. The MWID_LOCK bit
at XLEN-1 is sticky and makes the CSR read-only until reset, enforcing
a temporal security boundary per the RISC-V Worlds specification.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_hart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index f5f4062e..29856c0f 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -724,6 +724,13 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
 	if (rc)
 		return rc;
 
+	/*
+	 * Assume MWID is restored by root-of-trust M-mode in previous
+	 * stage. Lock mwid so RoT-defined WID remains immutable.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID))
+		csr_set(CSR_MWID, MWID_LOCK);
+
 	return 0;
 }
 
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
