Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14486606A319
	for <opensbi@archiver.kernel.org>; Thu, 22 Oct 2026 23:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nuBemG/C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nr7LMIhI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JOI1NivC5ZBtRkKThd6u6Kna3ONOwDLZE0mZIxon+wY=; b=nuBemG/CWIemRnOkkn/kGKaDhd
	RnYDIy4iCzBkUh2E88xvj6XvXk7nYDrdAGc6hHBq3daccTT0EhZ3G5zteLStxuFLvVMLqwJRI09wd
	qtOmwrmM55Wec7XQtebxrYIF9IGxWl/5n2+G6t7bOP+I+6G08acvlvK8tPagZu5wFsGLGKm5EU//g
	1xAbxwlSh0SIpRfARh7QCD+BE347yIMiD661MIWq7CcrAbZkYOjpSz5fGz/0muXim5CG23Wh82v6g
	gNSHA1OBR1ZoV/92HZiNzX7BdxRQGT96EdLIWd3WQ8tyr763hYv7VpUGCY981b1lTl32t3uV3VHwq
	+l5RB4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK2Pr-0000000FBJv-2UkP;
	Thu, 22 Oct 2026 23:41:47 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK2Po-0000000FBJd-2dED
	for opensbi@lists.infradead.org;
	Thu, 22 Oct 2026 23:41:45 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1438d9363fbso168874c88.0
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 16:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792712503; x=1793317303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g5KxLqMFRiicpOZSYGqiYkq9YulJtAunEu59NQgaIhU=;
        b=Nr7LMIhIOizboH+1rofe70Yve1r3TLs8lqIYS5DOrDVb+xKXyQF8EZlcoJ1br5QDYR
         TQaJVdMoMUrhJAoPaxQJmKeNp3Oj2ixGIbY+2r08+7XAxxi7Qk5t0/+0yaQEGjUxRv6q
         mw1EIWz61sp/hgGwoxi9qAhfxVWzdLn6NiXkf3cA3y2JCOZfDo4JVdIrjORucZ9UfXpd
         vkEHSIW9xDll5hNBi2/4uBzdiZ8VLNHGD+8iSGMfvNXIyvtJ3nJHwfsoJbNNB61CSzMl
         uEnxfuoTQSOlpVis7gUAlhkIsxl8u/sx1+qPin9VonNf5KzEyTV0FMC0r+/h3O7LHzlF
         9asA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792712503; x=1793317303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5KxLqMFRiicpOZSYGqiYkq9YulJtAunEu59NQgaIhU=;
        b=UAIJdJXEh/vSTM9vOYuB6QSNRiHrA8JDla0HdoatQf0yJogQU0EhHVSnMSPMNq9Rgx
         MMnS8qNN+5J+05RVMJlSzXhLHHTVF2WEm+WQSnOHF4eUoQaiRDzmYvazZrDPgYLcTVED
         /CdGaDi9kzdhteGbZ10MNHs7AKMAaFDXQVlkIskXP49P92HWH15F/+3bImAs+EvLs25t
         i7in2xkOhqO1xDFviG75J3cxPDFNNm/GpQcNrTyOH3rfrfot358sEYvtAEx1wkbcvC1V
         Svmb/U9zwXIFopprFI/cqbumPe1PMTqiOnRdP6+p3BZ+5Wtf9NsjZeJfAfaWvMr6TYhH
         IfBg==
X-Gm-Message-State: AFq9FYLiXSg5FzDksEopIBZNCQi4LXA0eG1N/ziRbx7AA6ZQMIqwo2To
	K/HWmednyfM3IUWyMSOOw4ELZ/4taFkIXuRrwGpanjDr/Jc+g8Yu/XJ1GPlwwi0s
X-Gm-Gg: AYBFou1Z+f5FcHq6wMYKszSkJnAQT5pGVqG3ciuP6/oTmwmuf4FZNVf8H+pJvXrOO15
	W9VuRsA3nYq6xZXKYynv1d3dXnCUoJ/53O0LY/acXjkOVzXH+UizOWL8WXieFHJge3j/XMUh8SZ
	zYS7chXIDa6hQlWPBP/TXFSD4Akmq17brOkbm9lXtqwy8T2P7RZq8KEfHli/jNmc74eyEMuUuFP
	hoYOGQArWcjqYxKOg1QUsgei+rmDNKWZ6kql99smBPY4AQW5ZllF7WZdPQYyhxAheb17qnvrThu
	/ra4BE9loKhBpzMt9rLhYVSHNG/uxlqT6rxGSgiGuDOWpWs8NiPk88WVSYV5beUXffGrRXVw6Rd
	170DeFXpofplVX41Fa1UiAks5kAlvz67lELQ2MC2iG1UGBjA39gjy5Rp+73vRESu84t5zSpwWaf
	4PcPxJbQ3s2T71k3LY1TXSdfZp/lmNUSsZi8DTdHVjd5CdItqM8bTAmOSi0AmwjWQbeOweK0l8b
	5br1/EwhtZGSTlS3D2xBevFHDpC6SmWeyEybnDW8unjHz4GvKa6mglzhIoPw/dn+fE2YwxBA0vb
	oPS7wMuFJx1+WlCny8A5XQ6bo4h83QtJOCYJzIffCYxpElpmh3AJeEt9VlfVqDj6at1BIc3RwCe
	LBZNl
X-Received: by 2002:a05:7022:387:b0:146:5f73:d45b with SMTP id a92af1059eb24-19595e4d79bmr1182834c88.3.1792712503251;
        Thu, 22 Oct 2026 16:41:43 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195dfbc23fbsm1391836c88.0.2026.10.22.16.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:41:42 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: whensun <theodoruswensanfebruanto025@gmail.com>
Subject: [PATCH] lib: sbi: Preserve vl and vtype during domain switches
Date: Thu, 22 Oct 2026 16:41:35 -0700
Message-ID: <20261022234135.324887-1-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_164144_664074_91007216 
X-CRM114-Status: UNSURE (   8.89  )
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
Signed-off-by: whensun <theodoruswensanfebruanto025@gmail.com>
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
