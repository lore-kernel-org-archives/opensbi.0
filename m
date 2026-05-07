Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFE5CD343F
	for <opensbi@archiver.kernel.org>; Thu,  7 May 2026 18:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3gp3YVnQEqjtGMimTn7eTyRlea7xVICP4yups0dz9Q=; b=m7Sy+ucPMMyODZ
	aq0/u8NtVKehJ42ncli9rtcZ4AAnpnTGsOJb9Z9B1SLHZJEFz0jsOwGYN/at9QcPmRbCf3cOjDCRe
	KpFpnx6970TcGN0hOjtMj504RAyrjZVz9ZJBSA6wYW4t1lIfHjdG+NtAlRpyAKrWne6Z2hR8pu+AG
	tXVhqPD76H1Csp1s9w4nVr+Wl/CbyGA57j9e511EwIGcrvTJ9XxeUx+fyv9zb56WNh4yfNpTOGjLu
	7jvZxhd+xSCILTPZZ8dcNFa9V5MMfJKIjUkDtccxbMBHDhl1JXRHU7Wn84nRzMWv0cCT9YWY3XBtn
	5qRsI13cr/nu4FU6qifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39N-00000004YSf-0FLs;
	Thu, 07 May 2026 18:08:41 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39G-00000004YPr-3v81
	for opensbi@lists.infradead.org;
	Thu, 07 May 2026 18:08:39 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2ee34d7e55aso113226eec.0
        for <opensbi@lists.infradead.org>; Thu, 07 May 2026 11:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1778177314; x=1778782114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpB3YcnGU7X+N4SRTdXhRi2bV7L+1uKKq2fDYHJM7rw=;
        b=K5wHCZzzB//BaLySXIAAPRZWruDospXilda7i83H9snfOL/sSGgaujp4mlfYYV1d9y
         v3MOu8lrSuuSdo85gU2A21nVPNQRx2md87Q4URdmrdjhnTGyis7PxNlX/sKGvS7TuRDu
         wQaEfkX5egpr2//Uhu1W3Pj510LjE6joAoz70lqxyNOnM3wRir9jmSGs+INjyOIcImfs
         3dL8QMVAf+i9Fo5vjLuLIz8st34+h1gSqiz/vx6JWocbnZz4anrlE8GfFPGahu7jvV22
         FHMjR9KMu1SBaLTc955KlD1gXIVMU5BDB/CAJboeCn3qkppqzi0xrw3EzQqDKwuNOlgY
         YpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177314; x=1778782114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EpB3YcnGU7X+N4SRTdXhRi2bV7L+1uKKq2fDYHJM7rw=;
        b=O3HJjcd1PtYURjgQmTOB+Pzk9aKGFG5eSwV8ihd5z2RBUedRUWCUm6IFwl7YZsOdqe
         kJi5Iw5HdCmXCq3hNM+NNgt3iXhq3sxFk287kOdnst51wWvrhCQF8kIxD8Ow9IBSZXJc
         0QXrZqPv8fJQQ1UO9DVRZq6Y3bALt7CsSz71b3hoNmwa1zsmW5KA0+xDxdfM1jClWJVX
         mlcgaYsi7P4U9Y6lJfE4oHKg63loXN1/Fmsn774v9Bzqtx26V5oHy/pQmN6OTSBwzApX
         6wVnI1pa8mBe/KM/SNUpVoJGM9Ek21pGQQzMqv2ZxQPIGTTL+7AU8OvDcfDkzmwpw55D
         E6Yg==
X-Gm-Message-State: AOJu0YwqFaiuJfviqppqO418DSRarnUwJ50CI7zOlrkzIEfCQTJHmHQe
	Cm50oEwWRCN/H4pSRge8BzFP9O3rJMCwvpUUTheq7dIxQQaizldEuAjc0A7sXrCNKvA=
X-Gm-Gg: AeBDiesoORkWN0xEw0IsefwPmCXIpzhgBK6AipezD77OJp7u5S/Qsnn9m3tFDcBtbZZ
	ioY10MB6JB4N588HehOU/E1XKkZItLejGghQE4qMihWSxY0kg3nsFk/KOtXbgTDmAN+SP+hD7Bl
	XyI1vhsKON2nsaIBXCCKk3G9Q00tUPUQ6lig0IiSBchIb7u/viL7LVhwkMUiAsHk7IDIdts6E4f
	Fz3PHvHQbImCrw6nGNDQI0yjyhPSXpW7EINWcGMyRZXgQ3cyKbpxINYJErLVp/jK6mPgAYdcnDg
	ttOgN+kfSqo9iZpgutf0ESlrAxpEX4nb024Xnc+jl5JVvuaZVi/iG7dDIYrAB4SIjklAFuEk4cx
	z0ebJo6vxvgc+RF7iH9mk52j/8GuncATVJEMZ4Nlj2YhECB6gvk4XZ0MIVm9koBuXSGEieZA8cp
	G9aUbwck+T2iDc/59yuxjQFYNaRCXgawpki1JF4VzrUdGNlGA1Wg==
X-Received: by 2002:a05:7300:2327:b0:2d5:9438:2a02 with SMTP id 5a478bee46e88-2f5671e15a8mr2291585eec.1.1778177312731;
        Thu, 07 May 2026 11:08:32 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82b5636besm78285eec.2.2026.05.07.11.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:08:32 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v3 1/6] include: sbi_scratch: Add tmp1 scratch space for RNMI context saving
Date: Thu,  7 May 2026 18:08:02 +0000
Message-ID: <0a5d241fa1db03e71a3f56be24708cbbc8037e28.1778176768.git.evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778176768.git.evvoevod@tenstorrent.com>
References: <cover.1778176768.git.evvoevod@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_110834_972620_2E989D98 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
