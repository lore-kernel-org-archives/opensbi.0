Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76954C3ABD2
	for <opensbi@archiver.kernel.org>; Mon, 12 May 2025 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swtmwXPLu3Vnybl7texBYHl4ml1VLNqxPaAyLj1J7jw=; b=PMzXvPK2UFI6In
	1upDGL1qOuJMdDwuHpC1g2Cd6+qRXTBN00ahuNOSNLowrrwnvWzvWUmXAjF6x9BSTanqGqBImD9Ix
	De4/cadKR/+e0kA4C0et7pmIMfNHMdhDy2Fopkc/mM3hduztTBkhjdK/nWJ16hG9shZDckyzMLgfL
	OEFUyiLZqRDAgE+5aQXz5mZJc19iwAuPWpAMFdzZJcLBnaVVYOY/CzhgVPLoMzm+L10xJ0x6K7/RB
	+S3SDrXoABaISkuDru2Pgm/LnuFPiiD9r4VUIsrHRACX9WNxM93etgfftCmI8FSdFkYAtS69nMzcU
	4Y4+PxYZbMTTI7ANM2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOj1-00000008msn-3gBk;
	Mon, 12 May 2025 08:41:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOgL-00000008mQq-2juj
	for opensbi@lists.infradead.org;
	Mon, 12 May 2025 08:38:42 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7396f13b750so4524423b3a.1
        for <opensbi@lists.infradead.org>; Mon, 12 May 2025 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747039121; x=1747643921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSrTvQmXV7IyCICmQc7ErgVFYstdTdWzKTd+2cOw7SQ=;
        b=LRrBqcWLk2vGGFnMdygq6Fcj2hgH5bMdkT8SkTw9IcmebmHDJ/md/+lgdGHqmZKuXJ
         9H/Z8/jPpBxkvHB8P0b0lVLn64VVzorlG1lBiGrx/b0t+K8K4a3lHWBtbLiQEFfGvzvq
         Fmvi47CEirSe2mEvPt6XTdbFkXkK7QroIpfsV6Rgu5mACseHY8KFMss1uqvEdpVlWOuf
         APIxna6atKchIhVvs3JUyU9fl3koA4WXrO784Pb2cEdRGyat8TXZa1F0CvWWpKJv+i1a
         tTFYr/gJQmxt2xJ+9Rn3HNKn5v0PIomVODxYjLUaVrMuzVEJEiBGPsURDjeI2AijnWw9
         BfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039121; x=1747643921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSrTvQmXV7IyCICmQc7ErgVFYstdTdWzKTd+2cOw7SQ=;
        b=wiY7WpiSoQzOWwPwa9hAlUfz589u/vOpe0j/Ix6dNRCnuV66huFYSyIXBVSoorKWwb
         +k+kULb17THkS/kVwjaZevZui4j6NuwV9SkYyOkdYm6+9+mbcasvcfChZUoYiahQn0Sy
         hjDM6gb9KfJRFvNZBWKt3WzK6H3936m3TTJSldDbnEpE7lGFYwWwS0RbldjvErayoP3d
         2iPHAdhCNIbM8LN7dHxgbrxniZoJHq8Tl7V48tdkE4OjgECfeJowsTAT1JrA/vKNixQ1
         q3isEfQ9mDurrAgEdumocrn9/0bzRqBpSP3Bd8wvvXoEdJ4OH1mpu/mgSkxUS6EVBiyX
         e9dA==
X-Forwarded-Encrypted: i=1; AJvYcCW+hJzxvs5DTNXQWt43r/ZLK7TZEwlwOr4gtpyqTbEZwCXJhxMHRniudYSlriC0A2yjA9Gduaj2@lists.infradead.org
X-Gm-Message-State: AOJu0YyOvhNa2UdD+31ezSmYvqPlD+G8zp1JY7TlNjcaFhmmbCyJC6pT
	uuKTaZ4D1oQcGZ8pGurptmwUiu2RJPWjrvlHOSLck3EqW2MWkLv6xxvBIySuUns=
X-Gm-Gg: ASbGnctKQC5hafdKpFyO3JyMuY5i87LZc/dLS9fqHTqxwmY1VMeq4tWxo3abX0VvlnH
	e832HMPhn1kQn2r0eqPZAK3Lz2jBErtIr2yCKSHoDbsw0hBexycFgm8lRzaPUqmo5XmhpffVtOZ
	QO6oc686WLnIleQwAcjKPvKeVQC/TlFaDq1pLSei9NhdVmhlZt4jYA2GUpVWoHa83q9XiFLA9wW
	wyC2aXn9CP7jukS4rnGRah5PdZqieZmgaaNNhxj5GbthC7ldYIGX6QpVHSzwYCOzvmCXnhZvCcn
	bR5zwnFG97rncqXPZClXL3GiqiZpcdKViiQ4MPrdBTCN6KjpNLf3/uQKyAUaXATZuK24p+zcQDD
	Y07qWm+INYUrSeg==
