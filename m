Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03063606A338
	for <opensbi@archiver.kernel.org>; Fri, 20 Nov 2026 23:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HehcLPYw;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TKKMZHfA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g3BSPYAW6elcYZ3HtwrD6UGdSHdkoPAFmuSKoCzRuCA=; b=HehcLPYw/jrBXdhhQ59XmDmIMv
	jHd/fWsbb6NBLKj6pd9qtT88FUc6261cp7Zwfhf2+3ms5R5LqZL9wxqf4LvR4Dm80Are+DHf7vHW1
	/8yJKdWdtdfewXNahBF1ZKRv5Am5acNJJdBnMKZfTRPeVhT4b8H75mOsjdSgE4hm6Zw9iquhEaCkq
	/CF2guyNMkxrIyoMG0HUik0DbjCaCN9qZDiK7DvvfW0iHG2yiLUNFPqSvZ9pm1xJstrwfpkapTjda
	ckurB9Mcy1d/jgQI0EsglIPoQyYszAYDN+n/UO1dp16OFb7bHcuhoUXeJHT9tFJ8hEIUlO3zduPWV
	NlwSwo7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXle-0000000GNsT-1LMH;
	Fri, 20 Nov 2026 23:11:42 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlY-0000000GNox-0Cvc
	for opensbi@lists.infradead.org;
	Fri, 20 Nov 2026 23:11:40 +0000
Received: from LT03 (dynamic-176-006-022-220.176.6.pool.telefonica.de [176.6.22.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 7620B42CE0;
	Fri, 20 Nov 2026 23:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795216294;
	bh=uL8lIWE4zqfp25/DSI3BJsqoXNtY7c5UEUczRwvIg2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=TKKMZHfA08zAv6GuGBNR3g46/ZEF2JrF1gH3p7MATJRUvadvB6cEAgojO5yMUUqti
	 ysgmqMYufmg6WEOLfE59AR9fK9TEFHVzd+vjn3JvbvECt5f8Xu7G8kVZT/0xeRlGFE
	 Xu04Mvq8+ewAPkTtvIwIrFYToM28vAgKh5yIqhoaQPLlYGYZolwgqB0qGzc1lKN4MO
	 20daM4EvKgPbtGSxg2EZ9oAB3PCwvEtA/UOG8bqHZE/z/AAl4dVIVuqRC3u6guzafi
	 P8AjDXchhtZRAUJIKAwQ6Za1/EDJFa6GZY9al/BpE7y290la2Yl7YDSd/uy8zjTSpL
	 UEo31+8Tp1hewmt+cfxz81uOsxZcQ2kcB4oseGyRdfJPWHtMDSEiS+b1UU+SMAeJqI
	 ud61PB9tckPUbX+4rBddRSPuJy6XBWNAFtMJRM+P28zXXq37XjP9hnZXHKp4SPbfbJ
	 EouDvamGh6ojZgOufTuEhcuUuqw7fPelOVm9xGqxt1nDfNkEZS2SOeGD4ijgZtdusX
	 Vp0h2pH4UdPBRChXc+fzfpCLRwjqJ5h0zXOrqkik0ExueRCXsV2+NpjBrLxiL6ROBG
	 2sE2Nmowl5ZbqrIn+AQnWqToOjmgCwpTbMZlOkrHuStJPXlKcwxK5EkuRKDLUSdfbD
	 xTV6flZnXqlPTdLVFz6Niq/0=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 4/7] lib: sbi: dbtr: validate the trigger set of uninstall, enable, disable
Date: Sat, 21 Nov 2026 00:11:16 +0100
Message-ID: <20261120231119.90214-5-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_151136_397188_A6B5EF0F 
X-CRM114-Status: GOOD (  14.91  )
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

The specification requires SBI_ERR_INVALID_PARAM for these calls if a
trigger of the set is not mapped to a hardware trigger or has an index
of trig_max or more.

The functions shifted the mask by the base and walked the set bits below
total_trigs. Bits that are not below total_trigs were never visited, and
the shift dropped the high bits of the mask. A base or a mask bit that
is out of range therefore ended in SBI_SUCCESS. Enable and disable
silently skipped triggers that were not mapped, so enabling a trigger
after it was uninstalled succeeded.

Check the whole set before anything is changed. The index of a bit is
compared without adding base and bit, so it cannot overflow. As a side
effect a failed call changes no trigger.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_dbtr.c | 73 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 52 insertions(+), 21 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index fa0e5962..d4be1be3 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -839,22 +839,52 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	return SBI_SUCCESS;
 }
 
