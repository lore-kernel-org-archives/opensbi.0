Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC31606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 04:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZAVLx0Ll;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=iSfLZdXZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aF+bBRJBJMMlg23bxl2b0TZXPsW4ICD03Tv0gducfaQ=; b=ZAVLx0LlM1wX4VNTw/Yitw1ekH
	8scXcCretEGsBpz7ibIvyzqvGQ1XJigmhWnQuoBT/skXsruhsRg3WmUPZewyZLfUlCwiFzWWPE9M8
	dw2VhXg7mZocE0O8qybi3jIY4iBSenSiP1st9AtlqmCh7mYnGoKz3ifoe6U+HUvtQ3Gujabcotkkv
	mLgUr5zdeIcWPhVzH+4cGOTs2TXkWv8GpIsWYUhIdp6dERzRe7o3oKW/LSWIOPAgI+KWCujsYqcov
	aQJWq1D1Ojbsp7YOSN0/7Fbotx5Ktgas75ICeV38+BUv001xCSbwDpXoREMiQZjtoi7J1NDXsxdjj
	DDaVMkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxc-00000005VXz-2TaA;
	Tue, 24 Nov 2026 04:16:52 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxa-00000005VWe-08lT
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 04:16:51 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso1557164a12.2
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 20:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795493809; x=1796098609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Z8C/2ZwVePwSGX/I8UGy1Tha+E8ycejk8gpyGicjH0=;
        b=iSfLZdXZziAMJb0PZbD15gVxxaNVTJNSXPFsQVxa1xjH2LDDSgsy6BDzWajo7DLmpZ
         GO9RpRJwxjJUUbPMEKBjrvGYbtPtCRNkhDlqT3ysV/Cvw/7RoLb88kBs0jUptMGcjLZs
         rq+KknnpFo0vX98WxUgDkln16WHkztz9aNvSQZn1Moy5RshaB0JP2pzRBIkmZzM5XoaS
         NtXXSSZX8Nhhg2NX5uBAUN+lbR9Xpm0NrEUtvf4OvjmvVH6+jJ2DwkOojusaghQqkW3O
         mu69KF+qpQX1yMABDT8iynjHcLBc85/cC+/k+4qIKCN0IXFJxfC8FOq2fvk1eA4ggecN
         bnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795493809; x=1796098609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Z8C/2ZwVePwSGX/I8UGy1Tha+E8ycejk8gpyGicjH0=;
        b=LCCH7D18R+umudPKlVzi8l6M5AzObrBqT5k23Yx3TXRSlmOjViZyTiFqUBNU/EDUz9
         1lsm2MGvXigGlGexnh+Fpsvsj+2K/nAiLuiJexZXALan0IVrfEhOfYKvOMt3BiqXQtQ4
         v2UQ6qVjw3LrGTXBXh8R06+0ekOBxGcuIgUvdWJu2cbZoUitvXHOeWIOsd33qNMMZGgG
         joTEoGeeaeBxOrwkhSZe4Fw9GG8r8VUFFByL0AmUQXZWxcT/5xiLN/0ssOSoMYySYKa4
         LxcJHmXfulwY4HmtpOhGOT9jSIWy07REnmfi1EE5nfcMmVU1F6wevlF9lISRszp8ZP3c
         iesw==
X-Gm-Message-State: APuU4Z9PcNsLUSB/16tgepvp9cP+0r8lgSmcMD+uWtsl58KP6SM6TmRX
	TBXpZa00flpvGvJn7yB8EDV5P37N7atntbAMj9yr2JM0Or3WL0NPFuO6dEC5MCbdgfko06lOdha
	3s9HXxULZ/q9T1dm92lKPg4ORn3oOXBJ9KOiXMexoaxkIJgJIVrgRdnto9fj4XXqZIHRCYdshS8
	1xu+nJKzz7FjYVKkppuLoUwkB5wptsBWhEW4S/2Oevi4YnwFztIxY=
