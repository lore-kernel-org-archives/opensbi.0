Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C13D606A320
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 06:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QR+ibZQs;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=iViMLVKE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+t9aARTZyi4/mhRJLFYSdsHN4Kkd5HB8TZF1JUX3uB8=; b=QR+ibZQs1t1mwN9fEjTF+Enfzd
	QwuiskU9ULW86xs6VNMZIMrqIzc036gw9AB5jUiOHh2SVXPpZOGuxor//8DYyz+VIwaR9xu0Sz0JT
	poWIutdw3UK48wCLidBiurrAyH25XIAmg2yOvm0t7T4+0uH0SWCCQOr25GdtJSZdoD4RHv3ht98Dh
	EHo9O0nqkF3fEG8QQDhbsqHLeZNR+fXNezBtgfkPmnCEUTtk8ascpWW+yH2pQdOpGY3OM3Ya77FBr
	oHlanE4IgOk1jrI5vL5I0yB2KYpftWPSptJv5SiD/LJOjLeL5Jn7Yjm/SMTbdrfCTJau9jq55pL06
	HsQT0Zdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJms-00000008UB3-0PzF;
	Thu, 29 Oct 2026 06:38:58 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJmn-00000008U9t-3lms
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 06:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793255916;
	bh=GXecjcYEB8Bb3igeLU5ua81pQXiC8qEfNm7XZVtWTYI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=iViMLVKEP4kLj1UViTV2NfX5f2rt9oBKdBfPdkAtirfGBRSQhkZAC/87LVg1r1kK9
	 Vqh3L+ZvSMRQeL+X6KyZ4vw+kcflDSzQYZR//UjlD0IdGi72E+EXQW4AEwvJkkOjp5
	 2bz3l78QuvKK/B2WHgx6fHdvo/U4ULajb7/LLI40=
