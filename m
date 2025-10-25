Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7D9CCF9EB
	for <opensbi@archiver.kernel.org>; Sat, 25 Oct 2025 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ok9stCXA+em10F8HhiN52SCi73mVU5KvvCSlS/4kxU=; b=tCWFoP2BVxm0HF
	swvb70T7xQC2AgctWvw7UFLtfogFwdF60qkaB/0txNgLobrL3S7cLHdZrcHl0HNmOcfBwmkyVl7s8
	CdHCr+7NlQ6xx4TbQroXYKGw2kXxtgJSN0UV3Lr4Fg2R/Zgl2IkRf1KOafVvmJ9/xumfckfqR+Kpe
	rwMqSP9JgY6ScCU2znJQfxypjIw8Lt2BliyCMSTDzHN7re7aI7Yt4szi8Dg89mgIakZ/frcZdR0yn
	MuUkKtzFhBTCN6oKUqaTc268nwtWwIAD+QTYGE46m9kFix+NDO/Oofl505qyUao7KqDGaHH4rq7Oi
	6hRGrET8iq2reT8+sXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaQ1-0000000B9mM-3G8y;
	Sat, 25 Oct 2025 09:18:37 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaPy-0000000B9lA-2xwj
	for opensbi@lists.infradead.org;
	Sat, 25 Oct 2025 09:18:35 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so2906478b3a.1
        for <opensbi@lists.infradead.org>; Sat, 25 Oct 2025 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1761383914; x=1761988714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3P0z9M5/PKOs6PWUnlcJHGddDKM4tKrtthqyP3Wjqfo=;
        b=QiEfJf8nvk7FEL4+k/AkuQbXN4PuimdOOlp70w3gDskzWEHsb2mztP1Q5P3ivVD8pK
         lRV+tKy4+adnzBet9gLrkJaax1IYYPystYeV2l2hf2zYRCTT2UKLZQRq3JOUkVvjR6Bi
         X1Kut0l1vH7gFCgaJjNfgiLJhFl7pgtPmSEvSiWxIGZu6JYDRffeJfFmQOO9gpKkzpe8
         QzuZeXK0oe6cPJpP3MOJoBRA4S9EC/ugBsFhn2PxfZp3U8X3ODmLw2UyT9PNUlWQ/977
         laPR1DZP32l9DpTNEgi/gohmKOrd5SjPgrgukMpAabgUwDDAgn8Jrs2ckZZ77e2wEZn2
         +i6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761383914; x=1761988714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P0z9M5/PKOs6PWUnlcJHGddDKM4tKrtthqyP3Wjqfo=;
        b=R3REV6WEu8ME5Mm2Amoz/MDg/c/gG0DS6V6VuO+C+DIohmY5uMvvOqBvt1tZAHdts+
         iVGFamk7OSlOzT9s3ggJKJrHyHCHR1cXq9pLru/hceedxckhl/hqcmyHu/AgO7hMEhgg
         kiOwOnvEIeUKq008ew5BG7Rvil3+q8RZiQvRdNRN7fDiwJ+wSLbkXl0ESfZUY7ANV1NP
         hqbLbrV/ZzqHBcz/DSsnIyLfdu0V5AIXiFnBTNmPx/S9N+PPIqomZ5QHCAAhNcWJbjPG
         mojVYH82rMU6V7urEgCkj6n5+ypj03tfZrljLm2zEwm9xQRQ+LeC+GsXqrEmD0bZuqzm
         9/0w==
X-Gm-Message-State: AOJu0Yzfi0EKoZJy+WTd2WchpV1dCdIRYbZNRoQAHtj0/De7eGy2dr8I
	Dd3vzyGiB7e273JTL+zZMGvHOzKmAxKHEpgpIaEFsENXGlZ0cQkYvh07+GGiYodJoT5ZjGmnVzZ
	PJPxfNxl8yjceRnZWYG5n9Tm9fySgXZN+AbuoD9MtrwBMvmhOhLdKpvfnuRddISn8oXYNezXXwn
	F71jO/fgNasMa6rxS8d8UMUPE85vMIyXDoJMUE/QK4EvM63Dbb
