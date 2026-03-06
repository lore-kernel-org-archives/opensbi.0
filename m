Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CBFF0181A
	for <opensbi@archiver.kernel.org>; Fri,  6 Mar 2026 09:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KkEg1rnh+/tV1/mThPKT2HdMpZvHwvs0jXMd4MnDF/Y=; b=xprwpMBeOpC3pY
	Zy77Iw9dll6dH/djHYnsmdgkXt1Tg6W4/r1X5SyxGEseLGDrnw2gkiCW7HHCri1CHQrnsk5Mb1A2i
	yDc4gmT30u+k5nxXwjerqFLho3H6U/RYh3Jbr9b2DsIItBHfwio130NeK7fLhGfouVtsJQlG8xTKI
	nZNxdWnCP+cjRcAI54ocf3rBNNWC1LazeUbmF2c706lUGfYO5sl1zR79GADb7g8SM7cVSOQsza2aF
	w5pned6B+nqO9oPnIgVwd4YcquTfK33adIbWeE0Bh82lfGIeTtcPgc2tWvOWCuVDz0IdZxkhZ1BW5
	dIkKPKfL9zBCPyr3mzRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRoX-00000003NSP-2JVV;
	Fri, 06 Mar 2026 09:49:45 +0000
Received: from out199-15.us.a.mail.aliyun.com ([47.90.199.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRoS-00000003NQn-0Y7g
	for opensbi@lists.infradead.org;
	Fri, 06 Mar 2026 09:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772790287; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=lOW3SrzmhXiSC49dzoZ0KoMP5T4Jk5g+66T0fulE+bQ=;
	b=T/pso0dNqZLzDGorY8lSaTlQAoCAHi7UOOe6s6xdFVjuYI9Ret5mekGvRHAdrKtFNaUbWOIb6JI0lTCjvQ976LObGgaiK1KW2A852ADTbWDNdydYPbDeZCaoTxhBmwEL7W2lXsoKXDxLiD6bXo4fmRmM2IFDG+MiJIn4bOYDErQ=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X-N0CJn_1772790280 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Mar 2026 17:44:45 +0800
From: cp0613@linux.alibaba.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	guoren@kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH 0/2] Add string test to SBI unit test suite
Date: Fri,  6 Mar 2026 17:44:23 +0800
Message-ID: <20260306094425.1918-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_014940_901695_02A8BD02 
X-CRM114-Status: UNSURE (   6.00  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

The string tests were added to the SBI SBI unit test framework; then,
it was discovered that the implementation of sbi_strchr was not aligned
with the C standard behavior, which was fixed in the second patch.

Chen Pei (2):
  lib: tests: Add test for string
  lib: Fix sbi_strchr to correctly handle null terminator search

 lib/sbi/sbi_string.c            |  11 +-
 lib/sbi/tests/objects.mk        |   3 +
 lib/sbi/tests/sbi_string_test.c | 372 ++++++++++++++++++++++++++++++++
 3 files changed, 380 insertions(+), 6 deletions(-)
 create mode 100644 lib/sbi/tests/sbi_string_test.c

-- 
2.50.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
