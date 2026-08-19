Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78770C5B572
	for <opensbi@archiver.kernel.org>; Wed, 19 Aug 2026 07:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVOHArF5KhWn9jYklIlFz9AMHMcXWU2l8y7Z07A87U0=; b=aqhECN1A7FGa04
	eU8+gcK3kfVz7zAxeykq71dR25fPQC3GWN752uKJn81sjX9bllyI+lZvKtP0EdwDkll4z29aKmi+I
	xvkByr+CIOUuBjBVigUoHqXtcz9kXeqejICgR4sFID9i3zUMnqXd4XKqp8ZFcWgF94JiB8SQN0fiY
	uQYxddWwKWfuU5lHV1cX7LDDKXpGPC2MPyM8BhzlB8b6C8gC5/ayIzT/yJU/hovYp3YSKtB4Uw1HQ
	D6a7MET6y8yOElrvWOD60RgpvCrfdYKqEPmd8nNUxwIRKAbMmJmpLZaiNRb7iEwGh2leUvZ3+FX0Y
	2jLhrOSBD/xzqDx3K3Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb5d-00000009Et8-0ISs;
	Wed, 19 Aug 2026 07:52:01 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb5Y-00000009Eqx-24MF
	for opensbi@lists.infradead.org;
	Wed, 19 Aug 2026 07:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787125903;
	bh=aTt2Ds+K/JxMO5l+wyzAQ7RkgDpMJXzn9yWPEY+CdlI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=h44KTEbVXdF4D6+CF6kHiq4AyTYcm2mLIfDQI/Gc3f7Ne9WolqODhyNCWBkNNCaxo
	 Nz8zzm75XQig0QhxUEfXaYVpGc2Ix3TA5vyZPgvUZepcHIn9RF4LNDCQVn1ezZ741w
	 UFT1p+RdybIexzCBLMP/2o4+RcmFSepMFhC+AvlU=
X-QQ-mid: esmtpsz11t1787125902tdee78a36
X-QQ-Originating-IP: bKsVy2ICvA0yNue7qDjGaCPQDwSVuMoSrnWfHlsqdcc=
Received: from LT-WUHUAMAO.dc.com ( [101.71.222.5])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 19 Aug 2026 15:51:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16803476132852463536
EX-QQ-RecipientCnt: 2
From: Huamao Wu <huamao.wu@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Huamao Wu <huamao.wu@linux.spacemit.com>
Subject: [PATCH 1/2] lib: sbi_domain: introduce atomic hart assignment helper
Date: Wed, 19 Aug 2026 15:51:37 +0800
Message-ID: <916EFC083B00F8AC+20260819075138.31535-2-huamao.wu@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819075138.31535-1-huamao.wu@linux.spacemit.com>
References: <20260819075138.31535-1-huamao.wu@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MyzYaaOJD7B3ooTcjaAFRQgunHXpdydHecuAANIcu0IvHxtTHEuN+XYq
	p7r3X9MlYUddo1cP6bw3QYyWbadEJhZUuYaH+ooiXiU9VG+iCySydJ4BgMAH8z3nkUN8DEn
	a17K1DQVJBO7TZuOX7012YiBuhLUbZvkIbKIHlvJP4ws4jGj/gQCFa0NvsUwNDordX5ot1N
	zlIVhZPmya8q0bvBprkoz89UbO4YRAKVHS3qQ25Gs/mvxO0oB1BIzUT/KQyokyGp4sijm8y
	WRsBL8aeJZWry/OhjWVjro6TQkKdR2wbEurCGsaTuDV5ku1I9Yofr7H4A8NRwiBPhwDCeMD
	IlhebK2BTIZEWrl8++YlpNPUnII9roY7egRbTBFgIKSV0xc3qNpAbGVOpTHEkLm008GVWON
	txeaYIHKKFVyRlo1dM2/aAT2/u99qKawv69/z2UDquQfuY0kD+hICGw+s8oYys+ypmu8k0/
	QXqy3KKa3++NhDedHMUr8ZPFD+mPq39tOs38M2QBn5N4YdPTjkGEt7Yqst0OY7kbPttQLSS
	KDWpHJUnTkDXILaVzS08N6BnRR1D7xpYSZTHijEzDzgH92FzL8F70LUkjNXx8ugo0RdlPW7
	ae6gFf1/a4z2ZlajJBcYlXWUF+u9+PtLuKfhX8qhWGZxbWCM4NJgEDbEV2vCgJzdCaLrpNx
	dCpkBuWr23yfMp6tKdoBhW+lEam6zsBxruyEm3KsaBwbKU7r3NYF02ZT4AwylX60F4ykjVG
	u9oE+O+P7nUGwLIxmMw0JJl2XCyz8cS3o0CDrrCHxKVKK+UHGJqaudtF7UjNjfUDQDftoD7
	dvlWn70Td8wWrTHhHgZ6mdpPyPgK8ex9DsPsiatRWd+KR2O8oIzv77gGsIN/gdqjffBjb9U
	6HNS7Au2GjV4WtVb+a/hFlDTloOmJhjo+q7XoUlKStJYmMBjPwGHbdJ7RZ3qa85NmCmDv4v
	y/D3iltqRTj5JZw9Vg7e8pXZr2jAaSL/HT/juWax8odLuq6TBd/Rq8rmdYida3b8KOcDPN5
	USs94R4FVTSSRcDD24cUNZ+Bqh0jx40TKtse1qVwpZZ0wi7pHpxDcs+ANZWVk=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_005156_991398_A5821BEA 
