Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6624F606A31A
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gagrSj0l;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NBpkxV/d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SHpKEIdeNHk0C0ZxsvlRiW9mAIXMDUf3ZAnnrMe7HyI=; b=gagrSj0lAfImbUyUHlVgHCRHF5
	Pq6iPLNmJRPiTMoiaKoCKUtgh8jH38X4jL/57gyc863Z9CrNnMOt0LRvA+9YyqTIScYUE2AOOKAx/
	lw2vJwr8o7mjq+bOFjcu4ZaTVf3bnRkWvAY40mr7OzBKMx4WkrZvAAIBST9ftH5LQ0svb87CHNTax
	T2OlvByyglWsg4tvt42WwRsP2DMtfQXkWSiUPe34mJ5Xam+FJto+mJzse4wkB3ewNMe94yIbF5PJ3
	CY+hbbRRDbyqgMaOtu4dRm7CQMrQHrycVCjcz2gb5f/32Yj3tfTsLRCPQXCc26oZcko+zNbnYFgel
	B0kzFq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXs-00000009iQF-0kLc;
	Thu, 29 Oct 2026 16:00:04 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXp-00000009iMW-0rlO
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 16:00:03 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-537548b811aso19869711cf.3
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289600; x=1793894400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yj2USzT0ev6tkTpKB2v6WLXyKaebwkBWV0p59nvBUOE=;
        b=NBpkxV/d/41+XuqaX7SZy/pCXtTJLqxpnCmABfN2dsu9RTON//XePJRoTLn8450YTA
         4jRpYAITK/6TdYJDk4cB9wAMUIzW4pK+lFEAE4t8uHSC08z3+ZBGdarZK3ZhAui1HZgq
         F5h0u+w89KQf/D36kDGHcptmU081gf4oKxhvLCQ8IRsxfEkaN2kbbXb+awuE5qBOlzkg
         t+bp5NagVsibcx3x1HVbYQDq/GJjp0ajspazwPy92TjkMQr7BQwu8MbCK+mP3aRGxNaO
         r5nKOFTHVqZAwNMH9QWoAqZCH+llRKwClkylxxEl//hIlSo/nk9inIOJSeMa0Sq7HYD+
         ffWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289600; x=1793894400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yj2USzT0ev6tkTpKB2v6WLXyKaebwkBWV0p59nvBUOE=;
        b=Jg7Q4D+F8eH3Hy/YSuI5F0Oi5LppAS3bNgZxbc51rKL6pCGsdLQP4hu0FebvT2dsTr
         a2UFMmrelnVWRjxPOouUFY2klyc61vmoa3iLWs6JYkQWx7RCSA/nWuJp81hQML3RrOS6
         aHvwygxU/a0soDb3A4S98c2udySLP86h16sUlJTOnmOLpUgjEJPdnQvE4IHEHqtHL2+O
         74V2UmXEIVua+SWS6vkT3xifLBeHFvZGaQjXEahFWzH9sqJgUpu1AzffmkbjE9C4x+IA
         gVYGgr27O3NTo5i8pXJYMvWacQsugE4fyWej0d2sBY77nGLSHcrLBy4yDk3JT+93Yn26
         TrLA==
X-Gm-Message-State: AFq9FYKqMNCSEr1LDQ6mYtkwcga61CSHg9AqUwvBHgv7dQjtk+/eWVcg
	PTrPtqPT8btkd407F6X4nKeR8OSN1ZinHOAd9YNmMIeBSKzXvJyJznwKTpeiTg==
X-Gm-Gg: AYBFou2nn5QiS4bP6wQCnI54WZEX0AXpf909LbN3tjwruZLQ4XySfu9LG5wCULfClU5
	sqcnihReG+jAyY04V4lIh6x2iIw85VRHAFveBxBOwV4uhw3naz8tfrMPeF8jKqQTNXOPNfIUp84
	9Lmjgwm6s8oH761Is1R/8Ep/NtNORvoNF0tyc+c/WNba7vm+mhcw+LTVWr3z2e8XzDTZZOtw56q
	kM+Zy88fvXSdSJPNSDl89n2n/XSB8mVGlJ7hBxrvGe8BpaTBa4ED+HKrSk3JtX/jng6iwtXpOa7
	Ac/3Y3kcU1+3QD8njrnuxtacLa8XUIj/n2GmgIkt8PfO6RIhSnov332qBKsFVOyXkTfSFNhJQDF
	ShpaLew7Sm81y/3iKZGNTqGY7FlNRAHzB5CPlW08SnJSEq1ZsYq8inA7J7pTaIm2bE6QZpEpiNT
	7DhL01kK2ZCVikNwDP2lSG+BCbblx15gWAGHjet6+14FsfS+SWbr2m6WkUhlGs+jxsIT7EZZR15
	qTqVJP6vQ1GIntkEvg+CmDgaU3ay2hrCA+f003xw2XzmjCBynoRzK90HFvMJs6tf+VL2oXyn6Il
	HEMiJ4hdKT3igEZ2DQvmNRI+daPsStvP48PFH6ZqO7aIF99Yd4L2fwwHXc9Am29Pi0eP6J33mGc
	42SkrtoX3+y0lUShIa+rSuWm1ehULoP3LZ4c=
X-Received: by 2002:a05:622a:648:b0:532:cb9d:488c with SMTP id d75a77b69052e-53fcb20df87mr100445361cf.12.1793289600182;
        Thu, 29 Oct 2026 09:00:00 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.08.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:59:59 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 07/12] lib: sbi: domain: add domain lookup by name
Date: Thu, 29 Oct 2026 11:59:24 -0400
Message-Id: <20261029155929.586597-8-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029155929.586597-1-raymondmaoca@gmail.com>
References: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_090001_357556_402AF7D7 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Raymond Mao <raymond.mao@riscstar.com>

Provide a helper to resolve a domain by its DT node name, used by
sysirq DT parsing.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_domain.h |  3 +++
 lib/sbi/sbi_domain.c     | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 3e357e67..3cb49007 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -234,6 +234,9 @@ struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex);
 /** Update HART local pointer to point to specified domain */
 void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom);
 
+/** Find domain by DT node name (domain name) */
+struct sbi_domain *sbi_domain_find_by_name(const char *name);
+
 /** Get pointer to sbi_domain for current HART */
 #define sbi_domain_thishart_ptr() \
 	sbi_hartindex_to_domain(current_hartindex())
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 30588678..16df5533 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -61,6 +61,21 @@ void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom)
 	sbi_scratch_write_type(scratch, void *, domain_hart_ptr_offset, dom);
 }
 
+struct sbi_domain *sbi_domain_find_by_name(const char *name)
+{
+	struct sbi_domain *dom;
+
+	if (!name)
+		return NULL;
+
+	sbi_domain_for_each(dom) {
+		if (!sbi_strncmp(dom->name, name, sizeof(dom->name)))
+			return dom;
+	}
+
+	return NULL;
+}
+
 bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartindex)
 	MUST_NOT_HOLD(&dom->assigned_harts_lock)
 {
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
