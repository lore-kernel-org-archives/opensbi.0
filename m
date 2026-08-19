Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0088AC5DF6D
	for <opensbi@archiver.kernel.org>; Wed, 19 Aug 2026 07:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ZGjhOWXt1v6QAG6UyyD2L78ndUmVPys/DRFAhg665Q=; b=aYT5f4+flBMQqb
	zKp6mHu3xRAkgy6ktrJ85iH0EwhJDBjXA8mi7JzGAgZV7aZTMPE/MSBvBLjEZOp1bSPwumqXEDCKF
	KjnmpGBqWQEELt4d6unO7yVNr/LBfE35xXL5shn9tNyQgFNJOIZJ4D/YS5GHRGwGb/A36oCrqZe7J
	lvPdHMIbrCzGI/URvIGzR5brR0elHTfZcnDpDoGERvNmcsgb2legd95U9sP2djjIMPSstpsvmtfqp
	QTqtvEjtnUilbPnj9C4Aj56KPxmBmv2gLdtfDM82ekaAXO7vTJDa8KdepYCdLZe2N3hutnhzZAICV
	zNRUOT9SNNnBnf7LW7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb5b-00000009Eso-3Tup;
	Wed, 19 Aug 2026 07:51:59 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb5X-00000009Eqp-3KeJ
	for opensbi@lists.infradead.org;
	Wed, 19 Aug 2026 07:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787125901;
	bh=gIm1Cz0k4NIUHWEtLmMkkxIsTdcMqRQkg4CoH/CWOi0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BDqf1I83SbEHS7MdDykaR6BUjxf2FbC2qMzuWbHlR7vDvU6fs4ehBIL7sqyYdxJmu
	 boL7XFWu4Skq+WeVfgL1aSAPLgtbrQdUfUjXPAeaLkDdJVnllfTNcKE3LJsXAEaJB8
	 ahRJdvlU7kODUE5PPoRG8ODZwVPw7QaG+3zAOuSU=
X-QQ-mid: esmtpsz11t1787125900t43a84871
X-QQ-Originating-IP: oyskutSmRuuWGGVQkE9FHezSV+3om1glg3YRBQoJS+Y=
Received: from LT-WUHUAMAO.dc.com ( [101.71.222.5])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 19 Aug 2026 15:51:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2647986116104251148
EX-QQ-RecipientCnt: 2
From: Huamao Wu <huamao.wu@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Huamao Wu <huamao.wu@linux.spacemit.com>
Subject: [PATCH 0/2] Fix domain assignment TOCTOU races
Date: Wed, 19 Aug 2026 15:51:36 +0800
Message-ID: <D574DD93352E25B4+20260819075138.31535-1-huamao.wu@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: OATpkVjS499ukZKfOd3ghtsMhq2YcXTbBki+FVYXTqs2WemyxNF+yDTd
	I5D3v2141aLu9B7aF5Ng1h5tQJwS70AqBeXtH/HPmtauPybNfB2KPdrYAUEMbLKgKw3y5vl
	Gcj99+1PHQGm4YV33mn+cmVBZcve6zpYnZagPINyTz9Klw0gLtKfJrlU36+mqvD+HjVnncc
	Q+mLPTpf8nv66oG80+dUwJwLq0GD776WwAkct0IZGAeAez02WrFliW/7GtUtA+bxQYz77pU
	8N63TBLEOVU00b5rJ1bBOhkvzXaimSTi4si4S3SWM46mUKTobSKT6YAZc7T1XWmUWZcElKb
	oKg++xMmeEV4qq34SmGzCS289Efpn/lr50Qu8Fu3NFyLK8oZtDD9HzG7K0LhJ1Eb5Xi768B
	q5bumIrDhYfT7MSto/6fGDtuabzFje7CjBGxaebKyll9BK9zZ0QdMN9dJaqHMWeepECXBak
	e/iMu8xmT4NuOiDdQz6AjX4DyjtAlZ0XJXmMEJHfOJ1gWqz3l6+vuwEDF4QDNafwnAlxUm9
	N3h8Gq8IPrvQL7Hg5wcVjoczjx8ptL5ABpRoEB53vQxhPi4LvmJkySlB1X9ABKpX47E8aZl
	7D1Ovz0HWGnueQvFYZgBkD1W+GBcmoSVG+fRKukHl7zo7dCQ2qhvTwkTzR8sYST+phB64Fk
	f0ZSFTJHHA+FvkZvmAj7U58I6HA0OUmjI9n1I8srdP14KLZl2tEZhxxzo+nbVIDh7D5ZnNh
	yHaIxeXXHKA5G89RxOjmxx2MXOgpubS+bJM+Bo5lz09uOAhGdjFLLm67yl81kpWB4Kc5kvU
	azt03bTdULhWTviYvBSTPjcF5aVcmh5X7xvJbqBmugZCfCpB1/3PRzhCKsc4n8vvJTq9CCB
	J6eOx+LfV3jSQO3Damz7tPQu0En09kEZa1O7K+Gx2QVOUJ43lz4QDECx7mZ0oYql8J2OWec
	F8I2UBrupes7Mi2eOyhLsQPHWoXhnSSVQqVdqBq9CIRR+T1Lr8nvh7CI5dlT4hqpvK/+bPE
	WVURWCzWZxpJkP57xQzCTjWO0EdN966cq8DfFofEZenaizDcwWZ7ch/gwDh64=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_005156_599372_554B4A9E 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

