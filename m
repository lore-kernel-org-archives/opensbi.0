Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011C8606A31B
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SyrfV8Cp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ggFE9lSk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KbNMnvCzYDPsBR8lO6cwukaQO+gOIBttBTG/oMWKLwo=; b=SyrfV8CpuSc9ptDZXrf8UHNEpn
	uM0ABAMEe2Nb6ujWYxu4/+mVxlY6wTv+dh34ZKV0golOQ1LM/R+1WNZL8SpoOWKQ8vGJR1bpBeHt0
	qsacjdn6QbNsr/fxVPQNJv3vSqf+/lMIHzEd/P0or3VF+lfhGnL2f5mYqhoT8bRoYuW/EtVlovp2/
	UMr2uYEDOU+5VfGd1VmYVTkPYp148kyb8N8DS9Dw2PHtvV3PfWTEXr7/9dCgc6kMJ/Bf8WuHtTyVU
	ITYHoUkpuFrMs2aJue5ga6mrHWBnHhO7iiFqV+9xN5QFoO+tNttwA6CZinEzj30E9t/Z1WEgtf/PO
	IGDHPl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcex-000000042Tm-1Gsi;
	Tue, 27 Oct 2026 08:35:55 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcev-000000042S9-1Uz6
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 08:35:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e5378b281aso25190185ad.2
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 01:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793090152; x=1793694952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alofIM9yjiYbcKrGa3zfxRtQ3/Lhc2tLU0GrhB1wO4c=;
        b=ggFE9lSkGwouVBXxJJFcTxDEH8ZF2hfWxA1ZVePnPcNN96FlZioxEMu+3pnU3RdLU+
         83a10WD/bpO0bOdRPkiIZXLXrC/vqLBqtfloAlPY5Fgkhkzn3erA4E6Z1NgSqH+HppJj
         tdB/6K44EXtus1Trc4Kdrw0wpvC9m9V9UI2z4V0qpUvzEvFQCiQq4KHkXWrId0hCRxrb
         Isx7rBfZ1gZgMGybVKjeDQ+TUTnK+J3g7S0nsCV1Y8Qv7rwRpeO+Bbvp8B22kiEdmDli
         r98PuGIPVSqwx0Ef1EXblNRbr98k6FCWgaVNpEHQ3Owi/bEPq+WSdFhde5OBz/1cFzcD
         m3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090152; x=1793694952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=alofIM9yjiYbcKrGa3zfxRtQ3/Lhc2tLU0GrhB1wO4c=;
        b=EMT8ukO8/vAcEo9ZebPkZEx8kwpyMBwQDp+MWScpBthBQZFzdMrCkKZ9A1BD83loh/
         JKQ28HtZGXKtq/6s+FcUVUytJx/mfTgIs5qD8XQI6w1mGy5UqmvuArSU0iTlC0b0ynLC
         +qP1KTQz7Z3MBS57gGKaDWbRqf+JV1733fu8rP39kSvJRJMqdJUADK6QSUJAA+DRE2cN
         7WsGCgP38iq2ZtSY+ricpVMW/PidnxOHyPdmv02Qp7wxsegZqWB1/7ju5xgP46gX6UVy
         NMiieh4+H+WXQY1UbmW/Eu3TNOakGx3F2GtWlZXlLN63qtVEUHgQdy93n9DVMOU942rq
         jUEg==
X-Gm-Message-State: AFq9FYKboZvajJv1eGgU4fQqf2WzVGYLEzdFydcmEG5P5Th5vQdzv0Kv
	fjwZu4GTQvpLkwZe5vdB6ryNzrgu6L0pCPWjaSGc4yeEIR8iJfv4P2wmXaM3Gt1ta+XBecPgLbc
	DGOEt/dsGiz+eNovmU2oEZJIM+rJywh6yZZLbQAmSmg5jvggJteRUfsZF0dqPtKfWOAyImKmsUt
	I9ReePDh94lmkwaEVZC27m1bBz/ipgQqM4U43grasvuvNVv1dGyoM=
X-Gm-Gg: AYBFou23ieM4YpSgSF8QOYFMWggfyjGA5MP2yRFO68fxcNnQv73hl77YJJf3t28oGmr
	D3+cdttzvfxyjz7bEgZ6D9PL4KiQ8nV9lbYpVasF6ENfmF2Fh+l0Bi1iPS1Uzzc3eUeS0R35xei
	97jixSCIPkf3WSYyWAHhne5BzKm4M+6pM+PP6oqVhRFrfFblA4I0TUyC064w9g9GTzmv7+KFoDB
	NuRJCADumUdaN28ZNXkg5iNVibHrXsB1W0YeAoM6JQDr6Hotq1RCareauyAJjL7HawhoiV6Eh87
	+i3mj5ONw3PAu9aopUMwRhCHMnIYFN36x+ejNpKQU7So2eahOfqI4Jyo25WTvZPPas9eIvxZz5o
	A82FGf3cSxNkgHJ9Cbk/O0w5s7LJppW/PEQbQ67VlMdmjJf4v9k8uMOwDrlypb12wIrbsn4IC93
	mA7hnVDP/JvPlWUFlPK28uzkxfubHdmeot/GqNcBFSH3gyI2fewrIDunOl3DOJthLNBRbxZBzR0
	J4uvOLbZfvNK2c+CbvTkYKBmcoMLTbVIcxpTI9oA1P7HNNxHuvWDpA=
X-Received: by 2002:a17:90b:1fce:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3adeae70a21mr8484930a91.24.1793090152013;
        Tue, 27 Oct 2026 01:35:52 -0700 (PDT)
Received: from localhost ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae401bf352sm2900799a91.0.2026.10.27.01.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:35:51 -0700 (PDT)
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
Subject: [PATCH v3 3/9] lib: fdt_domain: parse domain WID properties
Date: Tue, 27 Oct 2026 16:35:03 +0800
Message-Id: <20261027083509.1076577-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027083509.1076577-1-peter.lin@sifive.com>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013553_406396_96144E21 
X-CRM114-Status: GOOD (  17.64  )
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

Add wid and widdeleg fields to struct sbi_domain to store the
RISC-V Worlds mlwid and mwideleg CSR values for each domain.
Also, parse the root and user-defined domains' WID during
fdt_domains_populate().

When Smlwid is implemented, the "wid" property is mandatory
for all domains; fail domain population if it is missing.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Change v2->v3:
- Add validate_domain_wid() to check if 'wid' is specified when Smlwid
  extension is present; return SBI_EINVAL if missing.
- Parse 'wid' and 'widdeleg' for the root domain via fdt_parse_root_domain().
- Set root.widdeleg default to 0.
---
 include/sbi/sbi_domain.h   |  6 +++
 lib/sbi/sbi_domain.c       |  2 +
 lib/utils/fdt/fdt_domain.c | 84 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)

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
index e4cce8c3..8ce03236 100644
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
@@ -290,6 +291,42 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
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
+	if (val && len == sizeof(fdt32_t)) {
+		dom->wid = fdt32_to_cpu(val[0]);
+	}
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
@@ -306,6 +343,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	dom = sbi_zalloc(sizeof(*dom));
 	if (!dom)
 		return SBI_ENOMEM;
+	dom->wid = INVALID_WID;
 
 	preg.dom = dom;
 	preg.region_count = 0;
@@ -449,6 +487,12 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
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
@@ -477,12 +521,52 @@ fail_free_domain:
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
