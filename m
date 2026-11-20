Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A7D606A687
	for <opensbi@archiver.kernel.org>; Fri, 20 Nov 2026 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s90PRtyX;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=VoZ1NY1b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HotdAKST478hXs59poLWvshi+hVT/Fy+o1XIzjDUelk=; b=s90PRtyXNR5lVyld9KLzX8rO5c
	tJPAGGekPYWp1TuYgF6u3WdvkcQb1ACvbuUkBneCiPwYRqHXlTyP4lAEm407txFMuuNlGtZieICFL
	ujaj0KXrHy1galukMieVIGY/ijrX/xwnl4dBfZTne7oeEmJBNOSUAlyax6udpJGOrmnwpoF00gtpe
	Psp8AaoG98wZI7ZPH/tJ79QP14BK5QezOqWSPhIrS9U1hHgR+UU7897YnqE+CH4cmpv3fiIAasLrM
	BIVzyeLPKYYwvb2KLzXIsyJM7Dt2z8XTYpOUt6MUS6yK+Fvt66e541AKZ3SPlB28tQW4mDUaTCiFa
	Hx+CpZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlh-0000000GNuC-0BUy;
	Fri, 20 Nov 2026 23:11:45 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlc-0000000GNqM-0eXU
	for opensbi@lists.infradead.org;
	Fri, 20 Nov 2026 23:11:41 +0000
Received: from LT03 (dynamic-176-006-022-220.176.6.pool.telefonica.de [176.6.22.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id CC2C642CE1;
	Fri, 20 Nov 2026 23:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795216295;
	bh=0fv0QvRADNcSfIPNDXFs8IGOqe6wSgmSozs5kZ4dQXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=VoZ1NY1bXCrolwy6t7tfuTycfU9dN77zWETFGWkYh0emg9Vk3HhznBZE0o/EWSmES
	 PsfKU+5u/GZSKAGTmONN0cMNHtAhUNI+GclLQESc2nqZoT+6DUZ5jKvZjmZDFc4WG6
	 l1UlnGEHF5uLOD3QlD7aYFwZY4Q7FSgSLDVyotJ2CdRGNIiZczE8NKrThHCDyOR5nx
	 Z13H0nW/vPBKb8nUdY1y2PAfFUoRoleqzLDyghULAhxVyMmboaB+GUT9Paj5651BiX
	 51yGl/he8tlJxy31VBj+YXs5/N9/e+agl9qkUv/udT9f8fEIOQO4YP6YSElQ8gIOk3
	 QqmOU5BsjCKSMr8dK1QLadlRQ7otEOEpm8YWo36MPwbfdQrTR+CqHpFfSAXSH9fdYl
	 8+c13TS1ZfB9glcnign/7WBNcNeiFuw9fogvYZypqf30wbY7HzUEmjr8/rYwrZqXF7
	 4HdoWVzhd2EeU2lzIhEoBh2nwON5NrF99kvCvTZrm4cW2hivq26w+zPAVpgArMWW7c
	 Uwy+zjhiB42tj20zlRrZPUCXUoawhY4+S/z9CqgMxxGUjV9LcI60xDcls/i4QIxqTW
	 l0rAhi5FdxTub8AAPOiuxUnt/yhU+BjeE2rlyf8Lq/EXuRAE/9SKtpMGHrbma9akuJ
	 ShdlXKRfoIMJRp90qAdUgxdQ=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 5/7] lib: sbi: dbtr: keep type and chain of a trigger in UPDATE
Date: Sat, 21 Nov 2026 00:11:17 +0100
Message-ID: <20261120231119.90214-6-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_151140_413427_E6E03DB7 
X-CRM114-Status: GOOD (  16.06  )
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

The specification requires an update of a debug trigger to fail if
trig_tdata1.type or trig_tdata1.chain differ from the installed trigger.

The update only asked if the hardware trigger can do the new type. A
trigger that supports several types, like the ones of QEMU that do
mcontrol and mcontrol6, was switched to another type. A changed chain
field was not noticed either.

Compare both with the tdata1 of the installed trigger and return
SBI_ERR_INVALID_PARAM. The specification names no error code for this
case, so use the one for an invalid trig_tdata1.

The chain field is defined by the trigger types mcontrol and mcontrol6 of
the RISC-V Debug Specification. Other types have no such field. For them
the same bits belong to other fields, for example to the count of icount,
and they are not compared.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_dbtr.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index d4be1be3..01b74f5f 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -693,6 +693,24 @@ int sbi_dbtr_read_trig(unsigned long smode,
 	return SBI_SUCCESS;
 }
 
+/*
+ * Value of the chain field of tdata1, 0 if the trigger type has none. Only
+ * the types mcontrol and mcontrol6 define a chain field. The other types use
+ * the bits for something else, e.g. icount for its count, so they must not
+ * be compared as a chain.
+ */
+static unsigned long dbtr_tdata1_chain(unsigned long tdata1)
+{
+	switch (TDATA1_GET_TYPE(tdata1)) {
+	case RISCV_DBTR_TRIG_MCONTROL:
+		return !!(tdata1 & RV_DBTR_BIT_MASK(MC, CHAIN));
+	case RISCV_DBTR_TRIG_MCONTROL6:
+		return !!(tdata1 & RV_DBTR_BIT_MASK(MC6, CHAIN));
+	default:
+		return 0;
+	}
+}
+
 /*
  * Check the configuration of one trigger read from the shared memory.
  *
@@ -730,6 +748,15 @@ static int dbtr_check_trigger_config(struct sbi_dbtr_hart_triggers_state *hs,
 		return SBI_ERR_NOT_SUPPORTED;
 
 	if (trig) {
+		/*
+		 * An update keeps the type and the chain bit of the installed
+		 * trigger, see the update function of the specification.
+		 */
+		if (type != TDATA1_GET_TYPE(trig->tdata1) ||
+		    dbtr_tdata1_chain(tdata1) !=
+			    dbtr_tdata1_chain(trig->tdata1))
+			return SBI_ERR_INVALID_PARAM;
+
 		if (!__test_bit(type, &trig->type_mask) ||
 		    !dbtr_trigger_hw_supported(trig->index, tdata1, tdata2,
 					       tdata3))
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
