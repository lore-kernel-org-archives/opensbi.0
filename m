Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3069606A6BD
	for <opensbi@archiver.kernel.org>; Fri, 20 Nov 2026 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=amYtAV0v;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=EpWlAQ6n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sBexemml7tkQKs+zn6mBQ4kFNUFx6zuZmNozUsfwrw0=; b=amYtAV0vLCHljwCZA/h2G53sPl
	3Z8XR6ioSgyhWL8tTVbrGLVKnFvrnRhvptnAquNal1qJ/+KnRwkNaAv9t5rGmmqpVYwa9K8E0utSL
	4oadaNwz2XOydYWNTEUYATm/U/JzkLaDbMwMJRSjz6ikx+qrRXuqZXfKNgTNZhvM8BAJnJgO99C0s
	0cNfTwwHnPXkLmvnj5ORS9uS/GhCA8PKnzlgD7L3SwhnOxbDAL9LKgpJVgnoPQ5o6TNkxHXJ/beto
	dYslwBa4Q+fX8S787rugHbKrMtWOmGyo5faGGcnnB71XpRXOPnhKtkAJs8FY2oHl4pIoLrYk7OX9k
	h/3izusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlh-0000000GNuZ-12ID;
	Fri, 20 Nov 2026 23:11:45 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlc-0000000GNqT-104R
	for opensbi@lists.infradead.org;
	Fri, 20 Nov 2026 23:11:42 +0000
Received: from LT03 (dynamic-176-006-022-220.176.6.pool.telefonica.de [176.6.22.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6CD9742CEC;
	Fri, 20 Nov 2026 23:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795216295;
	bh=EqlY5Xs2MLS7revC2q4DIKku6V9/uFgTDz7x/TVg5xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=EpWlAQ6n2lYy/Fe4vwJ3Ne/eXVFrGLkskOCZn6K3MKGXnTKkpvkpZGct/QBBmpayZ
	 vgsn7I0/wv8udZQP5Cn5TMxLgC0ljOpvfG7Lng0sgoGq8sgejK7SrrWrGx0Fvi3f0l
	 baX5w0sbI+4aYw+Fc7XESlhzTy0daP6BUnY9RoRYwxYXYKTGIbwDOI5mXl00BK5o94
	 UwRm/VHkS9vxn+joKEkWy38bhhs1csHTnHvoQE7VQgUGuB6tXLzYZ9kbrXKnr/HOOG
	 S7KL8bJsYb/1v5cqieele4RWzeU7zgqt6D1d0dRXKOPozZC6KAZSyCpk0zXeL9UmxH
	 oBDey0npNbsgwkQob0n1sfIyMdE5R5epU4RNhyGTsqn0R9Ec19aQtPwrJc5c0spzBx
	 zEO0zhleTrwGXZourr8y+G2wEsRn1BxrJWNXcHayBaOM4ErCxwenwnYeyiV02Hd0nf
	 Ii+xj6eUdenfcCS9WmyeSjObc7xNyJnWXj5RoRieO2OXRkDkk8ig2zeoouMOi3Z+gh
	 WOrtVVvulAfzLRgsqHSdcb24hkunz+zipJhCaO4i6YndtihiSF2EZKCAgdKlHcWe7g
	 a5amOum7pbgv0V11LDwcCzkTPdhIQvNIxXCo0IfsQn3TRwz/5TE2U6A/2t60GsKtT4
	 L+g+QT3bxnIsK+CtiojPxcZ8=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 7/7] lib: sbi: dbtr: reject a chain in the last entry of INSTALL
Date: Sat, 21 Nov 2026 00:11:19 +0100
Message-ID: <20261120231119.90214-8-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_151140_476372_C87254A1 
X-CRM114-Status: GOOD (  10.78  )
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

The specification says that the last trigger configuration in the shared
memory must not have trig_tdata1.chain == 1 for the types mcontrol and
mcontrol6, to prevent an incomplete trigger configuration chain. It names
no error code. SBI_ERR_INVALID_PARAM is the one for an invalid
trig_tdata1.

sbi_dbtr_install_trig() accepted such a configuration and installed a
chain whose last trigger points to a trigger that is not part of it.

Check the last entry together with the other configuration checks. The
check runs before any trigger is installed, so a rejected request installs
nothing, and sbiret.value is the array index of the last entry.

The chain field is only read for mcontrol and mcontrol6, as for the update
function. Other types use the bit for something else.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_dbtr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index a6b860da..f60cce7b 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -805,6 +805,13 @@ int sbi_dbtr_install_trig(unsigned long smode,
 
 		rc = dbtr_check_trigger_config(hs, NULL, recv,
 					       tdata2_impl, tdata3_impl);
+		/*
+		 * A chain has to be completed by the next configuration, so
+		 * the last configuration must not continue it.
+		 */
+		if (!rc && _idx + 1 == trig_count &&
+		    dbtr_tdata1_chain(lle_to_cpu(recv->tdata1)))
+			rc = SBI_ERR_INVALID_PARAM;
 		if (rc) {
 			*out = _idx;
 			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
