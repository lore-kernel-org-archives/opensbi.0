Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0081C60A2600
	for <opensbi@archiver.kernel.org>; Fri, 20 Nov 2026 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cYMhW3xh;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=sCYo8g4L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zplYwWGxe9IAY/SUaAn1UUx8I/TdTE+Lm7h4+cR+b70=; b=cYMhW3xh6uui5ESnKGUsHIJsAq
	2AqNAyoR183au24kaTkRuJnbetHZkBiim6lJiRGMiPQrIK4dm0vyx5LCpNe71BLKqExX60pmQFP+U
	tioJcJLrpKOoAurHzN3hshzcbEIdV/IB9tla6JURdtLq7hEAwx3gm2ts/MN4nINhTjct0ACeqHMi2
	XSTydArH/mtQr3QuEM447+LZx/PvCaZirX9FlXCDTF1BujqT45BwDYxuFl54s9Gk6Dqieh4U5DJjz
	Rhetax9kc6KnZn10YyPupgkmgUSP8KL1ps9z6NFZ9Rqx6WgbAF8/TnpwxQFpBef7Wn/OHWQreRtOy
	DtLjkN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlh-0000000GNuQ-0a51;
	Fri, 20 Nov 2026 23:11:45 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlc-0000000GNqN-0fcr
	for opensbi@lists.infradead.org;
	Fri, 20 Nov 2026 23:11:42 +0000
Received: from LT03 (dynamic-176-006-022-220.176.6.pool.telefonica.de [176.6.22.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2BBD942CEA;
	Fri, 20 Nov 2026 23:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795216295;
	bh=/ydTihTjRu3gspu9wvTlNEvVHgnL3Kxj0z66fqE/Kx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=sCYo8g4LSWL1Zo3b46NyBOmrm2+lUhGQYDb60j/MrdWJDhv0HZ91e7C4WDY8sE+TH
	 0wpuKSpsTZXgt5lCLnBZ2qV4M1iUt/B3H57C9EbdhAFuXUtGGe2IOZJkZpfNzj6kNY
	 e+kOd6ioIVQie2mNa1wa94hJXvMZlv/zsjOf+tBG3cnyx85pqGZRRdJYOgn/o8QrS5
	 pY53rM/y+hmsttGPq2SUWIz3JMpyr0POc440gfvqWsxGpxzd0TrLd+dlQmwhgpSf6j
	 NAfDFcXFwntzfn/Urjmg6DkorJUXRkcGlkgHm4NYtdALp2+AqrC+JXPxboKd9Yh4xm
	 Qo4iO53Hfx19b1+POKZhlNEWp6S/CCEszY1OOty1ZLeOsZhr0HfJzT1DsVl+OMUdGk
	 BKEopCGZ7ilOTxIkbaQDlA/USRFOc6bUuLvBAL0rWc6Z/ZURjPYTRbFWioSxIYQ9m6
	 SkaJo2dJ6doXJ4kBjJGBkdo0tEhT4t2ZKm38yxH4DeUsf/SJo66wrY44BiRljz/gEk
	 4CkHLgnIBxLWTjY1JIhMo9DdEandeScQgnx8Ledt+MGRDdz9LfyuSkMg5ydA7wWFUI
	 hCyY+qsltK1rwize4yWFMybYLue2+gOGI3cHw4CVy7vPbgftuVlZYlUQGUVzsAmXQd
	 4QO9XbvoVYIRbRgBfCUhgDw8=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 6/7] lib: sbi: dbtr: report the failing index of UPDATE
Date: Sat, 21 Nov 2026 00:11:18 +0100
Message-ID: <20261120231119.90214-7-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_151140_427569_80F7ED6B 
X-CRM114-Status: GOOD (  11.81  )
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

The specification says that sbi_debug_update_triggers() returns the
array index i of the failing trigger configuration in sbiret.value, and
zero on success, like sbi_debug_install_triggers().

The update function had no output parameter and the ecall handler did
not pass one, so sbiret.value was always zero. A failure in the second
entry of a batch looked like a failure of the first one.

Pass &out->value to sbi_dbtr_update_trig() and set it to the array index
on every failure inside the loop.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 include/sbi/sbi_dbtr.h   | 2 +-
 lib/sbi/sbi_dbtr.c       | 5 ++++-
 lib/sbi/sbi_ecall_dbtr.c | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
index 86af03f2..ab2038f2 100644
--- a/include/sbi/sbi_dbtr.h
+++ b/include/sbi/sbi_dbtr.h
@@ -126,7 +126,7 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
 int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 			 unsigned long trig_idx_mask);
 int sbi_dbtr_update_trig(unsigned long smode,
-			 unsigned long trig_count);
+			 unsigned long trig_count, unsigned long *out);
 int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
 			  unsigned long trig_idx_mask);
 
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 01b74f5f..a6b860da 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -943,7 +943,7 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 }
 
 int sbi_dbtr_update_trig(unsigned long smode,
-			 unsigned long trig_count)
+			 unsigned long trig_count, unsigned long *out)
 {
 	unsigned long trig_idx;
 	struct sbi_dbtr_trigger *trig;
@@ -973,6 +973,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 		trig_idx = entry->id.idx;
 
 		if (trig_idx >= hs->total_trigs) {
+			*out = _idx;
 			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_INVALID_PARAM;
 		}
@@ -980,6 +981,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 		trig = INDEX_TO_TRIGGER(trig_idx);
 
 		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
+			*out = _idx;
 			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
@@ -987,6 +989,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 		rc = dbtr_check_trigger_config(hs, trig, &entry->data,
 					       tdata2_impl, tdata3_impl);
 		if (rc) {
+			*out = _idx;
 			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 			return rc;
 		}
diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
index 704af5a4..b86ce5b3 100644
--- a/lib/sbi/sbi_ecall_dbtr.c
+++ b/lib/sbi/sbi_ecall_dbtr.c
@@ -43,7 +43,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_dbtr_enable_trig(regs->a0, regs->a1);
 		break;
 	case SBI_EXT_DBTR_TRIGGER_UPDATE:
-		ret = sbi_dbtr_update_trig(smode, regs->a0);
+		ret = sbi_dbtr_update_trig(smode, regs->a0, &out->value);
 		break;
 	case SBI_EXT_DBTR_TRIGGER_DISABLE:
 		ret = sbi_dbtr_disable_trig(regs->a0, regs->a1);
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
