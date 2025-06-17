Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC46C7115D
	for <opensbi@archiver.kernel.org>; Tue, 17 Jun 2025 03:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKj89aD3ExKTCtUwevW/hznvYEgbYmwdEldSzF4q6pE=; b=cct12cDZNtsqFC
	o62+PT+XWjXilRwKwrJ1abe2NM3vP1NyVhCo0jq7AOiaXb5Dwz1b1sP4s3V43fRn0ynfzxP+Xc+Y9
	ySMc6LHQRwlZohLtKPPE3VhNLN0ESCGyTZXfSdVQzRp7JdQzeCls06eHFH+CVi21IY23wPjUoRoVn
	pmXBQiMRgDPPJRevEmrrJF6we2uKfkugj2g086Pb4x1NPrIpavdsHYVgpNIu4ExQSpdlSrsXrD8qE
	lAuwNC40CJxj2yqQmaxya2vPH1N5ddQZBJ20i2PYOufGuJTARa7hkUA3W+K0VASK8PeqAyPNdsbXV
	mbsvLsrVwGvMyMcXe1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRMup-000000065nj-2UqT;
	Tue, 17 Jun 2025 03:23:15 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRMum-000000065mt-0Jn1
	for opensbi@lists.infradead.org;
	Tue, 17 Jun 2025 03:23:13 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso2831982a91.1
        for <opensbi@lists.infradead.org>; Mon, 16 Jun 2025 20:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750130591; x=1750735391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UP8mURXHExGb4aPx31P8b2XM6X+pghhVgj9ToII6yBg=;
        b=mfw3tzObDk/m5SmcBENSSfE5XoFtzIKG7d7guiJPeGRIC8N/VyOdssJQpwoAST26B3
         +66QIshKZilP2733p+0+s9R5DKh6x79xZ5FeChZ14bStE6/HT9B6rSkSP/1DOAEijwbV
         91Y7p5JCf3HWihjPSl6Ov0g44AFjrnS4pcf6pEF0D2BopaU/awPTU2n5//vvQslz0qo7
         S4FLc94A0ChnV3pWuGM7J4qITxMNlsQz11hxWuhM07oxEHcw2Ly4zYVimyB8dSxaRiQP
         ci3KtE7xu9bISWsbzlngodSBw54yBK4NbiQVUPJlaejOMXPPSTdVj918Oy3uIovJi0Fk
         XYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750130591; x=1750735391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UP8mURXHExGb4aPx31P8b2XM6X+pghhVgj9ToII6yBg=;
        b=OwOy3J+PY8udr/3u+1yW6+/EOP5/DMrsKwI+CcTiSNQuzBsYEu0VtP5RKosSUI9OAL
         YpSXRsOyHKxx117ixC3hex/vxaR61+88oHQXIbbQZkGJuwQi1OL05rXV5xzkqJJqPtPg
         8bmIpu+DdTQNYUxHF+NUuQgImMbU7fCclKhTFTTMOUfR+wr4+4HHhHwH8Cdq/Jr0t2o+
         MNevt/SmFg1j84BKdENfXlTb/WosQ7vFC1ZgkvKaYQV0KKa9quJDDWZRC/EE/qx774Hs
         xlRcaI50atclPUutMnX30XIUnm1QziyyeBs00TSnxerswageQ9JvXbJFuXjho2jBYNL5
         Ihvw==
X-Gm-Message-State: AOJu0YykJEdcgHlC7FnxfUHn68MYu+hyEFxwuZJEZR/EQTRrcMJulsxT
	nG9RaF31o9rwvZyshXRX2ZDg0nG7YOXqDNAPCd3Yqvjj2T6fu4sNWR/k35i247DlN67hF27nUmk
	PO7uL3r7xMb7UvS+EJkgdeHbZD+r4GdqSiU00tlfJqpkM4JuLKF0f2yM9vqGp7W9bu2BuJySeGr
	u5Adk4l7b0PEyGgZuGnunVQ3Tu9/AOr8Wf95A5um0qxzlaE8SoMp+saU0=
