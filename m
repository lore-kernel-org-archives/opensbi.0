Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48FB606A31A
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H9TN4Q07;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OuOFkMGd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xsnG6KtamGAjHxDN0CwX+G4ZmDV5GKesNv//AgpIFRE=; b=H9TN4Q07I/cqgYpfn0VLpd5ewX
	1XgYd9cV6tPpOlzSAxtM0NKj5TJXBROp6HR0LwpLSzV/puVPmhx1drUSgJ0BZ+DyPX3ewrXkvgXYH
	OzyB1IQDVR9puvu1RAxYSHvk11fV/CdYDCqZViAe6L1u08NbRBwL9Xlce3NfcdBemCz9hod/PnH04
	JJOqBaU5RpXEF5h5i6cpojkT7eWUyzoeHAaZI+FwQQ4915cJjcMKQeh1/1nver5HM+cpC1/KKjZlQ
	80iQiuI9idn3FAy03lzi73Jd1UQceoWVaJQ5YVf62toYFH+CgJK2Y2y/k4Zk0fG7ZI0/vu/MYUVy7
	LPDsVJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXm-00000009iKP-1wKd;
	Thu, 29 Oct 2026 15:59:58 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXl-00000009iIJ-0Bq7
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 15:59:58 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-53bb57f1310so27524081cf.2
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 08:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289596; x=1793894396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2mk3gX4A+SZDGjRraZHw5woOiBpSUvgwbk53y2w1Z4=;
        b=OuOFkMGdChoutOBqzpF3NsbhyVIcazD+AMK0JwtU0r83dXsnKKZarPQ9dV4supLX+e
         kWamkH4q6TDePzqLJbuZtw1wAY+8Qv8vKkwo+NbgMma9aIDK3yoGE3s6bWiGy54PNnrq
         Yn/RZ1j/bzov5Eylan4MHGgyqdbQe7pS3W32FnjF3b8S7n/Tr3Mv6BF2BOYGtHUL2EqJ
         NhGs4pQQ9IDKdaPfCvKgMndC7/FE+WzHV/9tcTJV/eJa/ZvT2vdddh/UPvFkLuXYLOFZ
         MU1GmmlXpjsi4A6TIgMTU58SFyQt+2JfzLCv/o023EN4LI3XesNMhOk1b7y/8TToI7n8
         XFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289596; x=1793894396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2mk3gX4A+SZDGjRraZHw5woOiBpSUvgwbk53y2w1Z4=;
        b=bZhbbDA2ULTGKMatPs6vpsF2SYZu4xsG7kHWp6tlalPLVNC5tzZvW9lbsAnZ4IsqAb
         bsIcEGOGcEdAaybgf3cHMcy9jO8XKWLy+Ee9KH0u5tb1hoTyMRgCvTeNSUf+m6jWJpmR
         l9HJk2bmpQvX/5KezcQT1GxztJYpHH98K8Kg7Fk/xoSLIb2XfwcbQ4tBOX7DszJEDfS1
         jogb8uqJLwsj+5qQAYB4DV0RE6whuYFGu6VfOKCN/TXlIkQlxzU1PDYkmwPmH3I+lwk5
         WB6jR/6xXbDFut9dpT9+1q/9r1bO6ZuGSAjFaFK9hbmJyBYzmANBzCuSNVoShikc6fyh
         dYzw==
X-Gm-Message-State: AFq9FYJzSeNwNcD4hvFr+sKFkbdVOIsXfo1hre0LIQeHVHSTpQIA9h9o
	ahlGlQKH9CnqdbaPXmAiUWG3+zIifgaMHSpIhHZWi0DI1vypsypfTa5WtZM2+Q==
