Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E6A606BF07
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 09:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lKsXuEkm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=CaTrzFgL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RfmPVSfmCNnTLtfhkoIhwHr3AU4GHqM3pp8PVHNfMsY=; b=lKsXuEkmxAbYD/v0sFUgO0RHlV
	RmquoFiyYzhXDKrkcsnbr8nPKlJkgXXhDGzcsZ4h0MSIwMX1wJZRNT2tcaU2mFPa8W95BfUX62iUl
	H+2RH2luDFDy4hj+FW1vVmkK76B4Smz2aV5EIUnxRctfPTxYw+tg0VsJmC8j5EhHczPn36idfMZ7U
	ajlTW3d/q9bSIMRO9w0Q+Rg4orMtslr1jPkOrgXU8kBPpsLfGvO1lgXy5wqabaIL2SNpZH5Z1GXyw
	9Hby7FwWrTM0jzLHGkxUrCF1yfu8qq+cd9UTrXXsNyeuPG/OpZfHWbWmjbWI8xnDJ5uSIJY9UUQm1
	A2q6nVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiV4-00000003LPV-0eJi;
	Tue, 10 Nov 2026 09:50:46 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiV1-00000003LNd-3OwO
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 09:50:45 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3b147e06befso825585a91.2
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 01:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794304243; x=1794909043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9G0oHFugjmB1Sq0H9cvtLOsKiYjo7oGhUOUzJgBomi0=;
        b=CaTrzFgLlDOyKfn39My0Cc1ab60KgzHJk364WdJE/IkCjdrBzQ2OjBOJCjeITIPTUK
         2JxFshpButjuid9qNfDIYxGz0iIyYIrEVsS8fYNkSvyX6UfwJx22BxbmuGVaG4YwqJoz
         qysLvd2KDQbYp0l+ZTR9aS4+5Nom/09opsYsJFX10JKF4NPzOPJPiWh4xR45lHFcU9xC
         6GWcf+nR7uLtQYTGAbLpwHg2UeAjD1rAi+Kuq6Ttpp2lhh5tNvjlhetrR/doG82C1NEr
         sHAwqvcK7OxnefwGgjdaIoUdP4rPPyfo3ZvaW3iU2IfkcvBfIzmfhb5gDCz2HPNUOIDm
         uclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304243; x=1794909043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9G0oHFugjmB1Sq0H9cvtLOsKiYjo7oGhUOUzJgBomi0=;
        b=jhU59WgbEJV6HLVq/9Xzqc5rZHx9KUio5JG3amNT/51VT6+Bp2SPd84RUhzvvq8cd5
         qIaz/pijLwcYLYshpo/Z9cWZ3GPPHs8044LFODmuUfvEL/y3cQ7Md/JMoz/SNlD47GpS
         1Mcmg0DTHM1z8f7wN1kL6aTymbqIfaWYv0sdw82j6vVc7u+pEkMCioMzncE8vJZi8FjW
         5L+lHc5qIHEawHKb0WlCIVvE+3amOrKZQdyROHIc7GOH7jh6WEjg+3TCFgybKKu+rbzE
         z8ocEFQt4fM0ERMDT7vZYCNKhHD47fR/D+0a6/hlttLBko+BveZTdO51PgYTyoP4v9ix
         iNIw==
X-Gm-Message-State: APuU4Z+BE/kNpQiwiMyNNLbxi8t+d77pBnTPp4pYWUCJKc6cAhaxAYAt
	ZO6cwEeseFgMATW+0Z3QAZ6uVC3jJpHa5Ow+9hEHfPRusLp8LN7bN1v2R4fpJ9naLohyA4bFPez
	iDYELjoPCKgSuhZdq0FOq4lvFXTegUVUQjzqMkP39oMyQOEsXvuMODvJz0qw7NqFXNslJC+Izc4
	7lbXxmiVcmC6zqlRkGYf0nBipWTeMNP+zBmJO+JNB51+qqPXANEk0=
X-Gm-Gg: AYBFou0acI0kts8e3jByae6JplgevQmA28Zmxyx4f4YiWGYGXTPrNTFrw8TMtjHkHEJ
	NtZ/WyMYzVF+4DnAGC+XbBBgQza+P5F0ftQjq5luVo/669UbPe1YMlOLTDQwKRxv35orX/9jqCs
	pPyWqnddKqG89Ti2VnABX7mv6xDWrz8PDTobL87muQefwdcIdQcneeK5edUFcjLAkwxhY0i8g/Q
	t0POkllJTLUuVUp7Gd2SAsBLJc7J/2CtHON12+wpaiqe77KT2D3mCZcjVXMYUs/uJpBjiGuvD2+
	7JWXEIZ2IxONuTnwT2QragK870MzMy7DxrT0VZcsyVNVwOqql6sgmRXVw9C/Osv0cT5vDD+sS4n
	BTGV3PYyR6X4NF6uiBfZEGwZzJq10dnZE7QaWDyHW7JWEtWiDuPbd278ysL3M6Dj1yzOkf/tuly
	qdUnqFVSAb3wCDI+WUGUrFNAH+6iSG5C3Q5K7Ggb5dM/nDKNh1XF9Xojwy/38V1KA/wl3dktUA3
	ixp4yzZlREz2RGfV+eeCd8BHEzyJuYERq0UpDcyoNJLphveraNEPczcpnaaGrNbyePmdMW7sbUj
	Lje62pziJAKbp4W046wSvitWnck=
X-Received: by 2002:a17:90a:d2c6:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3b166d12258mr1964058a91.44.1794304242604;
        Tue, 10 Nov 2026 01:50:42 -0800 (PST)
Received: from localhost ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1f42sm3330151a91.7.2026.11.10.01.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:50:42 -0800 (PST)
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
Subject: [PATCH v5 3/9] lib: fdt_domain: parse domain WID properties
Date: Tue, 10 Nov 2026 17:50:23 +0800
Message-Id: <20261110095029.117504-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110095029.117504-1-peter.lin@sifive.com>
References: <20261110095029.117504-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015043_888172_4BAF40BD 
X-CRM114-Status: GOOD (  19.12  )
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
Changes v4->v5:
- Reject wid >= XLEN and, on RV32, widdeleg wider than MXLEN, so
  BIT_ULL(dom->wid) is safe (Radim)
- Drop RB-tag from Anup
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
