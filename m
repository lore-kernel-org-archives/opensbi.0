Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C88106FD7E
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9K/DqC/INLGo2ufEKBP+7B8gPOet8ToxQi6Z3uy2/rQ=; b=1y53ztrS8a2th9
	QEPUdOjyDv+HNJnm/CiOrvPIB9wUx+nm2D3jlpKhgwjvK18y8In5+INjOycuBE7hlP8LEDbrjVDA7
	un+b7/wvVNaF3K46G6LkuM8Hi1HljzwoKoqvNEIwVS3EwH9gkXNMwgiwt6pbE71TbccV12Tka2Vih
	zJF1BFZ28rM9w1yCq5Ap3BPmSUIhZez2u7cwBHocxpcVHBwNRcBEaIpqLFoXDYqwCK+bAs2ETNnXp
	KTndsDDgYkAlu+NzhcVSLSTd6gS8hOg/lOg5SISVxHV+fslrkVup5W8z49178Q0QYazNDHPoHgshO
	+d7a1TtJV8FMm241xl6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwa-0000000Gbx2-3M9F;
	Fri, 13 Mar 2026 05:20:16 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwX-0000000GbwJ-1yqH
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:14 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c7381c4345cso746513a12.1
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379212; x=1773984012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/3wns8bZGQE1TDN50UALczjBdYHFQg3L/fFq2o/3340=;
        b=SDjiJ2DER+81jLnVS3uph1i8anUMsvMIBxuNa2UqNmh1hzsFy3BYJ74riydCy5ns3s
         3zIrL5WJ1k/P5S71qh9qMDrMQP+o3BkhsuEUc1TN9wZJTh3F4VTL4SGJRazx+HKBM2x6
         ioczO2I9P9E0NvDx2cUGXTE6I6qnxnSzUjs7NBb+J5sPwt4GDKFKb9r6Y/CXA0KbMSgf
         Z30qzLpiD09b6c09sn3/VxoglkYmAmqiDYI2enf7rl+hl3HUK7iaci04nL9OAxOuOx3Z
         SV7U7pLX3ufZv6SbziHR3RSGDgARj7Eo682isXLeL3hCBoRXnm8nV9854/Z1fNOADuEt
         JQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379212; x=1773984012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3wns8bZGQE1TDN50UALczjBdYHFQg3L/fFq2o/3340=;
        b=lUXc2xlJZiyDNqFgUc5GzvHfLwfcioswin3ckk3czNavFsCKnc0fbyrDYVRyJMKIvP
         KSs4WIpdypBPjMaI95RgHLruofEFByXXMnu60crre7N18KOj0CSy7W+4IgWWHfT1jazo
         mA9qUFYDaawh4/bA/OCB3sYhhDoPazK9UGBPcuSu7qpg0Kw/3krC4WmAOS579fMdcSN/
         nTmeXmjEBlUsp3aQH4sLqKj9/+WLon/MkY6JWG1hcAJH9WQ2mc5pZ/Oqua2ULnxIZICR
         ubxL9lrKgvJpjMiKEQ9mw81iga2Y00uQ/838qE1N/kNjDHsNDA7jT5QrNbCnrNE9LpFu
         WkkA==
X-Gm-Message-State: AOJu0YwfMu/UJzMbR0F5lcalQ+ej9xNpSCCHqnfcbAVNIyX4zkzCYmMo
	15NTZuqcQ8q5d/HZI2h29AnuQ6yvKHlnbMYw4ksxvW6gWGZvPg6GP3tgeoV/ng==
X-Gm-Gg: ATEYQzzeEF1epGiwXQODnDyyi1OHmQmJo22NZyGvlYH+Ye51KO3L7/4drtWDtEm2pxV
	A0Tt/5iZBssX6LeHAxsxZ9BNv1OIuqdqe+NaHxWsYMo6l7L9pCPOnPDeF93K2uJ6N7sso9O5Hz0
	c0OQBD9vRcYyPmFhDcTK1dX9vWip9qwCFhyiSAAYpFv0Wx1PxdqFUB/ULj7ZkCGcLdNe/V6TWUf
	nTfwTiLblTxW+ZptfYG5C0eSsO5/PfdOFO6dZfOfyn+1CRlZHnjRARkd2xwPBxf67ImAuly2As4
	z5wSdS4WjJMMpFNsCDZMEewKaBXGHG8io9aMiTn+12ZFNIkQ6v2fZ5CYq2VQY/Tk2KcPIu2h1E2
	YVItXnROGg7Dj4SObqVOYBZ78PHMHESFx5/ByEypJUvizv53DLLOS9blMp0GlRsUFcn9r19+LOC
	pFMnxiOobirEBXCEprte9/7bjh48MagWb6XSxiCi+pik4/n+z6ni4Wbj2tsse9F2entEie
X-Received: by 2002:a17:90b:3ec6:b0:359:f143:211a with SMTP id 98e67ed59e1d1-35a21c8507dmr1565955a91.0.1773379211903;
        Thu, 12 Mar 2026 22:20:11 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 00/18] dbtr: Fixes and heterogeneous trigger types
Date: Fri, 13 Mar 2026 15:19:29 +1000
Message-ID: <20260313051948.4017134-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222013_514684_902D14AA 
X-CRM114-Status: UNSURE (   9.79  )
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

In the course of implementing and testing heterogeneous trigger
types as found in the Tenstorrent Ascalon CPU, I found some issues
to fix as well.

Patches 1-11 contain fixes and improvements for existing function,
and make most of the new kvm-unit-tests tests pass. 12-17 implement
"heterogenous" triggers where different HW triggers support
different functions so we have to relax the 1:1 mapping from DBTR trig
to HW trigger index and allocate HW triggers independently from what
can satisfy the requested type. Patch 18 is another possible fix but
it relies on update to SBI spec so I put it last. I can move it ahead
into the fixes block if the issue is confirmed.

Thanks,
Nick

Nicholas Piggin (18):
  dbtr: Add consistent range checks to trigger ecalls
  dbtr: Trigger update should set sbiret.value on failure
  dbtr: Fix endian conversion in trigger install handler
  dbtr: Return correct error on install not supported
  dbtr: Do not support chain bit
  dbtr: Improve trigger update error checking
  dbtr: Check for invalid and unsupported triggers in update
  dbtr: Improve error handling for trigger enable, disable, uninstall
  dbtr: Read triggers should not read HW trigger if not mapped
  dbtr: Avoid crash in sbi_debug_read_triggers
  dbtr: Succeed operations with no triggers in mask
  dbtr: Move hardware trigger probing to a function
  dbtr: Rework install and update error handling
  dbtr: Decouple dbtr trigger index from hardware trigger number
  dbtr: Move trigger feature support test into a function
  dbtr: Heterogeneous trigger type support
  dbtr: Heterogeneous access type matching for mcontrol triggers
  dbtr: Work around specification bug in range checks

 include/sbi/sbi_dbtr.h   |  17 +-
 lib/sbi/sbi_dbtr.c       | 499 ++++++++++++++++++++++++++++++---------
 lib/sbi/sbi_ecall_dbtr.c |   2 +-
 3 files changed, 407 insertions(+), 111 deletions(-)

-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
