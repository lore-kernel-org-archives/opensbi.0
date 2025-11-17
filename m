Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064F8CEBF93
	for <opensbi@archiver.kernel.org>; Mon, 17 Nov 2025 05:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHF2JjhGxj2oIyIdAFs9M9mbuYnbcmd2jAFPlf6LOno=; b=eeW1hiw8yr1zjr
	c4G88vggV3GrQMqmpfHjnHEWwgx84+qhcqD/T25yHUB0TIlUTTPn3Wm+Ua8FoAqEDrcDzyWmmABRr
	gi7OS5bEnao/NP15fJ/yxns6BBrpf0M3YiQyZyQxdtEhwvG/Jm0bz+C59N2KtEc/zJaoYmGi4adAa
	6P+ZWdyPDe2aU29ePbpxTweyuewiCH3LNWluSQE/3Uc1fotwJ3PtvtYoDhHnMp0MMr9UVrLCZnPmt
	g+ehtw5U77z358+ZW7Zzn6gi/R4nO7zmvivrqvOG3VLV8S4hRbgy1W34I5iF6HjAyiYjl9HpBXKEI
	OnZwCLkycTJJDgsxC+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKs8F-0000000FT79-3gjX;
	Mon, 17 Nov 2025 05:50:31 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKs8D-0000000FT5R-1mXI
	for opensbi@lists.infradead.org;
	Mon, 17 Nov 2025 05:50:30 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so4410823b3a.3
        for <opensbi@lists.infradead.org>; Sun, 16 Nov 2025 21:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763358628; x=1763963428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1kP0Z05xFVxLP0O8oooT1Wdq/Ux4vKjRWcq+4AXSSM=;
        b=XdrfklB2FLmtwd0HUzpHsOyz2xSmIGvdg6Ftvj7iJDKOoVFIkUT5f8YYipETPokj50
         XHCcOeyAHGh8sTE+DXIqDmhOCkZtEYfJZjedRE1ULBIJ5da4xAtoJD7+Z+64uhmUAm3Z
         i1DX15U0SB6trMDTWJyHbpOXuwclpFsNrw2TO/xVijOVA2QRX/7T7EGqxINjG5rdhLKi
         kNbiIBYQmyVwXfSRz9rNED02R1Vn6nw6AGK1wcO0TAJQskKROq/TXA+5ef0H9tPkyimi
         52x9XjJAqvUs1A1GiivjrYV6zjPfnfdOGRo6CtJJWLJ8rpwZlWYbaSvUISh004Rn9rzd
         MbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763358628; x=1763963428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K1kP0Z05xFVxLP0O8oooT1Wdq/Ux4vKjRWcq+4AXSSM=;
        b=aFI4o2OGpX5x1M4o6+yzmZksQrhHIB1oEDyKzt5iM0O8T38e/6rs5XT2XQFWLX9c5y
         JnpFGocE5Zi7liil2FZVmlC3sxQ36Eg1TairMQHqsH8ozdjDN9OYq1AC1kcMS6iAo6La
         W+wfjTORcJ0usv0bWJhgTP6CnKHNinYiLAyufesMKARqqaHJGp/QGAi4ZyLAWFymxUNa
         42e1OuR/mOp3q1EcdpZWHkQtT0RKtkigcovwRmoffFaFAQrv04MTg4YcaplEdAWO7k00
         Yy8B4lwUP2XiIQF+adwe4CpC905f/tAmfLpXYjj48tvyRSyWFyhbtmOta3e0QiqwNsLK
         2arA==
X-Gm-Message-State: AOJu0YxJtkjiaZpjgYzpmM1/iAElO791N4ffddxP0+kDfnSuK0z3u9rB
	5Mcnh+ufGjTfEQBdWtuaZAR4ofG/6ORCFUf49UrOZYZQK03+4B4/8ROjPgeg1g==
X-Gm-Gg: ASbGncvieFHpGIa6t9e1K2Ee7LsjNKhjQ56PEytpBK4lcupEJV3sePHp+GT5IGt0Y/c
	oF0JKDFnvvc+JEIZpWBSxhZ24LqRI/vUGtviiZiNwYFQEzT4T5zdkEPu2bhBoff7vSXBG/eFKt7
	BHhwnDtKPh00zM6DL5OvtJkT+iEVrFPVdVARxyDcIYNgUIVC23YN9Q+BMXN4WbDo3TUUGXbQolb
	x8/s/nLKP+ghXfcTtl+qk+BErCacXlEdCiEcn66wxb9WQRNogLnJ1GTLRdJ351eF9FFl/FirGXR
	gZ6DjaSTh5Ajy7BTtMzzUODQv1FiUMf3sYEejGXAVqDhamsrl7zVRC1vbgKTbtQzzdy5pFtkWvV
	sKrHvebfLnr0kW4hrgwTOGDBHcUSVMM0h3EFn4xXUHhVGpzNXH5nneyvxi5oajMQ8bTATceik0x
	59s9Y9aYPTgxC6
