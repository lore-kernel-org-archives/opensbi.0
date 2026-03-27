Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFC410BA42D
	for <opensbi@archiver.kernel.org>; Fri, 27 Mar 2026 05:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=skAxAY00WEnwYh+KKPRSe2Kc+4tpCD4CbJJprLHL20s=; b=q99WvJMFc4yzxh
	48LwhAc6T9xBcf7CUptq2h0KZcAWFEqpnsuSRSgt6hFiE3ZFk4OduwFOJKQ+F6LQojAYBFfN2/fLg
	xRFyTBkY1MLNfN0kA9wFISZmbWyk6yZlqyZ4/QL+3UECxr1k99SbVXdDzHxxk9DzXld0sLyTsTH76
	roul/ggTg2OyX7drUEKS9kAKAKR7c9GM/2h4tyxx4tLkqvuOh80ZWwQOFoDup9jCuCNE4BTpOe+iN
	NheBwHwkRvNeGWLH0+zyYH/szqUQoNrJewgspPnq5hVlD9FsiTy3IBRNbiECLT4+3vGHLm1ykilBm
	lyBMv2MVLQlaQ3fqrsJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w604p-00000006iyo-1t6L;
	Fri, 27 Mar 2026 05:49:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w604n-00000006iyE-0ASs
	for opensbi@lists.infradead.org;
	Fri, 27 Mar 2026 05:49:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b06c43e6a7so8797785ad.2
        for <opensbi@lists.infradead.org>; Thu, 26 Mar 2026 22:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1774590583; x=1775195383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WM1DO2yyqYbyLoKz3p9RI6370EMEFM7rGW8ZUFf16g0=;
        b=m/iU8eqlANJjjtG5kqlpdJqIZuhiTudxONvv0zR1yuhDRZyH0zRPlTcXMugEV0Avi1
         J5OhxYG4yt4mjCFoScwgNBORntUp7oT1xq3mfe1duDmxc5l0uCQh3th03v/0kqzgTHYX
         ic+P2SIwGhs0Cr1MvOyO46baSbOXm+UXulmlLmx6rouwLG/lcxuK2QwkAxaPoAwAR9/V
         AYBTPEiwI5d20GYXZGvJq97nz3TuRZH55VPa2Uo11MmFdpyIzzkNj46KkaKI46mS5aJZ
         GIoo0KF7FPT48oYfTM69NE3LFU8lWSYDc+cz0qhzrEDjNDYzlQF492se2cMZeU2MSZgK
         9Yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774590583; x=1775195383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM1DO2yyqYbyLoKz3p9RI6370EMEFM7rGW8ZUFf16g0=;
        b=WWq8gKV0bmaPUJIyFQNPu6iCmTAaHL6FPgVqHiT2tUWfMnGRoqXHYW3moB9dqvPr6P
         UQxr574w7bCfLy98h9dkz6SIykWIk3CSIqMCelyi0npPKZNdNA02cr4t7JEc0NWWgPxK
         4HeMYHrPaCqqmqI1/S6EU78ItoB3FAvsbNJR/CWK26lwREXD8MVC+auzphnxC52ke0Cz
         tixslNa+cpJ1ZHmlMRdS7hjNebndNjMniT89f+36Dh6/neONr4Bxt+pc8KFSaOZT4X8J
         nC6rkGtpNoAEhiUK8vELkXoVkyWHeGJp0kk5cXpXv2q6OgyTWd1ocHkma3Rl/o1mntCD
         XpcQ==
X-Gm-Message-State: AOJu0YxMYwBeoW7cLlZEcDE894UDpWdS3X1eCl2feGZ7ZEm5osqRjdVp
	ChLzJlG95UxA2s3rwdrcW/FGTGsrimIFiIrG4APzBRnUpUcE6HpTuReiWhfyA9uDwmF+KgCBIBh
	qwrWcmMRCll6NzWyKXbH2HItQW7nSTY3UBtUaeJ9dBLcPjsJGVygRyKqdO54agYd2540cvculQz
	Q9/brSNzpHId2xQoaqEXbaH0gE9Vp7vmTC+/Q1JxTBntFUMpIg
