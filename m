Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEEB606B9D2
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AbnEsE21;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=je6yut5e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=VuTKDRRm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nPGOuDhC65Nf8Ooz6Qndnlxw5Urrtg+q+ix4I6izoY0=; b=AbnEsE218XMM7hrGuOjAtrsNRw
	zDXrF/X4zOn2RY6lL4o4RG0QndCf1zjLGZg7iQ0WSzkec3f9cLudPmAsI1key6R/G+RfjCeJPzo87
	pW+ekMEQuwUryj1bEm0MJQKpyzDCPPE6Wm2g1zxLryVpNIyZTpXsY3s9nDTyBr6vf4aK94q93IjZD
	3s6JCim4+75V7GpgB+8GpK71vfD6OhOg39LcI0v+gNhgAPARTtMKz0ahJ1fEG4bfCLC9SBnF6Ed3G
	ujtnceZmXQUl34dX12rw7kySVEznGmNdlxq5snu7LCDU+xh+cYViYNkdYWMlDCD4/C0dDJFJKDui7
	Mz0r5mUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiVU-00000003Lmm-0JPW;
	Tue, 10 Nov 2026 09:51:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiVT-00000003Llj-0wpa
	for opensbi@bombadil.infradead.org;
	Tue, 10 Nov 2026 09:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mArQ5vJJSPs0edhTKUhJ0cvTmC7D0PbQ6Mq/UPLM+rw=; b=je6yut5e0ufaHX9lamAaf47F40
	zyPWiUXo4DrG+QHWZVLishLGnj9Xnu2JFCaMcaAhS7Vq9TNqzNuAj9TUkd4SX9o43nrTpHT3Vj/DG
	oCbrL4fCJAVUI/Xls/uO37xG7TIx2z4SABKGeLrK/wWKT1XOONhlHj4DLAdeWrkkhPkYBSf7uVIYu
	bNu2Ito5NqZHzTO/GR7fWppWkdIAdADy5GWFcqIyBuvGUCuIw8Sx6lvmB/0XACcR3C1vUUl9DYq3M
	gMn685DXHcOX9Ns91pCyr0TZzF19IThg2KyPSMHfz7JzdXQ10hNWAinROKjo9isiBpw0PxV9ZapX0
	TM/f1qtg==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiVI-00000007lsO-18M5
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 09:51:05 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so927170b3a.1
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 01:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794304256; x=1794909056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mArQ5vJJSPs0edhTKUhJ0cvTmC7D0PbQ6Mq/UPLM+rw=;
        b=VuTKDRRmlHvnf7YXhfUbnIUOl7hDHFo4yTmYR+cPZ9Ir1hrli8yq9LRlFSCVV4fx5H
         pf+i/B2EAYSiQ9puwIVzV2D6Wpdy+tWv51J4W0Ux3fqOr1mIfdOWOPbfkSEP3y+YIjcf
         hGqEUe2+qIweLx7DqQOHr0NaUFHQQyY38xUajEk3o052dCy3gQemwxE7q7/XpJlnTHhB
         +tBc/ki2GfQlWGpcD3JKyq1skrL2yGrAzUk6x8zlO7ZOKIJ+tNTHhboIYomYjsB0daMv
         770fzQFBrwFXIKFdjXB+XKpAJFgryh3HPi6lM7WezUJcPut1ctGasS3h+J9s0nXYddmn
         lNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304256; x=1794909056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mArQ5vJJSPs0edhTKUhJ0cvTmC7D0PbQ6Mq/UPLM+rw=;
        b=pt7uUdTVp9m5PDV6P5qgEfNEdXy8U5JLLyrdMEjHaPRpW02Vm1WJNQoRwTrkRgc2BZ
         H+pgo6bxd+o26jRMCPS7nyyu4UO5T3uIGJSBUIW/KGTdqjtSTX4VmSWA/YMhtW57CeOl
         xto6miiTXztL4NPpVHapSoKl726nw6MlzR1MzdxKWfmpjftWGPTojMSL2pIjH1wxk208
         VMfQAE51f+b0+epa41SjnSv8vIzIahOpN60zvaVofQqtqxO2Dk/P0/pAPUEK47Z7z+MF
         8ry5DNfdFU3MEb5Ll5C1J5pW8ZPQzDDTaal4ihwVy9mXv4PNmg20ukvPP+BSAlnY9ct7
         S/Bg==
