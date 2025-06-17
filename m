Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AA7C7115C
	for <opensbi@archiver.kernel.org>; Tue, 17 Jun 2025 03:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhFYXDPK0rmW/ELTZjdWg6dvJu9Zha+SJJiHn/ugVlo=; b=VQEIiF+d4ybTM3
	dL3+araEoDSwC/5o+8rJrhqNwkn7dUcUGW912V5XY0v6ZxxNzHUZZIZswUE166ris5NnuHn88ucdm
	j/H68hGm6KX5sgzNTayZZnKnQPvK8nHCT8X+o4Mf5MkK6v6NrgrHNi7AtHvsO9nI3jq1/+hgltkGQ
	hiLnOipRFOI2874S2qPn+ggRxdJHTnxTNY9S8qbp7YAgXyeEp0nSh8MJxqSyZ6yMamVerufNX/dO/
	lpc+TJbYz2Epis9CNGf4RFkqA2CYkCeYweHVzDv8EmVXmi4x1109+akltK8Q7kEhJ4aPLJXah3iuG
	MscNiIdHWGDpCPhYENQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRMuo-000000065nZ-0A70;
	Tue, 17 Jun 2025 03:23:14 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRMul-000000065mX-0RTr
	for opensbi@lists.infradead.org;
	Tue, 17 Jun 2025 03:23:12 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3138e64b3fcso4703009a91.2
        for <opensbi@lists.infradead.org>; Mon, 16 Jun 2025 20:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750130590; x=1750735390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsL1sn/bGJHTVpcIhfxN2rd3GtnksZF86xvJ+kuOH5c=;
        b=XX52uVyk1JiWqS4GrJGOOOweVwDMzxvYBiau2FHvsfGXxGz3ij8oJxwhGKNIora/NG
         y+PwPV8P8x0hEzB0/GQBt6qRKv79o8ul1PBRq2yLJGE0CsfTnUFcu8Lx9bD8c7Kv3JkQ
         CC76izA1InZ0RYEZFna0tzHUbAypToOJhkXZLtooqy9M6UOF/n43pVz22fLA1vdKtcYz
         R08HZdMZHxwt3Kc2gtYSC1Mw6lm6B0X4/2i24FcpvdKgvQjGpqGctEVotfOXQLSCJLep
         NT3w6R4w7jwfA3qPVSAyovMq39fTIKRMDwX1NK36z9trxmZe6YBngJjDqW2hLAVhkWDo
         vORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750130590; x=1750735390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsL1sn/bGJHTVpcIhfxN2rd3GtnksZF86xvJ+kuOH5c=;
        b=WIUO4qumMIwy+wB8o7AmzwFOBgWlcYFfukCx3f4JFcg52+Ws13REgia6pif5BGznas
         drr2H/FrJzrqJ2TdFpmL/CO974dCCAjrIoVrpkdcD4bHv2FT2fLuUOMnBd64y0yBaIfT
         M7ErAZhHe7DwUBq1JkVT/FIMFeTwH7Jqzb2knHAM9Jrp4qKogXADOSb0CtjnHYUMf6VC
         F4BQd0CNLQXJhLZY03sI6DBfzI2x/2Q59MaZ8cFX5J7LoOEk1kqViSfDIeBhcKKSCwi5
         SztJZyQbMauBdyHfvGJ/J2/fDeLMdgScyl0fhfGNgzS/Ivt+gT1AhqOA56UgYrhyZ1Cp
         aUaA==
X-Gm-Message-State: AOJu0YwmgQYguzU0v46DchYmn6QA/OBnR1CwadSLeikr8tPZa5xYHQjX
	CjIeIVk5VIR2beW1blsE6fVwqNE8DVs9taLQ9e8wNMMyAfzw2eGUVeFqVt9zvAqtuQ9NRT/4pNx
	K01HVscaea5ruOwie6hVu1lnxdNExrfquh+KRqf1zfH0IHqP6rKrG7b0G6YVsgcRlLVFTulY9Qk
	UhiUkb4BCPqflASYCCKdlm+eyGB97ZpJh00lxw2dQWNbRn5FTlERuDoHY=
X-Gm-Gg: ASbGncuINZQ+IfcImvHqJhqyGzFZY5KIyoOgZ6206WomdqgQAYBXV/LH3AW9D6WIzu4
	H5+3EaJaR3PSyiVZXcQ+xJziu3ZbIcwcyJr3E9u0OTXoNMFf/jChPHxHclhVrpzHoVLxvqEOeQk
	4mAvtbahSf9U+oza+DOKV7ci2mn8+cSWkiSpdQogZ+jEa5xXDBZYJ2V2H/y+buhtbpBivGStm7L
	wgcyFKQ8vwVB1SSSGLbIvxf1hyrQ7hWHEq/G4DLo7sl5CN+AkUJehtiFNbZPU4CvXjGCjKNmtpV
	6LeSciV9hZ/hqFQt0PBx90AKHcNbVzlb7nAVoZE2jMQGUWeqldbS18krfSFmnKTmtEF8GgrOnfO
	RFKHkb8vaBeV00YiGn1M=
