Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E127606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UupB6H9P;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r91Lku1i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MK4Z+ljnhDPlrWn7ZwSMaKJX3+7vgE7DUey/FptXPZ4=; b=UupB6H9PXhgsyXqrjk326320iq
	enwneuVw2ud9z9FUSqeamJijOHpHW1VwdTxpHTK+ux2cz7PrKtQo6BEXHmvNhUBcWzQ641Ov/klXv
	JkS7goSvXb9O+EqaiDNcZ4w6gaAOxiwEYdNUOiQUVf3HFZiS3fYt82XXTpzFUTAFhqzevJPUf/Lx1
	ctT3QNCRt88KVyBy7N4ZwSbEeYKjW4Ptxt15UVkc9UR3nlIxyvp+yCQ+xEmE3d5T10dm2bA/Yrnu1
	VcsZLfx//09UGTeW8i306jH9zB5Dy/y8PovlYWhqGcDi20/mtvjDepSJcla2zNiggPW0M0Bish35S
	Em26gehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PO-0000000Fioj-1MYC;
	Fri, 23 Oct 2026 07:09:46 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PI-0000000FiiM-2lXT
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:09:42 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3550c917fd3so896814eec.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739380; x=1793344180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9dditCIhyY75lL209BXk3ThJr4jNjAnLNXEGLjatCrA=;
        b=r91Lku1iAGttRuKLR/YcHWW5QG+cD+C8gXzDzcjAVI9+9ihj2d34RpwVF5ZO1/7Awr
         5sUhyPWd/cwJH/kfOJ0qscxlPoiNMKzXpp/XYbMssVcuvnrg38KyUBTbUsXvTd2cvj4h
         5diZne02S7B0SE22zLHoqMhR5K/E/iBi5SwhQzIxzurSgj4g8G5FYB8Akyn/nEUJVeCI
         E/7EMNgKJNVBEfIO+NAVYRfVMEvVaj26vaIVIWv5w0iJmmNJEE27SPFZ4JnKHjkcgX94
         +MIDS1h+qmvQyni1tn8Xhnp2A8TvCkREplqJI9/lpkbrWDd1kOrjaKlyudXIwiX9Jafl
         ZBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739380; x=1793344180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9dditCIhyY75lL209BXk3ThJr4jNjAnLNXEGLjatCrA=;
        b=NymFQ3CsZITrem2NFAD9FeBstBuIWa65ehbQ0B96ovG+lWNz7SbvWWfjknuvrqA/q0
         rBL+Mmrkc0O56AJu3WixMbQ5oSzz5snJgeCyGv4AGKKbEuy6jP4dqOqaOwmukiNZX6wO
         73sNFFDVY+N+qwZqYh12J/8s27BVESmGRbTxyIT83qv5knNZqPW6hyvV0gioIH4Wyqmr
         eHsWx1QMXJoqiaorvQOENrEwAcbAhrSfZ9rCVM6luiSVKntyfoVcrcDKJIE0rkF4r2+1
         574w8L4u2U8eBppbRTfFYryVo15BECD53YmFbW9M0Rb9zBJkmNgM5+p9jYsnu7hsF8Hb
         +TNQ==
X-Gm-Message-State: AFq9FYLPal08VWBxwj0PShTRMHEOrwQph4e4sg6T5jRQMTZxi0RgEFSW
	j78SZc7i1hgJPAsfXpyVzdDCcUwWWt8M4BqzGKhEW0U5b8nTgrFazd3LnUAsk2Sg
X-Gm-Gg: AYBFou3qSavrYRl70veCvt9bKWfbDtePfqFzZfE9GSrNRXl46DebYWHOxeuXoQmPMbL
	TkLVKjzAQWYhFn9+DE2YXuMO5bH/6x+Zps+8r6rI4I6u7SqBjyInHvNGbs243TdLch5UIMxMFAq
	7ggkn9CE6t+aGyK6O79/jfO93XlzKKFEbTf9b7REoBWlCxQg5aVGYC60/7ffCqAlL+15A0E7FSV
	HWqdCpwxg5HIXv0bOxKd5YhM7Eo6NgeNMNRF1kW5jr4YQHjNBkPbScGvxvJ7cPXXemMr/oe69kQ
	+GnsFGnqZt+/Ub1YhQ2gHGnhf4xzp4MhgowPX+kWjrkQTITW2ZENX2A/nnqIHyZgrAgfoMUz6EL
	4b/sg05WDEEisVQDqBi4KfAiYo/0xLlZs5hfex9cJe19GsmXk8riAf2+pkYudD/VLs+C6SNodsC
	Eggs8dRvkwtQTy6Ld73SPnWMGSmtrprJVbNl5SvUpxmq8ixzYveTuy4op2O6X7zPPINjIZrUrXh
	KDtohumDo2HAp8WlBi1TsP0Jri9ttk6rmUykUXtcMUuwb6mdIQzCpODVMEzMmDaIeRuFVhmpCxL
	uyMKcRcap766fH1ME6fsfoMJKo6DWBzNcDWVzUvH3kdCbPpR1CIf/ZkNlw==
X-Received: by 2002:a05:693c:60d7:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-369d97a87f5mr2143914eec.7.1792739379628;
        Fri, 23 Oct 2026 00:09:39 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e10da4sm3863206eec.26.2026.10.23.00.09.38
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:09:39 -0700 (PDT)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH v2 8/8] lib: sbi: Preserve vl and vtype during domain switches
Date: Fri, 23 Oct 2026 00:09:25 -0700
Message-ID: <20261023070925.241680-9-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000940_700401_A2E4C10E 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Save vl and vtype as part of the Vector domain context.

Restore both CSRs using vsetvl after restoring the Vector register
file. Restore vstart after vsetvl because Vector configuration
instructions reset vstart.

Link: https://github.com/riscv-software-src/opensbi/issues/434
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 include/sbi/sbi_vector.h |  2 ++
 lib/sbi/sbi_vector.c     | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
index c14f3174..480f9ac3 100644
--- a/include/sbi/sbi_vector.h
+++ b/include/sbi/sbi_vector.h
@@ -15,6 +15,8 @@
 struct sbi_vector_context {
 	unsigned long vcsr;
 	unsigned long vstart;
+	unsigned long vl;
+	unsigned long vtype;
 
 	/* size depends on VLEN */
 	uint8_t vregs[];
diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
index 1f9e01cf..53c2e5a7 100644
--- a/lib/sbi/sbi_vector.c
+++ b/lib/sbi/sbi_vector.c
@@ -33,6 +33,8 @@ void sbi_vector_save(struct sbi_vector_context *dst)
 	/* Step 2: Save CSRs */
 	dst->vcsr = csr_read(vcsr);
 	dst->vstart = csr_read(vstart);
+	dst->vl = csr_read(vl);
+	dst->vtype = csr_read(vtype);
 
 	/* Step 3: Save vector registers */
 #define SAVE_VREG(i)							\
@@ -86,6 +88,15 @@ void sbi_vector_restore(const struct sbi_vector_context *src)
 
 	/* Step 3: Restore CSR's last */
 	/* Restore CSRs first */
+	asm volatile(
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"vsetvl zero, %0, %1\n\t"
+		".option pop\n\t"
+		:
+		: "r"(src->vl), "r"(src->vtype)
+		: "memory");
+
 	csr_write(vcsr,   src->vcsr);
 	csr_write(vstart, src->vstart);
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
