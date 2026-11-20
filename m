Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA81606A694
	for <opensbi@archiver.kernel.org>; Fri, 20 Nov 2026 23:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GnY6ug+e;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=RD/AhOBe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bluLGtbzGJdB7Sf3ZNkIP+N3/tuztSQdLIBcXN6Sw4c=; b=GnY6ug+evLYE4Xy4RH7I3bHuHT
	NPO0gWZbi+X60VMCKIx8XXG9SzTsibZ7s6SQ1H9v/6FtNorkqhFW1dVpI4zzeUZRrJdh6hyfHCmhr
	GpI6MjnGDur0JyfqP6eeFPHynCU2/yNAkGGY+EvyM9vDFLKPd/2UOoR6dhHjOKwoXQYeHUmzizWhC
	zREB8BBcyIUk76Fzan9JxfjmDsleLat4krLze7q6NAURmcP+XUb06I2ZaSyk/g4CNSV50qy1GT0ja
	DsQVLt0jSAfKzlp9Gq2sLqYO1HSUOVX5P+1gnkMOURj5+LiXsECRe7E3uq7Gf+8wzcQXKVUJfJ2rE
	J/inPNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlc-0000000GNqs-1mIi;
	Fri, 20 Nov 2026 23:11:40 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlX-0000000GNov-3req
	for opensbi@lists.infradead.org;
	Fri, 20 Nov 2026 23:11:39 +0000
Received: from LT03 (dynamic-176-006-022-220.176.6.pool.telefonica.de [176.6.22.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C262D42CD4;
	Fri, 20 Nov 2026 23:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795216294;
	bh=sfgyWq8Ip75NfvdQMHJsaRBXayLRT7d5BrVcbgrxyJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=RD/AhOBeN5KKC17Hh1PRuaEabexUkxSBg9ckDxQOrXwr6bhmcM5wuWu9wdH4zBw1T
	 bcljHIhkkgTSaBnk/qCWdlApoem4jtcbSnHrwkYiqVuuku3UCeHONRVNoDKLMqfhG1
	 3Se8bjNK6g+gWK2NOIXOh/50ET3ZCqeLzvTMHSZHOe7Vk7FeNl1QRbnFWKxgIPaXwR
	 UBuJ/UDigRFN6KkUUReqPhUaE14K5mZusJjksVlMD9wm9I7M+HT7CH1OqQ/KcsuwKF
	 /5bpYnhHm7A/KgoUEZaQyPbAFlCSLQACaOyNPwBw4BCKhqi+lRg6+ZLgjjFZNtMYWI
	 8ZI+7m6Pjq61owyWajzPJ1VWq60jO7g4v9RMR3xzUB8IjoDRhWufiz4wyo//jfUwdo
	 8G5j5hckF4X13p1hqow3fCVBKiCI37Y8EFDAFtHiNf0BGxlrd01GfLTcAXhfTjDz+B
	 N3PTzaufqtjRNghHyxVKPmMWCwiKGUpZnz7df/w6by5e2/58TEkY+Y63E6m0hgKK+d
	 mjjkPzT4U7wSNdzAoTmf5p1nZT+pIZyzHCjPemJIGahS0UXLlb5MLOowq5cci3l6SR
	 JkV0Yyif48XzPEWGDkqNGW5pgo/bvur3SVAxTJxWM+j6kMwWln98AdHpg8eNHagiph
	 jEAGaSoJzFP8TLNwBqk4NMck=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 2/7] lib: sbi: dbtr: share trigger checks of install and update
Date: Sat, 21 Nov 2026 00:11:14 +0100
Message-ID: <20261120231119.90214-3-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_151136_384875_401C0EFC 
X-CRM114-Status: GOOD (  20.17  )
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

sbi_dbtr_install_trig() validates every trigger configuration before it
programs any trigger. sbi_dbtr_update_trig() only checked the optional
tdata2/tdata3 CSRs and the platform hook. It did not check that the
trigger type is supported and it did not reject a tdata1 with the M or
DMODE bit set, which install refuses. Supervisor software could
therefore update an installed trigger into one that fires in M-mode or
that is owned by the debug module.

Move the checks of one configuration into dbtr_check_trigger_config()
and call it from both functions. The checks and their order are the same
as before for install. For update the configuration is additionally
checked against the type mask of the trigger that is updated, instead of
against any trigger of the hart.

The helper reads tdata1, tdata2 and tdata3 from the shared memory once
and uses the local copies for all checks.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_dbtr.c | 114 +++++++++++++++++++++++----------------------
 1 file changed, 59 insertions(+), 55 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 2108ca9e..53fcb0a2 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -682,6 +682,55 @@ int sbi_dbtr_read_trig(unsigned long smode,
 	return SBI_SUCCESS;
 }
 
+/*
+ * Check the configuration of one trigger read from the shared memory.
+ *
+ * The same checks apply when a trigger is installed and when it is updated.
+ *
+ * @hs:		trigger state of the calling hart
+ * @trig:	trigger the configuration is meant for (update), or NULL if any
+ *		trigger of the hart may be used (install)
+ * @recv:	configuration to check
+ *
+ * SBI v3.0 sec 19.4 and 19.5 require SBI_ERR_NOT_SUPPORTED when a trigger
+ * programs a non-zero value into an unimplemented optional CSR. Only the
+ * "whole CSR unimplemented" case is caught here; WARL bits tied off inside an
+ * otherwise-implemented CSR are delegated to the device-specific
+ * trigger_supported() callback.
+ */
+static int dbtr_check_trigger_config(struct sbi_dbtr_hart_triggers_state *hs,
+				     const struct sbi_dbtr_trigger *trig,
+				     const struct sbi_dbtr_data_msg *recv,
+				     bool tdata2_impl, bool tdata3_impl)
+{
+	/* Read the shared memory only once */
+	unsigned long tdata1 = lle_to_cpu(recv->tdata1);
+	unsigned long tdata2 = lle_to_cpu(recv->tdata2);
+	unsigned long tdata3 = lle_to_cpu(recv->tdata3);
+	unsigned long type = TDATA1_GET_TYPE(tdata1);
+
+	if (!dbtr_trigger_supported(type))
+		return SBI_ERR_FAILED;
+
+	if (!dbtr_trigger_valid(type, tdata1))
+		return SBI_ERR_INVALID_PARAM;
+
+	if ((tdata2 && !tdata2_impl) || (tdata3 && !tdata3_impl))
+		return SBI_ERR_NOT_SUPPORTED;
+
+	if (trig) {
+		if (!__test_bit(type, &trig->type_mask) ||
+		    !dbtr_trigger_hw_supported(trig->index, tdata1, tdata2,
+					       tdata3))
+			return SBI_ERR_NOT_SUPPORTED;
+	} else if (!dbtr_trigger_any_hw_supported(hs, tdata1, tdata2,
+						  tdata3)) {
+		return SBI_ERR_NOT_SUPPORTED;
+	}
+
+	return SBI_SUCCESS;
+}
+
 int sbi_dbtr_install_trig(unsigned long smode,
 			  unsigned long trig_count, unsigned long *out)
 {
@@ -689,9 +738,8 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	union sbi_dbtr_shmem_entry *entry;
 	struct sbi_dbtr_data_msg *recv;
 	struct sbi_dbtr_id_msg *xmit;
-	unsigned long ctrl;
 	u32 claimed = 0;
-	int slot;
+	int slot, rc;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 	bool tdata2_impl, tdata3_impl;
@@ -710,52 +758,20 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
 					   trig_count * sizeof(*entry));
 
-	/*
-	 * SBI v3.0 sec 19.4 requires SBI_ERR_NOT_SUPPORTED when a trigger
-	 * programs a non-zero value into an unimplemented optional CSR. Only
-	 * the "whole CSR unimplemented" case is caught here; WARL bits tied
-	 * off inside an otherwise-implemented CSR are delegated to the
-	 * device-specific trigger_supported() callback via
-	 * dbtr_trigger_any_hw_supported().
-	 */
 	tdata2_impl = tdata_implemented(CSR_TDATA2);
 	tdata3_impl = tdata_implemented(CSR_TDATA3);
 
 	/* Check requested triggers configuration */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
-		ctrl = recv->tdata1;
 
-		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
+		rc = dbtr_check_trigger_config(hs, NULL, recv,
+					       tdata2_impl, tdata3_impl);
+		if (rc) {
 			*out = _idx;
 			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 							     trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
-		}
-
-		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
-			*out = _idx;
-			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
-							     trig_count * sizeof(*entry));
-			return SBI_ERR_INVALID_PARAM;
-		}
-
-		if ((recv->tdata2 && !tdata2_impl) ||
-		    (recv->tdata3 && !tdata3_impl)) {
-			*out = _idx;
-			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
-							     trig_count * sizeof(*entry));
-			return SBI_ERR_NOT_SUPPORTED;
-		}
-
-		if (!dbtr_trigger_any_hw_supported(hs,
-						   lle_to_cpu(recv->tdata1),
-						   lle_to_cpu(recv->tdata2),
-						   lle_to_cpu(recv->tdata3))) {
-			*out = _idx;
-			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
-							     trig_count * sizeof(*entry));
-			return SBI_ERR_NOT_SUPPORTED;
+			return rc;
 		}
 	}
 
