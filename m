Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4263606A32F
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kVdgpO8y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Dtzb3GeH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BGoMdnP2rTu8L70EuGjSqwlXGMs9DNgI4rOUUi6vaY0=; b=kVdgpO8ydrjNCcqP6BXvTFovdE
	SaExvvIKmwNW8gXhVR4LukGJ5AU+Bd5UbbUN4dm/waZ5H/ShYocZlZ/S2Hd2xZryqTqxeJEZ7pdzj
	uJ4HfHoBJMDo1rPWumnpJ3ApsvGxNpUCI+WnEVdWOJfgqxg+ga/a0cLCnBNtZa2niqGEMVDI300mp
	RO4yJ0Snt/kqxvW16kMK4OaCgaXFDIcl8oAxW3n/E/mEktsZmbGAWmhPy++zPLCmAHTy76jwWCxjn
	+4fXAMN865RaCjGdspIYv/w1SwwdvSW7EPv5xRhHefrC8x4H7vM0xfLUd8ZChePda2Zx/O9u4aVme
	pIjkHm/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk74-0000000BQcN-1tMS;
	Fri, 30 Oct 2026 10:45:34 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk6z-0000000BQaS-425U
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 10:45:33 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ea0efd636dso4779425ad.0
        for <opensbi@lists.infradead.org>; Fri, 30 Oct 2026 03:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793357128; x=1793961928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8kDn7o0zGQApAJeibHcnCY2Lc4TRP46xWWkinPBjM4=;
        b=Dtzb3GeHv5iSSQamRVrfHFeIKad7Vw8Dp9qEvVmIGbVB7p9d8HgRXnHXQck3I39F64
         H1t7QduXXAGqfQkzV/NQr1DYiWzmFTaz1af5X8e1u/dhRyTFcHoDnyC/2XQ6TlD7fK7U
         +fM5G7gcMRw8gZoMzDQV1A0YdflMMU8srkRpSTXsMBvxgurZ3tGWSFGjRcBaD8dBATF0
         SKU6Qsnu7cVPbQPXE3hYxgi3T2BRyfRp2uPg3Foe1GQ7e1lTXY3fh6aEraq1bl0/+AsA
         CM3EugxQJ28DgiVANYZgGtu5PuDDlO4d7q7znVnsq/WtUXZ7fH3LBKEkFTtNvYQ+aITV
         Q7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357128; x=1793961928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8kDn7o0zGQApAJeibHcnCY2Lc4TRP46xWWkinPBjM4=;
        b=LRyF24hvYhXyLy/4Z7jJ6g20ySjT2kduKr4husin2THUd0vgd5rv4mzZf9k5ukagh+
         cEBBgM/3aN43etUrF+qV/iQ/fV2zS8vpWh7JPGM+Yh8yCEMWzYOd4eJsyp+8X/hXA34J
         pKCNZPRnykklvXy2dn3mhCWJSOkaU+W4DiaTxkfURqp7v6qJi316DyDja/Ecpnnm7Oyw
         PpCK9lgL4DNzGKNFdNwrsRK1nyqJO1O1By/unTuCY9vVbZ512Ra7W2UxWxHbR9WiH5oT
         fim1HUESeYRXDiKisZ0cqhJuvma6iuebUkv7h4MG4eAWW7fsvPvsEGas7LySJV6Rpbs8
         tH/Q==
X-Gm-Message-State: AFq9FYI/AY4snKTou9HHOQoO2H9PaUKSsWb7hVa0nEWEij1GjnbrpFwh
	K0Q+DUyAeTRY29KLm1PWjM8YnvJ0P8yFDVugdgyvz5MBvCENt3Ro4CR2gQ58qCsapQRAaicrPr9
	gjNtwze/NZuYTu9WPDCNW8d3ACjv8rmEhLn5I9kcUv+z/oNPUBFXije8Wv/h6qRWciliyqLe+Uo
	a1voAI5LaZzHltExWslSMfOcRGSznRkW9F7qaPoySou5t3U7XMoVo=
