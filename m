Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE49D606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 04:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yOK9MQTG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=HFF7ipSC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oywDC+WvaGJCRQV4rq4FlUyJqNDW75ieftglalvGKLw=; b=yOK9MQTGDTW9lwJ7LgtIqbexHO
	k93m6+zjM9BB4iy2YfgYtkDUnrvtw3wvF73BE3/MQnhFi9I+xR7JmOojSzCGw/9F4jQ3jCbrMUZuI
	VLmQQrF7rZ2kfF73erS1A8ihX530fdxmtW65vnyN7Eqe7SlfMqrGtol6eO3yn+aonVcan0nDlqLxE
	hoSBoQCGtWpkyPddSLicyBKzyiko9Pf+jsXaR2LW6AZYKu8h88ca090eovwrPAz/O67muR52UhEqX
	+wjHHPbZGjKRlSw/cy5g9wou6M1Cg7hzEFJdJ+8R1CRc2s69sTcDY9CGQDHLZpqUndrlSuqa/ttpo
	D7hA1TXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxZ-00000005VWR-1aDf;
	Tue, 24 Nov 2026 04:16:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxX-00000005VVZ-0YCT
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 04:16:48 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1685855a12.1
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 20:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795493806; x=1796098606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/F2jvorXF5ZkGB0BE/CV3Q3YjrsRPQDDzZsdsUqoqU=;
        b=HFF7ipSCP1oslOG2cAlQHN9e40Oy3ixqrezzMzpyxhzQhtZDDPPB6nK+EzeWApWb6y
         AnW97MmzWSguNdU5BDsIgFbRRa8Y2FS0fGNb+nBa8i/3OkHzEaSNTM6QxzF6mmv2f55V
         qackPgseyck2U0Dij7Ht5ITXE0RtXaaPcU/3mc7q3dCeZHSJLGYBIOTrsJPPZe4Eyxtc
         C8Woc9nDouM1ja6Nf5p0sGMY9bo+3ma89sQaqUhgpRrD1VLV37ujifQ3N6b/or8jQteE
         B0CRzo5u4ocHqcjJkYJa/gVbblMZim2oP1MFARY3r5vbwxvLMnXFqGOP83/itMlwhcCV
         dwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795493806; x=1796098606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/F2jvorXF5ZkGB0BE/CV3Q3YjrsRPQDDzZsdsUqoqU=;
        b=RCni8tRDi5o7s9yumaTZ9Or4MJeRttL7AaJSt3+SD0Mr4gDTQPbXjSDMldlrpKRW0L
         SwPvhgk+0GrndSaG9PtgACo0iPdkFitWboTuLRl7r4/hJYSCrDx6gVLVc2wV8ptauSRO
         wo0T00OHC8KLeo8U2bGCvg41v6N6YEBKaptc0bcIvMf40p37ZXH4r0fvPEo/gq7CuBqe
         OKnFCM/DU3xFCn8YPbQURq3eX1Hcq/reDww+A3ugDF+aijm6ecr/25nqoq5fZn9Zu0SM
         3viFEnB4xd9fU8BlU/SDEIc4yPksfakQ2NekV+o5i6QWF3T4UwgHyxUuUkPf5IHz4e9f
         ZjbA==
X-Gm-Message-State: APuU4Z+fEnyy4DrAt6zPuqfxTYZt6MR8P2AkHSqau4OPqrgVjYZOpRYQ
	YSAHKgDeyv0W3495f4eaZzR/Eq0mtg14SJc24cktpAT0dOa3BkpgvEBCtgs2KOXj5r70f4f5hXL
	yEMSlHEYi1i8aadaNzyTOHj3TII//wxpaCCWtArdkOJKE6dcRTybXk0zypZKkB2UKE/F4ktJX8X
	jpuy8Isdmqpub7yP5bZL3O8QZaLPwFeDjKXNBvz+2PJDJzXnV5Vzs=
