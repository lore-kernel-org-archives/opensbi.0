Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0333F606A897
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CLoxDMqt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WA+PlJa4DKuM7xPo0b1eIqpbWWn/IlQLmUPbjzJ6MCg=; b=CLoxDMqtggsN6MUG8mIgktzOG2
	RTMx4rxACVnYRI4SKcr4phCSejua3LjA1UxRnQvBjMhIlb8flvsVzgmFqZ2TYJliezwJkpvd5vNo+
	hIgxP553E5FhTBgDgpQaRuoDYLx4l7+Qr0ePw299U5y3HxwGdZGqgFtTD+D32+fxMMOCjsk2cBsmS
	9Taa8I3K5amugVWwzzXU2FQ/lLurSksnnrN+es8WE388gv3WzswOBeThTfPxwGPJz4aaK1IdTqK9H
	ATFWzeanPcHU2L1J0FHi41EO0PwSxc5tME7NWT73Y7X16npWBa4+wmeeLc2w8NHQcVmEy8+wz8FF+
	LV3h/vXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxC8-00000002jLf-3jnd;
	Mon, 16 Nov 2026 13:56:28 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxC5-00000002jJY-1SV5
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 13:56:27 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSxC3-006YFa-6V;
	Mon, 16 Nov 2026 08:56:23 -0500
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v2] lib: sbi_ipi: Protect the IPI device list with a read-write lock
Date: Mon, 16 Nov 2026 08:56:22 -0500
Message-ID: <20261116135623.52061-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006193630.735611-1-nickolai@csail.mit.edu>
References: <20261006193630.735611-1-nickolai@csail.mit.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_055625_390651_06515899 
X-CRM114-Status: GOOD (  12.20  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The cold boot hart wakes the other harts before it registers the IPI
devices, and each woken hart walks ipi_dev_node_list in
sbi_ipi_raw_clear(true) while sbi_ipi_add_device() may be inserting
into it. Nothing orders the walk against the insertion, so a hart can
follow a new node before its contents are visible and call through a
NULL entry->dev.

Take the write lock around the insertion and the read lock around the
all-devices walks in sbi_ipi_raw_clear() and sbi_ipi_raw_send().

Fixes: ee92afa63892 ("lib: sbi: Introduce IPI device rating")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Changes in v2:
    - Protect the list with a read-write lock instead of smp_wmb()/smp_rmb()
      and an open-coded list insertion (Anup).
    - New subject (v1: "lib: sbi: Order the publication of IPI device
      nodes"); added the Fixes tag.
    
    Depends on "lib: sbi: Add read-write locks", sent separately.
    
    v1: https://lore.kernel.org/r/20261006193630.735611-1-nickolai@csail.mit.edu
    
    Tested on QEMU virt with 8 harts, with ACLINT and with AIA (IMSIC)
    IPIs: Linux brings up all harts.
    
    This patch was written with the assistance of an AI agent.

 lib/sbi/sbi_ipi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index b04a5877..756baab0 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -11,6 +11,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_atomic.h>
 #include <sbi/riscv_barrier.h>
+#include <sbi/riscv_locks.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
@@ -41,7 +42,9 @@ struct sbi_ipi_device_node {
 
 static unsigned long ipi_data_off;
 static const struct sbi_ipi_device *ipi_dev = NULL;
-static SBI_LIST_HEAD(ipi_dev_node_list);
+static rwlock_t ipi_dev_node_lock = RW_LOCK_INITIALIZER;
+static struct sbi_dlist ipi_dev_node_list GUARDED_BY(&ipi_dev_node_lock) =
+	SBI_LIST_HEAD_INIT(ipi_dev_node_list);
 static const struct sbi_ipi_event_ops *ipi_ops_array[SBI_IPI_EVENT_MAX];
 
 static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
@@ -297,10 +300,12 @@ int sbi_ipi_raw_send(u32 hartindex, bool all_devices)
 	wmb();
 
 	if (all_devices) {
+		read_lock(&ipi_dev_node_lock);
 		sbi_list_for_each_entry(entry, &ipi_dev_node_list, head) {
 			if (entry->dev->ipi_send)
 				entry->dev->ipi_send(hartindex);
 		}
+		read_unlock(&ipi_dev_node_lock);
 	} else {
 		ipi_dev->ipi_send(hartindex);
 	}
@@ -313,10 +318,12 @@ void sbi_ipi_raw_clear(bool all_devices)
 	struct sbi_ipi_device_node *entry;
 
 	if (all_devices) {
+		read_lock(&ipi_dev_node_lock);
 		sbi_list_for_each_entry(entry, &ipi_dev_node_list, head) {
 			if (entry->dev->ipi_clear)
 				entry->dev->ipi_clear();
 		}
+		read_unlock(&ipi_dev_node_lock);
 	} else {
 		if (ipi_dev && ipi_dev->ipi_clear)
 			ipi_dev->ipi_clear();
@@ -351,7 +358,9 @@ void sbi_ipi_add_device(const struct sbi_ipi_device *dev)
 		return;
 	SBI_INIT_LIST_HEAD(&entry->head);
 	entry->dev = dev;
+	write_lock(&ipi_dev_node_lock);
 	sbi_list_add_tail(&entry->head, &ipi_dev_node_list);
+	write_unlock(&ipi_dev_node_lock);
 
 	if (!ipi_dev || ipi_dev->rating < dev->rating)
 		ipi_dev = dev;

base-commit: ed70256dd22c09962d146e433834239825ef0616
prerequisite-patch-id: 3f219b25b93a055133df65f70c1671f3df0514b7
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