+/*
+ * Check the set of triggers of uninstall, enable and disable: bit i of the
+ * mask is the trigger with the index trig_idx_base + i. Each one has to be
+ * below trig_max and mapped to a hardware trigger, otherwise the specification
+ * demands SBI_ERR_INVALID_PARAM. Nothing is changed unless the whole set is
+ * valid. The comparison is done without adding base and bit, they cannot
+ * overflow.
+ */
+static int dbtr_check_trig_set(struct sbi_dbtr_hart_triggers_state *hs,
+			       unsigned long trig_idx_base,
+			       unsigned long trig_idx_mask)
+{
+	struct sbi_dbtr_trigger *trig;
+	unsigned long bit;
+
+	for_each_set_bit(bit, &trig_idx_mask, BITS_PER_LONG) {
+		if (trig_idx_base >= hs->total_trigs ||
+		    bit >= hs->total_trigs - trig_idx_base)
+			return SBI_ERR_INVALID_PARAM;
+
+		trig = INDEX_TO_TRIGGER(trig_idx_base + bit);
+		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
+			return SBI_ERR_INVALID_PARAM;
+	}
+
+	return SBI_SUCCESS;
+}
+
 int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
 			    unsigned long trig_idx_mask)
 {
-	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
-	unsigned long idx = trig_idx_base;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs;
+	unsigned long bit;
+	int rc;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
 		return SBI_ERR_FAILED;
 
-	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
-		trig = INDEX_TO_TRIGGER(idx);
-		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
-			return SBI_ERR_INVALID_PARAM;
+	rc = dbtr_check_trig_set(hs, trig_idx_base, trig_idx_mask);
+	if (rc)
+		return rc;
+
+	for_each_set_bit(bit, &trig_idx_mask, BITS_PER_LONG) {
+		trig = INDEX_TO_TRIGGER(trig_idx_base + bit);
 
 		dbtr_trigger_clear(trig);
 
@@ -867,20 +897,20 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
 int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 			 unsigned long trig_idx_mask)
 {
-	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
-	unsigned long idx = trig_idx_base;
-	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs;
+	unsigned long bit;
+	int rc;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
 		return SBI_ERR_FAILED;
 
-	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
-		trig = INDEX_TO_TRIGGER(idx);
-		sbi_dprintf("%s: enable trigger %lu\n", __func__, idx);
-		dbtr_trigger_enable(trig);
-	}
+	rc = dbtr_check_trig_set(hs, trig_idx_base, trig_idx_mask);
+	if (rc)
+		return rc;
+
+	for_each_set_bit(bit, &trig_idx_mask, BITS_PER_LONG)
+		dbtr_trigger_enable(INDEX_TO_TRIGGER(trig_idx_base + bit));
 
 	return SBI_SUCCESS;
 }
@@ -945,19 +975,20 @@ int sbi_dbtr_update_trig(unsigned long smode,
 int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
 			  unsigned long trig_idx_mask)
 {
-	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
-	unsigned long idx = trig_idx_base;
-	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs;
+	unsigned long bit;
+	int rc;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
 		return SBI_ERR_FAILED;
 
-	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
-		trig = INDEX_TO_TRIGGER(idx);
-		dbtr_trigger_disable(trig);
-	}
+	rc = dbtr_check_trig_set(hs, trig_idx_base, trig_idx_mask);
+	if (rc)
+		return rc;
+
+	for_each_set_bit(bit, &trig_idx_mask, BITS_PER_LONG)
+		dbtr_trigger_disable(INDEX_TO_TRIGGER(trig_idx_base + bit));
 
 	return SBI_SUCCESS;
 }
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
