Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D182606A31C
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 02:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Keoyqi+J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ID4hxqowiecpbzkzYmms8yJOhGiPGRMfCmyBTKSK2O4=; b=Keoyqi+JuFGtRdRfanziPsGG8s
	rJ6VHEzRz5ZwAUHS7vq92xX/TXWnocno6UWcAXTcUhlacok9GNkYF1V25BvWmP/fZERhjJR9O8VBi
	Neq4CXJyDwafaz5ljr2RMvrymJSE9rI8GaR9izHYg47dHOoc6LmD/tDUGYO4/cma5aFSMtKj0LHXb
	jSCXIkQnRn3S4ZDnIQ9BN32n6xTT2oizVTfH7sYBhcd6QPUS2m5k2B8v0h47snOo4A2XEnzSkTGWh
	Tuj2xCGRR+sjxWL1J6X+M2mq5B+gsl8Mrd8V42E+QJKOM/LoGDCWIffw3nljKb/NHHBpqv9VFEJlC
	Kjtgym6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmFH-00000000vOu-31d8;
	Mon, 16 Nov 2026 02:14:59 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmFE-00000000vOM-18WV
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 02:14:57 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSmFA-0049JT-Hu;
	Sun, 15 Nov 2026 21:14:52 -0500
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Nickolai Zeldovich <nickolai.zeldovich@gmail.com>,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v2] lib: sbi: Refresh the memregion count after sanitize_domain()
Date: Sun, 15 Nov 2026 21:14:52 -0500
Message-ID: <20261116021452.49828-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006193637.735638-1-nickolai@csail.mit.edu>
References: <20261006193637.735638-1-nickolai@csail.mit.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_181456_415600_196DCE81 
X-CRM114-Status: GOOD (  10.86  )
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

From: Nickolai Zeldovich <nickolai.zeldovich@gmail.com>

add_memregion() counts the regions once before its sort-and-merge loop,
but sanitize_domain() in that loop removes regions covered by another
one. The merge step's sbi_memmove() then uses the stale count and
copies slots past the terminating entry. Those slots still hold copies
of the old terminator and lie inside regions[], so the table comes out
right today, but only by accident.

Recount the regions after each sanitize_domain().

Fixes: 0d5629381731 ("lib: sbi: Fix sbi_domain_root_add_memregion() for merging memregions")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Changes in v2:
    - Rebased onto the add_memregion() rework (145bd4cc, c4f098bf), where
      the count is the local memregs_count. v1 was based on the master of
      the time (8740e0a3); the root_memregs_count it changed was the local
      variable added by de376252, not the removed global.
    - Shorter source comment and message.
    
    v1: https://lore.kernel.org/r/20261006193637.735638-1-nickolai@csail.mit.edu
    
    Tested on QEMU virt with a test-only uart8250 change that also adds a
    64 KiB range covering the console page: without the patch,
    add_memregion() merges with a count of 7 for 6 live regions; with it,
    the counts always match. The final region table is the same.
    
    This patch was written with the assistance of an AI agent.

 lib/sbi/sbi_domain.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 42fe5632..f711f6bc 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -835,6 +835,9 @@ static int add_memregion(struct sbi_domain *dom, const struct sbi_domain_memregi
 			return rc;
 		}
 
+		/* sanitize_domain() may have removed covered regions */
+		memregs_count = sbi_domain_used_memregions(dom);
+
 		/* Merge consecutive memregions with same order and flags */
 		reg_merged = false;
 		sbi_domain_for_each_memregion(dom, nreg) {

base-commit: ed70256dd22c09962d146e433834239825ef0616
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