X-Gm-Gg: AYBFou2agCjsfr0f0zOUD4VPWCp5EwztlXndgJ9WNm2HJqjSkvBMMYGgtDcLQhqBDG5
	eOJdDKAieMf0CgULgEeAkz6tqG69eLzBA9GmjQVErcG7uKBBN/5lxlSRd1qao/mOJ0lrIdhXtmZ
	CGJHAxfRfjicgHFb8BSFcygjT/3zlCA9/eAjRRsQcUfA6rKxn9Hjp6NelkbuYNVEnMB/4C2Zrcf
	yRo2zAibZve0vafYeNIxeH+mVzEPk0X5IFiiQp/RulfrX5oGgDD94JBcDaaccsWppKjWmvTRrh4
	YON+XafO37+MP6Y/YDitr5U/yWNBRPiPk7BGaMwkQZrO9j72KlxZ/foxnKsEFjDRZenL92JqTpJ
	HIBsakf4o3XCYjQBAP7z4WmuWrjgrnPbLdffYxl0iZlTPKwdiW6/u/oVeCpIYfAFDSC4DJGWW2F
	zay9BdWPdIBDQcNUp2fVA/ih6npusJK1jlnFO7w4vSnGmO5hh84k+gNtYlzsPatm5eRYrhsvEh9
	u9w0l0JRklZy6A/FGQ9AhjebwAY56kb45ibgE60/36XsVqK2sLT0YF6U5dZj5r4lroGZQam9j2x
	hqyxIb30S5oSDGictUFeOga2DJC/DbwiciLhz0AnKQIJNcVyh/h9NWjCnxEVFEVtjKiWlWJAbva
	bPIaLU9zJbUc1ZA==
X-Received: by 2002:a05:622a:4290:b0:535:25db:17ae with SMTP id d75a77b69052e-53fc8db64d4mr101502521cf.11.1793289595693;
        Thu, 29 Oct 2026 08:59:55 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.08.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:59:55 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 05/12] lib: sbi: domain: ensure boot_hartid is assigned
Date: Thu, 29 Oct 2026 11:59:22 -0400
Message-Id: <20261029155929.586597-6-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029155929.586597-1-raymondmaoca@gmail.com>
References: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_085957_091265_55BFA322 
X-CRM114-Status: GOOD (  12.18  )
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

When boot_hartid points to a hart that is not in the domain's
assigned hartmask (e.g. due to cold boot hart differences),
the domain startup can skip starting the intended boot hart,
leading to intermittent Linux boot failures.
Scan the assigned hartmask and pick the first available hartid
to provide a valid boot target when assigned HARTs are available.

Select boot HARTs during domain finalization, after all domains have
been registered, rather than changing them during startup. This keeps
the selected target stable for physical interrupt affinity setup.
Preserve the configured boot HART when no HART is initially assigned.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 lib/sbi/sbi_domain.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index b3f5892d..604c5b7a 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -799,6 +799,38 @@ int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
 	return 0;
 }
 
+static void domain_select_boot_harts(void)
+{
+	u32 dhart;
+	struct sbi_domain *dom;
+
+	sbi_domain_for_each(dom) {
+		u32 boot_hartindex = sbi_hartid_to_hartindex(dom->boot_hartid);
+		bool boot_assigned = false;
+
+		if (sbi_hartindex_valid(boot_hartindex)) {
+			spin_lock(&dom->assigned_harts_lock);
+			boot_assigned = sbi_hartmask_test_hartindex(
+				boot_hartindex, &dom->assigned_harts);
+			spin_unlock(&dom->assigned_harts_lock);
+		}
+
+		if (!boot_assigned) {
+			u32 new_hartid = -1U;
+
+			spin_lock(&dom->assigned_harts_lock);
+			sbi_hartmask_for_each_hartindex(dhart, &dom->assigned_harts) {
+				new_hartid = sbi_hartindex_to_hartid(dhart);
+				break;
+			}
+			spin_unlock(&dom->assigned_harts_lock);
+
+			if (new_hartid != -1U)
+				dom->boot_hartid = new_hartid;
+		}
+	}
+}
+
 int sbi_domain_startup(struct sbi_scratch *scratch, u32 cold_hartid)
 {
 	int rc;
@@ -873,6 +905,9 @@ int sbi_domain_finalize(struct sbi_scratch *scratch)
 		return rc;
 	}
 
+	/* Select stable boot HARTs before programming physical IRQ targets. */
+	domain_select_boot_harts();
+
 	/*
 	 * Set the finalized flag so that the root domain
 	 * regions can't be changed.
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
