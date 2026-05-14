Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512E9CD4F3D
	for <opensbi@archiver.kernel.org>; Thu, 14 May 2026 22:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sroEOPSLlQyrwa8zeuh8INQcKj5bY6zzOXffi3nAANA=; b=Q0reofAFv+3aNV
	F/FppxrT4b2Jo0JdXRQHtWTqdWU/+5QHS5uICIhIhvsaDYNRdRlp4YPOltTrpEqmxCJAuNUYDYwRu
	Nl5zNiI4OBi9hMou8hpzCOaR5klId6PSJ9wsvCJBHkWZJZMHnrP0qLrtJon3Fh1wuSAAr0uwMBtYg
	2YsdSr0msPbX4+FupAO4OWEcAhcrhAhpqZ6j7vC/jARoypOQERlH4c/1wBMUOkuM+A4OYmO+WmLLB
	vEgTTKXmF6xfNzI2bzf4FVPM/imyXunSOCXMMVVmLRH7hX8UJ5EjWEwHdmb/SPHk/gSqlI1/q4Q1Z
	QxHrXeXqcMIW1cAH/yWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0Y-00000006lzX-3jwn;
	Thu, 14 May 2026 22:58:23 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0W-00000006lxH-0o7o
	for opensbi@lists.infradead.org;
	Thu, 14 May 2026 22:58:22 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8b7ec7bedcbso42612726d6.2
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 15:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778799499; x=1779404299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOXCUlFGXYfXdhjerE4T+yrythfjrF/TXjjeikaImPY=;
        b=bV9eZvZEMMecO8rzmHUsjVzcXX3gUVFIxlT9caWfjMvS3gkrcKNCUqN1S43jS+PZye
         /+57FyumQT778jHWQ/lkG2jULnPZOWcty+ZEasYbPjjtJfgMdI3V8z/gBsab6ALcrZ8w
         BN6FZ4aeRSt6gaflnpBSOtgCF3+2y7hEeE+3Qmwsnkinlj1QViV+fKOK4+Pq06iY9I8p
         /UkdowGzgCvwzFF6qnvFoEGr23QrOV1lu51eT0JwauOpyP6EiNRUekhKjrVkbu2nKQ3s
         SQEqLiSK0U9rf0TNcUkHoIsMdghJtCBQGdprSnQXFOu31KG5PSNKOlC0HZOmJSh4vb/+
         SXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799499; x=1779404299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vOXCUlFGXYfXdhjerE4T+yrythfjrF/TXjjeikaImPY=;
        b=JHFFK3RhGg8bUVg4wJPFKQbWjJA8+7LlQjg+/hoEPm6hYXy2YIVtOFSPiMIj6BZeOz
         691f6MCKu2aiPGXnNCLsD7VyQvqzdsoyFwxl+Je5XO7G4XCCWJpGp2MSMw/KzvKn52sC
         Ahd3rguIhX7uc4iFL581oPDMOTIQqmoT95V0oyPDkXK0sYJP0nVMUxWCLPrCabGLEpXl
         QxTlSUZKjBG5ZqyeK68rMa6qMaS+WLqhTN/cnzGGOa7FSUI2mLzAILg4lH1Wg1TzcLIk
         W2XgNIt79Aghtz2RPmFDN64IlPpq/YxYuzPJcRWBVMFRfGMKISbED49dkKQkGG5DbtVr
         6VYw==
X-Gm-Message-State: AOJu0YxeUHN/tT6WYy+REy+Coq0cQPhxSHsHHd6JI+i+gJpM/arSxVhP
	b/gmKUu/F8cmChpNuC1ex60da4mdru4on6+mJKzsyO7SVYqjFKvZvdl7wpg8bQ==
X-Gm-Gg: Acq92OFDYbLFdZ5DIEkA4jOFKBZTp8p+PPKqF80KKn71VBJGtwbMTOZMLrt/Ivpn0lV
	Z+Ng+1JsqL0aQBfZumMgobhRRWR1p3jqYU1m3iRPgZfp/cog37zzckHso2aFgDb0CoeBJ7gHCTa
	XB+YkPUXHK3i5x/ryTPpbF9eC7pHYmsAn4pFKhA2R2IgfpbfWgFFuP8o7DG0BGzg/eJehoT6Sam
	jj563r8xDt8T2kkrr0biVWqkXM7SFx4lmpHMkJ4X4ADSHvQuo45ztCWWe+yCaiWfjGDs2haq8jh
	yx4Uz8IpTED+nYhGyW4PO7wFI9OfKPQk/bvP4kS1hyYW2DNe2b1xhH5NeP9tdSbK7101kM+Zzw7
	8bkXnxMDRbKx1xWzeXx7nlkbBih5MkIZJQdMqYMh5T+s0hrq+7oPBJbTwyoFTWJJrIlMPU6vpT8
	QE9m1PbvXtIbh/HCHpiE5ytilfoi6eMNx0uSIGX4PQ5rzqN6ohz7TvLzlzQJE3oKYUNYHtLs/v2
	jiLeyNkGGc=
X-Received: by 2002:a05:6214:448d:b0:8a0:d08c:a721 with SMTP id 6a1803df08f44-8ca0f61cb59mr32069136d6.22.1778799498319;
        Thu, 14 May 2026 15:58:18 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c16366csm34974426d6.40.2026.05.14.15.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:58:18 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 03/10] lib: sbi: Add Virtual IRQ (VIRQ) subsystem