X-QQ-mid: esmtpgz10t1793255912tabd4bcd3
X-QQ-Originating-IP: eNs7SAEDszIukveixogwVqwsArqjOWVeCv0PrfkEFWo=
Received: from LT-WUHUAMAO.dc.com ( [101.70.125.129])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 14:38:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1638733173364387107
From: Huamao Wu <huamao.wu@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Fix domain assignment TOCTOU races
Date: Thu, 29 Oct 2026 14:38:27 +0800
Message-ID: <EF557A8ECB0ACACE+20261029063829.783449-1-huamao.wu@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MFLJ0yl68g4WGyiWQPMZ/ODBUhhSRwfbbmQ0G3edot59QD7Qung/dV9c
	s9Y+QtULl3t/e7/wqwwieMwfs/PV9SIMwVjAPiA3cbErLtfqz8oyCsgRPOUPnnFfF/85a2u
	wm09q8ZIt7RkULJ2fo3Qj4B4/JljtE1tOqPnuAIoLzvkFfi0P0hunTOd9ho6pMyRGdM/yPS
	PuhErFra7EDNhgLPiCT4JNANEKAYnqm0JwOeNKOfD2ao8wodAW6BOzZjcFEg0g6Yv0hmrhw
	eW55FbSgSROrt09VyAztszzhpo2/mXoAbG8Q4jagjj9dqT5qNu0UG86LQIyCq1+Ww3MZk2U
	TdUf7Rm+oD4nPX+Y5Dh95NeyjvNqbu4w2YmB5KnBQoYm/VyMTZm/bMgiXb/shY+9tmL6cLg
	fL2T/NKVSyt1zEvLbOhPm7hUTTjyQezjE+MskbNfY2K7+9ea9KUGQQK8kWLfcQEpHDKqirL
	aOVlrt6InslBmj63PRtyNuAnx49OoaMDGhkaYPoVhkTworIxGc0PEs74iDyYkb2S21zQlNq
	YgbZXTVAkQu71vGJEzGV/uF2sPBcgfzXHcXSoyD9kMCUIBo1ozUfu0caJ0S9OxlqdXFAukg
	UndUHkA4/k4/JAbf8qOJpyrOFpdFHfDPTei1U9UAMeF5zch+afvKOOS+ln9bYrvptKCSKZ9
	0g5UZMhf8WaSXzTkR3s2++Ahq6b5VvciGf3XRpr9dbyW6NpRGrWD4Lc1NQOOsWi5hdgL5Yn
	YCBB7aWjshxoJsC+53Eo51auuotPRAa7WFbb3znfd6G2ufi4kkGvo6vg6Odoei1aVVGEG1/
	2zHUf40HOFtxklkdcUaNEIuSIkgMfR4GqqaVQo4YwYEt5oIhfZjE0jmm+Fcj/J4NTLlgom7
	WIZ8SL2ybwUgku07Yp8Az/K8n157kNzf+GFAHnxrfJFzne0MnAM9PRujGOAChYJMHIRaXAm
	+dNQwZjr5ljdxagLMG2mknN+/K7d0MTP8ZDFPmPUu9VZNKjPuwmoVKZOjTjHvznIyA2/fLx
	DUYqVRxDZsJId+LyAgALiQTdYWovYq7OuPTOxd3AA3vNMz2euC2xbh/uCiNSLuddRzE1JNN
	R1X2ldDftGd
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_233854_480103_1A66ABCF 
X-CRM114-Status: GOOD (  13.12  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The HART-to-domain pointer and the assigned-HART bitmap are updated by
separate statements: the old domain's bit is cleared, the pointer is
rewritten, then the new domain's bit is set. While a HART moves from
domain A to domain B it is in no bitmap at all, and for part of that
window the pointer already says B, so a reader that looks at both gets
an answer that depends on which of the two it read.

Patch 1 moves the whole update into sbi_update_hartindex_to_domain(),
serialized by a new domain_hart_assign_lock, so a reader holding that lock
cannot observe the pointer and the bitmap disagree. Patch 2 holds the
same lock across the ownership check and the STOPPED -> START_PENDING
transition in sbi_hsm_hart_start(), closing the matching window between
validating a start request and accepting it. Mechanics are in the commit
messages.

The diff this series follows was written against b3f5892d and the series
is on d28bc6f8; the only adaptations are that the lock is exported for
sbi_hsm.c, and that the open-coded bitmap update in sbi_domain_register()
is folded into the updater instead of clearing the bit outside the lock.

Scope: after patch 2 every reader that takes domain_hart_assign_lock sees
the two agree, but a HART is still briefly absent from every bitmap, so
readers of assigned_harts_lock alone -- sbi_domain_get_assigned_hartmask()
callers and the sbi_system_suspend() scan -- can still miss a HART under
reassignment. Fixing that means changing when the set happens, not where
the lock sits. sbi_sse_inject_from_ecall() also reads the pointer and the
bitmap separately, and closing it would widen the lock into an SSE
deliverability rule. Both are outside the scope of this series.

Changes since v1:
- Reorganized per review: patch 1 is limited to
  sbi_update_hartindex_to_domain() and its callers, patch 2 only
  serializes HSM hart_start.
- The API names introduced by v1 are dropped; existing names are kept.
- Problem statement and fix unchanged.

These patches can also be found in the domain-assignment-race-fix-v2
branch at: https://github.com/kasperis7/opensbi/tree/domain-assignment-race-fix-v2

Huamao Wu (2):
  lib: sbi_domain: Make HART to domain updates atomic
  lib: sbi_hsm: Serialize HART start against domain reassignment

 include/sbi/sbi_domain.h     | 16 ++++++++++++++--
 lib/sbi/sbi_domain.c         | 37 +++++++++++++++++++++++++++---------
 lib/sbi/sbi_domain_context.c |  8 --------
 lib/sbi/sbi_hsm.c            | 35 +++++++++++++++++++++++++++-------
 4 files changed, 70 insertions(+), 26 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
