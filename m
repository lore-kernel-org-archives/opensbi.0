Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DB0606A323
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0r2+yw5y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=BFxDkBen
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oPje8IdgoFrGqjcRbeDl7ntTw41Bmao4mb0vQHbeI4c=; b=0r2+yw5y5XFDjic5aiLmP3+7G7
	4RyuLvPQIg/z9Q21OdDXWokF0+bDwqsFRLS+exH6dMJ+84wjBLBG0YlLyDHkTKSnt+S4FkRersx9G
	ZzSIv7AN0HtFYNIq7oaRlQomVxEdfpA7nrvYssFcc4KS+ON41PlhzZWQXSoBScNOb3erzylq1ppc5
	C6CDjBjAlo843ovsemn+aeAewYNan9l7UUH1yXLzuIID1Drq2a523PqaDTfQ9rX7w2x+FgZ/EYN6g
	lU12oQD/XfFZ6gfKMtotgFia0adad+hFL7BG9yxoN62Tq9psEW2c4SXIjbz0SA8EINznnepyFDsTc
	Ku+Qgl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk79-0000000BQfj-30H1;
	Fri, 30 Oct 2026 10:45:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk76-0000000BQd5-2Ioe
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 10:45:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e985106c0cso5307425ad.2
        for <opensbi@lists.infradead.org>; Fri, 30 Oct 2026 03:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793357135; x=1793961935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSLtXct9u+wnHU83tIm6uLJtEXjzXV/17XccPeiILZ4=;
        b=BFxDkBent2KD/EUTWAfAug8mHDmaJA+K+QA1yR5HXfJbfHoTJFqvjitHDeUu2k/2uf
         ycAjLe/onAw3Sv1NAJz/Lq67AE19fROinP73KCj0+7ezTzpUDsVcwcwFc+n+uFXhj+Ia
         GpPrHBrAYPggBoJRFa4ALbbbs4VMb/WLrfrVI/gQAgT52dhNDEaPFff+w5y767RTEp7S
         1KT/RCW+AnXlrA0SZj60gbpeDr7U8Kx+Mc2zjuHkd/slg8Y2KgRIm1eEB9H4yDcVnHHV
         RNz5Ag7EacxmQ+MII+J4BlhXDzCRmnTQ3QLIVwjVpKx1a6u80Ewo+W2fi3VZItp9GJic
         1CPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357135; x=1793961935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSLtXct9u+wnHU83tIm6uLJtEXjzXV/17XccPeiILZ4=;
        b=zt9YerxMgkRyTVU7vRTr9nYydakM6MywHxWePm6mc7h6S/6aVRRKj7QpztUXgcXD7G
         /Y4vEG9n+dG9LcO9NTOPw7SuQ6GRgbBKJ3CkxCfCTaF5deqS0LQok5jDZztRfXJ/O1X7
         4NrgoTQWLW+B2vgTw7i3O7RTsSo8OuViS78qy2SKPI4Yz9MdlKw4v57gA6Fhf18t6JFh
         XtYVqjUnTSOzXXuFHiOAkf32xaBSqk4G+NqssuNfYQF2BQlhDVRV+SA4muQeScc+EKGu
         KBq5k7Y+a5MZeeA47GMf3n7nJqId06XDYFqOpHNNiivJyEXLyuN/Sl02D04ljH6Sp+aI
         6Z9g==
X-Gm-Message-State: AFq9FYIkrwRNYgxech+rKtEWApuy4ft8QdcW/vXpmYILDxwQ4cM52/Ax
	2uHsj67DyCoxkAvCJT5Q6t61bWjLQtatCJgpYJhc7oMhC3sDirWhcMCrMiC8cQppKErlZ7Z1Aw0
	sPbS94hD0b3OVcSH9BOSJKcdE5J11cFmUuoZRTRgDpLDW8fBu+lgvuOKb/vbnkpfGowK/I4tmdw
	EEiURyCq9wueyphvgHCGR7cnsvPkCWV3HbOtxNXK5YGEVaViQKWmE=
X-Gm-Gg: AYBFou3NDfyYCUIcv5aM7VL3vWKLtbwDCS9K/7VfZGAqbR6B1eoeABnEVrv2o/bAtJ+
	v0TZCV2+RBKWt8dkYDEVUj3lqRWlCesOGD6/zWBzSF7itc9hxTlChl/7qqvGVoGIG5dqQjPNBCz
	I3+Ymes848/HdnlRxxqHdNqzGv4etcbKMfbjbzsADtCzKheBByt4cBZ23Z23wYePhCyfFzy05wx
	qBDAa5QXzNZf3OkcYZA2nfGy2anHgDMOehi1NoAuYoZNdu+juqkrN41tqp4LAXJEILXQna1cFBB
	chfA9XzxpaUiyrkcT72x5YnGKYMDvuRELrTPoLRByl0CZ2JHzf9U/9EPYeta26QrVcwImuI9zTy
	DUV1HXIwnSy/XdP9MzIg6WHinT/+fHKbJFkuwk7+KdhxhOREsaWvPEYkpa8lt6WSxS0o7gsAjBB
	In6NmRfa5EMFwYihP6Cd3Uz8uzhMonnxIaK0yZq0CGy78YZsRk9g+Ja44aMr8Fp2JAtWk7ZwEvv
	LuVnzK0McnkhKtY1rKWQWqx6bfZ7ZOkuz5qQ2hxya8P/YPJ2YpFCrUXTQHhJc3J7nUY0/xQwm1V
	wVTemt8rfCV1GJv7CDEfUSy82Mg=
X-Received: by 2002:a17:903:b50:b0:2e9:7b4f:b994 with SMTP id d9443c01a7336-2eb364d67bdmr19066705ad.33.1793357135066;
        Fri, 30 Oct 2026 03:45:35 -0700 (PDT)
Received: from localhost ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ebesm5395475ad.9.2026.10.30.03.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:45:34 -0700 (PDT)
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
Subject: [PATCH v4 3/9] lib: fdt_domain: parse domain WID properties
Date: Fri, 30 Oct 2026 18:45:12 +0800
Message-Id: <20261030104518.3297875-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104518.3297875-1-peter.lin@sifive.com>
References: <20261030104518.3297875-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_034536_607743_ADE9F9B1 
X-CRM114-Status: GOOD (  18.56  )
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
---
Change v3->v4:
- Skip the "root" node in fdt_iterate_each_domain() so it is not
  treated as a regular domain instance (suggested by Anup).
- Drop RB-tag from Oza
---
 include/sbi/sbi_domain.h   |  6 +++
 lib/sbi/sbi_domain.c       |  2 +
 lib/utils/fdt/fdt_domain.c | 87 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)

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
index e4cce8c3..a2bc002e 100644
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
@@ -290,6 +294,42 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
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
@@ -306,6 +346,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	dom = sbi_zalloc(sizeof(*dom));
 	if (!dom)
 		return SBI_ENOMEM;
+	dom->wid = INVALID_WID;
 
 	preg.dom = dom;
 	preg.region_count = 0;
@@ -449,6 +490,12 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
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
@@ -477,12 +524,52 @@ fail_free_domain:
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