Date: Thu, 14 May 2026 18:57:49 -0400
Message-Id: <20260514225756.2255758-4-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514225756.2255758-1-raymondmaoca@gmail.com>
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155820_368471_E0380162 
X-CRM114-Status: GOOD (  26.24  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

VIRQ is an abstraction framework providing per-MPXY-channel
HWIRQ<->VIRQ mapping, per-(domain,hart) VIRQ routing and couriering.
It notifies S-mode payload via irqchip SEIP helper when a VIRQ is
mapped/routed/enqueued and provides ecall extension for a S-mode
payload to pop/complete a pending VIRQ.

VIRQ layer is composed of three major parts:
1. VIRQ mapping and allocation
   - Provides a stable per-MPXY-channel mapping between a host
     physical interrupt endpoint (chip_uid, hwirq) and a VIRQ
     number.
   - VIRQ number allocation uses a scalable bitmap.
2. HWIRQ->(Domain,hart) routing rules
   - Routing rules are derived from sysirq nodes by
     interrupts-extended property, for example:
       interrupts-extended =
         <&aplic HWIRQx IRQ_TYPE>, // virq 0
         <&aplic HWIRQy IRQ_TYPE>, // virq 1
         ...;
   - VIRQ numbers are allocated from zero, implicit from the order
     of the entries in the interrupts-extended property.
   - Each entry is cached as a routing rule.
   - Default behavior: if an asserted HWIRQ does not match any
     routing rule, it will be routed to the root domain
     (channel 0) as a fallback.
3. Per-(domain,hart) pending queue couriering
   - Each domain maintains a per-hart ring buffer queue of pending
     VIRQs. A courier handler enqueues VIRQs on HWIRQ assertion.
   - The couriering is domain-aware. It switches to the target domain
     when it is not the same as the current one, and sends request for
     returning to the previous domain after SEIP completion.
   - S-mode notification is edge-triggered based on the irqchip notify
     state, and is cleared only when the queue becomes empty.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_domain.h |    2 +
 include/sbi/sbi_virq.h   |  492 +++++++++++++++++
 lib/sbi/objects.mk       |    1 +
 lib/sbi/sbi_domain.c     |   10 +
 lib/sbi/sbi_virq.c       | 1136 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 1641 insertions(+)
 create mode 100644 include/sbi/sbi_virq.h
 create mode 100644 lib/sbi/sbi_virq.c

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index c507023c..7e288cd8 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -219,6 +219,8 @@ struct sbi_domain {
 	bool fw_region_inited;
 	/** Whether to notify S-mode for VIRQ couriering */
 	bool virq_seip_notify;
+	/** per-domain wired-IRQ courier state */
+	void *virq_priv;
 };
 
 /** The root domain instance */
diff --git a/include/sbi/sbi_virq.h b/include/sbi/sbi_virq.h
new file mode 100644
index 00000000..566ae827
--- /dev/null
+++ b/include/sbi/sbi_virq.h
@@ -0,0 +1,492 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Virtual IRQ (VIRQ) courier/routing layer for OpenSBI.
+ *
+ * This header defines:
+ *   1) VIRQ number allocation and (chip_uid,hwirq) <-> VIRQ mapping
+ *   2) HWIRQ -> Domain routing rules (from DeviceTree "opensbi,mpxy-sysirq")
+ *   3) Per-(domain,hart) pending queue (push in M-mode, pop/complete in S-mode)
+ *
+ * High-level design intent:
+ *   - All physical host IRQs are handled in M-mode by host irqchip drivers.
+ *   - For each incoming HWIRQ, OpenSBI determines the destination domain using
+ *     DT-defined routing rules and enqueues a VIRQ into the per-(domain,hart)
+ *     pending queue.
+ *   - S-mode payload consumes pending VIRQs via pop(), and completes them via
+ *     complete(), which unmasks the corresponding host HWIRQ line.
+ *   - M-mode notifies S-mode via the irqchip notification mechanism.
+ *
+ * Notes:
+ *   - "opensbi,mpxy-sysirq" routing is derived from the sysirq node's
+ *     "interrupts-extended" entries. It does not encode privilege level
+ *     delivery. Hardware delivery (MEI vs SEI) is determined by platform IRQ
+ *     topology and interrupt-parent.
+ *
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#ifndef __SBI_VIRQ_H__
+#define __SBI_VIRQ_H__
+
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_irqchip.h>
+#include <sbi/riscv_locks.h>
+#include <sbi/sbi_types.h>
+
+/*
+ * Current implementation behavior when queue overflows:
+ *   - Drop the incoming VIRQ
+ *   - Return SBI_ENOMEM
+ */
+#define VIRQ_QSIZE  64
+
+/*
+ * Reverse mapping table is chunked to avoid a single large static array.
+ * VIRQ is used as an index into a chunk; chunks are allocated on demand.
+ */
+#define VIRQ_CHUNK_SHIFT   6U
+#define VIRQ_CHUNK_SIZE    (1U << VIRQ_CHUNK_SHIFT)
+#define VIRQ_CHUNK_MASK    (VIRQ_CHUNK_SIZE - 1U)
+
+/* Minimum growth step for forward mapping vector and related metadata. */
+#define VEC_GROW_MIN       16U
+
+/* Returned by pop when no pending VIRQ is available. */
+#define VIRQ_INVALID       0xffffffffU
+
+/*
+ * VIRQ allocator and (chip_uid,hwirq) <-> VIRQ mapping
+ */
+
+/*
+ * VIRQ mapping model:
+ *   - Forward mapping:  (chip_uid,hwirq) -> VIRQ
+ *       Implementation: dynamic vector of entries (linear search).
+ *
+ *   - Reverse mapping:  VIRQ -> (chip_uid,hwirq)
+ *       Implementation: chunked table allocated on demand, O(1) lookup.
+ *
+ *   - VIRQ number allocation:
+ *       Implementation: growable bitmap; capacity expands as needed.
+ *
+ * Memory usage scales with the number of installed mappings.
+ */
+
+/* Entry of reverse mapping table: represents (chip_uid,hwirq) endpoint */
+struct virq_entry {
+	u32 chip_uid;
+	u32 hwirq;
+};
+
+/* Chunked reverse mapping table: VIRQ -> (chip_uid,hwirq) */
+struct virq_chunk {
+	struct virq_entry e[VIRQ_CHUNK_SIZE];
+};
+
+/*
+ * HWIRQ -> Domain routing rules
+ */
+
+/*
+ * A routing rule maps a single HWIRQ to a domain.
+ *
+ * Rules are populated once during cold boot while parsing the DT
+ * opensbi-domains configuration (sysirq node "opensbi,mpxy-sysirq").
+ *
+ * DT encodes mapping via "interrupts-extended"; the index within this array
+ * becomes the VIRQ number for the given MPXY channel.
+ *
+ * Policy notes:
+ *   - Duplicate HWIRQ entries are rejected and return SBI_EALREADY.
+ *   - If no rule matches, routing falls back to the root domain (&root).
+ */
+struct sbi_virq_route_rule {
+	u32 hwirq;
+	struct sbi_domain *dom;   /* owner domain */
+	u32 channel_id;           /* VIRQ space/channel */
+};
+
+/*
+ * Courier context passed as 'opaque' to sbi_virq_courier_handler(), created
+ * per host irqchip.
+ *
+ * The courier handler needs to:
+ *   - map (chip_uid,hwirq) -> VIRQ
+ *   - mask/unmask HWIRQ using the correct irqchip device
+ * Therefore the irqchip device pointer is carried here.
+ */
+struct sbi_virq_courier_ctx {
+	struct sbi_irqchip_device *chip;
+};
+
+/*
+ * Per-(domain,hart) pending VIRQ state and queue management
+ */
+
+/*
+ * Per-(domain,hart) VIRQ state.
+ *
+ * Locking:
+ *   - lock protects head/tail and q[].
+ *
+ * Queue semantics:
+ *   - q[] stores VIRQs pending handling for this (domain,hart).
+ *   - enqueue is performed by M-mode (courier handler) according to route rule
+ *     populated from DT.
+ *   - pop/complete is performed by S-mode payload running in the destination
+ *     domain on the current hart.
+ *   - chip caches the irqchip device for unmasking on complete().
+ */
+struct sbi_domain_virq_state {
+	spinlock_t lock;
+	u32 head;
+	u32 tail;
+
+	/* Pending VIRQ ring buffer. */
+	struct {
+		u32 virq;
+		u32 channel_id;
+		struct sbi_irqchip_device *chip;
+	} q[VIRQ_QSIZE];
+
+	/* Last popped entry for completion. */
+	u32 last_pop_virq;
+	u32 last_pop_channel_id;
+	struct sbi_irqchip_device *last_pop_chip;
+
+	/* Return to previous domain after VIRQ completion. */
+	bool return_to_prev;
+};
+
+/*
+ * Per-domain private VIRQ context.
+ *
+ * Attached to struct sbi_domain and contains per-hart states.
+ */
+struct sbi_domain_virq_priv {
+	/* number of platform harts */
+	u32 nharts;
+
+	/* number of allocated per-hart states */
+	u32 st_count;
+
+	/* per-hart VIRQ state pointer array (indexed by hart index) */
+	struct sbi_domain_virq_state *st_by_hart[];
+};
+
+/* Courier binding used when enqueuing a VIRQ. */
+struct sbi_virq_courier_binding {
+	/* destination domain */
+	struct sbi_domain *dom;
+
+	/* irqchip device that asserted the HWIRQ */
+	struct sbi_irqchip_device *chip;
+
+	/* VIRQ space/channel ID */
+	u32 channel_id;
+
+	/* VIRQ number to enqueue */
+	u32 virq;
+};
+
+/*
+ * Public APIs
+ */
+
+/*
+ * Initialize a per-channel VIRQ map.
+ *
+ * @channel_id:
+ *   VIRQ space/channel ID (0 is the default channel).
+ *
+ * @init_virq_cap:
+ *   Initial capacity in VIRQ bits (e.g., 256). Implementation may grow beyond.
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_ENOMEM on allocation failure
+ */
+int sbi_virq_map_init(u32 channel_id, u32 init_virq_cap);
+
+/*
+ * Create or get a stable mapping for (channel_id, chip_uid, hwirq) -> VIRQ.
+ *
+ * @channel_id:
+ *   Paravirt channel ID; VIRQ numbering is local to each channel.
+ *
+ * @chip_uid:
+ *   Unique 32-bit ID of the host irqchip device.
+ *
+ * @hwirq:
+ *   Host HWIRQ number as produced by the irqchip driver (e.g. APLIC claim ID).
+ *
+ * @allow_identity:
+ *   If true, allocator may attempt VIRQ == hwirq for small ranges.
+ *
+ * @identity_limit:
+ *   Upper bound (exclusive) for identity mapping trial: hwirq < identity_limit.
+ *
+ * @out_virq:
+ *   Output pointer receiving the mapped/allocated VIRQ (0 is valid).
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_ENOMEM on allocation failure
+ *   SBI_ENOSPC if allocator cannot allocate
+ *   SBI_EINVAL on invalid parameters
+ */
+int sbi_virq_map_one(u32 channel_id, u32 chip_uid, u32 hwirq,
+		     bool allow_identity, u32 identity_limit, u32 *out_virq);
+
+/*
+ * Force a mapping for (channel_id, chip_uid, hwirq) -> VIRQ.
+ *
+ * @channel_id:
+ *   Paravirt channel ID; VIRQ numbering is local to each channel.
+ *
+ * @chip_uid:
+ *   Unique 32-bit ID of the host irqchip device.
+ *
+ * @hwirq:
+ *   Host HWIRQ number as produced by the irqchip driver.
+ *
+ * @virq:
+ *   VIRQ number to assign (0 is valid).
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_ENOMEM on allocation failure
+ *   SBI_EINVAL on invalid parameters
+ *   SBI_EALREADY if a different mapping already exists
+ */
+int sbi_virq_map_set(u32 channel_id, u32 chip_uid, u32 hwirq, u32 virq);
+
+/*
+ * Ensure VIRQ map capacity for a given channel.
+ *
+ * @channel_id:
+ *   Paravirt channel ID.
+ *
+ * @min_virq_cap:
+ *   Minimum VIRQ bitmap capacity in bits (will be rounded up).
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_EINVAL if the map is not initialized (channel 0)
+ *   SBI_ENOMEM on allocation failure
+ */
+int sbi_virq_map_ensure_cap(u32 channel_id, u32 min_virq_cap);
+
+/*
+ * Lookup existing mapping: (channel_id, chip_uid, hwirq) -> VIRQ.
+ *
+ * @channel_id:
+ *   Paravirt channel ID; VIRQ numbering is local to each channel.
+ *
+ * @chip_uid:
+ *   Irqchip unique id.
+ *
+ * @hwirq:
+ *   Host hwirq number.
+ *
+ * @out_virq:
+ *   Output VIRQ (0 is valid).
+ *
+ * Return:
+ *   SBI_OK if found
+ *   SBI_ENOENT if not mapped
+ *   SBI_EINVAL on invalid input
+ */
+int sbi_virq_hwirq2virq(u32 channel_id, u32 chip_uid, u32 hwirq,
+			u32 *out_virq);
+
+/*
+ * Reverse lookup: (channel_id, VIRQ) -> (chip_uid, hwirq).
+ *
+ * @channel_id:
+ *   Paravirt channel ID; VIRQ numbering is local to each channel.
+ *
+ * @virq:
+ *   VIRQ number to look up.
+ *
+ * @out_chip_uid:
+ *   Output pointer receiving irqchip unique id.
+ *
+ * @out_hwirq:
+ *   Output pointer receiving host hwirq number.
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_EINVAL if virq is VIRQ_INVALID, out of range, not allocated, or
+ *     reverse entry missing
+ */
+int sbi_virq_virq2hwirq(u32 channel_id, u32 virq,
+			u32 *out_chip_uid, u32 *out_hwirq);
+
+/*
+ * Unmap a single VIRQ mapping and free the VIRQ number.
+ *
+ * @virq:
+ *   VIRQ number to unmap.
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_EINVAL if virq is invalid or state is inconsistent
+ */
+int sbi_virq_unmap_one(u32 virq);
+
+/*
+ * Uninitialize the VIRQ mapping allocator and free all resources.
+ *
+ * Notes:
+ *   - This frees bitmap, forward vector, and reverse chunks.
+ */
+void sbi_virq_map_uninit(void);
+
+/*
+ * Reset all HWIRQ->Domain routing rules (frees the rule array).
+ *
+ * Typical usage:
+ *   - Called once at cold boot during init before parsing DT domains.
+ */
+void sbi_virq_route_reset(void);
+
+/*
+ * Add a routing rule: hwirq -> dom with channel_id.
+ *
+ * @dom:
+ *   Target domain that should receive HWIRQs in this range.
+ *
+ * @hwirq:
+ *   HWIRQ number to route.
+ *
+ * @channel_id:
+ *   Paravirt channel ID for VIRQ mapping (MPXY channel).
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_EINVAL on invalid parameters
+ *   SBI_ENOMEM on allocation failure
+ *   SBI_EALREADY if the HWIRQ already has a rule
+ */
+int sbi_virq_route_add(struct sbi_domain *dom, u32 hwirq, u32 channel_id);
+
+/*
+ * Lookup destination domain for a given HWIRQ.
+ *
+ * @hwirq:
+ *   Incoming host HWIRQ number.
+ *
+ * @out_dom:
+ *   Output pointer receiving destination domain. If no rule matches, &root
+ *   is returned.
+ *
+ * @out_channel_id:
+ *   Output pointer receiving channel id if non-NULL.
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_EINVAL on invalid parameters
+ */
+int sbi_virq_route_lookup(u32 hwirq, struct sbi_domain **out_dom,
+			  u32 *out_channel_id);
+
+/*
+ * Enqueue a VIRQ for the destination domain on the current hart.
+ *
+ * @c:
+ *   Courier binding containing:
+ *     - c->dom  : destination domain
+ *     - c->chip : irqchip device pointer
+ *     - c->virq : VIRQ number
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_EINVAL on invalid parameters
+ *   SBI_ENODEV if per-(domain,hart) state is not available
+ *   SBI_ENOMEM if queue is full
+ */
+int sbi_virq_enqueue(struct sbi_virq_courier_binding *c);
+
+/*
+ * Pop the next pending VIRQ for the current domain on the current hart.
+ *
+ * Return:
+ *   VIRQ_INVALID if none pending or state not available
+ *   otherwise a VIRQ number (zero is legal)
+ */
+u32 sbi_virq_pop_thishart(void);
+
+/*
+ * Complete a previously couriered VIRQ for the current domain/hart.
+ *
+ * @virq:
+ *   VIRQ to complete.
+ */
+void sbi_virq_complete_thishart(u32 virq);
+
+/* Return to previous domain if a VIRQ-driven switch is pending. */
+void sbi_virq_return_to_prev_if_needed(void);
+
+
+/*
+ * Courier handler intended to be registered by host irqchip driver.
+ *
+ * @hwirq:
+ *   Incoming host HWIRQ number asserted on the irqchip.
+ *
+ * @opaque:
+ *   Point to a valid struct sbi_virq_courier_ctx, which provides the
+ *   irqchip device pointer used for mapping and mask/unmask.
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_EINVAL on invalid parameters
+ *   Other SBI_E* propagated from mapping or enqueue
+ */
+int sbi_virq_courier_handler(u32 hwirq, void *opaque);
+
+/*
+ * Initialize per-domain VIRQ state.
+ *
+ * @dom:
+ *   Domain to initialize.
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_EINVAL on invalid parameters
+ *   SBI_ENOMEM on allocation failure
+ */
+int sbi_virq_domain_init(struct sbi_domain *dom);
+
+/*
+ * Free per-domain VIRQ state.
+ *
+ * @dom:
+ *   Free the per-domain VIRQ state.
+ */
+void sbi_virq_domain_exit(struct sbi_domain *dom);
+
+/*
+ * Initialize VIRQ subsystem (mapping allocator + route rules).
+ * Must be called once before parsing sysirq DT nodes.
+ *
+ * @init_virq_cap:
+ *   Initial VIRQ bitmap capacity in bits
+ *
+ * Return:
+ *   SBI_OK on success
+ *   SBI_EALREADY if called more than once
+ *   SBI_ENOMEM on allocation failure
+ *   Other SBI_E* error codes propagated from mapping init
+ */
+int sbi_virq_init(u32 init_virq_cap);
+
+/*
+ * Query whether the VIRQ subsystem is initialized.
+ */
+bool sbi_virq_is_inited(void);
+
+#endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 07d13229..184bf173 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -86,6 +86,7 @@ libsbi-objs-y += sbi_illegal_insn.o
 libsbi-objs-y += sbi_init.o
 libsbi-objs-y += sbi_ipi.o
 libsbi-objs-y += sbi_irqchip.o
