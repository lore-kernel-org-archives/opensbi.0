Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FFA606A31C
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 06:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ac5Khgz;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CGMOL/8K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sA5gJ9abOjrIGnNi3hVbMbdo4+NNLzp6QYkJlbtxLR4=; b=1ac5KhgzjbhwjW8NtiEQLaRwHR
	Z+7DmTSXSso1mXXkJSqq9MDDLL6duDXxyiaOx2Xv9A48kcUl2YBLDVNkiYWvAoIsXaefZODWgbZ29
	IJEwfTAdwi6KMi8Bv/t1fHwPj1NtPUCtnqj5bbz/Azgwv6j0kNmTccWWkgei1wh0rWePp8FhLSRiE
	GzL6SeB3H4NBnxipKjNLu8CuMyhBLyzcZ5LrdyyIN5dO8i06a7ewW9yCc1xIuoQY0W91Qm8xfuLjC
	4wRLjFQGP10QgvZh0nyuIG8sIlkShKeKhWwZ5phiM+ycV+TywEQZJGr1LXyOk4BQ+gZ1fBcEnf3KC
	ymieCdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJmu-00000008UBg-10b5;
	Thu, 29 Oct 2026 06:39:00 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJmn-00000008U9v-3jbF
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 06:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793255920;
	bh=4U9VkcUbjtVRQcvJAacHaGK3QDcrV0OvsgyALyCxQys=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=CGMOL/8KDJeJPwXj/vJg9t0+zs+gkclrjNqDLvyNL6rz5jYLLNSs/xsXEDTAyyLMe
	 hBeP4SB/dWmdVnIQvWzInSaw8FTyJPIs0dQuhUccb16NiVZ+QgcZEOApSNS1yGe2Cx
	 2srEAikMLV4GuDhnW1cDQVnmgkamC0wGhpFm1K+U=
X-QQ-mid: esmtpgz10t1793255916tf3862e42
X-QQ-Originating-IP: HxawBfNyR4o/XfVnLfc6c/JaqP57ZNM5kul6lYD72SY=
Received: from LT-WUHUAMAO.dc.com ( [101.70.125.129])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 14:38:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8895853402943305644
From: Huamao Wu <huamao.wu@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v2 2/2] lib: sbi_hsm: Serialize HART start against domain reassignment
Date: Thu, 29 Oct 2026 14:38:29 +0800
Message-ID: <2BBABD4FD63FC04E+20261029063829.783449-3-huamao.wu@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029063829.783449-1-huamao.wu@linux.spacemit.com>
References: <20261029063829.783449-1-huamao.wu@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MZQHZNohqAr1qSuUnt3VhB8YEr/NpxmMsBKgLZ7jWgtVQL6QKnLlC4+4
	t0bNXv8BDvacNZ+H0OrCnS2bPHfMw5AJcoBSBkY6s7huo7DtlWpXlRp6GdrHdLg3qPzORLo
	Gekcjl6VjOzCw3jxFnYPX1BTUW2FILwClA/jZvoyYqhLA4ZDoOfzkr00E3sHfVcvsAKSgAW
	Xhj50jzWPq0klQtjaueKzxf+1W/Cw4gA0r3t+vgh1EbILPTVU7jJKI89mkYdrRStedSAXyN
	C3xgrSPi2Gt/Gp06YjtZy/ZhWE0sAkpahpZkvbiJgd79foWmj4XTuRoi42mQeA1P2jSTSrH
	4Roj/gtUBuM7NsdgPgcksesUCytfg9qqEYjtwd7Sx0knfIiuvSYIrg5zCiRqc5SMdMnwhU0
	2KXylUlBN2mSuaYj7XF+1JhgGiQjxtn3NSlMW+BfjiNeyTr9j71WJ5zheTudQSTVYGQRLpa
	CVj7X2OC70y3+QY0gwD1UhCw+ufHGjuLEA8lm2onKf4lZ3rGt6hGS/dJG9haGC6Ryho9h7S
	whhg3cdftnlJw2QQ1pHxQDnn/0jI75fwQ7WLl8fmreLT5hBN1G/DQffMrGG7yN0E9g9ngis
	neuJTugCcChwJoMIoqM7y12xIzQ0GgEBndW+qW/zDu+8wqZf4WDICfM5G5gly8/CSs15MR9
	9zYGaL6SgmohQB8QpQ8KMwHyBlQYeFl6AzbwkQwIlm+D47XGHsh4gpzl/Y86en3QbAoNIz/
	rarJcB1AcQmzCBQJZ1RBbkuhDM9wthcjDRia2OS1YuzaJ8/qsxZe2RKL7SuG1kZ5zyHPG+c
	nrS+z6Ff93R125h3ODDoUt+WkXysxmSc4arLy0AeXOTbapJzJFEBnG1EgGJZniJfAQaoWUR
	WvfeKSRJujOMG0nyvMyMvGsx55sZLWjv54ulzt0tTLHzhOKImejokStMYstZpS+rnYfg7fz
	UfzalTVKjwi0+mduGVfnixWTc6NmDQTv73mFx6GUI2VzCQOWh79vtUOXTsKghRquW4u8=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_233854_556259_BD24703B 
