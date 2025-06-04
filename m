Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57461C5B543
	for <opensbi@archiver.kernel.org>; Wed,  4 Jun 2025 13:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NmU8ZdvABRDQaMpzmZvIMUJOkTPDxGJfampxph4Evys=; b=CChIAIdp27aAoU
	QeISF92fPxM+igJz5O6DopByPR1XDa/hrAUfPUxfWlY22PVLbTPr2LCbaUUWKxVrP6mGgBI0BSCUS
	YLcQyWqcXFAKo9mb5SMrpR4nN1vwbMDd/4X6HgXnFszVGrNFEL2xFeE07Hv/tCctViPLjCekKvEqz
	BdNXr+WVo187auKL4lro0yWDfnb7FX7YZmMiMVBbdwqw/8aotPKRMgniWoD8h2iFTMqZyeS4WnVGn
	h+SYRn+OxZKAS3RUhy1699UDC8Gkckw8ciUt/KAMqDuAB2RfjCXn7Bz5MM1U9woj4XAdpVRsVTHBK
	FNk+CIF0CknbwuKsyp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoXf-0000000DUrG-2STv;
	Wed, 04 Jun 2025 13:52:31 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoXd-0000000DUqp-1vK7
	for opensbi@lists.infradead.org;
	Wed, 04 Jun 2025 13:52:30 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7d09b0a5050so408263585a.3
        for <opensbi@lists.infradead.org>; Wed, 04 Jun 2025 06:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749045148; x=1749649948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=en+OmczmPC2BxycM4Y+FgJ7YVQNL+OjH8N78DBrbKfA=;
        b=KymQtaL9wN+AtTGF/+IPGfQumZ9F7HStZL9UI7+8lNE01TeZimOiDXJ9fKaI5ro+G4
         TkRFOsssTbI+5n6prl6hRrWb/ig4RtL4kAzynBpC1g4M2kcdy6sdkk8iiDsERBgC01dT
         g9Zu8bdXu5/xEYMQfQe0FRBy/Ddb2/vMcSqdiSd7MiLz1bW8Ma4aTlEYpfUHxUV/SldM
         cOzf6WCRxaHI663g5sE/SUwvIwzg8WFySl4g8aSQgw15Oj3U6f8SV7lXUzcdcY/13jrt
         5L4G0KmbKwK/j1o5GyP7Gny3e0uraEWudVuczG5vyJxgjyPqYnroyL07v7PPrHL4/ecH
         vGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749045148; x=1749649948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=en+OmczmPC2BxycM4Y+FgJ7YVQNL+OjH8N78DBrbKfA=;
        b=M7Aiqgk68k5P7u632xm3sKuMZI4oAD30k4wOx8IQhsbomF802AG/kZIgH+LC6eBG/a
         dDctX3lvbHJeKCai2KKQPfCSjoewHdb9c0Q9uahAZ4QCScBtI0erKRRbXAmXPsecX1Ac
         Psh9Ir4BNpDnd3Q34jorDt7YZs0I/OZLr90Y660UE9UX02L+8J9Qp9c4G6oJAKG8T9B3
         yw1dzy6Ns705ElGP17jHvoo4I7lxVboVL/yIITe/UPGX1c5gKg4/RyqWV7wFih5sWgR2
         Pj4Ts7CPfrDQlKhFbIItyAHBNGQ3Bw29id6Zka62N1gkdMFJQMQKMyMDSSLwSpd2dDAq
         QLKQ==
X-Gm-Message-State: AOJu0YwuSx8mjwOmJ7khx9VGrKoFCGvN/K57ELrrGMnZ6eMi0qHngEHf
	mecM961E22KLGjvJlw2a/pXyBL+lurmtcZfZVa4vvbvNWFR5kXUjkHlHZGYcdl+O/sCg/0tClzo
	W9O2p
