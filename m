Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F25CA0ED1
	for <opensbi@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOatooPCVYR2RGGvCFWO7W0Z04HPCMWTpomU+uZLRPk=; b=hiJBzmA/o/toUV
	tfwjJHsdy8QOsHVVH+YvzwU8WtnUyyEGIy1e1oUuYQ53aqQDih44m+LMBZp5kIX+ZNie7yLS8rkPE
	SD13Z9w9iLwnp2s3n2kI+e905aD5m5h9E/+qupJXSpd0ZxrRDX1hkFoNF9FF/vEDpvo7twRx267Pd
	2Ti0I3iclMd3ftR2xtHTGw76rfXfv9+aN+4PAwDi7ohXDL6phIBl5Uqto0lubglXt9/nKqyah/P1J
	hXK34zuiPsYhQLI82Jf+gwcdehYQ5q4UkQYgRxAts1Ba7iGfr++6p3He98P/HMeCuEIa8RaSFWjBI
	A+WT+w0e5prIGBLuFWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuGY-00000002YJd-2IPe;
	Fri, 15 Aug 2025 13:14:42 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrFc-000000028ji-0mrv
	for opensbi@lists.infradead.org;
	Fri, 15 Aug 2025 10:01:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76e2ea94c7dso2350486b3a.2
        for <opensbi@lists.infradead.org>; Fri, 15 Aug 2025 03:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755252091; x=1755856891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6/hlX0V9M91NcauIj0F5awzqes4lTYNkCt16R6vgi4=;
        b=nlnwG6xG3o87VK7ebLg1/8yBw6h1kenfHGKxB2AVn9Bi8VcS2gv4JrQyUikOlNo6Zv
         /+7ISn5ZD9xu4d3WZrGUolhw762D7vXnRYccLVx6G6bZAVMIrxgkSdp34cW2JVS+n3iQ
         FOaY3nZWR3ZHfdfzPZvj/2dy6P+hCeeLfAj3SsdCK1vrKWfHRoLPzgbIIHJ2KwUCBbWD
         YjZQVN+ntzndYG5ayWd8RS7Dau/0AbdTDqfZ4Rob9RuJTPqoQu2LCTTau4QW3iDSjAni
         RwF7+HeZ4YX2OeIu1d7pIEFl/0b8ReFPKDqGKLD24iPSOqHWSCcjJIaCaRh2qqCmw4ZT
         e1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755252091; x=1755856891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6/hlX0V9M91NcauIj0F5awzqes4lTYNkCt16R6vgi4=;
        b=QtyL0H9qG1RUenCfTvEBn8vg3M9EB/vuMXeC97DD3XZs97zVXKNYKJA+dto1CVgDYE
         y3HW+das8/8HWKJiuVto24iU5MZdxBMLn4CMlDkusgVJfcSNBmryIOndjkZCdpVlQ59y
         aULzF7wPatapzLZ4DqqGHInRRokhpORoD3N6Lun6VQJKbVdXcgiOExHBogCXhX1XgGSl
         yhEjE7K6DZentz4JBQRiRjDenag7YopgH+RHUxD4fp4ZlYq+HPdGuB2z5/g0vvZED4ql
         9Sgh4k5U7G8KMSUMihVNc1ytRAWfgBLkXOuOzhIXht5dNi67aOpw2qRTqUwv3FdItboU
         SJ0g==
X-Gm-Message-State: AOJu0Yw+pCRVPM7krnbR4NqMsJ8454ZGrrCPn8UgJPWlCwR3WqT2pHK+
	ECH4R/F+FezNU2IrGpMO/zu2MgqrWXgE2iMi67QpWJEuwlNaPDMGA/8WoeePCIPgHz7d0I1FHqe
	YCZvG4B3bz/fdUc81vO8EeDFyI4G53ejPP+8q6XGV/n+C9W7COgJUzlp8Vcg7LKZbk3O2TBs9gv
	/goafRM9f+Dbr1ICTRiV7jmeebP5LtLX5pI1709iDLDl8tGHYAEZFZSA==
X-Gm-Gg: ASbGncvNobGCoa5OE9iROB8rhhppoyJBRoNtK1DoagPJfXNQ+h6o9InbHi312VLZzp4
	7saxYos9SI7kDo0jsD24tW0JQ3SWZLBtgBs7XqgSgLoFIC7E/sRSCeRM7cBjhn/Q4+G7HZg5N5b
	zXlbGyhy3l2aVN+AzsJCy6CMxdBKBQ0dvmKMSKooYByh9RJX0X3QE3qUd4ScBd3cQeTz46PM4MZ
	8hQOcY2NIry7V1ql5WX9B9xI1VhFmwMycVfl+U1/W2lv8tgZt47bkWrpbtgQu/v8oJwHTiFHemo
	uJ5YlUOStJqyysdiUnU+cSe1QcbsCRHor2u2D8n71ckLLJfEbKaaloN3RVw7x9wVV2HDgnn3XKU
	kA6B+t3qxG2eL/9PHaQjXl9f+a+yyjyC7pJjjocPcxez64TM=
X-Google-Smtp-Source: AGHT+IGre1NR0iX/dbyNN7zfeL3mzIjeiIb+iBiwb/aZo45inXT6ldRe/QIp9gbKqe96vmxbn0osZw==
X-Received: by 2002:a05:6a20:12c9:b0:23d:45b2:8e21 with SMTP id adf61e73a8af0-240d2f19ba3mr2569981637.37.1755252091054;
        Fri, 15 Aug 2025 03:01:31 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5a7a40sm879220a12.9.2025.08.15.03.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 03:01:30 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH 3/7] platform: generic: platform: introduce fw_platform_get_reserved_pmp_count()
Date: Fri, 15 Aug 2025 18:01:11 +0800
Message-ID: <20250815100116.27776-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250815100116.27776-1-peter.lin@sifive.com>
References: <20250815100116.27776-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_030132_229576_2C75E8A4 
X-CRM114-Status: GOOD (  12.66  )
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
Cc: greentime.hu@sifive.com, Yu-Chien Peter Lin <peter.lin@sifive.com>, zong.li@sifive.com
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
 platform/generic/platform.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 2e8c6051..10bc3137 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -67,6 +67,39 @@ default_config:
 	return fw_platform_calculate_heap_size(hart_count);
 }
 
+static u32 fw_platform_get_reserved_pmp_count(const void *fdt)
+{
+	int chosen_offset, config_offset, len;
+	u32 reserved_pmp_count;
+	const fdt32_t *val;
+
+	/*
+	 * Reserve one default entry if smepmp is enabned.
+	 * This entry is required for sbi_hart_map_saddr().
+	 */
+	if (fdt_has_isa_extension(fdt, "smepmp"))
+		reserved_pmp_count = 1;
+	else
+		reserved_pmp_count = 0;
+
+
+	/* Get the heap size from device tree */
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
@@ -185,6 +218,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 
 	platform.hart_count = hart_count;
 	platform.heap_size = fw_platform_get_heap_size(fdt, hart_count);
+	platform.reserved_pmp_count = fw_platform_get_reserved_pmp_count(fdt);
 	platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
 	platform.cbom_block_size = cbom_block_size;
 
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