X-CRM114-Status: GOOD (  13.23  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

The per-hart domain assignment is represented by two fields: a
per-hart pointer (in sbi_scratch) and a per-domain bitmap
(assigned_harts).  These must stay consistent, but
switch_to_next_domain_context() and sbi_domain_register() update
them in separate locked steps with no surrounding critical
section, leaving a window where a concurrent reader can observe
a hart that belongs to no domain.

Introduce sbi_domain_assign_hart() which atomically removes a hart
from its current domain and adds it to the target domain under a
new domain_assignment_lock.

Add sbi_domain_check_hart_assignment() and its locked variant
sbi_domain_check_hart_assignment_locked() for callers that need a
consistent snapshot of both fields.  The unlocked variant is for
one-shot checks where the caller does not need to hold
domain_assignment_lock across a multi-step operation, such as
platform code on systems with an HSM that must validate domain
ownership of a hart before starting it.

Signed-off-by: Huamao Wu <huamao.wu@linux.spacemit.com>
---
 include/sbi/sbi_domain.h | 19 ++++++++++
 lib/sbi/sbi_domain.c     | 81 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 94 insertions(+), 6 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 16edd4ce..a8528bd1 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -228,6 +228,25 @@ struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex);
 /** Update HART local pointer to point to specified domain */
 void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom);
 
+/** Atomically assign HART to specified domain */
+void sbi_domain_assign_hart(u32 hartindex, struct sbi_domain *dom);
+
+/** Lock domain assignment state for a compound operation */
+void sbi_domain_assignment_lock(void);
+
+/** Unlock domain assignment state after a compound operation */
+void sbi_domain_assignment_unlock(void);
+
+/** Check HART assignment while domain assignment lock is held */
+bool sbi_domain_check_hart_assignment_locked(const struct sbi_domain *dom,
+					     u32 hartindex,
+					     struct sbi_domain **mapped_dom);
+
+/** Atomically check HART assignment and return its mapped domain */
+bool sbi_domain_check_hart_assignment(const struct sbi_domain *dom,
+				      u32 hartindex,
+				      struct sbi_domain **mapped_dom);
+
 /** Get pointer to sbi_domain for current HART */
 #define sbi_domain_thishart_ptr() \
 	sbi_hartindex_to_domain(current_hartindex())
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index fa69170b..9ea7b7cb 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -37,6 +37,8 @@ struct sbi_domain root = {
 
 static unsigned long domain_hart_ptr_offset;
 
+static spinlock_t domain_assignment_lock = SPIN_LOCK_INITIALIZER;
+
 struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex)
 {
 	struct sbi_scratch *scratch;
@@ -59,6 +61,78 @@ void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom)
 	sbi_scratch_write_type(scratch, void *, domain_hart_ptr_offset, dom);
 }
 
+void sbi_domain_assignment_lock(void)
+{
+	spin_lock(&domain_assignment_lock);
+}
+
+void sbi_domain_assignment_unlock(void)
+{
+	spin_unlock(&domain_assignment_lock);
+}
+
+static void __sbi_domain_assign_hart_locked(u32 hartindex,
+					    struct sbi_domain *dom)
+{
+	struct sbi_domain *current_dom;
+
+	current_dom = sbi_hartindex_to_domain(hartindex);
+	if (current_dom) {
+		spin_lock(&current_dom->assigned_harts_lock);
+		sbi_hartmask_clear_hartindex(hartindex,
+						&current_dom->assigned_harts);
+		spin_unlock(&current_dom->assigned_harts_lock);
+	}
+	sbi_update_hartindex_to_domain(hartindex, dom);
+	if (dom) {
+		spin_lock(&dom->assigned_harts_lock);
+		sbi_hartmask_set_hartindex(hartindex, &dom->assigned_harts);
+		spin_unlock(&dom->assigned_harts_lock);
+	}
+}
+
+void sbi_domain_assign_hart(u32 hartindex, struct sbi_domain *dom)
+{
+	sbi_domain_assignment_lock();
+	__sbi_domain_assign_hart_locked(hartindex, dom);
+	sbi_domain_assignment_unlock();
+}
+
+bool sbi_domain_check_hart_assignment_locked(const struct sbi_domain *dom,
+						     u32 hartindex,
+						     struct sbi_domain **mapped_dom)
+{
+	bool assigned;
+	struct sbi_domain *mapped;
+
+	mapped = sbi_hartindex_to_domain(hartindex);
+	assigned = false;
+	if (dom && mapped == dom) {
+		spin_lock(&mapped->assigned_harts_lock);
+		assigned = sbi_hartmask_test_hartindex(hartindex,
+						      &mapped->assigned_harts);
+		spin_unlock(&mapped->assigned_harts_lock);
+	}
+	if (mapped_dom)
+		*mapped_dom = mapped;
+
+	return assigned;
+}
+
+bool sbi_domain_check_hart_assignment(const struct sbi_domain *dom,
+					      u32 hartindex,
+					      struct sbi_domain **mapped_dom)
+{
+	bool assigned;
+
+	sbi_domain_assignment_lock();
+	assigned = sbi_domain_check_hart_assignment_locked(dom, hartindex,
+						   mapped_dom);
+	sbi_domain_assignment_unlock();
+
+	return assigned;
+}
+
 bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartindex)
 {
 	bool ret;
@@ -668,12 +742,7 @@ int sbi_domain_register(struct sbi_domain *dom,
 		if (!sbi_hartmask_test_hartindex(i, dom->possible_harts))
 			continue;
 
-		tdom = sbi_hartindex_to_domain(i);
-		if (tdom)
-			sbi_hartmask_clear_hartindex(i,
-					&tdom->assigned_harts);
-		sbi_update_hartindex_to_domain(i, dom);
-		sbi_hartmask_set_hartindex(i, &dom->assigned_harts);
+		sbi_domain_assign_hart(i, dom);
 
 		/*
 		 * If cold boot HART is assigned to this domain then
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
