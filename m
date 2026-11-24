Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640D1606A321
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 04:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ThzqPesN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=F1tJV8MA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uA9afqW3KZ9gzdc6jhhsyDUOvU4O+3inT6zsA6ryFhk=; b=ThzqPesNkGoKOhumy/MgmWy8l6
	DuiqWL0VSMGmgF9ENHNDbpBXDLv/ni96M04INXN9qXrD7r3W38uunS1fjF9CUbGFaw1SSbN4IMJFx
	YU5imzgVY+BkAytpYlultLef8X5A3WW218OCpfVZYdGMqu3tKHoOehkTIEuhHLPjsYmSFvWPyZN4Z
	U8OqbIM2zboF2X6nR13KdDpVRExM6ZNqX5opMACbO+UPw8twwZFfsNyT26nrLvcl0yJ+u8211REeq
	8q9PErEwL0MAUMdCRNkGeaXmLVS6d8y2MHi3ryOqgM1UTwNIJvF75l8/EhKj8YKzGM3T3dO5NWrAN
	ZGc0xeJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxU-00000005VUS-0s5v;
	Tue, 24 Nov 2026 04:16:44 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxS-00000005VU0-1vsg
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 04:16:43 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2036773b3a.2
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 20:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795493801; x=1796098601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itAAlRbAzaAZ3ImosClW14YuxFRe069dWyGFnoayAQM=;
        b=F1tJV8MA5JxZRhthMrro3OpTvbpFSgFmLD1n8+txubr6ZDUW+A6o24jvm75WpZq6Wm
         wMAA4VZXgXVDAVDK2mQa0DCit6AOAASaP2zED01c72SA8SfA1dcdVsriBRmoiAsaSdfZ
         3hn4NwMT+bJfl8c97nMbp7Bgsd38TzM10kbg4zlP9Mu4Gb14NNMLb40X39Co5D7JY3eG
         RB+uFthCUOH6Z0mWGCMxoWndqfmYP8+Z17sWREFYIS7ly3IKqmbuW3p8KK7yEthfYJPy
         SlUwZYLfjb3ctUo7l+djrruMxKO/SaWXZ8r+4SkGH/noEM526pvdeXeiTapK1QxHNfEP
         XJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795493801; x=1796098601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=itAAlRbAzaAZ3ImosClW14YuxFRe069dWyGFnoayAQM=;
        b=tQrYK3uw62isxJvZCrs1IlWPRLeqwpAFOhTk103TenglTRxwA71qqZbLcOZ8G4XxuN
         YD/b8+1tp6ZyMng6HYOttqnUonjUJA03H4jZpKUJ2GxvjsJR4Y7E2XDQCNzIOLgxavmV
         QeYjnsfNHyOj5bBhFpncUj0p8prAMRX8IkcdW7bYhYubXUFpAjONrfjae/VTPxnKFyFp
         gTe8Yz0mGw1f6Yyhv4oTX8KW1ME+rblGCcPGMVeP61qZ9H7SHYOwqO9V5wZRSsil6XMU
         TZjEsSEb9plmW4LnvaUJd+j63yx6IT6I9zrmpNjiaOIwEyI6kzzlvwgfDzYH/oK6fKDL
         DWWw==
X-Gm-Message-State: APuU4Z+yIzxlOid3/UQBIGilVaiSqVXIY6WwkpCMo74glBYyhJOPQUUR
	QzU0HXT3Wk3YtsIDsh5yBDAkkGhBo9t+Y42MQZi4/0eB3ZNKQHbKaVT5QhCaI8cQ6H6CuKIycpH
	lThqzufNdZjaUx8taMGDcmuzohZQvO4R/qbXdr+NbQPCKNHIv93saHVDpdrFKKGtt7dCFrHOqPk
	N7uDDBvKGMN2vqF4qzrrb3K5emLPVubKd39Z4YrNogK+8ti/8qM3k=
X-Gm-Gg: AZFdTZfim8OLDnJx1BjfveFa6s09Dq2dHraegdr/1SUhH6+CJcaqkxuAPd6GAgxKa7D
	RKNQRerGdOiPa3CeuysaY5LkbrPeMH/r6rg8EoWsL9zOB7hOX+J3FruY7wGQmw9Cg4Q0/n2cNPt
	Fcnb/SCpb+T2KAM2aVq0V8Y/FpjeP5ceieI9TR5UVV6pj+13Kn2BkNqDhqCXM1279Bb88fyksqI
	idnqVJHEnOMA88piwwGKUtXU7HD8crmo0kSiW+3HPRfPmLHwrn82WtPI1LKWnQmuYJ5S/VwSBVi
	ZgRwE1tajaVaWmvI+Kp52ktP/JBxVvzKetw4TobWKZqypJ+3VZxuZJAbysilyXK7L1mUSmGnGHA
	huDUl+LvW3S4S/Bzi4zAReTVcmMYAPrZg/LZb2nQDw8TQdHVozLco0/vAtZBGydSv6ggrPk8h9l
	nIYp4rXmKkWCWqLkU5543nSW92Tz+8ngI4NHKyOBKrSsxfvHI4g8RY7K5DAKstG9MWEwnGownGx
	K6Pb7Yb6cqhMqsBxtzKzpDtUZnkdsC/iLfHMDq93LHlL65iE1CQz+4rVPSEB7eq1aIN/4kzvqSv
	fM8MwSn7BPsS+QLKA8LLg/UCwnI=
X-Received: by 2002:a05:6a00:94f4:b0:89f:c441:580a with SMTP id d2e1a72fcca58-8c87ca522a0mr11297495b3a.36.1795493801261;
        Mon, 23 Nov 2026 20:16:41 -0800 (PST)
Received: from localhost ([136.226.240.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4aca2sm6394302b3a.32.2026.11.23.20.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:16:40 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com
Cc: raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v6 1/9] lib: sbi_hart: add RISC-V Worlds ISA extensions
Date: Tue, 24 Nov 2026 12:16:23 +0800
Message-Id: <20261124041631.1049169-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124041631.1049169-1-peter.lin@sifive.com>
References: <20261124041631.1049169-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_201642_502956_F4F75313 
X-CRM114-Status: UNSURE (   8.77  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
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
index d1f5500d..d86abf07 100644
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