X-Gm-Gg: AYBFou3aGFhKRoQYMFr75Z3vrbatm7z4HhRSd62PomOw7v3iPDrPMMldSMRKMiD6+Fi
	b7AurnoaZA3Xgw5KjTIpBM0ZcpXGskxSExPSXymVuPCOsH5l8PfPlqQe74sZYmb7hvFrCIqYHxV
	JAOQNRuGIwMtxX/3QLdCLm0aO7kT7xXE+tSr+cHXnLrzm+xxdOHRMG+nnE3Rv3IkMKJn1/M5EAm
	ytPXNyPNWXkwHbFNieMcKfr0WPt/OId49pjcSy5o8fE3m6qjEoKrUxYpQ0MXCR1ocl6Xn9lpIde
	8OPA/8s1zUOVET0Yc0DYXKP2HGXvd+uW8xkVOUhDCxHtRSzwCEE7QBXcTmBo/ILJrPNj4K5reYZ
	HRLnLZBfmMpNesrWMBHGH7wT5Y6EK4JCsZOQSQxbYacnCkyHTOGdNVZq0Y85mZOe3zhfl8mXRbG
	qLG2lr12pNHnGVByqafDlqbkFn+5K2IQq244olAI+UEtO2Ixf0Lkbdo5iOUfLkm5g1THPhFuOAE
	f8EqwYaNnrRgPlaJv0Wn+3KK8P43kXBuw7MZATWTz+HRLWT6rJVnrhDCE/cmFJbmD9g0mxK1zOE
	56e2HgqnnxxLjrGWKVFXUFm11VE=
X-Received: by 2002:a17:903:1aed:b0:2e9:3c24:999 with SMTP id d9443c01a7336-2eb364d2f4bmr19693665ad.40.1793357128275;
        Fri, 30 Oct 2026 03:45:28 -0700 (PDT)
Received: from localhost ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5c2sm5571115ad.20.2026.10.30.03.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:45:26 -0700 (PDT)
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
Subject: [PATCH v4 1/9] lib: sbi_hart: add RISC-V Worlds ISA extensions
Date: Fri, 30 Oct 2026 18:45:10 +0800
Message-Id: <20261030104518.3297875-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104518.3297875-1-peter.lin@sifive.com>
References: <20261030104518.3297875-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_034530_000611_56AC3A74 
X-CRM114-Status: UNSURE (   8.99  )
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

Add CSR definitions for RISC-V Worlds (mwid, mlwid, mlwidlist,
mwiddeleg, slwid).

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Change v3->v4:
- Drop trap based extension detection (Anup)
- Drop RB-tag from Oza
---
 include/sbi/riscv_encoding.h | 12 ++++++++++++
 include/sbi/sbi_hart.h       | 10 ++++++++++
 lib/sbi/sbi_hart.c           |  5 +++++
 3 files changed, 27 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index ffe7666c..e0262bfc 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -400,6 +400,9 @@
 /* Supervisor Resource Management Configuration CSRs */
 #define CSR_SRMCFG			0x181
 
+/* Supervisor lower-privilege mode World ID CSR (Sswid) */
+#define CSR_SLWID			0x190
+
 /* Machine-Level Control transfer records CSRs */
 #define CSR_MCTRCTL                     0x34e
 
@@ -520,6 +523,15 @@
 #define CSR_MTINST			0x34a
 #define CSR_MTVAL2			0x34b
 
+/* Machine World ID CSRs (Smwid, Smlwid, Smlwidlist, Smwiddeleg) */
+#define CSR_MLWID			0x390
+#define CSR_MWID			0x749
+#define CSR_MWIDDELEG			0x748
+#define CSR_MLWIDLIST			0x74A
+
+/* mwid lock bit */
+#define MWID_LOCK			(_UL(1) << (__riscv_xlen - 1))
+
 /* Machine Memory Protection */
 #define CSR_PMPCFG0			0x3a0
 #define CSR_PMPCFG1			0x3a1
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index a020cf03..ed344783 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -97,6 +97,16 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_F,
 	/** Hart has D extension */
 	SBI_HART_EXT_D,
+	/** Hart has Smwid extension */
+	SBI_HART_EXT_SMWID,
+	/** Hart has Smlwid extension */
+	SBI_HART_EXT_SMLWID,
+	/** Hart has Smlwidlist extension */
+	SBI_HART_EXT_SMLWIDLIST,
+	/** Hart has Smwiddeleg extension */
+	SBI_HART_EXT_SMWIDDELEG,
+	/** Hart has Sswid extension */
+	SBI_HART_EXT_SSWID,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 925cfe96..77ef1a70 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -355,6 +355,11 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(v, SBI_HART_EXT_V),
 	__SBI_HART_EXT_DATA(f, SBI_HART_EXT_F),
 	__SBI_HART_EXT_DATA(d, SBI_HART_EXT_D),
+	__SBI_HART_EXT_DATA(smwid, SBI_HART_EXT_SMWID),
+	__SBI_HART_EXT_DATA(smlwid, SBI_HART_EXT_SMLWID),
+	__SBI_HART_EXT_DATA(smlwidlist, SBI_HART_EXT_SMLWIDLIST),
+	__SBI_HART_EXT_DATA(smwiddeleg, SBI_HART_EXT_SMWIDDELEG),
+	__SBI_HART_EXT_DATA(sswid, SBI_HART_EXT_SSWID),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