X-CRM114-Status: GOOD (  14.11  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sbi_hsm_hart_start() validates that the target HART is assigned to the
calling domain, then accepts the start request. The validation and the
STOPPED -> START_PENDING transition are separate steps, so a concurrent
reassignment of the target HART can complete in between: the request is
accepted for a domain that no longer owns the HART.

Hold domain_hart_assign_lock across the ownership check, the state check,
and the state transition. The lock is released before the HART is
actually started, since starting it may run code on the target HART.

The check must use sbi_domain_is_assigned_hart() rather than
sbi_hartindex_to_domain(), because the latter acquires the same lock.
MUST_NOT_HOLD on the accessors makes the compiler reject the alternative.

Signed-off-by: Huamao Wu <huamao.wu@linux.spacemit.com>
---
 lib/sbi/sbi_hsm.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 0e5498d7..8cce94e5 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -318,19 +318,35 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	/* For now, we only allow start mode to be S-mode or U-mode. */
 	if (smode != PRV_S && smode != PRV_U)
 		return SBI_EINVAL;
-	if (dom && !sbi_domain_is_assigned_hart(dom, hartindex))
-		return SBI_EINVAL;
-	if (dom && !sbi_domain_check_addr(dom, saddr, smode,
-					  SBI_DOMAIN_EXECUTE))
-		return SBI_EINVALID_ADDR;
 
 	rscratch = sbi_hartindex_to_scratch(hartindex);
 	if (!rscratch)
 		return SBI_EINVAL;
 
 	hdata = sbi_scratch_offset_ptr(rscratch, hart_data_offset);
-	if (!hsm_start_ticket_acquire(hdata))
+
+	/*
+	 * Serialize domain ownership validation with acceptance of this
+	 * start request, so that a concurrent reassignment of the target
+	 * HART cannot slip in between the check and the state transition.
+	 *
+	 * The lock is dropped before the HART is actually started because
+	 * that may immediately run code on the target HART.
+	 */
+	spin_lock(&domain_hart_assign_lock);
+	if (dom && !sbi_domain_is_assigned_hart(dom, hartindex)) {
+		spin_unlock(&domain_hart_assign_lock);
+		return SBI_EINVAL;
+	}
+	if (dom && !sbi_domain_check_addr(dom, saddr, smode,
+					  SBI_DOMAIN_EXECUTE)) {
+		spin_unlock(&domain_hart_assign_lock);
+		return SBI_EINVALID_ADDR;
+	}
+	if (!hsm_start_ticket_acquire(hdata)) {
+		spin_unlock(&domain_hart_assign_lock);
 		return SBI_EINVAL;
+	}
 
 	/*
 	 * Ensure target hart is in correct state before updating
@@ -339,7 +355,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	hstate = atomic_read(&hdata->state);
 	if (hstate != SBI_HSM_STATE_STOPPED) {
 		rc = hstate == SBI_HSM_STATE_STARTED ? SBI_EALREADY : SBI_EINVAL;
-		goto err;
+		goto err_unlock;
 	}
 
 	init_count = sbi_init_count(hartindex);
@@ -356,6 +372,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	 */
 	hstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STOPPED,
 				SBI_HSM_STATE_START_PENDING);
+	spin_unlock(&domain_hart_assign_lock);
 	if (hstate != SBI_HSM_STATE_STOPPED) {
 		rc = hstate == SBI_HSM_STATE_STARTED ? SBI_EALREADY : SBI_EINVAL;
 		goto err;
@@ -377,6 +394,10 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 err:
 	hsm_start_ticket_release(hdata);
 	return rc;
+err_unlock:
+	hsm_start_ticket_release(hdata);
+	spin_unlock(&domain_hart_assign_lock);
+	return rc;
 }
 
 int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
