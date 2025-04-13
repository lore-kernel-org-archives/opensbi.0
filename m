Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311CCC369B1
	for <opensbi@archiver.kernel.org>; Sun, 13 Apr 2025 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PIqEwB/fZUtIB10YhmSrvdt7y0WkHx2heYJ55Gpvc5s=; b=f9yyz6qkjf46ov
	bureCYg0DY14I6zgqBuaHmkuJ0PQB+W0qThMXS724wmFlNpYkxsn2vhexBWLdFmETFe6TTsfF5o+K
	VZq8ZLHdhvDyFPJrfHSJLfUGbXzHjk5vxSEaWccksBSc3BI5ohmnUQzvJnQbi6xglloIhjN0/Q5Fh
	SEkV6sP0z+qSHjR9crxHjsqS+XCEf1ZgerWudABjfkqW5RxA5JrVulwAuBeffinJzFGfjIaXY6Mfw
	yKmrKHuzl2Azx07yrbWSTjhC63GHfP5fX6ds5Cdv/d0l9reyIc/QlsO+pTri9JcqREo36L1KM+XlI
	NbByjzNfvpL5gEPozU0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yv5-0000000HIj3-1Szf;
	Sun, 13 Apr 2025 15:06:51 +0000
Received: from m16.mail.126.com ([117.135.210.7])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yuz-0000000HIfw-1Vuv
	for opensbi@lists.infradead.org;
	Sun, 13 Apr 2025 15:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=cq6ka
	oogJTi5KJzXXI2o4uMuMFMP1M0x4mzwnE6Sc7Y=; b=YS3TY61Eaod+sWizMnrka
	eIbstla3Aui0vEDOQ/rym3LE/E+yXoeMxaWFYEl9Zqn50AwOHC2BSug4tqeWjtjQ
	ByMVGnVfL+7NRvAgk68FMneA+nA21sNV1lZXzCuB+ynKxhpzBKZDIbs5CQMHEbKc
	NqRbVqE2KNikHqM7s62mvc=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P+H30vtnZUv4Aw--.52201S2;
	Sun, 13 Apr 2025 23:06:32 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 0/5] Some updates about sbi_timer
Date: Sun, 13 Apr 2025 23:06:15 +0800
Message-ID: <20250413150628.75614-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: _____wD3P+H30vtnZUv4Aw--.52201S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw17Cw1UWw13ArW8Wr43Awb_yoW3AwcE9a
	40va4UXFs8WFZ8tayUtw1kWrWqkrWUWw1UZF1DJF47ArW2vr4UJr17A3ykZF1kua12yr1U
	Jrs3JFy8Jr4fZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNxR6DUUUUU==
X-Originating-IP: [112.83.182.169]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5BcuOmf7rvXghAABsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_080645_768672_147E8AF1 
X-CRM114-Status: UNSURE (   4.79  )
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

PATCH0-4 are some bug fixes and improvements
PATCH5 adds sstc support for thead

The description of T-Head stimecmp can be found in the following document
https://occ-intl-prod.oss-ap-southeast-1.aliyuncs.com/resource/XuanTie-OpenC910-UserManual.pdf

Xiang W (5):
  lib: sbi: fix sbi_timer_event_start
  lib: sbi: Add error message for sbi_timer_event_start
  lib: sbi: Fix sbi_timer for Asymmetric Multi-Processing
  lib: sbi: Add error check for sbi_timer_waitms_until
  lib: sbi: add Xtheadsstc support

 include/sbi/sbi_hart.h          |  2 +
 lib/sbi/sbi_hart.c              |  1 +
 lib/sbi/sbi_timer.c             | 67 ++++++++++++++++++++++++---------
 lib/utils/timer/aclint_mtimer.c | 55 +++++++++++++++------------
 4 files changed, 82 insertions(+), 43 deletions(-)

-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
