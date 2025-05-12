Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA4EC3ABD4
	for <opensbi@archiver.kernel.org>; Mon, 12 May 2025 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bVue9v0UP5WQE3K9rKBN9Ivvcu6HV6NYKCNKrP/9Dk=; b=jEsAp1CMI6rVDT
	UPiRrY1DZf7g7rWV2socFMtw26HqAFtMG5xf5EGmiIBSTxfEryECaAMn8rPdEpqIexzrUIj63Jkwo
	KjsVaTrgp/VVLNNhOD35xc7+QWqLALslpwIL5jUftW62j4uWuRls8+Q3L2kK9tSUNJZfu9SlpHC3E
	uO13fG71dvEgseb5tg6CBZCmHq6qbH2vT0rf/BAK7PlGHrsYrQbN//gkIaCRmEFerjQstPc17BJRn
	qmW1zy/w4oCuTnfBCxaEcgOQKxNqA1LJVzXI29+jU5enKke2JTsxRviKyqKjO9xJegE6QYFLppjey
	da2wPFG0J57xDFR1j0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOj2-00000008mtJ-22ch;
	Mon, 12 May 2025 08:41:28 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOgP-00000008mRS-0Oxj
	for opensbi@lists.infradead.org;
	Mon, 12 May 2025 08:38:46 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7398d65476eso3381945b3a.1
        for <opensbi@lists.infradead.org>; Mon, 12 May 2025 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747039124; x=1747643924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsfUByPrqs7RmQ0JaDSq21l6p9cG8NDy3X/NGpn8qUo=;
        b=LkBO60mc9cE+6ZKupPQENSXLX9P2DUbYarhXBEP0YV4VIWmUcJeNwHb/TnqaCruQf+
         2BCIZOAKnn9lUIbEJ6Gu68LNix28B1YSk59ZJh/o9Uuf1EW1TkkBDchHJm2/4NZw0LgS
         rinGMCsF+Mkq+TdxNytYb0QiRKj1GEHlpjvV0hjg0astcFm+XjNwohGAJBF+J5gGUsEt
         AudX9E13/h+sFSymUwZVh3Ag0i0ocEnFMG1wp0P869Cjs9HDIRAmjz6oTBKAOEEUxm5D
         uYWoYmWbT/+eXicULevT38WhpdSCKn19Y/icx8b+aCArxmK5CdAE/WT7d0XRTPdj38tO
         /1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039124; x=1747643924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsfUByPrqs7RmQ0JaDSq21l6p9cG8NDy3X/NGpn8qUo=;
        b=WlSlnsPB86a3jnvHxFfg5IOgP5qmiS1SSQDwSMGTLivrcmTHm6/8J0lsHg4fv2dQHY
         k9XB/9muklgPvD6ELd2Mo9Ojqf+a/VxZ8HNn+F2sjK5X/xcohcESNyMAXkPPgENW9hPe
         RBugsL13Ij/wIoYbbiCcBzhTj9O6fo8USJVUWrQ5lWPiHYd7y/1WOv5TbJ0zXBJPlMa1
         P3u7iP0+lruukvIMIJkOvjesDoSI9EGHfXqj8PusZocquynzU5w8oUVYJfGN6PepcV47
         WgJWOU9qDYNmV+jBsch76aPJpTZnz/HURVsVbOqFD5y+Q+yOxOBiiAE/gEauia7dip7P
         0zfg==
X-Forwarded-Encrypted: i=1; AJvYcCXnqfKXRLS1fAgF7lNq4SN7UEbcvLRrde5EQ2bQMuI2NyqvPm3Rc+nLVfRuYXSUkncoXdR04nJp@lists.infradead.org
X-Gm-Message-State: AOJu0YxsEjs+XtpyAofQIkQHEabfW18st+0alr0c/9lFJTrsLPiA62UQ
	WOZDUbjsjoLCdeaV0ScbPGkJmrofenDWwMCX8MS3lPCND8I/rKTvAsu+Z47ct8o=