X-Gm-Gg: AZFdTZe/tZsDMn9IEGWmh9Drk828fpjA1Vly9POi2PRT+fmEutMyxj416R4GMwFjuJh
	2rvR/EsVE8UydWYtYczt5l6OebzrSdTar+QmS8kg6UR4relGTUuNp1dD3Nbd+KzPqJYpKHL3NHG
	Ybzn87t06/8beEoaFXOZOmMAyrENfBGs9HO11qOjVY0N7Q3Vncp0RNVwic+H95IjKtkE0UnGj3A
	bEesickOPa/VqB7DuOd4C5duo+VAOy8tsTBrDkRIfhSQb54ocdK3CKmes+kj8h0RoxmMjAnMYP+
	8OC8FJ3zfDbyUkA63wmIhygSfXqohnK1cZkLU++jR8oon0M07J2D5LR4bybkUfOmOfO4jfUpi9n
	wxlGSNCcv5Q9UiYmPW5IAXlKE52Vv/i2BQUV6hHtHX7Xx+ZzSCslg8w4FF+6Iq+DdzQCmoeIaex
	U180SbjwdF0wxqyaY6l7MzJ24vEOnAasr9JCJ7Z3jFAmQyu42viHXoY/1OjfBDlt9uqORM2JaP7
	6OeVWUj24vRaW2NU1h7rOepJxO4Kes6Sz1N+x79nIp53yh5zbWI4SDZSQhDAQAB5WzGYqNu6WuP
	lSwcyzHFDPf/qvNEt+wyzxZ9LaM=
X-Received: by 2002:a17:90b:2f8c:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b41c95aec8mr11686930a91.46.1795493805980;
        Mon, 23 Nov 2026 20:16:45 -0800 (PST)
Received: from localhost ([136.226.240.203])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm5876766a12.18.2026.11.23.20.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:16:45 -0800 (PST)
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
Subject: [PATCH v6 3/9] lib: fdt_domain: parse domain WID properties
Date: Tue, 24 Nov 2026 12:16:25 +0800
Message-Id: <20261124041631.1049169-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124041631.1049169-1-peter.lin@sifive.com>
References: <20261124041631.1049169-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_201647_289312_E686742E 
X-CRM114-Status: GOOD (  18.49  )
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

Add wid and widdeleg fields to struct sbi_domain to store the
RISC-V Worlds mlwid and mwiddeleg CSR values for each domain.
Also, parse the root and user-defined domains' WID during
fdt_domains_populate().

The root domain WID is described in the "root" subnode, which
carries the "opensbi,domain,instance" compatible string. Skip
this node in fdt_iterate_each_domain() so that it is not
treated as a regular domain instance.

When Smlwid is implemented, the "wid" property is mandatory
for all domains; fail domain population if it is missing.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_domain.h   |   6 +++
 lib/sbi/sbi_domain.c       |   2 +
 lib/utils/fdt/fdt_domain.c | 102 +++++++++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 56a21397..5a291d1f 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -19,6 +19,8 @@
 
 struct sbi_scratch;
 