X-Gm-Message-State: APuU4Z9yqmLGTXaPOKYxNA5spRbCqRMBp9R6ewAeaeTbUJ51qcVUN698
	o42HTv5djT2/UEW4L3DhsoloisviCY/kLzwqvucBgRIwT6Ak0KMCT8HpNO7EEthFRXfOJFMUMaN
	GLbiNxBrP1Kv7HiJqimeIO2xOAlTBvVU0kLfb5DX9Qqe9DqV23L4P11f6ASp8hIu9aq96/uYY1H
	niY6I3QroNncwDJaQzLngWT7eZk26zRz0i/fZ5XNl/mbMeXFDARPo=
X-Gm-Gg: AYBFou095hIJi9mNxcmMZqSk/Oex4HSCJoLNAmIpanohGA42hVdJ5pQMKOVR0tGo+C5
	swXhjGg+PnshdE5emvP5rqMQ+pgeY9rF/Mg85yONpw8LyIG3RJF2QcdBk1LgTy0B0EA1KnZXjJ8
	DMwbbbW5xXk4moagJZ5kcOKKUBy28XZwyUMOMFP828VQqAIfPYzIzhItYAEz6b8GK6PVujAYeqJ
	EW0iGK0Xwaz5uPvQ5t/mv+XnLB4KvMpHO/iKlL1CDrnKQS+WPIsn5ZzMR2l3ssSljwjj52hY/w+
	qK4OzjpOjXUHw15KH0DUVKv/bzIsuwVGYeN4/8mUGsm2gaGJ8BsSZE2UJuVCyfvPLxvQVJJDm7M
	1cprNp8uhAK2iVv8ROAHP5t8sfT1jzmC8JHomLNb92OUboeeWVYWNX1Lk+aUwVGOuo4yx+AU7KP
	c1YwkeRGWRBCOxTTtLTqfxQuoc1vZh3bICM0x8C1dzKNOS30uRQKJeXIVhLhRPzb46ohwvSeC7X
	9NlzpVHv2ZFTPHcxA5Okl8wD+WMxzo+Mq8ArVfzHHqw095BAP2D6AH5CGdEhFKRsHGhfAY2kbbo
	NQ/+BrQRj9DvxBTqdBMak/vw2Ms=
X-Received: by 2002:a05:6300:210f:b0:3e2:38b8:ef40 with SMTP id adf61e73a8af0-3f18fa846admr1939855637.62.1794304256311;
        Tue, 10 Nov 2026 01:50:56 -0800 (PST)
Received: from localhost ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d697a84sm562963a12.15.2026.11.10.01.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:50:55 -0800 (PST)
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
Subject: [PATCH v5 8/9] lib: sbi: display World ID configuration at boot
Date: Tue, 10 Nov 2026 17:50:28 +0800
Message-Id: <20261110095029.117504-9-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110095029.117504-1-peter.lin@sifive.com>
References: <20261110095029.117504-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_095101_101181_26E1E8B7 
X-CRM114-Status: GOOD (  11.52  )
X-Spam-Score: -0.2 (/)
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
Changes v4->v5:
- No change
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
index 64b8c777..16dd79d7 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -167,6 +167,7 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	int xlen;
 	char str[256];
 	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
 
 	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
 		return;
@@ -208,6 +209,18 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 			   (ops && ops->smrnmi_handlers_init) ?
 			   "Platform" : "Default");
 	}
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