X-Gm-Gg: ASbGncuk9zzIV7vK7AcBEJh5HgxDlJPrU3zFQS1rwHPnmYsW2ALHm8A1IIpaBn+JBqt
	h3g5IHaA5Hqiqe8h5HFrz6xJgGXuQ6hIVy3zZrOxX4Pn9VJXYJvinPnXVYOiOSBMiBnqMCXGdMr
	kQac5Y2s3BrDQYe5xBgfAdmJhY0ukib/CAqlbFdzGC5cQJxpO9eQ9twfDf6vidT/d4Vg0mtBQFm
	KsOQA99l8UH171oAdFnVlZvqekMnL0mdKjM/UMxnFDpr0q4zG+VUhgWR0YC5wl3c5rJlRmBhHu5
	J1yq44BGdNeHgd5wjJcWh39qPgJdeAX5nQZytIbdUoCOL1+Np8b0qOAiAUvpvNKZdoGHa8O19Zb
	bDkdgF6DxDNfkDi2/wXA=
X-Google-Smtp-Source: AGHT+IEFEF9BmAdbKIYeqJYH22O5E3c9rHsCsdR6Y8qWL1kTl2BHyysukIHGDe2OYVFO6U5tDtGPpg==
X-Received: by 2002:a17:90b:2542:b0:312:def0:e2dc with SMTP id 98e67ed59e1d1-313f1c6f6e7mr20663881a91.7.1750130590956;
        Mon, 16 Jun 2025 20:23:10 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31429aae8eesm244821a91.40.2025.06.16.20.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 20:23:10 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 3/3] lib: sbi_heap: Simplify allocation algorithm
Date: Mon, 16 Jun 2025 20:21:37 -0700
Message-ID: <20250617032306.1494528-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617032306.1494528-1-samuel.holland@sifive.com>
References: <20250617032306.1494528-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_202312_203320_A7583F66 
X-CRM114-Status: GOOD (  13.49  )
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

Now that the allocator cannot run out of nodes in the middle of an
allocation, the code can be simplified greatly. First it moves bytes
from the beginning and/or end of the node to new nodes in the free
list as necessary. These new nodes are inserted into the free list
in address order. Then it moves the original node to the used list.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/sbi/sbi_heap.c | 54 +++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 32 deletions(-)

diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
index 8cad3aaf..1de6dc1e 100644
--- a/lib/sbi/sbi_heap.c
+++ b/lib/sbi/sbi_heap.c
@@ -73,7 +73,7 @@ static void *alloc_with_align(struct sbi_heap_control *hpctrl,
 			      size_t align, size_t size)
 {
 	void *ret = NULL;
-	struct heap_node *n, *np, *rem;
+	struct heap_node *n, *np;
 	unsigned long lowest_aligned;
 	size_t pad;
 
@@ -107,40 +107,30 @@ static void *alloc_with_align(struct sbi_heap_control *hpctrl,
 					 struct heap_node, head);
 		sbi_list_del(&n->head);
 
-		if (size + pad < np->size) {
-			rem = sbi_list_first_entry(&hpctrl->free_node_list,
-						   struct heap_node, head);
-			sbi_list_del(&rem->head);
-			rem->addr = np->addr + (size + pad);
-			rem->size = np->size - (size + pad);
-			sbi_list_add_tail(&rem->head,
-					  &hpctrl->free_space_list);
-		}
+		n->addr = np->addr;
+		n->size = pad;
+		sbi_list_add_tail(&n->head, &np->head);
 
-		n->addr = lowest_aligned;
-		n->size = size;
-		sbi_list_add_tail(&n->head, &hpctrl->used_space_list);
-
-		np->size = pad;
-		ret = (void *)n->addr;
-	} else {
-		if (size < np->size) {
-			n = sbi_list_first_entry(&hpctrl->free_node_list,
-						 struct heap_node, head);
-			sbi_list_del(&n->head);
-			n->addr = np->addr;
-			n->size = size;
-			np->addr += size;
-			np->size -= size;
-			sbi_list_add_tail(&n->head, &hpctrl->used_space_list);
-			ret = (void *)n->addr;
-		} else {
-			sbi_list_del(&np->head);
-			sbi_list_add_tail(&np->head, &hpctrl->used_space_list);
-			ret = (void *)np->addr;
-		}
+		np->addr += pad;
+		np->size -= pad;
 	}
 
+	if (size < np->size) {
+		n = sbi_list_first_entry(&hpctrl->free_node_list,
+					 struct heap_node, head);
+		sbi_list_del(&n->head);
+
+		n->addr = np->addr + size;
+		n->size = np->size - size;
+		sbi_list_add(&n->head, &np->head);
+
+		np->size = size;
+	}
+
+	sbi_list_del(&np->head);
+	sbi_list_add_tail(&np->head, &hpctrl->used_space_list);
+	ret = (void *)np->addr;
+
 out:
 	spin_unlock(&hpctrl->lock);
 
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
