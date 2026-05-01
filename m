Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2010ACD3427
	for <opensbi@archiver.kernel.org>; Fri,  1 May 2026 21:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3gp3YVnQEqjtGMimTn7eTyRlea7xVICP4yups0dz9Q=; b=mlCkZumnKRVUFM
	ejoiekl+Yf9MLrWmOajHMKVvbOYgeXQwFO53wd3e0Df+IH/hFkWirlLzECBe4mwkVJ0hMcE7MXVfU
	CVGSNxuJQztu6IygenTe2rHOP/8Y32pV6ZoeCegUrt8JLSJh7UVk3Cq3n8FNayL9XqpAoO58qO85w
	XtI3AVCYrsPUZ9o3nVcj9OmlFvOzIugq/0Lq9xPo2uUpIZKrWym5e0PaN/2gAWC50gVkSaF4RhhZR
	baezJdgdSORgHrkApA3GFT18NFTpR5emFWRbMhbiKQYeTHx9vv8Tu7RZmyZbAKU1yf4rGSfYKysyq
	WgJXVgx4McYHFlsuy6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE6-00000007gpc-1GSA;
	Fri, 01 May 2026 21:16:46 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE3-00000007go5-2rlk
	for opensbi@lists.infradead.org;
	Fri, 01 May 2026 21:16:44 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2ef397ad64dso47413eec.3
        for <opensbi@lists.infradead.org>; Fri, 01 May 2026 14:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1777670202; x=1778275002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpB3YcnGU7X+N4SRTdXhRi2bV7L+1uKKq2fDYHJM7rw=;
        b=CIMcvy2acCgh7GzI82ZFZkcICuTsRmNC5TCkYiEX9PpthPiM27d2ucdKUmFM72eMb9
         Gg+dneQwnFJQroHuvBRa1NIf7ZQrlb4ghUQwUSAhDZgTgrgRO0jGiL8D0tzyETcfWwRk
         mChQuit+rOAbIYA2w3pcQB3hC+lBeJu9yH6lQYA2GaRK6NE6ZNydA/LOLYLLbZrjX4ro
         GYjvXxw3kaH/dKwiyzFJ2uk80BooIABsulFfF5h8yCEjXlMh9szstisQnLuy2ELotLX7
         US30EDfiKqI1eQ9WrPrCcThiVcm+cpGaNuVNWhCO91gD5fLwq4Kb3VCn1n2mau5D7+Mp
         rRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777670202; x=1778275002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EpB3YcnGU7X+N4SRTdXhRi2bV7L+1uKKq2fDYHJM7rw=;
        b=ixrxBzS+dhrQI++sl+w3zwxES9IR9VmRsv4rnSoMlca9HxEGQz9IYbp5bzYTiErSoW
         AhHEs4YVNSsViDqmNYE8C/FNmOVhU8i/shwjL8KyAuk9l/8e5C7C0rKPf0DXHECNXF70
         pwDe89KcGm/HIYvfFi41fmG6DfrZWFiY9LXEHp+0jtVFAPCoYYJlCpbbM9U0gv3qTw3A
         rkLOMP02QXusH5FbKy9kIr8N5mMKmovyzuqJSC/qU31CYGPDQ+4vxeLRkRwmhYQx2lX7
         77v2x6k7YY7KfqedmjvTy/qdibshUVISizPu52xMH7JQt/nzhAQe1HILu8U3MZaa+Vsn
         p95w==
X-Gm-Message-State: AOJu0YwXXbYVqnbvOcWdpdhFLbL0oK+xOSWUDuYU4sDOof9leManJVHO
	jiuYFYDseV0AuRRedK4M4s3ZAIywmz7aLoL9g5E6HoWXJ2B4VbRvE5VHZuCZnK7E6MdLZK7AgAC
	W8kBh
X-Gm-Gg: AeBDietlNFyJ12rWsyj2NebPJmENyLw6kFSA7Z54zeJxtEDXMZFYFQIN+oqCArMLhJS
	OJ9d7MjkFKtrYVPaed/eh64GEfQy5EVdCWpLSyBTBChAGPMSC1l2wVvuXN+nrCUq+z5pR2va2qY
	ynW0bdIy7/fMaiHe09M7bxKIpkGNNSZYP2JWkOdkJ3Rbk3+ghWdikZqefV4ACmCWPzGKmK9gKtm
	cm2ZKUHv8/2eaBhoWqN7JdNRr6ds/NL9/zh3jXcb4FnYFvUNTfCwb9G/bn5pxjvqmpZVIy3iTSp
	DX3Y1sVDIruhhWBahE9D1mzRqkf2GcCsVONHDe072jUbjHNRLR2Ga3/usY2AFMQTDoRJIYJkKMP
	UdvjGmt7Tf6FZnS5TyRKIM+1PPWkut9MLEE2HGFDEk4ojVXlbJCdTyMMYxcR7G1UCXEhZjBUtYL
	gVpFLNCQiia17TWnS8RrBvEQXm3XOuql94wubM4aQ9K9RTPF17TQrqSucAWbui
