Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABF1606A336
	for <opensbi@archiver.kernel.org>; Fri, 20 Nov 2026 23:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n1iJszjH;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=lx+0t5UC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aSIbb3KfGzlYtD787hLsG+2HouWowW6AKamQ5TnOauw=; b=n1iJszjHMEDP8JwDcDsxd8pohl
	wrrdFQ95B7DSpLazzswtmUhvCv4q4g3by1h1+c8Qv9QY+P3oN0IuvhSO/2aRV1WNoQn2SsK9d9Wyg
	vrxAsZ2D0tQ5k44cI5G0i0F9Sx8g2u6QtjWK7VBnLeqlTFf8gTC9iSwkZvkPK/j0uOdOcLr4D00V/
	Ec3xKXFUi4wyuHBQ42ZfS8Vpy5e1/2xiWQjhgdDMO1imbH8iXVLFPB46rk4Q89yP2ryi3Ti79Xdwo
	XxXw0FsOSGxugOwzGqdFWHtGpcGtLikOwZ3oYNvrnPiMzT0dQok86ZXFFX0vxnwjbBBKzWCeVySjZ
	czpTSgmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXld-0000000GNs3-2dc5;
	Fri, 20 Nov 2026 23:11:41 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXlX-0000000GNos-3rYO
	for opensbi@lists.infradead.org;
	Fri, 20 Nov 2026 23:11:39 +0000
Received: from LT03 (dynamic-176-006-022-220.176.6.pool.telefonica.de [176.6.22.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 1EEE440B11;
	Fri, 20 Nov 2026 23:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795216293;
	bh=lN/YGmWPqVrqzsnvi0w7M3jBKulsmqhS2l6/1GaBGK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=lx+0t5UCNAxbJPYWuMZsH3k9nLdaxbFpe6B9Zd8FFsxwdSZYYIvnwl8y1UlR+dL8s
	 4ENAcQH3cLBge9Z8Pm0umy06b+uIguYj2Vz+nK43pynZW8ZEpaQpI1K0awmpf1RDvj
	 pQeUdgIP3A/3jQOLdhtSezHKIN8j9DY3HemV0GlFxkIJXHNsywMz/A78iex5CDnmWk
	 iY3fMmNpD/3TpSruAK9bfJWwAbqRMUeSEYeVOo/YLGA4HegYpaqJJmZWb4SAa9yONF
	 wZQWkiM54qRkHhQeD5XRszO4wQB4JvJJLQ/E+16AIW/8oa1Gz6ycEBSSeShuxBRtfL
	 z7EnTvQc+uwKm7Z7oa39cIetgXTzJn9KjackuvVMDwraWKW9PSdeLpWq2z7uPvlygt
	 qzMDyKEHYAnYDTWomqXjP8KHQNvd3tl5ZfKG769KyUOha6u1B0aIiBS+AH9IgBnT1u
	 azDSq5qzDmF8L9C+MLdJH4dJ68h1m9toVfiNcA+qp78cYwUUIT+emjN3XkWmFyeLJe
	 ipyUTQvtgwI7AfqKnm98sZozWWFMLbDGKSgQAirqCXumBmEX8nHfsSMJhPqaFFYBdE
	 mMku2QP1AFHzEXv89SsV9lxAJyxSJ9U+4ZdORtrwmDv5O1X/Pnzx1Z9c5fzu++plOI
	 70b8MutX018UQlF5lN5K9P8E=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 0/7] lib: sbi: dbtr: improve parameter checks
Date: Sat, 21 Nov 2026 00:11:12 +0100
Message-ID: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_151136_401997_4E0DDF83 
X-CRM114-Status: UNSURE (   7.01  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There a numerous places where OpenSBI's parameter checks don't match
the SBI specification (patches 1-5, 7). Patch 1/7 is a resend.

Patch 6 provides a missing return value.

Due to a bug kvm-unit-tests reports an error for patch 4.
Enabling an uninstalled trigger must not be allowed.
I am preparing a patch for kvm-unit-tests.

Heinrich Schuchardt (7):
  lib: sbi: dbtr: check the flags parameter of SETUP_SHMEM
  lib: sbi: dbtr: share trigger checks of install and update
  lib: sbi: dbtr: check the whole shared memory range in SETUP_SHMEM
  lib: sbi: dbtr: validate the trigger set of uninstall, enable, disable
  lib: sbi: dbtr: keep type and chain of a trigger in UPDATE
  lib: sbi: dbtr: report the failing index of UPDATE
  lib: sbi: dbtr: reject a chain in the last entry of INSTALL

 include/sbi/sbi_dbtr.h   |   5 +-
 lib/sbi/sbi_dbtr.c       | 250 ++++++++++++++++++++++++++-------------
 lib/sbi/sbi_ecall_dbtr.c |   4 +-
 3 files changed, 174 insertions(+), 85 deletions(-)

-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
