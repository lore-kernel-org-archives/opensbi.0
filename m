Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D48606A324
	for <opensbi@archiver.kernel.org>; Sun,  1 Nov 2026 10:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y6ROeBRa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EsZGBIhI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=m5yCW+zoujzeYDI5Cigli0xQmoFkCGR9QCBBvs3XhGA=; b=Y6ROeBRatrr67bmgYazI5XPPLl
	tX1wpPKEhU+ti5+7pKh4shCqVbFhKOlhH9jngJrB17zF1ruoqXCjabaEnq3yCXjO6nV7a+PlTAWTS
	hzcBKeWkPwPt2h6k1K/sKOqOfl558QOlwbXWL+TzzqYSm5x6/N9yeoMdCtE/qquN6UOqeRPGsJQzv
	oByCHUk93eD6kBv7jT/UFi3O3rPYpqzM5dXY5hqL6Su0GprOZepdNfvu96Nm+3yWejbO4kAzFcrmP
	H9AJGg49RLcSDXYlXJ4WHD7MrjkkoaoQGp0t+0XqflyxAqnDAdFpQF5G/pTSHSx2bWyWj+jIZMzz2
	hjgvfDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNSyk-0000000E5mK-1EsC;
	Sun, 01 Nov 2026 10:39:58 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNSyh-0000000E5lx-3SV2
	for opensbi@lists.infradead.org;
	Sun, 01 Nov 2026 10:39:57 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-15dd124bbe7so2115645c88.1
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 02:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793529594; x=1794134394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ju3BKwbHCnWkPqtLeQbETaEiCQgopYUQzbzTlRlytr4=;
        b=EsZGBIhIliKkIm+tloKE41ylK89U3EzocydysIgNts6H3tsgdJK/KJkkA8l2oWfYFB
         0h8FzSnEQA5iSAkJA71Tp5vMLvDZtV7ND72BLGKFpZTvuXZAsa8GJ+pK6kVa8tHggUgP
         V6OEwjmUwUItlZwwIAYZ0Fg72uwTmNQLbTXyapHeIdsxNH5IDurj5Udffnotv31Jc1tf
         nYy7RWXKOlnMBRM3mZP9rUpedUl7zpaN3aFQmEQNjAsRy6dfZHr2QN2xB71m+zQGmVHk
         kQOEyeai+6rK/7t00YAz5zsxZW/X19p7hkXQe3O4zXbS59E+bd7zGNsYTSToOWsoykYq
         zlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793529594; x=1794134394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ju3BKwbHCnWkPqtLeQbETaEiCQgopYUQzbzTlRlytr4=;
        b=DL+iMiNTcT+KN9SYaVCq6Wq6TX7Z3vzewlhUL40exvA2upYYKri32ay5TyddLZUvpS
         ugoCXTFhT6aztElykFQAFrcRftzrttiEecZyANEnLDrof9FhO5wC6V42R6/+uVB6bIjV
         jANgUH9scHyMwQ6Du6QfQmNTZK/M9swy166fSqN7PVN3cnQ1mxMWhPwTRvxJ0on8UXLJ
         sxQr544hx2i3rprbirh0xOAuyL4i/WJ3UrZIJsfSox5kVwA3JeSrZHlhY8lmRQSJAOPx
         OoxpaJlIif4pZWhn25pjSw5GXssAHlmgqhT3ANf9Mzdvfg9efe+kGzHHoZn9EeIgPv6l
         cdlg==
X-Gm-Message-State: APuU4Z/17B57cnYM1+6jzDnJIBlX/7YZvxRzybJOYp9BJWq9szPc+5J8
	J1Wyc8DpyehipkktmqreQQl0wHO5OIoepyTTGLCF/O9oqF5Ilpjo+KragUZq3g==
