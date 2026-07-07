Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701C8C43458
	for <opensbi@archiver.kernel.org>; Tue,  7 Jul 2026 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnzVlqEjItmAOL1/0yIi14P+/a9kaaH1zbWN2lS2ZUM=; b=V/pdty3yD6oEDc
	Z6EVybg4uBrEvbYNaquqEo+piQeXp/DVrn0pubSJEN3VQzY0r3f2t419ylMMyf9lZyT4ql28Qsh+t
	icfCJhK8kw6UjLJv0j5jvvzyu/hDZtPIkPYBGz5h8YIfAa085vh3bbd6Mbe8O6kaWxy8N2OWpNGYn
	TIAY6bfOvqVJEIPdwsqs0cYCpN4agnitoFuN3uDE2+LhPmGNi3gu9PMK83I7R5xn5fR5I8RfS158Z
	9OQT1TeicOO+PhYTvjAcH5njem9Y4tw0oyps7F42oygnkkSaXh04XpQEoyRoJs5Ve3n5ZFv+jAE3t
	w06h3OV3F0VS5r32+pyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5Yn-0000000F1YH-0KjU;
	Tue, 07 Jul 2026 13:10:01 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5Yk-0000000F1Xg-1Bv1
	for opensbi@lists.infradead.org;
	Tue, 07 Jul 2026 13:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783429795; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=a0Ah7CpPauecKIME3T65b40lgiUn+sGzLDn7oO5P5TY=;
	b=voDX5hCv7mvLNPl8SDtBMTlns3a2G+QeeRo27Uwvpf61teOS6TO+gh7OlPn+XOzmUKd9r+8VAkV2LneFmvt/gNCaVD4N08SzJk0FAbvYBiKn9CljIjqk4cPzwd9ZucNJ37BE3J6iQiU2PArpNIkDV3jERrmXWENTKs86Z/rmTCM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0X6dbGIZ_1783429779;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X6dbGIZ_1783429779 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 07 Jul 2026 21:09:54 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] lib: sbi_ipi: Validate hartids against domain, not HSM state
Date: Tue,  7 Jul 2026 21:09:32 +0800
Message-ID: <20260707130938.40197-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612115208.118132-1-cp0613@linux.alibaba.com>
References: <20260612115208.118132-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_060958_481640_6BE5807D 
X-CRM114-Status: UNSURE (   5.17  )
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

Hello everyone,

Friendly ping on this patch. Is there any comment on this fix? Thanks.

To summarize, commit 37eaca4ab33d ("lib: sbi_ipi: Return error for
invalid hartids") added a weight check against the HSM-interruptible
mask. This causes sbi_ipi_send_many() to return SBI_EINVAL when the
kernel sends a remote fence whose hmask includes a hart that was
stopped by CPU hotplug, because STOPPED harts are excluded from the
HSM-interruptible mask:

  __sbi_rfence_v02_call: hbase = [0] hmask = [0x3] failed (error [-22])

This patch changes the validation to use the domain's assigned hartmask
instead, which still rejects truly invalid or cross-domain hartids
while allowing HSM-STOPPED harts to be silently skipped.

Thanks,
Pei

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
