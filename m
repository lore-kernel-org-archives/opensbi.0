Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31666EA3F33
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DjdOEzVvWErCzICaYUk6wk1/C7aeXOfoB/YgoYKKkQ=; b=BdPz2mJD/1D7OO
	w2ISWy2SGEe7Xpwr2FyBXvqLKdPopVTeQSRuW1NEXXo46i6zPorUM6Gs2GzwiA2EArOlTTEJKcqTe
	UPdrIYah4XkLlrU/k9QoQz7qYMvLCQi5LEZ6dLZbKuexJGC45QHrHKfgAn98pfOvYAw2q3mFBY8ei
	KL/gHGw/0STAIJ0ZjQu1mtuc3CvTTrwhj/JsBsGe4hTWwxNdCvq9Z7H7d6ifgx7rCryUbyoWz671s
	9RW0Hl1G6/j+C7p9Vfd57BdMIezkXKfsafXFMZCZgEJdVYX0COzcETgbbNMxW+pNyG+uGbxWsRbN4
	LGhGV80ZYB4ToGf0I+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGl-0000000Gla5-3W3z;
	Tue, 10 Feb 2026 09:42:55 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGi-0000000GlXh-33BP
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 09:42:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a8fba3f769so23899365ad.2
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 01:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716571; x=1771321371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHgRNrM4xytsr7+ws5uECagIdEin47px8uj4+VCK3J4=;
        b=HQvOrnMFSK62ssyXbzJJ12pMyj4q+edHk4ZJzASkgpFnptV/dZTdpx7j6EUW5gfyju
         Lfp8C0LueUiV4VQ6a5LyU0OX/G/GeKNqNEV83LgUAQpmFwqQM8OPJnpKjHq86mxKSEHi
         J4oWGJfBK/qORDdlwtT5hKkL7e/2MI0PW7iwMGJLbGjeZIvj/RaU2BQCnLtt88Az3EIt
         A4iUv4Otm6h3kqHz660dkdltsJcX8QukeWbqwM2ZPqLjLNa4RFKKNHoCz7kuohtm+E6z
         d1wGPFSqJBE4AOg4haZmAMSAGdUXWejXIn8AWzL67ForgX3HKxd4oDvpImWoCMUcmZxm
         XJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716571; x=1771321371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DHgRNrM4xytsr7+ws5uECagIdEin47px8uj4+VCK3J4=;
        b=wDeddXigLDRwFa1/OlXt/bnFgJDArSC6hjj662R297xCHeoa4TMskyL82e65IE+bEI
         ez9CzRfs8Ls6yU4DdQo1rFQnqdTYGr/0o+WnIM0gxWCLvKVh5JMonk+HkxtccZPosjk4
         DPX/y25dYw3rFyjqmJEZa2vuddzhBSCT9FLKY9+bt6zXElG+AlBuCk1slvNDmiea2vgb
         pHNOrV+TgYjZS4jR8MOVwW8sWI/99+9X9sH/8kyKr6RcBJMum8Fjsh5dgz8glxM9y0eZ
         bOQ30Im6bpqirP+GERt1P9t8gUN9wSlBsUUlHKY5yEZZHyPevFJkh8HGsKvmZNJpkDw7
         FWOg==
X-Gm-Message-State: AOJu0Yy9nTVHh+jOKxjBEcaLW4dcAyYGdfIDf/mJARUlhcXTi2n87w9c
	nU98TDB30XM3JBK4bJB/ZxnVaLC6RDsps2dVgmHEFBI6jR7ptI4K+TpQWa3IBQ==
X-Gm-Gg: AZuq6aKEHc4po0MCQzf+M4fMeYRx691swgrO+Y/HcIpVZtCJSAT3rQD4IPpxJ2F+4Kn
	VDCAqn+GcsjaQ/xzQSSi2h5bW8W7BcogfIc3JeOMU9btUF7lttsrky1TetxnuGBX4LJE5h2MpOB
	oopDpAkDI0OmF1e8Ddu7v01s8qdT23U+tt0NrQZWt3aqulaCLkN8gkHIEWTv014pAdnDmiTCUei
	evyb3pDYI7vCjBZRZvuLD+zXE0SRaHpTUSVm5IYEFBdRJ96KRd6HBIeYh+O8v2OYs4FAkIJttO3
	C8tD9zpbs27Qy/W0sYv/TfDja3aA1Uy2YOD7iVepczaObd1OxJfko6pMG/VjqV/5aGlwYKwI0y0
	86axkyyhCtotsjYwn1mu1/TVUtZA6X6npLNnRxzDayXb79dbh/bIZIkvrrxLJYHmO7mltTIBhfQ
	Ay9OLqMH6eLYHWmLIuzbbz46UM
X-Received: by 2002:a17:903:174e:b0:2a9:2858:19a2 with SMTP id d9443c01a7336-2ab10a0dee7mr16126085ad.43.1770716571215;
        Tue, 10 Feb 2026 01:42:51 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b8d79sm133219215ad.61.2026.02.10.01.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:42:50 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	dramforever@live.com,
	anup.patel@oss.qualcomm.com
Cc: anup@brainfault.org,
	cleger@rivosinc.com,
	samuel.holland@sifive.com
Subject: [PATCH 4/7] include: sbi: set FS dirty in vsstatus when V=1
Date: Tue, 10 Feb 2026 01:40:41 -0800
Message-Id: <20260210094044.72591-5-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210094044.72591-1-ganboing@gmail.com>
References: <20260210094044.72591-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_014252_763610_3CE17A80 
X-CRM114-Status: UNSURE (   9.12  )
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