X-Google-Smtp-Source: AGHT+IFXYZHICvurqf+BZNz2MOdyCoRVXjPgSWhXSVgXUvzsnb78n4JyIXr5MX7afw5vTiKTjS53Tg==
X-Received: by 2002:a17:90a:f944:b0:311:e305:4e97 with SMTP id 98e67ed59e1d1-313f1cb1ae5mr15860609a91.19.1750130590113;
        Mon, 16 Jun 2025 20:23:10 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31429aae8eesm244821a91.40.2025.06.16.20.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 20:23:09 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 2/3] lib: sbi_heap: Allocate list nodes dynamically
Date: Mon, 16 Jun 2025 20:21:36 -0700
Message-ID: <20250617032306.1494528-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617032306.1494528-1-samuel.holland@sifive.com>
References: <20250617032306.1494528-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_202311_161507_88172E9E 
X-CRM114-Status: GOOD (  20.31  )
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

Currently the heap has a fixed housekeeping factor of 16, which means
1/16 of the heap is reserved for list nodes. But this is not enough when
there are many small allocations; in the worst case, 1/3 of the heap is
needed for list nodes (32 byte heap_node for each 64 byte allocation).
This has caused allocation failures on some platforms.

Let's avoid trying to guess the best ratio. Instead, allocate more nodes
as needed. To avoid recursion, the nodes are permanent allocations. So
to minimize fragmentation, allocate them in small batches from the end
of the last free space node. Bootstrap the free space list by embedding
one node in the heap control struct.

Some error paths are avoided because the nodes are allocated up front.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/sbi/sbi_heap.c | 83 +++++++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 35 deletions(-)

diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
index 646c2e0b..8cad3aaf 100644
--- a/lib/sbi/sbi_heap.c
+++ b/lib/sbi/sbi_heap.c
@@ -16,7 +16,9 @@
 
 /* Minimum size and alignment of heap allocations */
 #define HEAP_ALLOC_ALIGN		64
