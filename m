Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D59606A320
	for <opensbi@archiver.kernel.org>; Fri, 20 Nov 2026 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dYGKeVzS;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=oH7XAN3q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+I52DaE/TyTlkqKS82zteqRVBrJqPTbfN7p9UnbSoIo=; b=dYGKeVzSeDYIhEs0ZW3lfxWpwM
	yVjO277tz8jERlQiHeupdgE3IwIHcxJiI8seRuxNWcRmU+yWR4vGmP2Wpegcue3vLNYf+n89t2HQ6
	lJdfBMxHuCI07PUUec0MCerxqhQNL7vfwuiKOah3PIUt1M5DhnYM6gpyYGeMmef2dreWA7FNtcW4X
	IvOF1YNO0OOnKkhovORBI5Xynwu5jBbq6WsYTToWRmDDba7GThoyd8JZYZStl82eZGohqgvzhNy6q
	ygDUZ4Ue3mDna7HCXBdW2xJ4D7WlWdVkXsS/Gby7+FZV4uZeuvHuql94El4KhrM8Dh4KeVbCs5MKL
	zo70AD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNDz-0000000Esb3-0VrE;
	Fri, 20 Nov 2026 11:56:15 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNDt-0000000Esa4-41H7
	for opensbi@lists.infradead.org;
	Fri, 20 Nov 2026 11:56:14 +0000
Received: from LT03.fritz.box (ip-084-119-040-110.um24.pools.vodafone-ip.de [84.119.40.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6775D40B15;
	Fri, 20 Nov 2026 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795175765;
	bh=qFVtlcSoCxDmOdWmsPF7UJ6v9F5f3EiuJEIGKHnAw9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=oH7XAN3q9UJvmHf7yb4vjVMpjvUL9a5cjjz6gWZzHdlUYX+qub4Dbq43L90J1jHLQ
	 OrBhW0U6JJSC8IPwgT/O76ZWP5xBb0AEFxCsxurfMvM9Af179YKMB5D1o7c/64ZDck
	 0Ryh9jnOKLgBtFDLw+qsuFKgNlHHy4PRiPA5+taEUF4JLdmPtYMEa+92m/Rt0BU6MF
	 itphULagbM7WFGrcv4rPbTPq2nA/JWsbLXaKFf5vSgifxEDfe8U8LLmrBDBQ1j5M7s
	 XPNrNhpLnSr9tJiMgsKicfk5besth48fgXqY4J9Y83J9yyCSclUj4CP85KkpGu25C2
	 Mvyb6VnYbxNr4zQZXw21dEcvNfU8Wk0bAuTpgmIxpY/efFMxPlgMw02ZS0pNDenSJq
	 6KzaKvTJTdmaOO/cH/MM/M9g654JachD4oJ7YIFiEg9HbliLOt199pazi9UgOPQg+E
	 lBlpSzHjAuLj5g9lVJhEgj81QzHmDCciGdcbVSXkw3NmSXRF5QHdSxEiUcXMM0e71I
	 bHeYR4NinKFWAx7o936WhwrZqFkxnj9w1Qvgl6K4t42RrCt22dyuluSUw2cUO9VqZ/
	 zv4nbOUlWj47zuVEPhRgOWWiceXQWxBGPUfscurdTngw1n1kFu8aVVN4ZYy+iGwqt4
	 vOtX2Mo2diJi+dvsAMhYgxEE=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] lib: sbi: dbtr: check the flags parameter of SETUP_SHMEM
Date: Fri, 20 Nov 2026 12:54:27 +0100
Message-ID: <20261120115427.50400-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_035610_351794_ECE86A25 
X-CRM114-Status: GOOD (  12.40  )
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

The SBI specification defines sbi_debug_set_shmem() with three
arguments: shmem_phys_lo, shmem_phys_hi and flags. The flags parameter
is reserved for future use and must be zero. If it is not zero the call
must fail with SBI_ERR_INVALID_PARAM.

The ecall handler passed only a0 and a1 to sbi_dbtr_setup_shmem(), so
the value in a2 was ignored. Pass a2 as a new flags argument and return
SBI_ERR_INVALID_PARAM if it is non-zero. The check is done first, so a
call with reserved flags does not change the state of the hart.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 include/sbi/sbi_dbtr.h   | 3 ++-
 lib/sbi/sbi_dbtr.c       | 7 ++++++-
 lib/sbi/sbi_ecall_dbtr.c | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
index 90871f0d..86af03f2 100644
--- a/include/sbi/sbi_dbtr.h
+++ b/include/sbi/sbi_dbtr.h
@@ -114,7 +114,8 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot);
 int sbi_dbtr_supported(void);
 int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 			 unsigned long shmem_phys_lo,
-			 unsigned long shmem_phys_hi);
+			 unsigned long shmem_phys_hi,
+			 unsigned long flags);
 int sbi_dbtr_num_trig(unsigned long trig_tdata1, unsigned long *out);
 int sbi_dbtr_read_trig(unsigned long smode,
 		       unsigned long trig_idx_base, unsigned long trig_count);
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index c97e625f..2108ca9e 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -337,10 +337,15 @@ int sbi_dbtr_get_total_triggers(void)
 
 int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 			 unsigned long shmem_phys_lo,
-			 unsigned long shmem_phys_hi)
+			 unsigned long shmem_phys_hi,
+			 unsigned long flags)
 {
 	struct sbi_dbtr_hart_triggers_state *hart_state;
 
+	/* The flags parameter is reserved for future use and must be zero */
+	if (flags)
+		return SBI_ERR_INVALID_PARAM;
+
 	if (dom && !sbi_domain_is_assigned_hart(dom, current_hartindex())) {
 		sbi_dprintf("%s: calling hart not assigned to this domain\n",
 			   __func__);
diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
index 40a437ee..704af5a4 100644
--- a/lib/sbi/sbi_ecall_dbtr.c
+++ b/lib/sbi/sbi_ecall_dbtr.c
@@ -28,7 +28,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
 		break;
 	case SBI_EXT_DBTR_SETUP_SHMEM:
 		ret = sbi_dbtr_setup_shmem(sbi_domain_thishart_ptr(), smode,
-					   regs->a0, regs->a1);
+					   regs->a0, regs->a1, regs->a2);
 		break;
 	case SBI_EXT_DBTR_TRIGGER_READ:
 		ret = sbi_dbtr_read_trig(smode, regs->a0, regs->a1);
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
