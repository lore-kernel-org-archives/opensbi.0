Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A79C606A32D
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C+hCDbsB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ZyYbdmeV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2wsw403b7wUm9TMypvz+VYIabL/XsnfcpCOLdJRFD5I=; b=C+hCDbsBljNOJIVMx5xqoUKfLm
	dg0L7FwhPJxJ+mslM7tYRuVFUHuZ9ZhnD6VBJziTuJBZwWJ2XhzHciiA9l66T6LjbKnwaH6bD5oYV
	ko0oftbjosqxVNspXueLj+v5u7++qsz57I0AvukHozvt7rY4rGior0ps2cPEhGgWES9eDb/UVBSDv
	amlg5nYhGAHRcedNBytH+OY6ATt/uxfvoMUyH3ItSG80+kNvOyitqSjsHU0nmB7niw75Olz0pcEW0
	lsvoJtMx/CwK+Gk0z3SqBl52u0PynM8iog5nnslsp5DGjVjJn+4lt0q+sf4e9xyGr6KmQFVQHphcr
	DXZYl7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7P-0000000BQrr-2oCq;
	Fri, 30 Oct 2026 10:45:55 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7M-0000000BQo2-33rm
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 10:45:53 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so276666a12.1
        for <opensbi@lists.infradead.org>; Fri, 30 Oct 2026 03:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793357151; x=1793961951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bl4Q4pQk1Ce32x3I3tB3CnT6M4CLxD3+ugW9Vg7JOZA=;
        b=ZyYbdmeV+JPyzu1z2CZ8Tngc3N8mvmxAAwMJcDAS6EIVi+emFwsmEn60LYIPlQPJI5
         amwm3VHcqMyDd4ZP54IAhQzEdu5e+6CYfWg61Z9PpkRA8TSFr1zlYT88E2CEGSif3glZ
         K0/xddOucrxcrb6IHwxI3bC3x0z54AyaWvvKMO3OhiVvmRrv6M1d521XfllpYCZG511q
         +9Z3OuDZAzRdxAJot2g4//VtPRUi3C5n3btAduYq7ufaQX2RDYl45aj8GMsdKmuszH1H
         hmPtlELdHWMor36bqUQJ4zopqy77t+3xaUrxazCx84VNBLgYWSv6T2yYlIcqoH3p98L7
         xszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357151; x=1793961951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bl4Q4pQk1Ce32x3I3tB3CnT6M4CLxD3+ugW9Vg7JOZA=;
        b=uoAejz6w7yyteRzvzuLciFKIbP0naAm+kBbhF3O64nrmk5hshgZok+kqB+bP/iKvKa
         Cu4q4Oc8Avrv4M+TLgSPZwjzUNW0XrZ53h8JT6Tp+mr8ZhbLp+8idiea3jBUvkpSALeI
         KoFFVg/pkTPoTJSMLmTOkUC+4Jbxvx56dPPwADVxsw5vqDb8dcx3IHijsEd1/kj8DdeR
         Zs8TnNubJhBETBkmqQF7j/zTooKsmBCHGCFPhNrky1IRfdO6RFUj0zftymlRCPA24pZa
         1cWzIJPTWZWRjmISbiFS6hZMmiab+veLI5BOCL/LtpzmfpaAEe9JeQQghkUcPFQagp1p
         cLnw==
X-Gm-Message-State: AFq9FYIp+ciP2awBql0vE1zbLHAV2lg7/x18WmJJULnD8DdY222LksVx
	WkxyYfCf6o3/tvuq1ldN04j6QTlO6aBz/VV2sLnWOuU/ypJ2ZvwklaCerFzMe8QUT6ZYN2urJmK
	0+vwuumkAd+ErqcXoIJxWfMqRutAt9xfnPj4VFF40w1zBvfcysJW7jL5WoLdpPWUST/fWH1Xlhm
	O4adw4NDTJ9YEa8YpyEjklISPMcCOnEuZJejOUaK3yyPtdTJdO
