Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02090606A31F
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=spWQ62nz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=T1P6wO06
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tpkJAmYTUn9vWiP+1M+U0+j26vS02EuZ4LiI1p5uR/A=; b=spWQ62nzMCBMu+jCgIopygvldI
	wHOeEMH/AlkDA7jvKu22YaS4w6C0g/FExyGcQwRHxqHfuGP1Lwegw4gbVP/6zR8WlrTJnoIBhS1MD
	hoRI2URfncuMZyzqTe1GHLQa18zNDAldX9SRGsSRv5CEa6EhHkJ0FVMAK3SW9528sib+nNOCTx1iC
	2M23WMJPPsieMrZAQ95TNQq7yP1Z3Yswa0OMvVxvkFiU412FnFrAEfzisC0iUjxgokk+MyqcXAg+R
	3x2kqJvnylCBJyZEEpbRky7kJD2XJF5v5/dBMCTkA0B3v4oURcEgZiiVLb6UpZMMSJgUxYaHQvf9X
	dr1C8oeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcfK-000000042o4-0oHg;
	Tue, 27 Oct 2026 08:36:18 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcfD-000000042ig-0lvE
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 08:36:16 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso1586054a12.0
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793090170; x=1793694970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xUdXvZDPiiHdSYdcqbl49Nv/YphVHRoPTNPUCozcHs=;
        b=T1P6wO06Y//mjMaAeCjjKzeQkZCXqMRdO4qc2pSdGQGhgQTGgarNZOv/YcZF46DoA/
         pZ7f//5WesFzzFpov/F3+GKGy38wu0dStNdPzJJwwuF2J+1FiDLKMKaBAWs1okGCvLyN
         I7fF+W03GqO3u9gP9F7p+CURAUhFmVc0w0WhgrdLS4FKMDOt+7PmDfl/hYy76+om/mZo
         aoXnk7lULDBqyphxVH3gpbbnArjdIZNxu9XeKQXPRxHc0cidn/lZJvU+LROFNLeX2lfj
         eyKGGc5T8FfX2bKj0W5vRj6LRa+v70M+2Owav7sv89U9YEh/wHiIhd8BLXPRGdaXpLNF
         Wdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090170; x=1793694970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xUdXvZDPiiHdSYdcqbl49Nv/YphVHRoPTNPUCozcHs=;
        b=OCp/Td8CuJ1zA0KrNW6QOTsqKZkslT5Aineg+MpsKaZL1W3TC1PQ+klYNxsfhHY1cD
         LWTT56YTF4IflAoMUVg6fZUnsWRS2rXocPhvR7Is7IIqyz1RK74c0h8gzsfY8kQl4b8u
         ooL2D2uf4+mPj0wck8ncY824mIY4+tGscC9GM/9PJT/Yd8QsMN9PlArTaxpx3Z2Jib8q
         9Li8KizywxFrfIJkc7x49F5C5+Xd9u+9tMtTtA70YJjxZrw9EwIOIyWcG8srl0fSjS90
         8h3M4CeIP9Pq8BMvlN3uyFet168koizuAHJoMXS/cVOzMzPct5WsWB4i22Vbr03oHRMx
         G6Ag==
X-Gm-Message-State: AFq9FYIZ0i+1E8MD31mbDO4be6hOEequm3yZCOp5WTodwpxVT2nYEszd
	v96B4z3URgZbsZV4b2b/sLVEi2knj7kW5OtOtzJujpP/uaSZ8azspXfaIliS5sqaVSXpQe4hUCC
	5AjAM5XXMCM6U2sshUa9qeyM1eNad1rbEF37xMwv6ywNggOho/Vjk0MMJkqd7scP/UFbzwQQ43B
	xSmw/du7p7ZXe/yp+LmiXJO307377NPKphpFhslKE+Pno25OOBFys=
X-Gm-Gg: AYBFou0/eV8O67+e8IKUbXKxrB2k67DYwURVAoghOVHCTsPNqrBA6/EOKS2RHa2c9VK
	pX4aX9GYDUu//uZGnBNB9DkQK1oXAAvajoL0lfe9jALXzOp4QUAOHa/EM6hYIGEkI5oCnwmmcgs
	mACpE0GD8doLACxdf3RpbEjtgLyRxOIa0yIxnss/MGK6I/1OBjoR6gP6Wi2j/8iNjrlWU7RGkfp
	a1qK8wTL8rwF5Eu74GU3XJ3CYr9yKzHCcP8hoMlKU2DTY+ppE6A3YoCYWOKvwhU9+0OHbmrvDoE
	Dl4E29hBD491o/W4gXe1uRGnFT12W8solRj+qH7kmqtcF7O/yZxZKCnfCSduET+sGosvJLBSf/H
	yHD6lslWhGaoHEC1rHcNpqQv0joqP5VT6P5qWmOoNpCR0WGYjTMGtbTuwiaJYXWv617Ai6tFHvl
	Kuc7tP4vBiY/qmvMwIyFL2FACyAsNrpByze7IBl4LSqWkDG0hiA2/8Flq3daARg93MaSi6GXBnf
	HG2mr27ePhgcMVltAfRxBOULYFACLI77Tq/3fJgUTZdAucXAaAviw==
X-Received: by 2002:a17:90b:54c4:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3adead57d38mr6246116a91.26.1793090169933;
        Tue, 27 Oct 2026 01:36:09 -0700 (PDT)
Received: from localhost ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm2461393a12.18.2026.10.27.01.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:36:09 -0700 (PDT)
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
Subject: [PATCH v3 8/9] lib: sbi: display World ID configuration at boot
Date: Tue, 27 Oct 2026 16:35:08 +0800
Message-Id: <20261027083509.1076577-9-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027083509.1076577-1-peter.lin@sifive.com>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013611_249917_7D952F29 
X-CRM114-Status: GOOD (  10.81  )
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

Print per-domain Wid/Widdeleg and boot HART's M-mode
World ID (mwid/pmwid fallback).

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Change v2->v3:
- Display dom->wid directly when Smlwid is present.
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
