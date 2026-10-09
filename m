Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD26CA5FED
	for <opensbi@archiver.kernel.org>; Fri,  9 Oct 2026 07:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYu2QcDV/zK3IPITcQT1Zo0xdMeJ8kxq69rI1TfSxhQ=; b=LAw7ZL9QSwxYda
	ozBXiN8s5/cXa/e8CpLyBk8JMJzqeW+zFLSznj4hy9Gj4aCaGELesyhWmCjoEHp9VJDVSW/AKtexl
	jaX7LJ6+H4B7VMyqbfRFeR194FgqODicOicJtFPnY9QvD0Tm5ATGVLbvtdszFRgJJnkypHyEErmQ4
	+Xmotf7aELsDhLw9lz8zah1Rs+slYvz9+aJ2knQ6smN93x8XY3uYby7Yx4Dth+QSNlsREJQiUEuer
	DH+WqCUEYBPatiVOk81/sQcXfk9aN71qX/4is0QKz0GvHsItqDc5Vlf173FZYyFy/u/19gPy2eMBP
	/WFLkTRr3zPPgmpb6dlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4ok-00000005hc6-2BPk;
	Fri, 09 Oct 2026 07:14:58 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4of-00000005hbL-1Xjb
	for opensbi@lists.infradead.org;
	Fri, 09 Oct 2026 07:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791530090; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=Y+F2qdOUe8hhphq7HLlxF8tVCXO0kLlUqbRtpyAUEuU=;
	b=H0cX2WYkG/RT9IFUjUPPi7BgaCnkvA6hoL86dJ1HfeyTozRK9cf9dKgc9Juk5rM8WdkudeDr4q8ZDy8l5RmaEbsE/yS+1To4coQMdWwOOOoHy5LS2erTzl10g/5+UBeEJCnv//plBR5GSG6heVYiJdQSflymEOL1g6y2NP3hcw8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R451e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0XCSZujf_1791530085;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XCSZujf_1791530085 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 15:14:48 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: nickolai.zeldovich@gmail.com,
	opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: sbi: Install the next-stage entry as a direct-mode xtvec
Date: Fri,  9 Oct 2026 15:14:41 +0800
Message-ID: <20261009150400.reply-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006193619.735580-1-nickolai@csail.mit.edu>
References: <20261006193619.735580-1-nickolai@csail.mit.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_001455_550968_3A01F165 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Nickolai,

Thanks for tracking this down.

I ran into the same problem a while ago, but fixed it from the Linux
side by aligning secondary_start_sbi to 4 bytes:

https://lore.kernel.org/linux-riscv/20260413132009.133752-1-cp0613@linux.alibaba.com/

With the C extension, a 2-byte aligned start_addr is a perfectly
legal input to sbi_hsm_hart_start(), so OpenSBI should not turn it
into a reserved xtvec mode. I support this fix, and I see it as
complementary to my kernel-side change rather than an alternative to
it: the firmware fix covers every next stage, while an aligned entry
simply makes the mask a no-op.

Tested on QEMU riscv64 virt (-smp 4) with a kernel whose
secondary_start_sbi is 2-byte aligned: before the patch, "-d unimp"
logs three "CSR_STVEC: reserved mode not supported" messages; with
the patch, none, and all 4 CPUs come up.

> sbi_hart_switch_mode() writes next_addr unmasked into stvec (vstvec,
> utvec).  Bits [1:0] of xtvec are the MODE field, so a 2-byte aligned
> entry, legal with the C extension, selects a reserved mode: QEMU drops
> the write, the Sail model keeps the old mode, and the next stage starts
> with a trap vector that is not its entry.
>
> Mask the mode bits and install the entry as a direct-mode vector; mepc
> still receives the exact address.
>
> Signed-off-by: Nickolai Zeldovich <nickolai.zeldovich@gmail.com>

Tested-by: Chen Pei <cp0613@linux.alibaba.com>

Best regards,
Pei

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
