Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7BD606A324
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W7TtdmDw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Lv+UHY7S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v/XzOy6qwGpRAmf+NyrhRmGeQre6SVEj4Ux1kjxmgx8=; b=W7TtdmDwEK2C3dQ18DOAjQYV88
	d4qSlNeySOzpTtdVyF47hMQeH1b/KLi85RT3EvwyecqfoJzaA5Xg7VLECR1bITSRtd8cTgr1eB8y/
	KENTrCrY4mgCyX4r8WuJkP9EtsnB3M8+zS0djvGRY1QmslKQk2i9tFkm4cQQRNH+ZTBYh7kTHDuG7
	N93qKOF4Xm3fCLKRYNgaKxohmylYdrK/86Z7rVO71qiM6w4J7x+BUhU4PbejadIrT+EoEa1Jaryaq
	WjMoWw48t7Mg8QaNH9Egrs5QZ09VUPdYR2uA2zDikYG9nQ01vqT+3tIE+r44j2xGIgbunxOZc+qle
	xrgpTJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcet-000000042RN-0LkI;
	Tue, 27 Oct 2026 08:35:51 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcep-000000042Q2-2nfO
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 08:35:49 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so2726826a91.1
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793090147; x=1793694947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vp47AOiOmOEzB/VZ//MB/4LywSrXEsAKEdiU/6WZ03s=;
        b=Lv+UHY7SvouXkF3rigemZwGRUscB4YawRsnNvT2p8VUEja2DHNvaKCozhWFeU9MOjp
         ELEb0y3SEzCOOONPH7l5i5d/V+kpG02wHpPvf44xtgDMpaLU/2xNsVj+UkdlEU2c71nL
         yyygh9rzsMsJPEhAIjcOt1ep/E5H2SpSTZL32t4PGOKCBc7PmEh63KoKGz7M2sQmssi1
         v5Lv6x83zlRXAhhi3oc0VtgqLJ8WN8qpADbu4onothzpdbKmREDo+1wgr1OmiuPAIdxO
         4ng1MWwEWyFpXdP7ZKD0ytkDrzevnQtAbSJN4p/bM3emrhCEIqYKzrVh4x//ZMgpEBAF
         8spQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090147; x=1793694947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vp47AOiOmOEzB/VZ//MB/4LywSrXEsAKEdiU/6WZ03s=;
        b=HqUG5RiwlnVkPGGbxLh3wbNJ4WcSmCg906p2hIl8OFvB1VPZS+84Hnywj+TOIpwUkR
         dkTEngjxEGjgtaVUhd1nS2Gyq9CcpMNHH0tW+F2Ts/PZk/P420WJHvap+cYZsle5qBtT
         DlDq5b7WmOYTj+MbLWm9E9Ho93hiIvjjAmrA39YEaNHdpa0z3W4xWDKME2H65GoPQ34Q
         Grk+OcaYNcuvP0iBefLRa6Z4yGE4beSKd/yktO5lUp6SZx3C3EczWQDQfoDHCuYGSJ5N
         fk/obs/drCqLZsHeIlZiqti1TYqNGR3jPxdYjSZ8yrLa70sxc+9pYzi3hrKK8hdBgpoV
         Jj9g==
X-Gm-Message-State: AFq9FYLgNsu/DJvB0+8GnrHCblNs7e3UbuXBKJOnvyY5bkdwKm5MgOVz
	5PR9tDh0EMdx20ybnGhbRLhVMQ0w6ibFqi8xsB/+SQ6UA3BFNsF2C+zXGHfdTJ+hOUOdXayrhF5
	cKeclPnAvt6mqvxkmYIoPwEs3VMfo/ghuVegywSrb4hx3uxVlC0cjHsa3gm7tZgJUIxrRVHHjmS
	OiKJIfywVCEHSwS9kxrLXKaa+yZt8t3b67FUUoQ0J/6F9WLWuj