X-Gm-Gg: ASbGncuMUnnn8f/jQ/jzXqrmG1O9G6LEmwfBJ1ATpEplJo6zAMkx0Rj2p24WLnFcbsS
	Q+8LEaPwcyy5fTXVZM0Vid0snsgQrpSxMJbKan5X8kUrDbaAUOdgeAq92PXc3FQJqjXulvbLukQ
	9LWokIQkBWCO2NP6XmRpMnNHda1Sh6Iv8zTU+E+9CiLa0r3mf17gTZKrUF8NVUheUQ4DxlkF75m
	SPzumM7X5lIZNU7Egi7CMA4LiAATExjPOhAyVVcqdnSWoqo847m2LL+9ClT3BEGNGs1ljK46NSy
	ZG1pWW45RDsbU+886kd7wzGDGMCBVsgebDodlMYalST9G4LHAJn+pvADiHzafyRc+9gcHOhd7Ra
	cTqf/JxhWLbRs1YcNU33E8YvbKGuY3vsdaEZd16xndeBoG2eeHUEib8efQCX99fU96lj0Afs5u3
	XoBsPTT5rQcFnlLos2LnH3QU0qf9UizHXx23aEe5QE63t4TA==
X-Google-Smtp-Source: AGHT+IEbgI6MgaBelPtWyaR6pA6BH7K3aonXs8Sz3OMjX55Qf4wim3bm1JbAclM4aMPTpUbHeILsIg==
X-Received: by 2002:a05:6a00:2d17:b0:7a2:7058:ab89 with SMTP id d2e1a72fcca58-7a284db9a1fmr6378494b3a.7.1761383913528;
        Sat, 25 Oct 2025 02:18:33 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049f20sm1702700b3a.29.2025.10.25.02.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 02:18:33 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v2 3/7] platform: generic: introduce fw_platform_get_reserved_pmp_count()
Date: Sat, 25 Oct 2025 17:18:07 +0800
Message-ID: <20251025091811.506511-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251025091811.506511-1-peter.lin@sifive.com>
References: <20251025091811.506511-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_021834_745364_0C9E722B 
X-CRM114-Status: GOOD (  11.33  )
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

Introduce fw_platform_get_reserved_pmp_count() to parse the
`reserved-pmp-count` property from the opensbi-config node.

Since mseccfg.{RLB,MMWP,MML} are sticky bits, we can't poll them
to detect the presence of Smempp. Therefore, the only way is to
parse it from FDT `riscv,isa-extensions` or `riscv,isa`.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 platform/generic/platform.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 91140958..936e5356 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -66,6 +66,35 @@ default_config:
 	return fw_platform_calculate_heap_size(hart_count);
 }
 
+static u32 fw_platform_get_reserved_pmp_count(const void *fdt)
+{
+	int chosen_offset, config_offset, len;
+	u32 reserved_pmp_count = 0;
+	const fdt32_t *val;
+
+	/*
+	 * If smepmp is enabled, minimal 1 entry is required
+	 * by sbi_hart_map_saddr().
+	 */
+	if (fdt_has_isa_extension(fdt, "smepmp"))
+		reserved_pmp_count = 1;
+
+	chosen_offset = fdt_path_offset(fdt, "/chosen");
+	if (chosen_offset < 0)
+		goto out;
+
+	config_offset = fdt_node_offset_by_compatible(fdt, chosen_offset, "opensbi,config");
+	if (config_offset < 0)
+		goto out;
+
+	val = (fdt32_t *)fdt_getprop(fdt, config_offset, "reserved-pmp-count", &len);
+	if (len > 0 && val)
+		return fdt32_to_cpu(*val) + reserved_pmp_count;
+
+out:
+	return reserved_pmp_count;
+}
+
 extern struct sbi_platform platform;
 static bool platform_has_mlevel_imsic = false;
 static u32 generic_hart_index2id[SBI_HARTMASK_MAX_BITS] = { 0 };
@@ -184,6 +213,8 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 
 	platform.hart_count = hart_count;
 	platform.heap_size = fw_platform_get_heap_size(fdt, hart_count);
+	platform.reserved_pmp_count = fw_platform_get_reserved_pmp_count(fdt);
+
 	platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
 	platform.cbom_block_size = cbom_block_size;
 
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