X-Gm-Gg: ASbGnctT9+n7VJgzl9N8WdV6RbxT5iW8nRFP2Jq5uPPAo/5XijJI34hfIGU+lkrthLb
	Xket2E9OwkAvXMyBuTQMwYtJxKM/NLtSWIpX/Uu6THmWTpiVOCII97J6O+klcmW5IEtKPU7W8vC
	H8bz5h2lp2gJM3Mtu2hwpaleKaeb0cJVbl/ewl6fqB97P6tglM9+4wtRnsv1lj3/bkG3J4caEUZ
	5bm8VIwgZEnxS40fqNPolxbrZCeM2NjWat6oIlff0YuYAH068cuIvgruSdvgpnDVq4PotGznq3a
	qvCyKsKdBxM49lAURHzE8vn9UG21zz/aLKVreJ5pwmwfMso1WQrbVPTtzDgSzhcYoPy5RP/KaEa
	KuWsvDixMpPeTHg==
X-Google-Smtp-Source: AGHT+IFUOjSLrUqVv6/l6qxIeYnzHTm2V93YPm3cg+LnTtxveyTzNu9FQ5HpzBuf1mLrxFuZskb/yA==
X-Received: by 2002:a05:6a00:35cc:b0:736:b3cb:5db with SMTP id d2e1a72fcca58-740a94f8e34mr26105197b3a.11.1747039124065;
        Mon, 12 May 2025 01:38:44 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.16.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423773dedfsm5520943b3a.72.2025.05.12.01.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:38:43 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/4] lib: utils/mailbox: Parse A2P doorbell value from DT
Date: Mon, 12 May 2025 14:08:26 +0530
Message-ID: <20250512083827.804151-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512083827.804151-1-apatel@ventanamicro.com>
References: <20250512083827.804151-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_013845_131020_E7DF8FF7 
X-CRM114-Status: GOOD (  11.62  )
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

The A2P doorbell value written to the 32-bit A2P doorbell value
must be discoverd from device tree instead of always using the
default value 1.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
index 164ae14d..aad68b5a 100644
--- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -134,6 +134,7 @@ struct rpmi_shmem_mbox_controller {
 	u32 slot_size;
 	u32 queue_count;
 	u32 p2a_doorbell_sysmsi_index;
+	u32 a2p_doorbell_value;
 	struct rpmi_mb_regs *mb_regs;
 	struct smq_queue_ctx queue_ctx_tbl[RPMI_QUEUE_IDX_MAX_COUNT];
 	/* Mailbox framework related members */
@@ -248,7 +249,8 @@ static int __smq_rx(struct smq_queue_ctx *qctx, u32 slot_size,
 }
 
 static int __smq_tx(struct smq_queue_ctx *qctx, struct rpmi_mb_regs *mb_regs,
-		    u32 slot_size, u32 service_group_id, struct mbox_xfer *xfer)
+		    u32 a2p_doorbell_value, u32 slot_size, u32 service_group_id,
+		    struct mbox_xfer *xfer)
 {
 	u32 i, tailidx;
 	void *dst, *src;
@@ -300,7 +302,7 @@ static int __smq_tx(struct smq_queue_ctx *qctx, struct rpmi_mb_regs *mb_regs,
 
 	/* Ring the RPMI doorbell if present */
 	if (mb_regs)
-		writel(cpu_to_le32(1), &mb_regs->db_reg);
+		writel(a2p_doorbell_value, &mb_regs->db_reg);
 
 	return SBI_OK;
 }
@@ -364,8 +366,8 @@ static int smq_tx(struct rpmi_shmem_mbox_controller *mctl,
 	 */
 	do {
 		spin_lock(&qctx->queue_lock);
-		ret = __smq_tx(qctx, mctl->mb_regs, mctl->slot_size,
-				service_group_id, xfer);
+		ret = __smq_tx(qctx, mctl->mb_regs, mctl->a2p_doorbell_value,
+				mctl->slot_size, service_group_id, xfer);
 		spin_unlock(&qctx->queue_lock);
 		if (!ret)
 			return 0;
@@ -604,6 +606,10 @@ static int rpmi_shmem_transport_init(struct rpmi_shmem_mbox_controller *mctl,
 	prop = fdt_getprop(fdt, nodeoff, "riscv,p2a-doorbell-sysmsi-index", &len);
 	mctl->p2a_doorbell_sysmsi_index = prop ? fdt32_to_cpu(*prop) : -1U;
 
+	/* get a2p doorbell value */
+	prop = fdt_getprop(fdt, nodeoff, "riscv,a2p-doorbell-value", &len);
+	mctl->a2p_doorbell_value = prop ? fdt32_to_cpu(*prop) : 1;
+
 	/*
 	 * queue names count is taken as the number of queues
 	 * supported which make it mandatory to provide the
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
