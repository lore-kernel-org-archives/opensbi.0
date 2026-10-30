Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DF6606A333
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tnUbC6TC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=JC5MIQiN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IfGyTIVJcLM5JiJ5G9pF/Vr9lE1pMN7WYQUvhUuIs/Q=; b=tnUbC6TC2ehh/8bnGmwF6gQT7h
	KHyMoDk1hZAT6zJ0iZ9CpbVCod5D1P3pW3N4pYNwJ6rmXuN6vQFa9YRNWsEUoBfNf8SoLuxoxnMLp
	JaPZSH2xNRoImlW02/hhwj4NYWZ/s8nY696IDBFrCttWsupP2dyjMBs/XCZE1pG7/ZJWXdxynPF+V
	Vx6GO3u9ArC58/hKLGokWvGJ4/pszw7Cit/yv3N35srGKZwv7vtxD0DvhaePpbotEsbsFxg4i7IQ+
	enKLYBD3/EvCgXTzYwkMkMv0wMAOuD9Y27jnq072n4CwvdfBpOibaxZG7jWefaTOuvZ5rZtmxWzh3
	izGbVMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7D-0000000BQhv-3rCB;
	Fri, 30 Oct 2026 10:45:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7A-0000000BQfd-2IPQ
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 10:45:41 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8a06454116eso219295b3a.1
        for <opensbi@lists.infradead.org>; Fri, 30 Oct 2026 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793357138; x=1793961938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Duhmc+K5zKurrSafzzGrPybcI4UTj7vtNRB+jshVE=;
        b=JC5MIQiNd5erhb+VVnsWWFeyWqXT6L+0zDApdIvtdoCBhUK1qpAdfEG/LsoHldUR2d
         TKSvuGFfb50zJcFJ5K/Gq56qsSACFspIeTJ6pSDCgCYLS68LMmTdVByT14FeJHtFixSF
         uljsmQi684CER7MMi6lzj4uVuo4HbJCjb3AY1Z9g7W9jv45S5R/M6P8rs18NCewpQ9fQ
         zQd4RsN62W0GBf0jQtTeHncXa+foM00jib2Ah8Jw7/h/xYUjX9iB5tEO6t2TtCMjRgE2
         GqzWyl++e2WPqnVsddCTKqtPios13tB1+fU3g0YceG75MNh0SALj3qlHcy4W2iZ5KeSF
         DLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357138; x=1793961938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0Duhmc+K5zKurrSafzzGrPybcI4UTj7vtNRB+jshVE=;
        b=iYTD0+/aKY+yAucCtxaNn/16omI1uLFlETHZXSdeuwJfymPPDTwv8qMIy7xsPaDiSP
         aYYhy2kGVbGjEfR8Psr+7vgNSXkg8IJyft20GSBgQwn+HVR3G+EzN+8Me/pt9VjF8AuB
         70vRUqNVd6PQ2O+XNSTLvOtascFoOu4GhvaAW6twn8/IbhlLenOckpj4eCtqmJpu/eQo
         YnmBgbEVSzG0XKT0tHhMhQCpujIlXF6LbAc2aYBW5xrx491mengB1CHq3M38iX5RKkEk
         VLDcmenpnShGr4iz6neHuuMutQiOCEmmiNwPxVfFsF9NfVxqmJ/cJ2wOQ6UTA4xba835
         Xtkg==
X-Gm-Message-State: AFq9FYJsrYaq87i7mcg4E3gDtcmi+BxpafAm7RWoRts1MPhqg9kRB5Kz
	Vsg7D/qmD0iGQkAkyRQgV27E8e6uSDlBN/I4NSVjtgy1RYzvJ0FgOovDLA27IATAbr/SBZLSOKN
	AmSqiY5XrgM4It6A6UYCMCmQPDUjXNg8RG5EO3DLAtjvbNwLXnt5LQCLTTxExJMuWvVOfo3YMAZ
	ZZDIDvv+Q+E6z7dWBaGqLtYym5Ae5CxbI06I6Y2R6hnerctDsQdIc=
X-Gm-Gg: AYBFou1DFJAVGOfnO8RFod9oW6Jkpbw1YRLBXN+T8rBhy4hlikUUxslBl8WIl6Cojxl
	jZyEHrFv+T4puiuKOGRSYpYe3Ux/hhVARcCo6tduJ21rzTMwYaHVjFIQIlmPWruDGWL6Fhpt45r
	RINfGbCgE01ST+nI+S4Cqn4pkCHHQNsSYioaApT1nLiMHklwUGEm1vjWHOCCZbBvWFohavfLS6/
	qdSUiaHk8I1Y2HIZc1Vbojc2V3Q2RzakfWxAfir5Ew7p3qLmT9QEtd8ZlGJQnM76BbOmHjQAmUK
	9AzAuPwYjGXSCr3r2f6mHI1rClOC2DI51qlnzedDtsyw2IJQczORzDMPqDSwHF0ip54TqsyL0WB
	+ioyLYYcm5nbqI8KCSFa9iQBUMz5hMdp0xVoYSpfKNg5JhXP6J7PmP3UgSYdxrZkPa0eADmJarV
	8DI6xcngOYwf/u83jMc7fchJIUlghEMEEZ8Sjg0ogSwj6slhWm/gXFDgwT57tH5ssrDkXWTjl0T
	uaQk+qseUiTUCX3y7mbpKFbZWTBXilzjCzllM4lijiwPg3nHolalHctYYL+MsDZ/JNYyiCQV/Sc
	lhjgp/FlUsnZjrfPQZn04tEjZ/U=
X-Received: by 2002:a05:6a00:3a21:b0:881:7ff5:606f with SMTP id d2e1a72fcca58-8a9bf71bbb0mr1643639b3a.43.1793357138277;
        Fri, 30 Oct 2026 03:45:38 -0700 (PDT)
Received: from localhost ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef569709sm591004b3a.23.2026.10.30.03.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:45:37 -0700 (PDT)
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
Subject: [PATCH v4 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
Date: Fri, 30 Oct 2026 18:45:13 +0800
Message-Id: <20261030104518.3297875-5-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104518.3297875-1-peter.lin@sifive.com>
References: <20261030104518.3297875-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_034540_590195_36ABCE75 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

Lock the M-mode World ID (mwid) CSR during hart re-initialization
to enforce immutability of the WID established by the root-of-trust.

OpenSBI does not assign the WID value itself; it only sets MWID_LOCK
to freeze the value established by prior RoT stage. The MWID_LOCK bit
at XLEN-1 is sticky and makes the CSR read-only until reset, enforcing
a temporal security boundary per the RISC-V Worlds specification.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_hart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 77ef1a70..611c97bf 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -705,6 +705,13 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
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
