Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB23CD6E7C
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSJzKlA6AhqBGf5PJLp7AMEw0llUhe2C5alGrmId6Ik=; b=dJpeKOdhyEzn8r
	KzG+sPiDPtv9vNDvv3c0z1OXowNbHhY9GEP2ERgDKHSNzWtoIKFJaI7oSQggHoXOPGTFRIHIHy9gY
	jjDHaT60uNw6VVAqjzJZ8lOgjiNlH5Fw95uSL03MCmdnIPwwZEHMNUK7fFH3wsJ+B+B2mv3UyNJ4h
	PyQ98UXZGq42Q1BqmmhvbFJiM3239oD292Rx3yn6os9sgJ2ACcW7vPr4cCWpFj70xaAatTIVd0oze
	el080563Frh0xkRKbyn7lUKjWdOM3NmSQh7S488CLRqk9vDHl+MUhGb+CGy2NVdt77IU7yA87r4l4
	1+q7UiLnJzrbU2Kav5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSop-00000000Xo5-0SBn;
	Fri, 05 Jun 2026 11:34:31 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSol-00000000Xlb-0z3s
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 11:34:29 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8423f1d8902so760899b3a.1
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 04:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659266; x=1781264066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cb51vPr0qL6zmfLsXM1rx72TFHihMzOJwjLHll7tL20=;
        b=SqTLUb0DzRqehhksf8MpxerL9GFeb5w1p/UnsANJVQqb9P1CmCCy8jWKrRoh/3GKAV
         jOPCVIBbE+uaM9AbZJB6DI4cov6ehWGafovcHJN1/FpaydwvJtK1L2tU7PzofnT0v3KZ
         HHBcJClltFxXP5VHclt+EcmyY682SeEEADTepazU2dFqKKiSY332MwHb/jD2c8ZvUOse
         AR7Yy6Jf3Kyc4mVo7iyXm3BUQJArPH7qdsPvVp1RxSxT4eg5kizgrG57F35QlnMkyso0
         5Qmi5xH7Kxz3vVtTiW59apD56KAPbNGunhtVdrQfWLiCTL8ujXg8E5ZZDVqmhxyb9naq
         TCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659266; x=1781264066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cb51vPr0qL6zmfLsXM1rx72TFHihMzOJwjLHll7tL20=;
        b=KReZv0IyOQky2T72ZdqCWuKmFt8kzazhRaxyB/7VFWceI0PQk9JAixvWUTGABhNNkd
         IAZCLPpo3atOSzcDiv66eR3yDXHzp9TrK0A5/mkW0md8i0oInUfgP5KPv1OPCBV5Mgrs
         trl3e8Ah1UJ1kkkMFZSzKYArbKCMNTvOLADUC0J8a7RdPkxI++phSAuSTnmRMXIwudP1
         6wu2Uwf/JmM7+f3gr/qDyT4sTDUV8zbFPIEK1kjXpqq/g4eJd3H7AvbSIL8b++nVSrRp
         etZIeyy5b0YDcsSz0W2ZPZHdXQmdCwSl8J7tWdymhn6rNKbr2/O8qDQsSXvPFwUyOTOh
         NTBw==
X-Gm-Message-State: AOJu0YyNU8UzesYxzmhWZhfwmxFXAI2cmABWP9gOsRjT7lMHob3waGfD
	YJgdeaNrD5skEMTk5AS5YozVrPkwFslxQNOr2ztshtPqZnNK0eDqgcQihoFi5A==
X-Gm-Gg: Acq92OGUgsZI3bQuLsEFhACDq2rUgK75fPzN6ZuuYhSK7jSYhiuQNTOcDcgLnAmSCJX
	DW+Nzc7rOk26v+t8b4DJKhBphpIPOooopAuxCd5cIVv7cU8q04Q4F4yvd9JORKa4Yo9qrr8+wTU
	Q0sJfoFt24Tv0Sczn1vLlmGa/5v4YnbcbvryDg6Y4SzI3T5ywTk1JXz/GixbujyDY34Uo6MlcCY
	CZXC4XwocrB6r9BoZFVHVYsqsOGhPx2toMb0BGSXvNY2mwECaD8FmSt2/1t04QOtrLYIPq+U8IO
	uTP9e64TDEIu7rdSZ63XZSWag7T45BamrvIXcH1+OK7E0oLQDYuz6LWMkGDOeZsJ/6GJQ78oKUJ
	sr2gIt+iBMH9H+/P1q9ESX7YgGY5M4k+a4Gdh0TWAwwe+IUwi4De2jQqBLr/BT+VA2y/rnztjHE
	4RIUdNP0TOfRzfL8e6Nk0Z6x1vCTdMR3HlmlO3xU/M/THqaQ==
X-Received: by 2002:a05:6a00:2e28:b0:841:dc7d:306a with SMTP id d2e1a72fcca58-842b0f4cc26mr3073938b3a.25.1780659266258;
        Fri, 05 Jun 2026 04:34:26 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm10141414b3a.2.2026.06.05.04.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:34:26 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 4/8] include: sbi: set FS dirty in vsstatus when V=1
Date: Fri,  5 Jun 2026 04:32:10 -0700
Message-Id: <20260605113214.242-5-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605113214.242-1-ganboing@gmail.com>
References: <20260605113214.242-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043427_481742_5E3CBAA2 
X-CRM114-Status: UNSURE (   9.04  )
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

According to Privileged ISA 19.2.11:

Modifying the floating-point state when V=1 causes both fields
(vsstatus.FS and the HS-level sstatus.FS) to be set to 3 (Dirty)

Fixes: 130e65dd9d44 ("lib: sbi: Implement SET_FS_DIRTY() to make sure the mstatus FS dirty is set")
Signed-off-by: Bo Gan <ganboing@gmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/riscv_fp.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/sbi/riscv_fp.h b/include/sbi/riscv_fp.h
index 03011af9..ff1dbc87 100644
--- a/include/sbi/riscv_fp.h
+++ b/include/sbi/riscv_fp.h
@@ -83,7 +83,11 @@
 #define GET_FFLAGS() csr_read(CSR_FFLAGS)
 #define SET_FFLAGS(value) csr_write(CSR_FFLAGS, (value))
 
-#define SET_FS_DIRTY(regs) (regs->mstatus |= MSTATUS_FS)
+#define SET_FS_DIRTY(regs) do {				\
+	if (sbi_regs_from_virt(regs))			\
+		csr_set(CSR_VSSTATUS, MSTATUS_FS);	\
+	regs->mstatus |= MSTATUS_FS;			\
+} while(0)
 
 #define GET_F32_RS1(insn, regs) (GET_F32_REG(insn, 15, regs))
 #define GET_F32_RS2(insn, regs) (GET_F32_REG(insn, 20, regs))
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