-#define HEAP_HOUSEKEEPING_FACTOR	16
+
+/* Number of heap nodes to allocate at once */
+#define HEAP_NODE_BATCH_SIZE		8
 
 struct heap_node {
 	struct sbi_dlist head;
@@ -28,15 +30,45 @@ struct sbi_heap_control {
 	spinlock_t lock;
 	unsigned long base;
 	unsigned long size;
-	unsigned long hkbase;
-	unsigned long hksize;
+	unsigned long resv;
 	struct sbi_dlist free_node_list;
 	struct sbi_dlist free_space_list;
 	struct sbi_dlist used_space_list;
+	struct heap_node init_free_space_node;
 };
 
 struct sbi_heap_control global_hpctrl;
 
+static bool alloc_nodes(struct sbi_heap_control *hpctrl)
+{
+	size_t size = HEAP_NODE_BATCH_SIZE * sizeof(struct heap_node);
+	struct heap_node *n, *new = NULL;
+
+	/* alloc_with_align() requires at most two free nodes */
+	if (hpctrl->free_node_list.next != hpctrl->free_node_list.prev)
+		return true;
+
+	sbi_list_for_each_entry_reverse(n, &hpctrl->free_space_list, head) {
+		if (n->size >= size) {
+			n->size -= size;
+			if (!n->size) {
+				sbi_list_del(&n->head);
+				sbi_list_add_tail(&n->head, &hpctrl->free_node_list);
+			}
+			new = (void *)(n->addr + n->size);
+			break;
+		}
+	}
+	if (!new)
+		return false;
+
+	for (size_t i = 0; i < HEAP_NODE_BATCH_SIZE; i++)
+		sbi_list_add_tail(&new[i].head, &hpctrl->free_node_list);
+	hpctrl->resv += size;
+
+	return true;
+}
+
 static void *alloc_with_align(struct sbi_heap_control *hpctrl,
 			      size_t align, size_t size)
 {
@@ -53,6 +85,10 @@ static void *alloc_with_align(struct sbi_heap_control *hpctrl,
 
 	spin_lock(&hpctrl->lock);
 
+	/* Ensure at least two free nodes are available for use below */
+	if (!alloc_nodes(hpctrl))
+		goto out;
+
 	np = NULL;
 	sbi_list_for_each_entry(n, &hpctrl->free_space_list, head) {
 		lowest_aligned = ROUNDUP(n->addr, align);
@@ -67,16 +103,11 @@ static void *alloc_with_align(struct sbi_heap_control *hpctrl,
 		goto out;
 
 	if (pad) {
-		if (sbi_list_empty(&hpctrl->free_node_list)) {
-			goto out;
-		}
-
 		n = sbi_list_first_entry(&hpctrl->free_node_list,
 					 struct heap_node, head);
 		sbi_list_del(&n->head);
 
-		if ((size + pad < np->size) &&
-		    !sbi_list_empty(&hpctrl->free_node_list)) {
+		if (size + pad < np->size) {
 			rem = sbi_list_first_entry(&hpctrl->free_node_list,
 						   struct heap_node, head);
 			sbi_list_del(&rem->head);
@@ -84,11 +115,6 @@ static void *alloc_with_align(struct sbi_heap_control *hpctrl,
 			rem->size = np->size - (size + pad);
 			sbi_list_add_tail(&rem->head,
 					  &hpctrl->free_space_list);
-		} else if (size + pad != np->size) {
-			/* Can't allocate, return n */
-			sbi_list_add(&n->head, &hpctrl->free_node_list);
-			ret = NULL;
-			goto out;
 		}
 
 		n->addr = lowest_aligned;
@@ -98,8 +124,7 @@ static void *alloc_with_align(struct sbi_heap_control *hpctrl,
 		np->size = pad;
 		ret = (void *)n->addr;
 	} else {
-		if ((size < np->size) &&
-		    !sbi_list_empty(&hpctrl->free_node_list)) {
+		if (size < np->size) {
 			n = sbi_list_first_entry(&hpctrl->free_node_list,
 						 struct heap_node, head);
 			sbi_list_del(&n->head);
@@ -109,7 +134,7 @@ static void *alloc_with_align(struct sbi_heap_control *hpctrl,
 			np->size -= size;
 			sbi_list_add_tail(&n->head, &hpctrl->used_space_list);
 			ret = (void *)n->addr;
-		} else if (size == np->size) {
+		} else {
 			sbi_list_del(&np->head);
 			sbi_list_add_tail(&np->head, &hpctrl->used_space_list);
 			ret = (void *)np->addr;
@@ -216,44 +241,32 @@ unsigned long sbi_heap_free_space_from(struct sbi_heap_control *hpctrl)
 
 unsigned long sbi_heap_used_space_from(struct sbi_heap_control *hpctrl)
 {
-	return hpctrl->size - hpctrl->hksize - sbi_heap_free_space();
+	return hpctrl->size - hpctrl->resv - sbi_heap_free_space();
 }
 
 unsigned long sbi_heap_reserved_space_from(struct sbi_heap_control *hpctrl)
 {
-	return hpctrl->hksize;
+	return hpctrl->resv;
 }
 
 int sbi_heap_init_new(struct sbi_heap_control *hpctrl, unsigned long base,
 		       unsigned long size)
 {
-	unsigned long i;
 	struct heap_node *n;
 
 	/* Initialize heap control */
 	SPIN_LOCK_INIT(hpctrl->lock);
 	hpctrl->base = base;
 	hpctrl->size = size;
-	hpctrl->hkbase = hpctrl->base;
-	hpctrl->hksize = hpctrl->size / HEAP_HOUSEKEEPING_FACTOR;
-	hpctrl->hksize &= ~((unsigned long)HEAP_BASE_ALIGN - 1);
+	hpctrl->resv = 0;
 	SBI_INIT_LIST_HEAD(&hpctrl->free_node_list);
 	SBI_INIT_LIST_HEAD(&hpctrl->free_space_list);
 	SBI_INIT_LIST_HEAD(&hpctrl->used_space_list);
 
-	/* Prepare free node list */
-	for (i = 0; i < (hpctrl->hksize / sizeof(*n)); i++) {
-		n = (struct heap_node *)(hpctrl->hkbase + (sizeof(*n) * i));
-		n->addr = n->size = 0;
-		sbi_list_add_tail(&n->head, &hpctrl->free_node_list);
-	}
-
 	/* Prepare free space list */
-	n = sbi_list_first_entry(&hpctrl->free_node_list,
-				 struct heap_node, head);
-	sbi_list_del(&n->head);
-	n->addr = hpctrl->hkbase + hpctrl->hksize;
-	n->size = hpctrl->size - hpctrl->hksize;
+	n = &hpctrl->init_free_space_node;
+	n->addr = base;
+	n->size = size;
 	sbi_list_add_tail(&n->head, &hpctrl->free_space_list);
 
 	return 0;
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