+#define INVALID_WID	((unsigned int)~0U)
+
 /** Domain access types */
 enum sbi_domain_access {
 	SBI_DOMAIN_READ = (1UL << 0),
@@ -218,6 +220,10 @@ struct sbi_domain {
 	bool system_reset_allowed;
 	/** Is domain allowed to suspend the system */
 	bool system_suspend_allowed;
+	/** World ID for this domain (mlwid value) */
+	u32 wid;
+	/** World ID delegation bitmask for this domain (mwiddeleg value) */
+	u64 widdeleg;
 	/** Identifies whether to include the firmware region */
 	bool fw_region_inited;
 };
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 42fe5632..be9020d0 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -30,6 +30,8 @@ struct sbi_domain root = {
 	.possible_harts = NULL,
 	.system_reset_allowed = true,
 	.system_suspend_allowed = true,
+	.wid = INVALID_WID,
+	.widdeleg = 0,
 	.fw_region_inited = false,
 };
 
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index e4cce8c3..295587b0 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_scratch.h>
@@ -37,6 +38,9 @@ int fdt_iterate_each_domain(void *fdt, void *opaque,
 		return 0;
 
 	fdt_for_each_subnode(doffset, fdt, poffset) {
+		if (!strcmp(fdt_get_name(fdt, doffset, NULL), "root"))
+			continue;
+
 		if (fdt_node_check_compatible(fdt, doffset,
 					      "opensbi,domain,instance"))
 			continue;
@@ -290,6 +294,57 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
 	return 0;
 }
 
+static void fdt_parse_domain_wid_props(const void *fdt, int offset,
+				       struct sbi_domain *dom)
+{
+	const fdt32_t *val;
+	int len;
+	u64 val64;
+
+	val = fdt_getprop(fdt, offset, "wid", &len);
+	if (val && len == sizeof(fdt32_t))
+		dom->wid = fdt32_to_cpu(val[0]);
+
+	val = fdt_getprop(fdt, offset, "widdeleg", &len);
+	if (val && (len == (2 * sizeof(fdt32_t)))) {
+		val64 = fdt32_to_cpu(val[0]);
+		val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
+		dom->widdeleg = val64;
+	}
+}
+
+static int validate_domain_wid(const struct sbi_domain *dom)
+{
+	/* Worlds supports at most XLEN WIDs, and mwiddeleg is MXLEN bits */
+	if (dom->wid != INVALID_WID && dom->wid >= __riscv_xlen) {
+		sbi_printf("%s: domain \"%s\": \"wid\" %u exceeds max WID %u\n",
+			   __func__, dom->name, dom->wid, __riscv_xlen - 1);
+		return SBI_EINVAL;
+	}
+
+#if __riscv_xlen == 32
+	if (dom->widdeleg >> 32) {
+		sbi_printf("%s: domain \"%s\": \"widdeleg\" 0x%llx exceeds MXLEN\n",
+			   __func__, dom->name,
+			   (unsigned long long)dom->widdeleg);
+		return SBI_EINVAL;
+	}
+#endif
+
+	if (dom->wid != INVALID_WID)
+		return 0;
+
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_SMLWID)) {
+		sbi_printf("%s: domain \"%s\": missing \"wid\""
+			   " property (required by Smlwid)\n",
+			   __func__, dom->name);
+		return SBI_EINVAL;
+	}
+
+	return 0;
+}
+
 static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 {
 	u32 val32;
@@ -306,6 +361,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	dom = sbi_zalloc(sizeof(*dom));
 	if (!dom)
 		return SBI_ENOMEM;
+	dom->wid = INVALID_WID;
 
 	preg.dom = dom;
 	preg.region_count = 0;
@@ -449,6 +505,12 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	}
 	dom->next_mode = val32;
 
+	/* Read "wid" and "widdeleg" DT properties */
+	fdt_parse_domain_wid_props(fdt, domain_offset, dom);
+	err = validate_domain_wid(dom);
+	if (err)
+		goto fail_free_all;
+
 	/* Read "system-reset-allowed" DT property */
 	if (fdt_get_property(fdt, domain_offset,
 			     "system-reset-allowed", NULL))
@@ -477,12 +539,52 @@ fail_free_domain:
 	return err;
 }
 
+static int fdt_root_domain_offset(const void *fdt)
+{
+	int offset;
+
+	offset = fdt_path_offset(fdt, "/chosen");
+	if (offset < 0)
+		return offset;
+
+	offset = fdt_node_offset_by_compatible(fdt, offset,
+					       "opensbi,domain,config");
+	if (offset < 0)
+		return offset;
+
+	return fdt_subnode_offset(fdt, offset, "root");
+}
+
+static int fdt_parse_root_domain(const void *fdt)
+{
+	int offset;
+
+	if (fdt) {
+		offset = fdt_root_domain_offset(fdt);
+		if (offset >= 0)
+			fdt_parse_domain_wid_props(fdt, offset, &root);
+	}
+
+	/*
+	 * Ensure root domain has a valid WID
+	 * even if FDT or root subnode is absent
+	 */
+	return validate_domain_wid(&root);
+}
+
 int fdt_domains_populate(const void *fdt)
 {
+	int err;
+
 	/* Sanity checks */
 	if (!fdt)
 		return SBI_EINVAL;
 
+	/* Parse root domain config from "root" subnode */
+	err = fdt_parse_root_domain(fdt);
+	if (err)
+		return err;
+
 	/* Iterate over each domain in FDT and populate details */
 	return fdt_iterate_each_domain_ro(fdt, NULL, __fdt_parse_domain);
 }
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