X-Google-Smtp-Source: AGHT+IHKzLLCmyktR6uwJi7RXwCiSlAcrpWRgXCJAV+npJmvl5kLPLwqOAN/x/vh+wBJ1AO0PRMc+g==
X-Received: by 2002:a05:6a21:3382:b0:34f:47f8:cca2 with SMTP id adf61e73a8af0-35ba29884cemr13518020637.58.1763358628120;
        Sun, 16 Nov 2025 21:50:28 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924cd89bcsm11719856b3a.15.2025.11.16.21.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:50:27 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v2 3/5] firmware: add CONFIG_FIRMWARE_PACKED_RXRW
Date: Sun, 16 Nov 2025 21:48:44 -0800
Message-Id: <20251117054846.1335-4-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117054846.1335-1-ganboing@gmail.com>
References: <20251117054846.1335-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_215029_484543_D4AB520D 
X-CRM114-Status: GOOD (  15.22  )
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

By default we power-of-2 align the rw sections of firmware. Provide
an option to disable this behavior. Platforms w/o Smepmp won't be
able to enforce RX/RW in M mode, so this 2^n align only perhaps
saves some memory by covering OpenSBI with 2 finer grained PMP
entries, instead of 1. For platforms that are really in short of
PMP, consider enabling this knob.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 firmware/Kconfig     | 11 +++++++++++
 firmware/fw_base.ldS | 14 ++++++++++++--
 lib/sbi/sbi_domain.c | 11 +++++++++++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/firmware/Kconfig b/firmware/Kconfig
index c1fee190..30e4ec7d 100644
--- a/firmware/Kconfig
+++ b/firmware/Kconfig
@@ -25,4 +25,15 @@ config STACK_PROTECTOR_ALL
 	  Turn on the "stack-protector" with "-fstack-protector-all" option.
 	  Like -fstack-protector except that all functions are protected.
 
+config FIRMWARE_PACKED_RXRW
+	bool "Do not power-of-2 align the RW portion"
+	default n
+	help
+	  By default we align the beginning of read-write data sections to
+	  2^n. This facilitates the setting of NAPOT PMP entries to cover
+	  text, rodata, data... sections with proper permissions. For those
+	  platforms that're in short of PMP entries, and not using Smepmp,
+	  they may choose to disable this alignment and the entire firmware
+	  can be covered by a single PMP entry.
+
 endmenu
diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 12c7a844..8b60a68a 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -56,12 +56,22 @@
 
 	/* End of the read-only data sections */
 
+#ifdef CONFIG_FIRMWARE_PACKED_RXRW
+	. = ALIGN(0x1000); /* Ensure next section is page aligned */
+#else
 	/*
-	 * PMP regions must be to be power-of-2. RX/RW will have separate
-	 * regions, so ensure that the split is power-of-2.
+	 * Align the start of RW sections to power-of-2, so READ/EXEC
+	 * and READ/WRITE sections can be covered by different PMP
+	 * entries. Platforms with Smepmp can utilize it to enfore RX/RW
+	 * permission on different portions of the firmware. For platforms
+	 * using traditional PMPs, there's no enforcement of permissions
+	 * in M mode, so NAPOT aligning the RW sections has no security
+	 * benefits other than perhaps saving some memory for SU mode to
+	 * use. It does require 2 PMP entries to cover OpenSBI, not 1.
 	 */
 	. = ALIGN(1 << LOG2CEIL((SIZEOF(.rodata) + SIZEOF(.text)
 				+ SIZEOF(.dynsym) + SIZEOF(.rela.dyn))));
+#endif
 
 	PROVIDE(_fw_rw_start = .);
 
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index da0f0557..7307f11e 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -865,6 +865,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 
 	SBI_INIT_LIST_HEAD(&domain_list);
 
+#ifndef CONFIG_FIRMWARE_PACKED_RXRW
 	if (scratch->fw_rw_offset == 0 ||
 	    (scratch->fw_rw_offset & (scratch->fw_rw_offset - 1)) != 0) {
 		sbi_printf("%s: fw_rw_offset is not a power of 2 (0x%lx)\n",
@@ -877,6 +878,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 			   __func__);
 		return SBI_EINVAL;
 	}
+#endif
 
 	domain_hart_ptr_offset = sbi_scratch_alloc_type_offset(void *);
 	if (!domain_hart_ptr_offset)
@@ -904,6 +906,14 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	root.possible_harts = root_hmask;
 
 	/* Root domain firmware memory region */
+#ifdef CONFIG_FIRMWARE_PACKED_RXRW
+	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size,
+				  (SBI_DOMAIN_MEMREGION_M_READABLE |
+				   SBI_DOMAIN_MEMREGION_M_WRITABLE |
+				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE |
+				   SBI_DOMAIN_MEMREGION_FW),
+				  &root_memregs[root_memregs_count++]);
+#else
 	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
 				  (SBI_DOMAIN_MEMREGION_M_READABLE |
 				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE |
@@ -916,6 +926,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 				   SBI_DOMAIN_MEMREGION_M_WRITABLE |
 				   SBI_DOMAIN_MEMREGION_FW),
 				  &root_memregs[root_memregs_count++]);
+#endif
 
 	root.fw_region_inited = true;
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
