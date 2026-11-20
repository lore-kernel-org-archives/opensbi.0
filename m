Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A46606A6B5
	for <opensbi@archiver.kernel.org>; Fri, 20 Nov 2026 23:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0IzOFvF6;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Sg1FreQU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=INbVCUvkRvrR1tW2SmDo7FfnJJdJFETjwzgFCdQEZTw=; b=0IzOFvF6YaIf3h5p3WJRxOPUHe
	FIMN2tUFt/69Zz0+p44NZq7CEa6laJlPuEvKv4T1wbAJBmtYeojkC4VdjO/War6xzwXKCoaMHM/a6
	sIkMLyKYG1/8tbmqkqNJTEsc9g4FA7BEjXNcQ0nxis/n9yIOFSI12SoongvuGiLTR2fenNw0qUVyc
	9Sw00ZT7eAolgCVUzq3/yyIvHPYynwfI1EDPEw7eJZkOuycQ5uIFuJqhmyqKYfnTrrIugkfxRJJAv
	z4hEjK62uRHoSaYFpMF/RP+b3uZoJ/HK48h9kvnbj4YsIa9SmNRt2NV1oPUgEMlC1A7hEq0QG863X
	zkA7b9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlb-0000000GNqY-3XJu;
	Fri, 20 Nov 2026 23:11:39 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlX-0000000GNow-3rXp
	for opensbi@lists.infradead.org;
	Fri, 20 Nov 2026 23:11:38 +0000
Received: from LT03 (dynamic-176-006-022-220.176.6.pool.telefonica.de [176.6.22.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2B9FE42CDF;
	Fri, 20 Nov 2026 23:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795216294;
	bh=n8mDqn8PwkQJPnMA869MVS7AWg5nGRBPRA7pJPW6r2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Sg1FreQUECTHrL6apGKeR8dJBoyiBH+arglM9fsXRHBFRhXNJcIPucsnMW6WqrMTA
	 pTEg1ztEPC8LwxmbBYLoGtwrVER3NeyezuihSSMh3oB+wfdf4GhwyuNDJBDXlUP8zG
	 GQiHHRUjZnvwaSDflYgmfrufxRKYNpiq/LhCuJJmkXcifQUlPu43Vv575EIsacs2x2
	 vciYaqAx8SlEreeJ0farilvJWCGWHJZui5qc/BS6bo0kM9QerF2nDiGSG0bwYpJ6jr
	 9YQwXj/sPeSZ/hNRpFvSiKHw+rOIhG3JwdsPQUoaWPP4zuvG8bklr6PYKpAQvql7KT
	 OPYZRNwZJFdrYjq414ZrR2Nbf/8ONA1Xq9AgBwhOQsfOWCZWqSkbg0sXin3Gzq3eie
	 vYBaRCF+QVKP3CKchJw2R6lnafXYAnYk16r9pFiWSMtOw47/YiNnGMdEB7TTqWPzKQ
	 p+COQ4N25iH1TMHKEWzoybNDUgolHcIkN6yNC3uwwVt3akrRitvMWWFwBHl0WT91YC
	 7qpm/Q0z0WHN8p47XoiMmmFD2kX24AumY8RdvvzRCM1diuFTWVQXb1yLjtNp0Y/AHT
	 xBf0lVJ9bxyhpCpe2zHUPw+UTUFUftAhqn6+ht/U9I5LfAoRb84+sI9UtqJ8COlS6Q
	 sJ5mo2jfQ5ve0Umic1p61C5o=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 3/7] lib: sbi: dbtr: check the whole shared memory range in SETUP_SHMEM
Date: Sat, 21 Nov 2026 00:11:15 +0100
Message-ID: <20261120231119.90214-4-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_151136_382190_5F4066CA 
X-CRM114-Status: GOOD (  13.52  )
X-Spam-Score: -4.4 (----)
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

The shared memory of the debug trigger extension is trig_max * (XLEN / 2)
bytes long. The specification requires the SBI implementation to check
that the whole physical memory range is accessible for the caller, see the
chapter on the shared memory physical address range parameter.

sbi_dbtr_setup_shmem() only tested the first address. A range that starts
in memory of S-mode and reaches into memory protected by PMP was
accepted. A later read of the triggers then makes M-mode write into the
protected memory. A range at the top of the address space that wraps
around was accepted too.

Use sbi_domain_check_addr_range() with the size of the shared memory. It
also rejects a range that wraps around.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_dbtr.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 53fcb0a2..fa0e5962 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -385,9 +385,20 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 	if (shmem_phys_hi)
 		return SBI_EINVALID_ADDR;
 
-	if (dom && !sbi_domain_check_addr(dom,
-		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
-		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+	/*
+	 * The shared memory is trig_max * (XLEN / 2) bytes. All of it has to be
+	 * readable and writable for the caller, not only its first byte,
+	 * otherwise a read of the triggers would write into memory that the
+	 * caller cannot access. A range that wraps around is rejected too.
+	 */
+	if (dom &&
+	    !sbi_domain_check_addr_range(dom,
+					 DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi,
+							      shmem_phys_lo),
+					 hart_state->total_trigs *
+						 sizeof(union sbi_dbtr_shmem_entry),
+					 smode,
+					 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
 	hart_state->shmem.phys_lo = shmem_phys_lo;
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