X-Gm-Gg: AYBFou2pWprnypO1/xzEBagCa0+jMBclmwYPk0aWamOiPHuUOPpMR/cG7F5RMIFHm0J
	OH6cEE9qcN26cDK5a4XNWjJt0+OrJ5vk7KTtqzpS5yQ7WH459rHbILivUJBIrAIZ9Evz32fupSy
	VahAgjeRLS+PhAK8bWlebZSD+pii2T4BC6fMr7O0LlqtUv9qWVnL1yBIQwPBZIewnbyE5PMaZIb
	nmOCO7mWqDWPtsa2TniREd/KU/Q6sGtxwnswqbBx6ydr/LnwEF6++DDJsAP/rTN9X9Zq8hPT52O
	+oLVt/QiFz9Jyitb8U1vdJULt1ZTOy+kqMYXbEGTRuUITIoDOd9pausKPSCz9lKdOjvPuq42Wz9
	axpbWNKE0UQuPkXwjuUzHMlofDgwk8aEWZjDU/iWzYlwPug2CRxiG7BZ6ArAjAClEKa2l9Sy/dO
	BlOI/a/mvOM1Lz7Tpc0lfsQ6oko+G9GZLlI71fsUFrAPxARA1/R9MYVXjNHGpg4ibE7+o9qh24g
	dLwMYx42cS35Y+UuDg38ZOuBvq0Ia8OS+pdLa3fwCv0hMVcY2XZtfc5UmBgNfAyf2jmTvQIhrUz
	DQWQ1ucU7qPRsznZuOblvnJ5kZ6VE5F2UXyKzRJhXxKe8ekCuRgCPrtFKTL3hKd7DdCiyMTLxdp
	s8pZfhXUbrGTFtvQqf5s62HxPQA==
X-Received: by 2002:a05:7300:a9f:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-36a4235f45emr10388502eec.13.1793529594454;
        Sun, 01 Nov 2026 02:39:54 -0800 (PST)
Received: from moksh-Nitro-ANV15-51.. ([36.255.88.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm28029616eec.20.2026.11.01.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:39:53 -0800 (PST)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v3] lib: sbi: pmu: Validate reserved bits in counter config match flags
Date: Sun,  1 Nov 2026 16:09:31 +0530
Message-Id: <20261101103931.26148-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_023955_868239_401CF4AD 
X-CRM114-Status: GOOD (  13.11  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The sbi_pmu_ctr_cfg_match() function (SBI_EXT_PMU_COUNTER_CFG_MATCH,
FID #2) does not validate the flags argument against reserved bits.

Per the SBI specification PMU extension, Table 8 (PMU Counter Config
Match Flags) defines bits 0 through 7 only, and Table 9 (PMU Counter
Config Match Errors) requires SBI_ERR_INVALID_PARAM when the flags
parameter has a reserved bit set. Currently any bit from 8 to 63 is
silently accepted and the call succeeds.

sbi_pmu_ctr_start() and sbi_pmu_ctr_stop() already guard their flags
arguments with SBI_PMU_START_FLAGS_MASK and SBI_PMU_STOP_FLAGS_MASK
respectively. This adds the equivalent SBI_PMU_CFG_FLAGS_VALID_MASK
guard for sbi_pmu_ctr_cfg_match(), following the same pattern.

This is unrelated to CVE-2025-63913, which concerns cidx_mask == 0
in the same function and was fixed by commit 69a0f024 ("lib: sbi:
pmu: Return SBI_EINVAL if cidx_mask is 0"), already present in this
tree. That fix does not touch flags validation.

Tested with a small S-mode harness on QEMU virt (platform/generic):
flags with bit 8, bit 20, and all reserved bits set previously
returned SBI_SUCCESS; after this fix they return
SBI_ERR_INVALID_PARAM, while valid flags (none, and CLEAR_VALUE)
still succeed.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
Changes in v3:
- Dropped unrelated SBI_EINVAL conversions that were accidentally included in v2.

Changes in v2:
- Rebased on current master and resent with git send-email as requested.
 include/sbi/sbi_ecall_interface.h | 9 +++++++++
 lib/sbi/sbi_pmu.c                 | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index fd4e77ca..cfc5db95 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -303,6 +303,15 @@ struct sbi_pmu_event_info {
 		SBI_PMU_CFG_FLAG_SET_MINH    \
 	)
 
+/* Config match flags valid mask */
+#define SBI_PMU_CFG_FLAGS_VALID_MASK    \
+	( \
+		SBI_PMU_CFG_FLAG_SKIP_MATCH  | \
+		SBI_PMU_CFG_FLAG_CLEAR_VALUE | \
+		SBI_PMU_CFG_FLAG_AUTO_START  | \
+		SBI_PMU_CFG_EVENT_MASK         \
+	)
+
 /* Flags defined for counter start function */
 #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
 #define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT (1 << 1)
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index a043dc7c..2540043c 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -930,6 +930,8 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 	event_type = pmu_event_validate(phs, event_idx, event_data);
 	if (event_type < 0)
 		return SBI_EINVAL;
+	if (flags & ~SBI_PMU_CFG_FLAGS_VALID_MASK)
+		return SBI_ERR_INVALID_PARAM;
 	event_code = get_cidx_code(event_idx);
 
 	if (flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