X-Gm-Gg: ASbGncvFAlH4ybWxxHL836Ta+2YfFCimAkuJUVKil41KXql53sWTZF2Bo1CjBwLFFjs
	NjoSjtiUa+LIu4rV7C4/ijNERlDPpJ+8LgqyNMIOjD0uoI4tdh1M/T279//SicblxAHYFR82b1F
	KCSCTiLwo/Npll4RL8WgxMutBNeJvHheq5koWO1p+2CRueBiC4VcXN9HlxIr+6wVGDX3Okvc1xC
	mfU13FPhnDzhkqFLJt4Tx2/CSxr9cF9S2cNqmQnDz0/eASmBLTLvNlEr/yTZ+SJaQza8TQK+HKl
	6+JnI8MTWuJQiTQBsoTpuyUzLqZ50p3bEPEcZDawYh4Fo7MWbzNoRLkFI/tGhgMGIq45oFjHQJU
	XLBzsMrQoUOqHJBIiEtwPSzRWCUpoO/WKrzszn4gjxag=
X-Google-Smtp-Source: AGHT+IH1N+ikdrXyOb8oes5SAaKHmJQYJF1j6INIvsnvmgRqQjUupdJlI2u5vIzq4zKK2RHhTQ2GxA==
X-Received: by 2002:a05:620a:2448:b0:7d2:1199:d850 with SMTP id af79cd13be357-7d219841816mr404775285a.24.1749045147970;
        Wed, 04 Jun 2025 06:52:27 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-224-24.bstnma.fios.verizon.net. [108.26.224.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d3bfsm98956036d6.41.2025.06.04.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:52:27 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>
Subject: [PATCH v2] lib: sbi: dbtr: Fix shared memory layout
Date: Wed,  4 Jun 2025 06:52:25 -0700
Message-ID: <20250604135225.842241-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_065229_501374_C70BC37B 
X-CRM114-Status: GOOD (  11.41  )
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

The existing sbi_dbtr_shmem_entry has a size of 5 * XLEN with the final
entry being idx. This is in contrast to the SBI v3.0-rc7 Chapter 19.
Debug Triggers Extension [0] where idx and trig_state share the same
offset (0) in shared memory, with a total size of 4 * XLEN for all the
SBI calls.

Replace struct with union to match memory layout described in SBI.

[0] https://github.com/riscv-non-isa/riscv-sbi-doc/tree/v3.0-rc7/src/ext-debug-triggers.adoc

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V1 -> V2:
 - Remove anonymous union
 - Replace struct with union
 - Update commit description
---
 include/sbi/sbi_dbtr.h | 2 +-
 lib/sbi/sbi_dbtr.c     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
index a8b3a02..9b87968 100644
--- a/include/sbi/sbi_dbtr.h
+++ b/include/sbi/sbi_dbtr.h
@@ -90,7 +90,7 @@ struct sbi_dbtr_hart_triggers_state {
 	}while (0);
 
 /** SBI shared mem messages layout */
-struct sbi_dbtr_shmem_entry {
+union sbi_dbtr_shmem_entry {
 	struct sbi_dbtr_data_msg data;
 	struct sbi_dbtr_id_msg id;
 };
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index f0e9128..cfb6b2a 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -506,7 +506,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
 {
 	struct sbi_dbtr_data_msg *xmit;
 	struct sbi_dbtr_trigger *trig;
-	struct sbi_dbtr_shmem_entry *entry;
+	union sbi_dbtr_shmem_entry *entry;
 	void *shmem_base = NULL;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 
@@ -541,7 +541,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 			  unsigned long trig_count, unsigned long *out)
 {
 	void *shmem_base = NULL;
-	struct sbi_dbtr_shmem_entry *entry;
+	union sbi_dbtr_shmem_entry *entry;
 	struct sbi_dbtr_data_msg *recv;
 	struct sbi_dbtr_id_msg *xmit;
 	unsigned long ctrl;
@@ -659,7 +659,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	struct sbi_dbtr_data_msg *recv;
 	unsigned long uidx = 0;
 	struct sbi_dbtr_trigger *trig;
-	struct sbi_dbtr_shmem_entry *entry;
+	union sbi_dbtr_shmem_entry *entry;
 	void *shmem_base = NULL;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