X-Gm-Gg: AYBFou0dvsMvX2YvetlZYmnQlhkGefjzP0/s8bN3p6rM610O136/UjdL/ZrsWi33BsA
	Qt2EUcQhh71r9BboFaw1Ch4i4ddN/2P+9KI/BZzY3SVa5gq5YylrlePrw8shlPjnWt9u2uxDqef
	zNh+8nDCI+Q3goGvxMm7FfD7GW/+nBDy7vxNAQYbdV+pWtCnLhLqARu64KEBhCSNoGLGcSATQwQ
	hUKTrLZSo8BCCDn4fPOMe7TPnxGEP53JP+ACWVBprawob7btZrVif2vJQQmqRlP3hlJH9vZa/Zx
	9+lFuXW/NtmTYRRxrNZhSeITOmZSzOi7Q6BuQ3Bca6lydV6qXklD0RP72yA+FCLXCjNtr220YrI
	gstb6DH2epAZd0ufcJyEs27LXi3ZMqaGI5qtuCN1TL+JXyxGbshYpYTN/U6RTT8H4wF69KPEnOS
	iCYlrwYmZY3LvzvnO1+DmVR1FXqYx11JzIwuLTYUP/WBGleVrTmssjRZWi7G8nteUjzk4U5onzk
	PWeOmhzXG/GJxEMVGVJXHAo7tPwhYhImElUDSo1kJaRq4X1XkSTGw==
X-Received: by 2002:a17:90b:5210:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3adeaf9a70cmr7187472a91.51.1793090146657;
        Tue, 27 Oct 2026 01:35:46 -0700 (PDT)
Received: from localhost ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40427782sm2784783a91.4.2026.10.27.01.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:35:46 -0700 (PDT)
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
Subject: [PATCH v3 1/9] lib: sbi_hart: detect RISC-V Worlds ISA extensions
Date: Tue, 27 Oct 2026 16:35:01 +0800
Message-Id: <20261027083509.1076577-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027083509.1076577-1-peter.lin@sifive.com>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013547_735080_8A45E060 
X-CRM114-Status: UNSURE (   9.97  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add CSR definitions for RISC-V Worlds (mwid, mlwid, mlwidlist,
mwiddeleg, slwid) and detect Worlds extensions via CSR probes
in hart_detect_features().

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
---
Change v2->v3:
- No change
---
 include/sbi/riscv_encoding.h | 12 ++++++++++++
 include/sbi/sbi_hart.h       | 10 ++++++++++
 lib/sbi/sbi_hart.c           | 26 ++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

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
index 543393bb..2941809e 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -95,6 +95,16 @@ enum sbi_hart_extensions {
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
index 8e4c36d0..38a761ac 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -360,6 +360,11 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
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
@@ -647,9 +652,30 @@ __pmp_skip:
 	/* Detect if hart support sdtrig (debug triggers) */
 	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
 			CSR_TSELECT, SBI_HART_EXT_SDTRIG);
+	/* Detect if hart supports Smwid */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MWID, SBI_HART_EXT_SMWID);
+	/* Detect if hart supports Smlwid */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MLWID, SBI_HART_EXT_SMLWID);
+	/* Detect if hart supports Smlwidlist */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MLWIDLIST, SBI_HART_EXT_SMLWIDLIST);
+	/* Detect if hart supports Smwiddeleg */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MWIDDELEG, SBI_HART_EXT_SMWIDDELEG);
 
 #undef __check_ext_csr
 
+	/*
+	 * slwid traps on access when mwiddeleg=0 (reset state), so
+	 * Sswid presence is inferred from Smwiddeleg.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG)) {
+		__sbi_hart_update_extension(hfeatures,
+					    SBI_HART_EXT_SSWID, true);
+	}
+
 #define __check_csr_existence(__csr, __csr_id)				\
 	csr_read_allowed(__csr, &trap);					\
 	if (!trap.cause)						\
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