@@ -867,6 +883,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	void *shmem_base = NULL;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 	bool tdata2_impl, tdata3_impl;
+	int rc;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
@@ -880,12 +897,6 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	if (trig_count > hs->total_trigs)
 		return SBI_ERR_BAD_RANGE;
 
-	/*
-	 * SBI v3.0 sec 19.5 requires SBI_ERR_NOT_SUPPORTED when a trigger
-	 * programs a non-zero value into an unimplemented optional CSR. Only
-	 * the "whole CSR unimplemented" case is caught; WARL bits tied off
-	 * inside an otherwise-implemented CSR are not.
-	 */
 	tdata2_impl = tdata_implemented(CSR_TDATA2);
 	tdata3_impl = tdata_implemented(CSR_TDATA3);
 
@@ -905,18 +916,11 @@ int sbi_dbtr_update_trig(unsigned long smode,
 			return SBI_ERR_FAILED;
 		}
 
-		if ((entry->data.tdata2 && !tdata2_impl) ||
-		    (entry->data.tdata3 && !tdata3_impl)) {
+		rc = dbtr_check_trigger_config(hs, trig, &entry->data,
+					       tdata2_impl, tdata3_impl);
+		if (rc) {
 			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
-			return SBI_ERR_NOT_SUPPORTED;
-		}
-
-		if (!dbtr_trigger_hw_supported(trig->index,
-					       lle_to_cpu(entry->data.tdata1),
-					       lle_to_cpu(entry->data.tdata2),
-					       lle_to_cpu(entry->data.tdata3))) {
-			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
-			return SBI_ERR_NOT_SUPPORTED;
+			return rc;
 		}
 
 		dbtr_trigger_setup(trig, &entry->data);
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
