Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE162CA1013
	for <opensbi@archiver.kernel.org>; Mon,  8 Sep 2025 05:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vV60/58sObIT/YY56XrkNT9i73B473lA5sTwa11e7mM=; b=ZV1E46OjhS19+p
	XjEMze/befFD25ez2AAcPgfu0AGIJoh+49xhaY1CsgLt9TZLqr23PyUSNieT9e9IehDco5eHO6Y/u
	uzYGH9WBlR5P5vqRlP/F+vOCehzVDlYP0uvAXEFhdbflBjbGNT4iQ551B07WzQ5CgoiyGntdgBmDG
	w0VSmwKGoEo1x+EtHP83eQGcqsjwesa1YUQM+cD3FApMuxuN5Itfeumeh8Vp0B6qWP0tFpuKijXzG
	LNUstrM5bCcjO/ntp+ceoa+ANz+TgMB8HTX9Ikh06n12G8rmcG96/O/p46VE+fUybYjSsbYjto3QT
	ICzwP+wfn5pEJua/azlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUry-0000000Epll-1BfZ;
	Mon, 08 Sep 2025 05:56:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUrw-0000000EpkA-2PZy
	for opensbi@lists.infradead.org;
	Mon, 08 Sep 2025 05:56:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24c7848519bso40538635ad.1
        for <opensbi@lists.infradead.org>; Sun, 07 Sep 2025 22:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757311007; x=1757915807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=moW+3YGGJ49DxQ8epECjRG6qzlbuco0aKaH/TEHMT/M=;
        b=XcicpyDLQFAWzmjO8CmF/0qTNDpQSSvcQVIxCk4qo6ubzkPan843jJ8Lngcv6iG99u
         HiRKyhTfGx6he8XG83IvX4HtOVWfD6Nta5waMyN86Bd2CHFspXCcTVRUCOaaBZem20s5
         6EHcKTHm7E0YFB1A0zuJ4oX8A7vMSAS/MGiTmll2k3v1ZGiuoKlc1UhEXepOUCDxHUmy
         yfKSXZQR/p90rdRVpbZ5ByqO5yTAnU6ioP/71xtlbA+oRWBb8L8Yb0n6I0uZZLVfz2et
         iA+lFeQ1hg6OoDARROWVRzp/JJqZiIt1YBGc0DoTfFNB+gabNpXhNDQGMSYn9KsEoOUM
         eVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757311007; x=1757915807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moW+3YGGJ49DxQ8epECjRG6qzlbuco0aKaH/TEHMT/M=;
        b=lBHnrvp9cVfVb1YfqIwvEsh/ie9dHRyGG1Nw4WGt4iuT8fu13AnoqkBaWrL8ZWzSPN
         PL22YFVhNrsq5RfZDyiqQ6sraASUq4YMwVWUBg6tiid6PPUcEXnGEOVnuDceynnjh30m
         +Xg15vQJddPrtbJcTkG0Q5qDyXR1XvH2BqeDKHpltNQkcC5qWwIFkVasdy95ApD5C0Zi
         gUJlTCVU1098MiHNBWldGizUnZol3VFCKperVNlCmb+MBkotaz0a/ym4W1XyPlouZMpe
         mGwNzCQkB6k2aIvMEhKl3dSUOQQIWsrdJBwT5jc88kVYie/CFPzKlfu96sTNHwOcH3aH
         32LA==
X-Gm-Message-State: AOJu0YxITaVq4zj+CE15agzIYEeSVmCP0j0ZGseQb5c03EodqqGAGqQV
	51tCOnL8mV6s14FY3z8I+fPhOA3gZkOVslx9FLlI06UZLye+wT5OY3GU+etFXIGUfjyxubT9/0x
	K7B7Dnoct2W4i0vVVgFIPPOHNvpvVMvSRguA7RZ/4Nb6Ksa6vfk0vIwJDWz/h/KYm/uP9FN9T49
	yyxq0kAik5JZzdD5UlxY/W0DMzPAukcTClaS1RSF1vZIWtxIrhiReRJjo=
X-Gm-Gg: ASbGnctlGRG8fuKLbMBp+6DDCRxicUBz8CdB0a65cQDo7Y05eA38L/OsG2/APoMMSSD
	FRV5Dnjti51ofDeMsHpBBNO8uPnIq0vzqMkm+EJgfnDaRWFIohqkjKdofoXk0mmcpxkp3ylNNwM
	i3X6Ru9CytijdmVidYe2qLq4k0+XRJVtfXy2caM41j4pQbo846x2CmRZNbh+OUDlv4VRRwZu3n5
	FCjodLL/T34WcTzOCTdkD4XDJJa6fOKmRRWp8vmqzLkqza8n/fPWka3PKb6XiM9SWiNT8lPT48/
	I81XxJJU0ghsZZZwTpv+6iyZTypFpXAshSdOK/Ievei/27rNgRFvQfvausw5JFA7692R7g4lluq
	wVkhM2YC44sMvf+W/ZGCl1TxLiGOJsbn7OyOxWhmvPJEp
X-Google-Smtp-Source: AGHT+IFNQT2Im+M4mVtlt/ls9jPphJrcCkw6Kkcr7mSZVAlOF48jGOzTOhxfMexvzleAXXd5v30pyQ==
X-Received: by 2002:a17:902:e848:b0:246:d70e:ea82 with SMTP id d9443c01a7336-2516ef591e9mr113491535ad.5.1757311007530;
        Sun, 07 Sep 2025 22:56:47 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-252ea823306sm42894525ad.26.2025.09.07.22.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:56:47 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/3] lib: sbi_hsm: Save mideleg across non-retentive suspend
Date: Sun,  7 Sep 2025 22:56:38 -0700
Message-ID: <20250908055646.2391370-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_225648_655586_318B7A9C 
X-CRM114-Status: UNSURE (   9.66  )
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

OpenSBI updates mideleg when registering or unregistering the PMU SSE
event. The updated CSR value must be saved across non-retentive suspend,
or PMU SSE events will not be delivered after the hart is resumed.

Fixes: b31a0a24279d ("lib: sbi: pmu: Add SSE register/unregister() callbacks")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/sbi/sbi_hsm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 557ab131..8ec94d2b 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -47,6 +47,7 @@ struct sbi_hsm_data {
 	unsigned long saved_mie;
 	unsigned long saved_mip;
 	unsigned long saved_medeleg;
+	unsigned long saved_mideleg;
 	unsigned long saved_menvcfg;
 #if __riscv_xlen == 32
 	unsigned long saved_menvcfgh;
@@ -429,6 +430,7 @@ void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
 	hdata->saved_mie = csr_read(CSR_MIE);
 	hdata->saved_mip = csr_read(CSR_MIP) & (MIP_SSIP | MIP_STIP);
 	hdata->saved_medeleg = csr_read(CSR_MEDELEG);
+	hdata->saved_mideleg = csr_read(CSR_MIDELEG);
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
 #if __riscv_xlen == 32
 		hdata->saved_menvcfgh = csr_read(CSR_MENVCFGH);
@@ -448,6 +450,7 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
 		csr_write(CSR_MENVCFGH, hdata->saved_menvcfgh);
 #endif
 	}
+	csr_write(CSR_MIDELEG, hdata->saved_mideleg);
 	csr_write(CSR_MEDELEG, hdata->saved_medeleg);
 	csr_write(CSR_MIE, hdata->saved_mie);
 	csr_set(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
-- 
2.47.2

base-commit: 153cdeea5350837c1206a2d2b6189fd0ba06d1f2
branch: up/mideleg-fix

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