X-Gm-Gg: AYBFou3tOUyoDiV6vjpIrWj4dtJ5d9V2u6x4l+jCkYbQnrxjuJ6tsuu/A9T1VCYjRVq
	HsKpM6Gmv04Pdc338GILMKEUvws+PZc4VBAqvIKibxDqpCCPbrIT1p6uMnM8Me7A17V/KrtFur8
	U7UfOYOyeIgZdhXdAg3wBGV8UBK4c8OFu6ZWh5x7qrp6+Jw5ERZ4ZcQbGA+OtFDR7X8dddWWh/H
	BcrFeEWFtq7CoS2OM8+v84A3v1rrl7PYo4J+sXRtnF/06heOtYKagVdvVAi1pZbfnNEOfIrvP1D
	jZKKNJEPk9WhL8IxWkrGprFGyIY3T5GXaogPuBABV3gw57OkGYE3Wz1VwkbIgrbYVFRvDBFT9er
	BLH3ZJtrYnvKSCmeBz28TYXykWYsZXLjqEdhag6XMEhIDzfHNcRMPuZgJFHSt2iaup+aY2RGUxn
	V1v5DJghfuEIzVcCrgNxpPr+/1oQSU7mLVBvDTEZHj2kmwu95a3u0nQhA0ctwRK1CDKX10LG4hK
	mDGEGLoc01kbox+os0d5Ed8AC8UdKYDJ6El1RMZsOke4+UzUjox0Y0NRu/YMeF3qijBh6xykh02
	phgi8M8DWEtDm/9/ebjp2q7MUYQ=
X-Received: by 2002:a17:90b:4c4c:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3ae8972b662mr977271a91.19.1793357151150;
        Fri, 30 Oct 2026 03:45:51 -0700 (PDT)
Received: from localhost ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm3619811a91.14.2026.10.30.03.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:45:49 -0700 (PDT)
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
Subject: [PATCH v4 8/9] lib: sbi: display World ID configuration at boot
Date: Fri, 30 Oct 2026 18:45:17 +0800
Message-Id: <20261030104518.3297875-9-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104518.3297875-1-peter.lin@sifive.com>
References: <20261030104518.3297875-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_034552_777850_0AE7B1B8 
X-CRM114-Status: GOOD (  10.26  )
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

Print per-domain Wid/Widdeleg and boot HART's M-mode
World ID (mwid/pmwid fallback).

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_domain.c | 18 ++++++++++++++++++
 lib/sbi/sbi_init.c   | 13 +++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index be9020d0..f92ebc2f 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -10,6 +10,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
@@ -613,6 +614,7 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 	u32 i, j, k;
 	unsigned long rstart, rend;
 	const struct sbi_domain_memregion *reg;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	sbi_printf("Domain%d Name        %s: %s\n",
 		   dom->index, suffix, dom->name);
@@ -691,6 +693,22 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 		break;
 	}
 
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID)) {
+		sbi_printf("Domain%d Wid         %s: %u\n",
+			   dom->index, suffix, dom->wid);
+	} else {
+		sbi_printf("Domain%d Wid         %s: unsupported\n",
+			   dom->index, suffix);
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG)) {
+		sbi_printf("Domain%d Widdeleg    %s: 0x%" PRIx64 "\n",
+			   dom->index, suffix, dom->widdeleg);
+	} else {
+		sbi_printf("Domain%d Widdeleg    %s: unsupported\n",
+			   dom->index, suffix);
+	}
+
 	sbi_printf("Domain%d SysReset    %s: %s\n",
 		   dom->index, suffix, (dom->system_reset_allowed) ? "yes" : "no");
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index acd2f8b6..f771f548 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -167,6 +167,7 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	int xlen;
 	char str[256];
 	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
 
 	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
 		return;
@@ -199,6 +200,18 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	sbi_printf("Boot HART Debug Triggers    : %d triggers\n",
 		   sbi_dbtr_get_total_triggers());
 	sbi_hart_delegation_dump(scratch, "Boot HART ", "           ");
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID)) {
+		ulong mwid = csr_read(CSR_MWID);
+
+		sbi_printf("Boot HART M-mode World ID   : %lu (%s)\n",
+			   mwid & ~MWID_LOCK,
+			   (mwid & MWID_LOCK) ? "locked" : "unlocked");
+	} else if (hf->has_pmwid) {
+		sbi_printf("Boot HART M-mode World ID   : %u (pmwid)\n",
+			   hf->pmwid);
+	} else {
+		sbi_printf("Boot HART M-mode World ID   : unsupported\n");
+	}
 }
 
 static unsigned long coldboot_done;
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
