Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2394FCCA470
	for <opensbi@archiver.kernel.org>; Wed,  8 Oct 2025 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DNFQty9IV7n4vu+S3H2fVRyD3ugRLh4DTng/DA3GvRY=; b=UT5psGI/bhg7vS
	E5xDEubCl/QOLaovmLit4ikn/i3HBiM19MD3pHJ+a67Y5g3GmsxZmqGaNJEDbSVsc274g78YZXXW6
	tzQzJk9k97ms8JI/tY2V4MZqLe630Jc7e9Qgkt/RR+70V9EVbDoIDvvhCEKtaouL0xyRVFMY1jntv
	8eWyFwgKRnXcBqBTYgimsj6kV/xz/uAhqjjNhWDf8DCXJSj1jNx++o2c65P6o36VfWaZDtjCblv3Q
	4htB6RDavxsbKRIyRsuHBZXzT16KLM3QxeTJTmCCzmZEdqwhoE13rUlgGem9SwhtmHpkJePkCbVhi
	B/PsMc3Ne8x6okOtF0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Pn4-00000003UPa-0xNW;
	Wed, 08 Oct 2025 08:44:54 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Pn1-00000003UOT-3RVq
	for opensbi@lists.infradead.org;
	Wed, 08 Oct 2025 08:44:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so81476275ad.0
        for <opensbi@lists.infradead.org>; Wed, 08 Oct 2025 01:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759913091; x=1760517891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ISHZF01UkObMNj/HgBZZlv2+o6qyKHWkRXpkbMwhyqM=;
        b=d2AEeE3pWbWcGGsnzUwivGzRms+WVYqgIF0SF7DcGzOFRFSqV8MAkCdFAySg1fM7hl
         2bSaVlLeWjXBKTJJJfvYStpiGoCH3sha9CSWMu9tsYU9I26vez8Dw0LEjP9KBIfp/NAy
         Uh8SJR1IrrRvePWluU6+kd7dSUoqO9OzrI7x9YzZO9n0OIEKPcd8D1f3StZxplolWtw+
         lZvC8Vrz9WRbePXrlzNlHIrQSAaJijmEeiRJ8SjTO7rb/50FHaOvM2D91XiYJVHK5jYg
         ggg0Awmw92lA9vSiyZrDSckTGFVUOKThC+ou42cDhE9ayhktjarIqduK7jt5t7l8BsOh
         DWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913091; x=1760517891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISHZF01UkObMNj/HgBZZlv2+o6qyKHWkRXpkbMwhyqM=;
        b=rGfW+UNJ0VTlKUvh5YLHw+0Jo3nMo1U9VfNG82amU2Z08wLcR/tnirNsJCZacQGS3o
         GlLen/NyGS7pFmHFyJYGy6yqSDDMSdEyNu7XCdo3sUWmiMNeQmVbyn3zla/eBHhOHxoA
         IxuWSMrCWWLNeO6FpL7SB417u4uMRw22/3TXumJD+O4kXhN/exRcJ24y2pKS/PAwHOat
         p7BM/1+qm7lp3hhMWPs7ILlmA1U4mrDp9wMYp2m4aOgd6+m5fSVJrzoOs3XRuV2cpgox
         uh4lgSz5aVXmtSIcaQ4dE2ss3RB1juqZXDZgAuh9puUrxS5zfg1iBUbNl1NOMQkH6i1r
         Q9ag==
X-Gm-Message-State: AOJu0YxpQx5vxaPl8L06hQUie5ONkjuJ/HL5iB6dZiOkLcOypwZgYDpd
	O0dsQPavjqnNZ7ebFpLWj9hN4TmT0q6rXg0WveoueXYsX2Ae+Uzu32lf6D2o3yQLQ9kBQvW1srf
	dMKPb8fWG/ZJ99DH3aTdyS3eejjQmXq1EGvSOHxo0efhJtPGKiS/fFlZ4iEE2fMCoX1/fL+UJCs
	YfHkTCml9kLGolcYbyojyFhjeR9JALKkXrQ9nQG2CDlzQIGmfqie0=
X-Gm-Gg: ASbGncsV/laVW5LYVBcxDymmCpLKS4zvDkeqjE48WYDSzc3zZty+61VcejFw5k9PHha
	sh2HwyUw89nGUPCwY6B9nIf1LwzXMIA5IgjoBxoJRArY75D2GX3XJB0Ct1ZOv09D7zFAL1A9cgA
	G3lfY2989ynIbOHN6MUIu39Aaj1CjT+FKnL1eZHV5Vnobaumm6NNivy2vOQPuLO4NzKIIfU4icn
	wKcWDTUlDTirxKBNl3GHXHsYEskD3s6snlINw9/5TMNlS7BN0fxW36xHJDqxUh9QQRplHT+UT0g
	bJfSPqafVTn/yzFeSF4C2bv2tO/ZEDAK17DzJSWx+moWUVzveycTnpWDwQYHqC3QSPkemOJgp6z
	dDwHIl4aFLfszErEcpTPfFUMvlokXQvFYGPutb3IvK1QJ4rtsEeumrtNkxyxYet+dWzouXxzNZj
	1KQZscPJLwlICNeEATdJyPwHaIxFuiAV2qJbK40L/Xsn7cyKnpq78htq7s
X-Google-Smtp-Source: AGHT+IE/Y6dJbNEFpt+zI8hCEplbxaRPh8SCGL+Bmxli7GYcrUklz6UjDpI+GAfwSX/hrb58X9EA+g==
X-Received: by 2002:a17:902:b18f:b0:269:6052:3536 with SMTP id d9443c01a7336-290273ffc80mr22095825ad.45.1759913090626;
        Wed, 08 Oct 2025 01:44:50 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28ecaefd60fsm51327255ad.93.2025.10.08.01.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:44:50 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	wxjstz@126.com,
	alvinga@andestech.com,
	anup@brainfault.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 0/8] SmePMP bugfixes and improvement
Date: Wed,  8 Oct 2025 16:44:36 +0800
Message-ID: <20251008084444.3525615-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_014452_022732_1F677EB2 
X-CRM114-Status: UNSURE (   6.27  )
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

This series improves SmePMP related functions and fixes
the access fault during domain context switch when SmePMP
is enabled.

Yu-Chien Peter Lin (8):
  lib: sbi_hart: move sbi_hart_get_smepmp_flags() to sbi_domain
  lib: sbi_domain: allow specifying inaccessible region
  lib: sbi_domain: print unsupported SmePMP permissions
  lib: sbi_hart: return error when insufficient PMP entries available
  lib: sbi_domain: add SBI_DOMAIN_MEMREGION_FW memregion flag
  lib: sbi_domain: ensure consistent firmware PMP entries
  lib: sbi: sbi_hart: track firmware PMP entries when configuring SmePMP
  lib: sbi_domain_context: preserve firmware PMP entries during domain
    context switch

 include/sbi/sbi_domain.h     |  11 ++++
 include/sbi/sbi_hart.h       |   1 +
 lib/sbi/sbi_domain.c         |  98 ++++++++++++++++++++++++++++-
 lib/sbi/sbi_domain_context.c |   4 ++
 lib/sbi/sbi_hart.c           | 116 ++++++++++++++---------------------
 5 files changed, 158 insertions(+), 72 deletions(-)

-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