X-Received: by 2002:a05:7300:e8a3:b0:2da:a813:a629 with SMTP id 5a478bee46e88-2efb7bdc0aemr235964eec.2.1777670202377;
        Fri, 01 May 2026 14:16:42 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b2casm5879308eec.14.2026.05.01.14.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 14:16:41 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v2 1/5] include: sbi_scratch: Add tmp1 scratch space for RNMI context saving
Date: Fri,  1 May 2026 21:16:23 +0000
Message-ID: <20260501211627.3293126-2-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
References: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_141643_720656_5F732875 
X-CRM114-Status: GOOD (  10.13  )
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

RNMI handlers use MNSCRATCH instead of MSCRATCH and need separate scratch
space from regular trap handling. Add tmp1 for RNMI context while tmp0
remains for regular traps.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 firmware/fw_base.S        |  3 ++-
 include/sbi/sbi_scratch.h | 11 ++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 63bb4473..cdb15429 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -258,9 +258,10 @@ _scratch_init:
 	/* Store hartid-to-scratch function address in scratch space */
 	lla	a4, _hartid_to_scratch
 	REG_S	a4, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET(tp)
-	/* Clear trap_context and tmp0 in scratch space */
+	/* Clear trap_context, tmp0 and tmp1 in scratch space */
 	REG_S	zero, SBI_SCRATCH_TRAP_CONTEXT_OFFSET(tp)
 	REG_S	zero, SBI_SCRATCH_TMP0_OFFSET(tp)
+	REG_S	zero, SBI_SCRATCH_TMP1_OFFSET(tp)
 	/* Store firmware options in scratch space */
 	MOV_3R	s0, a0, s1, a1, s2, a2
 #ifdef FW_OPTIONS
diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 58d54628..a6edeb2d 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -40,12 +40,14 @@
 #define SBI_SCRATCH_TRAP_CONTEXT_OFFSET		(11 * __SIZEOF_POINTER__)
 /** Offset of tmp0 member in sbi_scratch */
 #define SBI_SCRATCH_TMP0_OFFSET			(12 * __SIZEOF_POINTER__)
+/** Offset of tmp1 member in sbi_scratch */
+#define SBI_SCRATCH_TMP1_OFFSET			(13 * __SIZEOF_POINTER__)
 /** Offset of options member in sbi_scratch */
-#define SBI_SCRATCH_OPTIONS_OFFSET		(13 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_OPTIONS_OFFSET		(14 * __SIZEOF_POINTER__)
 /** Offset of hartindex member in sbi_scratch */
-#define SBI_SCRATCH_HARTINDEX_OFFSET		(14 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_HARTINDEX_OFFSET		(15 * __SIZEOF_POINTER__)
 /** Offset of extra space in sbi_scratch */
-#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(15 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(16 * __SIZEOF_POINTER__)
 /** Maximum size of sbi_scratch (4KB) */
 #define SBI_SCRATCH_SIZE			(0x1000)
 
@@ -83,6 +85,8 @@ struct sbi_scratch {
 	unsigned long trap_context;
 	/** Temporary storage */
 	unsigned long tmp0;
+	/** Temporary storage */
+	unsigned long tmp1;
 	/** Options for OpenSBI library */
 	unsigned long options;
 	/** Index of the hart */
@@ -106,6 +110,7 @@ assert_member_offset(struct sbi_scratch, platform_addr, SBI_SCRATCH_PLATFORM_ADD
 assert_member_offset(struct sbi_scratch, hartid_to_scratch, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET);
 assert_member_offset(struct sbi_scratch, trap_context, SBI_SCRATCH_TRAP_CONTEXT_OFFSET);
 assert_member_offset(struct sbi_scratch, tmp0, SBI_SCRATCH_TMP0_OFFSET);
+assert_member_offset(struct sbi_scratch, tmp1, SBI_SCRATCH_TMP1_OFFSET);
 assert_member_offset(struct sbi_scratch, options, SBI_SCRATCH_OPTIONS_OFFSET);
 assert_member_offset(struct sbi_scratch, hartindex, SBI_SCRATCH_HARTINDEX_OFFSET);
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