+libsbi-objs-y += sbi_virq.o
 libsbi-objs-y += sbi_platform.o
 libsbi-objs-y += sbi_pmu.o
 libsbi-objs-y += sbi_dbtr.o
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 7030848d..2a846eea 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -18,6 +18,7 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
+#include <sbi/sbi_virq.h>
 
 SBI_LIST_HEAD(domain_list);
 
@@ -693,6 +694,15 @@ int sbi_domain_register(struct sbi_domain *dom,
 		return rc;
 	}
 
+	/* Init per-domain wired-IRQ courier state */
+	rc = sbi_virq_domain_init(dom);
+	if (rc) {
+		sbi_printf("%s: virq init failed for %s (error %d)\n",
+				__func__, dom->name, rc);
+		sbi_list_del(&dom->node);
+		return rc;
+	}
+
 	return 0;
 }
 
diff --git a/lib/sbi/sbi_virq.c b/lib/sbi/sbi_virq.c
new file mode 100644
index 00000000..fcd83369
--- /dev/null
+++ b/lib/sbi/sbi_virq.c
@@ -0,0 +1,1136 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * Copyright (c) 2026 RISCstar Solutions.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_irqchip.h>
+#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_virq.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_domain_context.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_locks.h>
+
+struct map_node {
+	u32 chip_uid;
+	u32 hwirq;
+	u32 virq;
+};
+
+struct sbi_virq_map {
+	spinlock_t lock;
+
+	/* allocator bitmap */
+	unsigned long *bmap;
+	u32 bmap_nbits; /* virq range: [0..nbits-1] */
+
+	/* reverse table: virq -> endpoint */
+	struct virq_chunk **chunks;
+	u32 chunks_cap; /* number of chunk pointers */
+
+	/* forward table: vector of mappings, linear search */
+	struct map_node *nodes;
+	u32 nodes_cnt;
+	u32 nodes_cap;
+};
+
+struct sbi_virq_map_list {
+	u32 channel_id;
+	struct sbi_virq_map map;
+};
+
+/*
+ * HWIRQ -> Domain routing rules
+ */
+
+struct sbi_virq_router {
+	spinlock_t lock;
+	struct sbi_virq_route_rule *rules;
+	u32 cnt;
+	u32 cap;
+};
+
+static struct sbi_virq_map g_virq_map; /* channel 0 */
+static struct sbi_virq_map_list *g_virq_maps;
+static u32 g_virq_maps_cnt;
+static u32 g_virq_maps_cap;
+static spinlock_t g_virq_maps_lock;
+static struct sbi_virq_router g_router;
+static bool g_virq_inited;
+
+void sbi_virq_route_reset(void)
+{
+	spin_lock(&g_router.lock);
+	if (g_router.rules) {
+		sbi_free(g_router.rules);
+		g_router.rules = NULL;
+	}
+	g_router.cnt = 0;
+	g_router.cap = 0;
+	spin_unlock(&g_router.lock);
+}
+
+static int router_ensure_cap(u32 need)
+{
+	struct sbi_virq_route_rule *newp;
+	u32 newcap;
+
+	if (g_router.cap >= need)
+		return 0;
+
+	newcap = g_router.cap ? (g_router.cap << 1) : 8;
+	while (newcap < need)
+		newcap <<= 1;
+
+	newp = sbi_zalloc((size_t)newcap * sizeof(*newp));
+	if (!newp)
+		return SBI_ENOMEM;
+
+	if (g_router.rules) {
+		sbi_memcpy(newp, g_router.rules,
+			   (size_t)g_router.cnt * sizeof(*newp));
+		sbi_free(g_router.rules);
+	}
+
+	g_router.rules = newp;
+	g_router.cap = newcap;
+
+	return SBI_OK;
+}
+
+int sbi_virq_route_add(struct sbi_domain *dom, u32 hwirq, u32 channel_id)
+{
+	int rc;
+
+	if (!dom)
+		return SBI_EINVAL;
+
+	spin_lock(&g_router.lock);
+
+	/* Reject duplicates to keep routing unambiguous */
+	for (u32 i = 0; i < g_router.cnt; i++) {
+		if (g_router.rules[i].hwirq == hwirq) {
+			spin_unlock(&g_router.lock);
+			return SBI_EALREADY;
+		}
+	}
+
+	rc = router_ensure_cap(g_router.cnt + 1);
+	if (rc) {
+		spin_unlock(&g_router.lock);
+		return rc;
+	}
+
+	g_router.rules[g_router.cnt].hwirq = hwirq;
+	g_router.rules[g_router.cnt].dom   = dom;
+	g_router.rules[g_router.cnt].channel_id = channel_id;
+	g_router.cnt++;
+
+	spin_unlock(&g_router.lock);
+
+	return SBI_OK;
+}
+
+int sbi_virq_route_lookup(u32 hwirq, struct sbi_domain **out_dom,
+			  u32 *out_channel_id)
+{
+	/* Fast path: no rules */
+	if (!g_router.cnt) {
+		if (out_dom)
+			*out_dom = &root;
+		if (out_channel_id)
+			*out_channel_id = 0;
+		return SBI_OK;
+	}
+
+	spin_lock(&g_router.lock);
+	for (u32 i = 0; i < g_router.cnt; i++) {
+		if (hwirq == g_router.rules[i].hwirq) {
+			struct sbi_domain *d = g_router.rules[i].dom;
+			u32 cid = g_router.rules[i].channel_id;
+
+			spin_unlock(&g_router.lock);
+			if (out_dom)
+				*out_dom = d ? d : &root;
+			if (out_channel_id)
+				*out_channel_id = cid;
+			return SBI_OK;
+		}
+	}
+	spin_unlock(&g_router.lock);
+
+	if (out_dom)
+		*out_dom = &root;
+	if (out_channel_id)
+		*out_channel_id = 0;
+	return SBI_OK;
+}
+
+static inline void virq_state_init(struct sbi_domain_virq_state *st)
+{
+	SPIN_LOCK_INIT(st->lock);
+	st->head = 0;
+	st->tail = 0;
+	st->return_to_prev = false;
+}
+
+static inline
+struct sbi_domain_virq_state *domain_virq_thishart(struct sbi_domain *dom)
+{
+	unsigned long hartidx = sbi_hartid_to_hartindex(current_hartid());
+	struct sbi_domain_virq_priv *p;
+
+	p = (struct sbi_domain_virq_priv *)dom->virq_priv;
+	if (!p || hartidx >= p->nharts)
+		return NULL;
+
+	return p->st_by_hart[hartidx];
+}
+
+static inline bool q_full(struct sbi_domain_virq_state *st)
+{
+	return ((st->tail + 1) % VIRQ_QSIZE) == st->head;
+}
+
+static inline bool q_empty(struct sbi_domain_virq_state *st)
+{
+	return st->head == st->tail;
+}
+
+static inline void virq_set_domain_return_flag(struct sbi_domain *dom,
+					       bool return_to_prev)
+{
+	struct sbi_domain_virq_state *st = domain_virq_thishart(dom);
+
+	if (!st)
+		return;
+
+	spin_lock(&st->lock);
+	st->return_to_prev = return_to_prev;
+	spin_unlock(&st->lock);
+}
+
+static u32 sbi_virq_platform_hart_count(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+
+	return sbi_platform_hart_count(plat);
+}
+
+static int bmap_alloc_one(struct sbi_virq_map *m, u32 *out_virq)
+{
+	u32 v;
+
+	for (v = 0; v < m->bmap_nbits; v++) {
+		if (!bitmap_test(m->bmap, (int)v)) {
+			bitmap_set(m->bmap, (int)v, 1);
+			*out_virq = v;
+			return 0;
+		}
+	}
+
+	return SBI_ENOSPC;
+}
+
+static int bmap_alloc_specific(struct sbi_virq_map *m, u32 virq)
+{
+	if (virq >= m->bmap_nbits)
+		return SBI_EINVAL;
+	if (bitmap_test(m->bmap, (int)virq))
+		return SBI_EALREADY;
+	bitmap_set(m->bmap, (int)virq, 1);
+
+	return 0;
+}
+
+static void bmap_free_one(struct sbi_virq_map *m, u32 virq)
+{
+	if (virq < m->bmap_nbits)
+		bitmap_clear(m->bmap, (int)virq, 1);
+}
+
+static int chunks_ensure_cap(struct sbi_virq_map *m, u32 new_bmap_nbits)
+{
+	u32 new_chunks_cap =
+		(new_bmap_nbits + VIRQ_CHUNK_SIZE - 1U) >> VIRQ_CHUNK_SHIFT;
+	struct virq_chunk **newp;
+
+	if (new_chunks_cap <= m->chunks_cap)
+		return 0;
+
+	newp = sbi_zalloc((size_t)new_chunks_cap * sizeof(*newp));
+	if (!newp)
+		return SBI_ENOMEM;
+
+	if (m->chunks) {
+		sbi_memcpy(newp, m->chunks,
+			   (size_t)m->chunks_cap * sizeof(*newp));
+		sbi_free(m->chunks);
+	}
+
+	m->chunks = newp;
+	m->chunks_cap = new_chunks_cap;
+
+	return 0;
+}
+
+static int bmap_grow(struct sbi_virq_map *m, u32 new_nbits)
+{
+	unsigned long *newmap;
+
+	if (new_nbits <= m->bmap_nbits)
+		return 0;
+
+	newmap = sbi_zalloc(bitmap_estimate_size((int)new_nbits));
+	if (!newmap)
+		return SBI_ENOMEM;
+
+	bitmap_zero(newmap, (int)new_nbits);
+	bitmap_copy(newmap, m->bmap, (int)m->bmap_nbits);
+
+	sbi_free(m->bmap);
+	m->bmap = newmap;
+	m->bmap_nbits = new_nbits;
+
+	return chunks_ensure_cap(m, new_nbits);
+}
+
+static struct virq_entry *rev_get_or_alloc(struct sbi_virq_map *m, u32 virq)
+{
+	u32 ci = virq >> VIRQ_CHUNK_SHIFT;
+	u32 off = virq & VIRQ_CHUNK_MASK;
+
+	if (ci >= m->chunks_cap)
+		return NULL;
+
+	if (!m->chunks[ci]) {
+		m->chunks[ci] = sbi_zalloc(sizeof(struct virq_chunk));
+		if (!m->chunks[ci])
+			return NULL;
+	}
+	return &m->chunks[ci]->e[off];
+}
+
+static struct virq_entry *rev_get_existing(struct sbi_virq_map *m, u32 virq)
+{
+	u32 ci = virq >> VIRQ_CHUNK_SHIFT;
+	u32 off = virq & VIRQ_CHUNK_MASK;
+
+	if (ci >= m->chunks_cap || !m->chunks[ci])
+		return NULL;
+	return &m->chunks[ci]->e[off];
+}
+
+static void rev_clear(struct sbi_virq_map *m, u32 virq)
+{
+	struct virq_entry *e = rev_get_existing(m, virq);
+
+	if (e) {
+		e->chip_uid = 0;
+		e->hwirq = 0;
+	}
+}
+
+static int vec_ensure_cap(struct sbi_virq_map *m, u32 need_cnt)
+{
+	struct map_node *newp;
+	u32 newcap;
+
+	if (m->nodes_cap >= need_cnt)
+		return 0;
+
+	newcap = m->nodes_cap ? (m->nodes_cap << 1) :
+		VEC_GROW_MIN;
+	while (newcap < need_cnt)
+		newcap <<= 1;
+
+	newp = sbi_zalloc((size_t)newcap * sizeof(*newp));
+	if (!newp)
+		return SBI_ENOMEM;
+
+	if (m->nodes) {
+		sbi_memcpy(newp, m->nodes,
+			   (size_t)m->nodes_cnt * sizeof(*newp));
+		sbi_free(m->nodes);
+	}
+
+	m->nodes = newp;
+	m->nodes_cap = newcap;
+
+	return 0;
+}
+
+static int forward_find_idx(struct sbi_virq_map *m,
+			    u32 chip_uid, u32 hwirq, u32 *out_idx)
+{
+	u32 i;
+
+	for (i = 0; i < m->nodes_cnt; i++) {
+		if (m->nodes[i].chip_uid == chip_uid &&
+		    m->nodes[i].hwirq == hwirq) {
+			*out_idx = i;
+			return 0;
+		}
+	}
+
+	return SBI_ENOENT;
+}
+
+static int virq_map_init_one(struct sbi_virq_map *m, u32 init_virq_cap)
+{
+	int rc;
+
+	sbi_memset(m, 0, sizeof(*m));
+	SPIN_LOCK_INIT(m->lock);
+
+	if (init_virq_cap < 8U)
+		init_virq_cap = 8U;
+
+	m->bmap_nbits = init_virq_cap;
+	m->bmap =
+		sbi_zalloc(bitmap_estimate_size((int)m->bmap_nbits));
+	if (!m->bmap)
+		return SBI_ENOMEM;
+
+	bitmap_zero(m->bmap, (int)m->bmap_nbits);
+
+	rc = chunks_ensure_cap(m, m->bmap_nbits);
+	if (rc)
+		return rc;
+
+	return SBI_OK;
+}
+
+static struct sbi_virq_map *virq_map_get(u32 channel_id, bool create,
+					 u32 init_virq_cap)
+{
+	u32 i;
+	struct sbi_virq_map_list *newp;
+
+	if (channel_id == 0)
+		return &g_virq_map;
+
+	spin_lock(&g_virq_maps_lock);
+	for (i = 0; i < g_virq_maps_cnt; i++) {
+		if (g_virq_maps[i].channel_id == channel_id) {
+			spin_unlock(&g_virq_maps_lock);
+			return &g_virq_maps[i].map;
+		}
+	}
+	if (!create) {
+		spin_unlock(&g_virq_maps_lock);
+		return NULL;
+	}
+
+	if (g_virq_maps_cnt == g_virq_maps_cap) {
+		u32 newcap = g_virq_maps_cap ? (g_virq_maps_cap << 1) : 4;
+
+		newp = sbi_zalloc((size_t)newcap * sizeof(*newp));
+		if (!newp) {
+			spin_unlock(&g_virq_maps_lock);
+			return NULL;
+		}
+		if (g_virq_maps) {
+			sbi_memcpy(newp, g_virq_maps,
+				   (size_t)g_virq_maps_cnt * sizeof(*newp));
+			sbi_free(g_virq_maps);
+		}
+		g_virq_maps = newp;
+		g_virq_maps_cap = newcap;
+	}
+
+	g_virq_maps[g_virq_maps_cnt].channel_id = channel_id;
+	if (virq_map_init_one(&g_virq_maps[g_virq_maps_cnt].map,
+			      init_virq_cap)) {
+		spin_unlock(&g_virq_maps_lock);
+		return NULL;
+	}
+	g_virq_maps_cnt++;
+	spin_unlock(&g_virq_maps_lock);
+
+	return &g_virq_maps[g_virq_maps_cnt - 1].map;
+}
+
+int sbi_virq_map_init(u32 channel_id, u32 init_virq_cap)
+{
+	if (channel_id == 0)
+		return virq_map_init_one(&g_virq_map, init_virq_cap);
+	SPIN_LOCK_INIT(g_virq_maps_lock);
+	return virq_map_get(channel_id, true, init_virq_cap) ?
+		SBI_OK : SBI_ENOMEM;
+}
+
+int sbi_virq_map_one(u32 channel_id, u32 chip_uid, u32 hwirq,
+		     bool allow_identity, u32 identity_limit,
+		     u32 *out_virq)
+{
+	u32 idx, virq = 0;
+	int rc;
+	struct sbi_virq_map *m;
+
+	m = virq_map_get(channel_id, true, 0);
+	if (!m)
+		return SBI_ENOMEM;
+
+	spin_lock(&m->lock);
+	/* already mapped? */
+	rc = forward_find_idx(m, chip_uid, hwirq, &idx);
+	if (!rc) {
+		*out_virq = m->nodes[idx].virq;
+		spin_unlock(&m->lock);
+		return 0;
+	}
+
+	/* ensure vector capacity for new node */
+	rc = vec_ensure_cap(m, m->nodes_cnt + 1U);
+	if (rc) {
+		spin_unlock(&m->lock);
+		return rc;
+	}
+
+	/* optional identity */
+	if (allow_identity && hwirq < identity_limit) {
+		/* ensure bitmap covers this virq */
+		if (hwirq >= m->bmap_nbits) {
+			u32 new_nbits = m->bmap_nbits;
+
+			while (new_nbits <= hwirq)
+				new_nbits <<= 1;
+			rc = bmap_grow(m, new_nbits);
+			if (rc) {
+				spin_unlock(&m->lock);
+				return rc;
+			}
+		}
+
+		rc = bmap_alloc_specific(m, hwirq);
+		if (!rc)
+			virq = hwirq;
+		else if (rc != SBI_EALREADY) {
+			spin_unlock(&m->lock);
+			return rc;
+		}
+	}
+
+	/* allocate new virq if identity not taken */
+	if (!virq) {
+		rc = bmap_alloc_one(m, &virq);
+		if (rc == SBI_ENOSPC) {
+			rc = bmap_grow(m, m->bmap_nbits << 1);
+			if (rc) {
+				spin_unlock(&m->lock);
+				return rc;
+			}
+			rc = bmap_alloc_one(m, &virq);
+		}
+		if (rc) {
+			spin_unlock(&m->lock);
+			return rc;
+		}
+	}
+
+	/* install reverse mapping */
+	{
+		struct virq_entry *e = rev_get_or_alloc(m, virq);
+
+		if (!e) {
+			bmap_free_one(m, virq);
+			spin_unlock(&m->lock);
+			return SBI_ENOMEM;
+		}
+		e->chip_uid = chip_uid;
+		e->hwirq = hwirq;
+	}
+
+	/* append forward node */
+	m->nodes[m->nodes_cnt].chip_uid = chip_uid;
+	m->nodes[m->nodes_cnt].hwirq = hwirq;
+	m->nodes[m->nodes_cnt].virq = virq;
+	m->nodes_cnt++;
+
+	*out_virq = virq;
+	spin_unlock(&m->lock);
+
+	return SBI_OK;
+}
+
+int sbi_virq_map_set(u32 channel_id, u32 chip_uid, u32 hwirq, u32 virq)
+{
+	struct sbi_virq_map *m;
+	u32 idx;
+	int rc;
+
+	m = virq_map_get(channel_id, true, virq + 1U);
+	if (!m)
+		return SBI_ENOMEM;
+
+	spin_lock(&m->lock);
+	rc = forward_find_idx(m, chip_uid, hwirq, &idx);
+	if (!rc) {
+		spin_unlock(&m->lock);
+		return (m->nodes[idx].virq == virq) ? SBI_OK : SBI_EALREADY;
+	}
+
+	if (virq >= m->bmap_nbits) {
+		u32 new_nbits = m->bmap_nbits;
+
+		while (new_nbits <= virq)
+			new_nbits <<= 1;
+		rc = bmap_grow(m, new_nbits);
+		if (rc) {
+			spin_unlock(&m->lock);
+			return rc;
+		}
+	}
+
+	rc = bmap_alloc_specific(m, virq);
+	if (rc == SBI_EALREADY) {
+		struct virq_entry *e = rev_get_existing(m, virq);
+
+		if (!e || e->chip_uid != chip_uid || e->hwirq != hwirq) {
+			spin_unlock(&m->lock);
+			return SBI_EALREADY;
+		}
+
+		spin_unlock(&m->lock);
+		return SBI_OK;
+	} else if (rc) {
+		spin_unlock(&m->lock);
+		return rc;
+	}
+
+	rc = vec_ensure_cap(m, m->nodes_cnt + 1U);
+	if (rc) {
+		spin_unlock(&m->lock);
+		return rc;
+	}
+
+	{
+		struct virq_entry *e = rev_get_or_alloc(m, virq);
+
+		if (!e) {
+			bmap_free_one(m, virq);
+			spin_unlock(&m->lock);
+			return SBI_ENOMEM;
+		}
+		e->chip_uid = chip_uid;
+		e->hwirq = hwirq;
+	}
+
+	m->nodes[m->nodes_cnt].chip_uid = chip_uid;
+	m->nodes[m->nodes_cnt].hwirq = hwirq;
+	m->nodes[m->nodes_cnt].virq = virq;
+	m->nodes_cnt++;
+	spin_unlock(&m->lock);
+
+	return SBI_OK;
+}
+
+int sbi_virq_map_ensure_cap(u32 channel_id, u32 min_virq_cap)
+{
+	struct sbi_virq_map *m;
+	u32 new_nbits;
+	int rc = SBI_OK;
+
+	if (min_virq_cap < 8U)
+		min_virq_cap = 8U;
+
+	if (channel_id == 0) {
+		m = &g_virq_map;
+		if (!m->bmap)
+			return SBI_EINVAL;
+	} else {
+		m = virq_map_get(channel_id, true, min_virq_cap);
+		if (!m)
+			return SBI_ENOMEM;
+	}
+
+	if (m->bmap_nbits >= min_virq_cap)
+		return SBI_OK;
+
+	spin_lock(&m->lock);
+	new_nbits = m->bmap_nbits ? m->bmap_nbits : 8U;
+	while (new_nbits < min_virq_cap)
+		new_nbits <<= 1;
+	rc = bmap_grow(m, new_nbits);
+	spin_unlock(&m->lock);
+
+	return rc;
+}
+
+int sbi_virq_hwirq2virq(u32 channel_id, u32 chip_uid, u32 hwirq,
+			u32 *out_virq)
+{
+	u32 idx;
+	int rc;
+	struct sbi_virq_map *m;
+
+	m = virq_map_get(channel_id, false, 0);
+	if (!m)
+		return SBI_ENOENT;
+
+	spin_lock(&m->lock);
+	rc = forward_find_idx(m, chip_uid, hwirq, &idx);
+	if (!rc)
+		*out_virq = m->nodes[idx].virq;
+	spin_unlock(&m->lock);
+
+	return rc;
+}
+
+int sbi_virq_virq2hwirq(u32 channel_id, u32 virq,
+			u32 *out_chip_uid, u32 *out_hwirq)
+{
+	struct virq_entry *e;
+	struct sbi_virq_map *m;
+
+	m = virq_map_get(channel_id, false, 0);
+	if (!m)
+		return SBI_EINVAL;
+
+	spin_lock(&m->lock);
+
+	if (virq >= m->bmap_nbits ||
+	    !bitmap_test(m->bmap, (int)virq)) {
+		spin_unlock(&m->lock);
+		return SBI_EINVAL;
+	}
+
+	e = rev_get_existing(m, virq);
+	if (!e) {
+		spin_unlock(&m->lock);
+		return SBI_EINVAL;
+	}
+
+	*out_chip_uid = e->chip_uid;
+	*out_hwirq = e->hwirq;
+
+	spin_unlock(&m->lock);
+
+	return SBI_OK;
+}
+
+int sbi_virq_unmap_one(u32 virq)
+{
+	struct virq_entry *e;
+	u32 idx, last;
+	int rc;
+	struct sbi_virq_map *m = &g_virq_map;
+
+	spin_lock(&m->lock);
+
+	if (virq >= m->bmap_nbits ||
+	    !bitmap_test(m->bmap, (int)virq)) {
+		spin_unlock(&m->lock);
+		return SBI_EINVAL;
+	}
+
+	e = rev_get_existing(m, virq);
+	if (!e) {
+		spin_unlock(&m->lock);
+		return SBI_EINVAL;
+	}
+
+	/* find forward node corresponding to this virq (linear) */
+	rc = SBI_ENOENT;
+	for (idx = 0; idx < m->nodes_cnt; idx++) {
+		if (m->nodes[idx].virq == virq) {
+			/* optionally also check endpoint matches e */
+			rc = 0;
+			break;
+		}
+	}
+	if (rc) {
+		/* inconsistent state */
+		spin_unlock(&m->lock);
+		return SBI_EINVAL;
+	}
+
+	/* remove node: swap with last */
+	last = m->nodes_cnt - 1U;
+	if (idx != last)
+		m->nodes[idx] = m->nodes[last];
+	m->nodes_cnt--;
+
+	/* clear reverse + free virq id */
+	rev_clear(m, virq);
+	bmap_free_one(m, virq);
+
+	spin_unlock(&m->lock);
+
+	return SBI_OK;
+}
+
+static void virq_map_uninit_one(struct sbi_virq_map *m)
+{
+	u32 i;
+
+	spin_lock(&m->lock);
+
+	/* free reverse chunks */
+	if (m->chunks) {
+		for (i = 0; i < m->chunks_cap; i++) {
+			if (m->chunks[i])
+				sbi_free(m->chunks[i]);
+		}
+		sbi_free(m->chunks);
+		m->chunks = NULL;
+		m->chunks_cap = 0;
+	}
+
+	/* free forward vector */
+	if (m->nodes) {
+		sbi_free(m->nodes);
+		m->nodes = NULL;
+		m->nodes_cnt = 0;
+		m->nodes_cap = 0;
+	}
+
+	/* free bitmap */
+	if (m->bmap) {
+		sbi_free(m->bmap);
+		m->bmap = NULL;
+		m->bmap_nbits = 0;
+	}
+
+	spin_unlock(&m->lock);
+}
+
+void sbi_virq_map_uninit(void)
+{
+	u32 i;
+
+	virq_map_uninit_one(&g_virq_map);
+
+	spin_lock(&g_virq_maps_lock);
+	for (i = 0; i < g_virq_maps_cnt; i++)
+		virq_map_uninit_one(&g_virq_maps[i].map);
+	if (g_virq_maps) {
+		sbi_free(g_virq_maps);
+		g_virq_maps = NULL;
+		g_virq_maps_cnt = 0;
+		g_virq_maps_cap = 0;
+	}
+	spin_unlock(&g_virq_maps_lock);
+}
+
+int sbi_virq_enqueue(struct sbi_virq_courier_binding *c)
+{
+	struct sbi_domain_virq_state *st;
+
+	if (!c->dom || c->virq == VIRQ_INVALID)
+		return SBI_EINVAL;
+
+	st = domain_virq_thishart(c->dom);
+	if (!st)
+		return SBI_ENODEV;
+
+	spin_lock(&st->lock);
+	if (q_full(st)) {
+		spin_unlock(&st->lock);
+		return SBI_ENOSPC;
+	}
+
+	st->q[st->tail].virq = c->virq;
+	st->q[st->tail].channel_id = c->channel_id;
+	st->q[st->tail].chip = c->chip;
+	st->tail = (st->tail + 1) % VIRQ_QSIZE;
+	spin_unlock(&st->lock);
+
+	return SBI_OK;
+}
+
+u32 sbi_virq_pop_thishart(void)
+{
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	struct sbi_domain_virq_state *st;
+	u32 virq = VIRQ_INVALID;
+
+	if (!dom)
+		return VIRQ_INVALID;
+
+	st = domain_virq_thishart(dom);
+	if (!st)
+		return VIRQ_INVALID;
+
+	spin_lock(&st->lock);
+	if (!q_empty(st)) {
+		virq = st->q[st->head].virq;
+		st->last_pop_virq = virq;
+		st->last_pop_channel_id = st->q[st->head].channel_id;
+		st->last_pop_chip = st->q[st->head].chip;
+		st->head = (st->head + 1) % VIRQ_QSIZE;
+	} else
+		virq = VIRQ_INVALID;
+	spin_unlock(&st->lock);
+
+	if (virq == VIRQ_INVALID) {
+		if (sbi_irqchip_notify_smode_get())
+			sbi_irqchip_notify_smode_clear();
+	}
+
+	return virq;
+}
+
+void sbi_virq_complete_thishart(u32 virq)
+{
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	struct sbi_domain_virq_state *st;
+	u32 hwirq;
+	u32 chip_uid;
+	u32 channel_id;
+	struct sbi_irqchip_device *chip;
+	bool drained = false;
+
+	if (virq == VIRQ_INVALID)
+		return;
+
+	if (!dom)
+		return;
+
+	st = domain_virq_thishart(dom);
+	if (!st)
+		return;
+
+	spin_lock(&st->lock);
+	channel_id = st->last_pop_channel_id;
+	chip = st->last_pop_chip;
+	if (st->last_pop_virq == virq) {
+		st->last_pop_virq = 0;
+		st->last_pop_channel_id = 0;
+		st->last_pop_chip = NULL;
+	}
+	drained = q_empty(st);
+	spin_unlock(&st->lock);
+
+	if (!chip)
+		return;
+
+	sbi_virq_virq2hwirq(channel_id, virq, &chip_uid, &hwirq);
+	(void)chip_uid;
+	if (chip->hwirq_eoi)
+		chip->hwirq_eoi(chip, hwirq);
+	sbi_irqchip_unmask_hwirq(chip, hwirq);
+
+	if (drained) {
+		if (sbi_irqchip_notify_smode_get())
+			sbi_irqchip_notify_smode_clear();
+		sbi_virq_return_to_prev_if_needed();
+	}
+}
+
+void sbi_virq_return_to_prev_if_needed(void)
+{
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	struct sbi_domain_virq_state *st;
+	bool do_return = false;
+
+	if (!dom)
+		return;
+
+	st = domain_virq_thishart(dom);
+	if (!st)
+		return;
+
+	spin_lock(&st->lock);
+	if (st->return_to_prev && q_empty(st)) {
+		st->return_to_prev = false;
+		do_return = true;
+	}
+	spin_unlock(&st->lock);
+
+	if (!do_return)
+		return;
+	sbi_domain_context_request_return_to_prev();
+}
+
+int sbi_virq_courier_handler(u32 hwirq, void *opaque)
+{
+	struct sbi_virq_courier_ctx *ctx =
+		(struct sbi_virq_courier_ctx *)opaque;
+	struct sbi_domain *dom;
+	struct sbi_virq_courier_binding courier;
+	u32 channel_id = 0;
+	u32 virq = 0;
+	int rc;
+	struct sbi_domain *curr_dom;
+
+	if (!ctx || !ctx->chip)
+		return SBI_EINVAL;
+
+	/* Route purely by HWIRQ -> Domain/channel rules (from FDT). */
+	rc = sbi_virq_route_lookup(hwirq, &dom, &channel_id);
+	if (rc || !dom)
+		return SBI_EINVAL;
+
+	curr_dom = sbi_domain_thishart_ptr();
+
+	/* Allocate/Get a stable VIRQ for (chip_uid, hwirq). */
+	rc = sbi_virq_map_one(channel_id, ctx->chip->id, hwirq,
+			      false, 0, &virq);
+	if (rc)
+		return rc;
+
+	/*
+	 * Mask to avoid level-trigger storm before S-mode clears device source.
+	 * S-mode will call sbi_virq_complete_thishart(virq) to unmask.
+	 */
+	sbi_irqchip_mask_hwirq(ctx->chip, hwirq);
+
+	courier.dom  = dom;
+	courier.chip = ctx->chip;
+	courier.channel_id = channel_id;
+	courier.virq = virq;
+
+	rc = sbi_virq_enqueue(&courier);
+	if (rc) {
+		/* enqueue failed; re-enable to avoid deadlock */
+		sbi_irqchip_unmask_hwirq(ctx->chip, hwirq);
+		return rc;
+	}
+
+	/*
+	 * Notify S-mode on notification rising edge.
+	 *
+	 * If the target is the current domain, operate on the live CSR.
+	 * Otherwise, set the pending bit in the target domain context
+	 * before switching (covers first-entry). After switching, set the
+	 * live CSR only if needed (covers already-initialized targets).
+	 */
+	if (dom != curr_dom) {
+		(void)sbi_domain_context_pending_notify_smode(
+			dom, current_hartindex());
+
+		/* Mark return_to_prev for VIRQ-driven domain switch. */
+		virq_set_domain_return_flag(dom, true);
+		rc = sbi_domain_context_enter(dom);
+		if (rc) {
+			/* Switch failed; do not defer EOI */
+			sbi_irqchip_unmask_hwirq(ctx->chip, hwirq);
+			if (ctx->chip->hwirq_eoi)
+				ctx->chip->hwirq_eoi(ctx->chip, hwirq);
+			return SBI_OK;
+		}
+
+		/*
+		 * If the domain was already initialized,
+		 * sbi_domain_context_enter() returns and CSR_SIP reflect
+		 * dom_ctx->sip. For robustness, set the live notify bit if it
+		 * is still clear.
+		 */
+		if (!sbi_irqchip_notify_smode_get()) {
+			rc = sbi_irqchip_notify_smode_set();
+			if (rc) {
+				/*
+				 * notification failed; re-enable to avoid
+				 * deadlock
+				 */
+				sbi_irqchip_unmask_hwirq(ctx->chip, hwirq);
+				return rc;
+			}
+		}
+	} else if (!sbi_irqchip_notify_smode_get()) {
+		rc = sbi_irqchip_notify_smode_set();
+		if (rc) {
+			/* notification failed; re-enable to avoid deadlock */
+			sbi_irqchip_unmask_hwirq(ctx->chip, hwirq);
+			return rc;
+		}
+	}
+
+	/*
+	 * Return SBI_EALREADY to defer EOI until VIRQ COMPLETE so S-mode
+	 * notification can be delivered to the target domain.
+	 */
+	return SBI_EALREADY;
+}
+
+int sbi_virq_domain_init(struct sbi_domain *dom)
+{
+	struct sbi_domain_virq_priv *p;
+	u32 i, k, nharts, st_count;
+	struct sbi_domain_virq_state *st_base;
+	size_t alloc_size;
+
+	if (!dom)
+		return SBI_EINVAL;
+
+	if (dom->virq_priv)
+		return SBI_OK;
+
+	nharts = sbi_virq_platform_hart_count();
+	st_count = dom->possible_harts ?
+		   (u32)sbi_hartmask_weight(dom->possible_harts) : nharts;
+
+	alloc_size = sizeof(*p) +
+		     nharts * sizeof(p->st_by_hart[0]) +
+		     st_count * sizeof(struct sbi_domain_virq_state);
+	p = sbi_zalloc(alloc_size);
+	if (!p)
+		return SBI_ENOMEM;
+
+	p->nharts = nharts;
+	p->st_count = st_count;
+	st_base = (struct sbi_domain_virq_state *)(p->st_by_hart + nharts);
+
+	if (!dom->possible_harts) {
+		for (i = 0; i < nharts; i++) {
+			p->st_by_hart[i] = &st_base[i];
+			virq_state_init(p->st_by_hart[i]);
+		}
+	} else {
+		for (i = 0; i < nharts; i++)
+			p->st_by_hart[i] = NULL;
+		k = 0;
+		sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
+			if (k >= st_count)
+				break;
+			p->st_by_hart[i] = &st_base[k++];
+			virq_state_init(p->st_by_hart[i]);
+		}
+	}
+	dom->virq_priv = p;
+
+	return SBI_OK;
+}
+
+void sbi_virq_domain_exit(struct sbi_domain *dom)
+{
+	if (!dom || !dom->virq_priv)
+		return;
+
+	sbi_free(dom->virq_priv);
+	dom->virq_priv = NULL;
+}
+
+int sbi_virq_init(u32 init_virq_cap)
+{
+	int rc = SBI_OK;
+
+	if (g_virq_inited)
+		return SBI_EALREADY;
+
+	rc = sbi_virq_map_init(0, init_virq_cap);
+	if (rc)
+		return rc;
+
+	SPIN_LOCK_INIT(g_virq_maps_lock);
+	SPIN_LOCK_INIT(g_router.lock);
+	sbi_virq_route_reset();
+	g_virq_inited = true;
+	return rc;
+}
+
+bool sbi_virq_is_inited(void)
+{
+	return g_virq_inited;
+}
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
