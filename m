Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E63CD4F26
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9inFIaUKBU2y7B3wR3Ziz1HlrE3Xvfsh7Z22fjO54s=; b=ZnntQBa2fPmkjE
	IJWtXr3/CI/17CmCLnrqy2rzPruV2v0SExg41UeKH65glCCvAGFqjW9qHPPc+gBkT4ZgxEGv0NcWb
	9VGKUpyNGfPEpF6LKulKP70eH9CTF+0cS72SQCgrnNaFloUqJRH6G8yuZkLhcrTowD3nkhwgihYa6
	ViQ2HiJOnVUaGoLZ3kqdIYCH+SAGB0yiwfRPygEJhfj3vVApwEWU7bdzLmqW/3Jr7GAEjO20UQ4l4
	1C/XmCyiSFWg3+WTROK9WGdG/TR8vb2GBmzQn3o7Dh+HdQb/YR7vdqQTnAOgoTkuWr3Gzn+qYdIm5
	IlsR5Ao4XstzmFwcnMng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cR-0000000B4cI-0IBj;
	Fri, 26 Jun 2026 10:17:07 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cK-0000000B4W5-3YiH
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:17:03 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-845c38dee22so368305b3a.0
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782469020; x=1783073820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQHvuUP9lM3AN0ucB3gk0QvOhIoK62vOjGgsuPZHqtc=;
        b=QPC5hTHy26AlFrL/SsD8gXMxSN168zxIVuc+a1Xdr+G/3pTS4izpXxz49AoxEjks6e
         4sOQWT7YOn0gC8yeKMExvQeezw2Tk9nouJbbjcoFFncrANvbOwhahatiBRavXZEkam4C
         9UXTKzrO0PZPxp60XuCeBJo6vOB2YMMumAfFkWVs7fPDty7Lb9VxWewMK6+YLrT/88Ib
         2tsm2+pcC7yb88vZlTmyVxY2qP45yoh0zV0hCLD9yciGvUYYCGKLwe0Q7VxybX0zboFZ
         NDCxpCB+uMofZMocd9UngnidkGUgoGnFi1pkyMrVpFqIIN7ZrXNNLocYiRQESqsrVamW
         f8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469020; x=1783073820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jQHvuUP9lM3AN0ucB3gk0QvOhIoK62vOjGgsuPZHqtc=;
        b=rD3mXXbrFOT87/y2X7xHiql6HpXnWyUBaSG2NuL9g3iF1SWV2YwSbMLxfvzQ66kBwJ
         ITbXLuqb6JfyvjSryRPft5CABzdRn+bLFNBe2HUC4GCsaNAbsSK93CHdVN9+sIda29MP
         4gEiBrkI4tnsVC3HctHuZiQmxma09Sec/OabNHkk/xMn5f1S6ICcVmHpjFw7YL0XEe1f
         voRz9HAL+r1hy4NaZPsM0fkSEqjEJsHpQmgmwcJnKSedJAbreb+35yQonJSCacCm+0DH
         Bc2gYTei1L+ukogMwNra2DBYpTM52ovqGEXTR1UCia9qbfiEtdvt86vCdIlFHa6yDIbi
         6k5A==
X-Gm-Message-State: AOJu0YzGpqA8UNW2yXUEk4HBHTn/7jHF6DFmD6sBoRyTrz4FZWF+Hqkd
	58cRcP/BmImPVrJaGfHVQxcD2LIRyidtOvmpDNzdTbUFzO64jAm2KacEHO26aiTFgPgKtltrFZ/
	BZ1zJDRd4WuM0ad8XpmwrjMKkihROio+Qd+7HsEEJpaI4DcPeqyWUZg6pG/Z4KpfM4Nj8g+BTjq
	AF+2K/TvPAZvnkkuKSfu8MClMqnM25FL+H+1lNjc+/NspxPFyWguU=
X-Gm-Gg: AfdE7cklqmBlURpOuRYTHIwTtP2Card5KBGvkElYcGbHlEXLZqPoB/Sp/hc9Fj5dldP
	j/QMLJxQ1TGLa9imwT7gBd3LI7IaTI7Xoy+G20qIMgDqviFJa2oVexg61GglZ6w9CqICOrd1YTC
	Mc6HyqdK/+cdMMkks5nrKnUKHP1s8wUl/mqkR+UXx9IpMNvaCZVeT3xU7knkhGJORKahlX+O/ls
	OKVuAGyVazsnPd35pZo5qNa/zzffDVrusTOEFsqqPwawFUnZ/DINIc6lOMBneIMmNGwAal9IFuh
	RpHdCYduWCt7MVkAPY6PTJh1hfrR060snQHWypZHcrF15k4kt5Ja4XxPpadJo12P0F06zcOwiCa
	aNpua9OF67kyoO6AjLi7zaSEOtz1SZLO7lrQcoXoRceJfBqiAqiHLs0I6CxITg5HhncalGYCMxI
	ioQBIOsDqmvTG74EJPthzsiPyV6dA7v6dmJ85e
X-Received: by 2002:a05:6a00:e8f:b0:843:472b:dba9 with SMTP id d2e1a72fcca58-845b3b0c2femr7288011b3a.45.1782469019823;
        Fri, 26 Jun 2026 03:16:59 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:16:58 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 08/12] lib: sbi_init: print M-mode World ID at boot
Date: Fri, 26 Jun 2026 18:14:29 +0800
Message-ID: <20260626101433.3133466-9-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031700_945742_6ABCF67D 
X-CRM114-Status: UNSURE (   9.15  )
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

This extends sbi_boot_print_hart() to display M-mode World ID
configuration during initialization. Shows mwid value from CSR_MWID
and lock status for Smwid extension, pmwid value from DT when
available, or "unsupported" message. Provides visibility into Worlds
configuration at boot for verification.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_init.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 658fe37f..1fb79eae 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -169,6 +169,7 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	int xlen;
 	char str[256];
 	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
 
 	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
 		return;
@@ -201,6 +202,18 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
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