X-Gm-Gg: ATEYQzzIFbzTkjTpBPrvuvchSAQ9N2pOsFrV8VCtSgSJ47SOrGUUA7vZBrQrNb5SjU6
	bxpNAWwEUuSlakWgtHAELNvhLu0AmzsqzwXUeDAuQbcxF60A6RNvpUj0e9bBm6NJShqoNHNWB6H
	k8vs+WmKFMETVl/of4jTkrBnzT2lIwcOmya97Bz1S2tXcDHT2UgD26Sx0LxjCF/Ox1y6LMOpr6j
	KVi6jxwFwzb9/d9ki+fX9g3hVsX/vSmUJhwRNoH8jS1piqm1ANa0E82VC2wCNUUC7ZbAfHSVxZH
	F8ljjB5Jjo0tFAqKorqqqckEVLlqhcR2wFdaMMqcsdNNzh8JQ9tqgglqmtE6z9M4SuZb8/jzjug
	UFPNWlp+qNCL73WzNJuSfvgavjWXafoQxu7BgYiTQEtNoNe4gDyBX/BuY8xPamYSPg65kODrZd9
	020q94J7JScsVxB8XjIA2ZQwL7Loi8mqL2IIAA+1u7uZxmil79gfcorXp/4g==
X-Received: by 2002:a17:903:3508:b0:2ae:bf92:5acc with SMTP id d9443c01a7336-2b0cdc0faa8mr15552975ad.3.1774590582619;
        Thu, 26 Mar 2026 22:49:42 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0cb9ad55csm13975665ad.53.2026.03.26.22.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 22:49:42 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH] lib: fdt_domain: Default boot-hart to coldboot HART for multi-domain boot
Date: Fri, 27 Mar 2026 13:49:36 +0800
Message-ID: <20260327054936.3462935-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_224945_086331_779C8AE5 
X-CRM114-Status: GOOD (  13.47  )
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

When "boot-hart" is not specified, dom->boot_hartid was left as -1U,
causing domain context switching to fail. Default it to the coldboot
HART to enable SMP boot in multi-domain setups, consistent with how
next-arg1 is handled.

Also update its description in domain_support.md.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 docs/domain_support.md     | 6 +++---
 lib/utils/fdt/fdt_domain.c | 5 +----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 93186c4a..c01e445f 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -173,9 +173,9 @@ The DT properties of a domain instance DT node are as follows:
   Any region of a domain defined in DT node cannot have only M-bits set
   in access permissions i.e. it cannot be an m-mode only accessible region.
 * **boot-hart** (Optional) - The DT node phandle of the HART booting the
-  domain instance. If coldboot HART is assigned to the domain instance then
-  this DT property is ignored and the coldboot HART is assumed to be the
-  boot HART of the domain instance.
+  domain instance. If not specified, defaults to the coldboot HART. Note that
+  if the coldboot HART is assigned to this domain, it will be forced as
+  the boot HART regardless of this property.
 * **next-arg1** (Optional) - The 64 bit next booting stage arg1 for the
   domain instance. If this DT property is not available and coldboot HART
   is not assigned to the domain instance then **next booting stage arg1 of coldboot HART**
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index b2fa8633..1b039533 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -396,16 +396,13 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	dom->fw_region_inited = root.fw_region_inited;
 
 	/* Read "boot-hart" DT property */
-	val32 = -1U;
+	val32 = current_hartid();
 	val = fdt_getprop(fdt, domain_offset, "boot-hart", &len);
 	if (val && len >= 4) {
 		cpu_offset = fdt_node_offset_by_phandle(fdt,
 							 fdt32_to_cpu(*val));
 		if (cpu_offset >= 0 && fdt_node_is_enabled(fdt, cpu_offset))
 			fdt_parse_hart_id(fdt, cpu_offset, &val32);
-	} else {
-		if (domain_offset == *cold_domain_offset)
-			val32 = current_hartid();
 	}
 	dom->boot_hartid = val32;
 
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