X-Google-Smtp-Source: AGHT+IHC9XrJxi2hxOjT1/7eic09QG1/SYt+wH9MZZjQH/+/p8XDJfDpisQ7T/BnlwFsBkaWg1pyfg==
X-Received: by 2002:a05:6a00:4fce:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-7423bc3bbcamr16045446b3a.11.1747039120991;
        Mon, 12 May 2025 01:38:40 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.16.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423773dedfsm5520943b3a.72.2025.05.12.01.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:38:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/4] lib: utils/mailbox: Parse P2A doorbell system MSI index from DT
Date: Mon, 12 May 2025 14:08:25 +0530
Message-ID: <20250512083827.804151-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512083827.804151-1-apatel@ventanamicro.com>
References: <20250512083827.804151-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_013841_694183_A9F42446 
X-CRM114-Status: GOOD (  12.76  )
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

The P2A doorbell system MSI index is expected to be discovered from
device tree instead of RPMI system MSI service group attribute. This
is based on ARC feedback before RPMI spec was frozen.

Let's parse P2A doorbell system MSI index from device tree and also
expose it as rpmi channel attribute to RPMI client drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h   |  1 +
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 8d8fa5e5..058b7e90 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -193,6 +193,7 @@ struct rpmi_message_args {
 enum rpmi_channel_attribute_id {
 	RPMI_CHANNEL_ATTR_PROTOCOL_VERSION = 0,
 	RPMI_CHANNEL_ATTR_MAX_DATA_LEN,
+	RPMI_CHANNEL_ATTR_P2A_DOORBELL_SYSMSI_INDEX,
 	RPMI_CHANNEL_ATTR_TX_TIMEOUT,
 	RPMI_CHANNEL_ATTR_RX_TIMEOUT,
 	RPMI_CHANNEL_ATTR_SERVICEGROUP_ID,
diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
index 2faf51e4..164ae14d 100644
--- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -133,6 +133,7 @@ struct rpmi_shmem_mbox_controller {
 	/* Driver specific members */
 	u32 slot_size;
 	u32 queue_count;
+	u32 p2a_doorbell_sysmsi_index;
 	struct rpmi_mb_regs *mb_regs;
 	struct smq_queue_ctx queue_ctx_tbl[RPMI_QUEUE_IDX_MAX_COUNT];
 	/* Mailbox framework related members */
@@ -505,6 +506,9 @@ static int rpmi_shmem_mbox_get_attribute(struct mbox_chan *chan,
 	case RPMI_CHANNEL_ATTR_MAX_DATA_LEN:
 		*((u32 *)out_value) = RPMI_MSG_DATA_SIZE(mctl->slot_size);
 		break;
+	case RPMI_CHANNEL_ATTR_P2A_DOORBELL_SYSMSI_INDEX:
+		*((u32 *)out_value) = mctl->p2a_doorbell_sysmsi_index;
+		break;
 	case RPMI_CHANNEL_ATTR_TX_TIMEOUT:
 		*((u32 *)out_value) = RPMI_DEF_TX_TIMEOUT;
 		break;
@@ -574,9 +578,9 @@ static int rpmi_shmem_transport_init(struct rpmi_shmem_mbox_controller *mctl,
 				     const void *fdt, int nodeoff)
 {
 	const char *name;
+	const fdt32_t *prop;
 	int count, len, ret, qid;
 	uint64_t reg_addr, reg_size;
-	const fdt32_t *prop_slotsz;
 	struct smq_queue_ctx *qctx;
 
 	ret = fdt_node_check_compatible(fdt, nodeoff,
@@ -585,17 +589,21 @@ static int rpmi_shmem_transport_init(struct rpmi_shmem_mbox_controller *mctl,
 		return ret;
 
 	/* get queue slot size in bytes */
-	prop_slotsz = fdt_getprop(fdt, nodeoff, "riscv,slot-size", &len);
-	if (!prop_slotsz)
+	prop = fdt_getprop(fdt, nodeoff, "riscv,slot-size", &len);
+	if (!prop)
 		return SBI_ENOENT;
 
-	mctl->slot_size = fdt32_to_cpu(*prop_slotsz);
+	mctl->slot_size = fdt32_to_cpu(*prop);
 	if (mctl->slot_size < RPMI_SLOT_SIZE_MIN) {
 		sbi_printf("%s: slot_size < mimnum required message size\n",
 			   __func__);
 		mctl->slot_size = RPMI_SLOT_SIZE_MIN;
 	}
 
+	/* get p2a doorbell system MSI index */
+	prop = fdt_getprop(fdt, nodeoff, "riscv,p2a-doorbell-sysmsi-index", &len);
+	mctl->p2a_doorbell_sysmsi_index = prop ? fdt32_to_cpu(*prop) : -1U;
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