X-Gm-Gg: AZFdTZfccP5EaudZMeuqdRPdKUrBictCxovS0OM9tPyi3ssXMWIXWtNfep0GxRIZJV9
	z4uKLfgNwSnf2pDbM7sYbsDkWo3rB1E5GjWAOssPfpWYUxObFvKDfcNM+QXsCLVhwBZxdHJM1ur
	S9O5ystWv96yatHxAsJXw7RuMSyfgWv8vmMhWVJ2wEtu0kyQAbJMi1cYfVfyXwJjVVpP3QvuB85
	XPT4MywzgwNomZZ3M9kKMlho5454hUJgpV+GFJTX7ZhB+sMQU8wFW2tk6sjIRn0dbUR6b2dM3mc
	xADVEWQqo0LkynkqWH2jV0xfH9U5nbwK/ByhJX6juL2nKbLN+g/cs64Vr243QvdZFsQd1B/KNIy
	hmU48aC2VV7Kdz3MVc9B15peRC9h+3/Jb6N+hAUtU2eBfDKblcDSt1RJfm5zBTfkh3pSFrgzjxG
	fqZDRaKK8QD17Mq+25DWwFWYI8AzuWff9PpI5r94w9ZLGyu0y6LI0eqDpozdZl8sPlYulCVWUIN
	pv34WlgjfuacWfAzUC5HfLMPBR91/AHdYaKuUHPvC7sGbmr5HU4490sbfdyPHGKPf0wFHG3JH42
	v6LmOWi1qez54CR5Ml0wJV1OE+xEV+kRrgt/zAUB7/gbMMjc
X-Received: by 2002:a17:90b:2247:b0:3b1:83aa:5b53 with SMTP id 98e67ed59e1d1-3b41c98a1b0mr13312913a91.58.1795493808932;
        Mon, 23 Nov 2026 20:16:48 -0800 (PST)
Received: from localhost ([136.226.240.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm23943079a91.15.2026.11.23.20.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:16:48 -0800 (PST)
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
Subject: [PATCH v6 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
Date: Tue, 24 Nov 2026 12:16:26 +0800
Message-Id: <20261124041631.1049169-5-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124041631.1049169-1-peter.lin@sifive.com>
References: <20261124041631.1049169-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_201650_095878_DAA46414 
X-CRM114-Status: GOOD (  12.06  )
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

Lock the M-mode World ID (mwid) CSR during hart re-initialization
to enforce immutability of the WID established by the root-of-trust.

OpenSBI does not assign the WID value itself; it only sets MWID_LOCK
to freeze the value established by prior RoT stage. The MWID_LOCK bit
at XLEN-1 is sticky and makes the CSR read-only until reset, enforcing
a temporal security boundary per the RISC-V Worlds specification.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
---
Changes v5->v6:
- Add warning message when pmwid != mwid (Anup)
---
 lib/sbi/sbi_hart.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d86abf07..8e8f84cd 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -469,6 +469,31 @@ static int hart_mhpm_get_allowed_bits(void)
 	return num_bits;
 }
 
+static void smwid_hart_init(struct sbi_scratch *scratch)
+{
+	struct sbi_hart_features *hfeatures = sbi_hart_features_ptr(scratch);
+	unsigned long mwid;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID))
+		return;
+
+	/*
+	 * MWID is expected to have been set/restored by the RoT's
+	 * M-mode implementation during an earlier boot/resume stage.
+	 * Lock it to preserve the RoT-defined WID as immutable.
+	 *
+	 * MWID may differ from pmwid if the RoT has demoted M-mode.
+	 */
+	mwid = csr_read(CSR_MWID) & ~MWID_LOCK;
+	if (hfeatures->has_pmwid && mwid != hfeatures->pmwid) {
+		sbi_printf("WARNING: %s: hart%u mwid (%lu) differs from"
+			   " pmwid (%u)\n", __func__, current_hartid(),
+			   mwid, hfeatures->pmwid);
+	}
+
+	csr_set(CSR_MWID, MWID_LOCK);
+}
+
 static int smrnmi_hart_init(struct sbi_scratch *scratch)
 {
 	const struct sbi_platform *plat;
@@ -721,6 +746,8 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
 {
 	int rc;
 
+	smwid_hart_init(scratch);
+
 	rc = smrnmi_hart_init(scratch);
 	if (rc)
 		return rc;
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