The per-hart domain assignment is represented by two fields that must
stay consistent at all times:

  1. a per-hart pointer stored in sbi_scratch (hartindex_to_domain)
  2. a per-domain bitmap (assigned_harts)

A concurrent reader is correct only if it observes both fields in
agreement.  Today these fields are updated independently, creating
TOCTOU windows where a hart transiently belongs to no domain or to
two domains.

These races were identified through code review.  On our internal
platform we observed symptoms consistent with the cross-call TOCTOU
described in Race 2 (a HART_START ecall seeing an assignment that a
preceding HART_GET_STATUS did not), though the root cause of those
specific symptoms turned out to be an unrelated cache-coherency issue.
The code paths nonetheless present TOCTOU windows worth addressing
regardless of the observed root cause.

Race 1: switch_to_next_domain_context() non-atomic reassignment
---------------------------------------------------------------

The context-switch path updates the two fields in three separate
locked steps.  A concurrent HART_START that checks ownership between
steps sees an inconsistent state:

  1. Hart A: clear hart N from old_dom->assigned_harts
  2. Hart A: update hartindex_to_domain[hart N] = new_dom
             -- hart N is in no domain's bitmap --
  3. Hart B: check assigned_harts for hart N -> not found
             -- hart appears unowned, HART_START rejected --
  4. Hart A: set hart N in new_dom->assigned_harts

Between steps 1 and 4 the hart is in no domain.  A concurrent
HART_START that validates ownership at step 3 will incorrectly
reject the hart.

Race 2: sbi_hsm_hart_start() check-vs-transition gap
-----------------------------------------------------

The HART_START handler validates domain ownership, acquires the start
ticket, and atomically transitions the hart to START_PENDING in three
unprotected steps.  A concurrent domain assignment can reassign the
hart between the check and the commit:

  1. Hart A: check dom->assigned_harts for hart N -> OK
  2. Hart B: assign_hart(hart N, other_dom)
             -- hart N now belongs to other_dom --
  3. Hart A: acquire start ticket
  4. Hart A: cmpxchg state STOPPED -> START_PENDING
             -- hart N starts in a domain that no longer owns it --

The ownership check and the state transition are not serialized
against concurrent assignment changes, so HART_START can commit for
a domain that lost ownership between check and commit.

Patch 1 introduces the locking infrastructure and converts the
assignment path in sbi_domain_register().

Patch 2 converts the two remaining callers (sbi_hsm_hart_start and
switch_to_next_domain_context) to the atomic API.

The patches are also available on GitHub:

  https://github.com/kasperis7/opensbi branch domain-assignment-race-fix

Huamao Wu (2):
  lib: sbi_domain: introduce atomic hart assignment helper
  lib: sbi: serialize HSM hart_start ownership check with assignment
    lock

 include/sbi/sbi_domain.h     | 19 +++++++++
 lib/sbi/sbi_domain.c         | 81 ++++++++++++++++++++++++++++++++++------
 lib/sbi/sbi_domain_context.c | 13 +------
 lib/sbi/sbi_hsm.c            | 15 +++++--
 4 files changed, 108 insertions(+), 20 deletions(-)

--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
