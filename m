Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD32CCF9F8
	for <opensbi@archiver.kernel.org>; Fri,  7 Nov 2025 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/ul+Km+EwvUq7WH7V8BKsrXzmetOYLEICYSh9Q/XFU=; b=KUjMsgPRmteDjq
	BFx37WbhkIQsU7EahYJo86HO7fCHbvwoa1aYISvoSs+XvCzFamP/plVz10VUcKTgjBeOwh6oDfXXg
	/YtHV3b8cAbfKfAwXTu4GwGbSsU5YpA0e+Ras9D1v7I5BpmNk8SOTKAihhnvJPEhFe9d07M/Xu91B
	Yv3tN6wJ3oZn8hXUtZj2YmlS8l2+u7VpbnlufMWaPcSq+ZNVwVf/KoMSfnBTApIMWWFkN+c31wZff
	luBOk9syOyn+wbOpbAlCGKB8RO9rh0ANrAOvruUdnXFOcGqhQ8DNqrruq4h214cNtEUiwSw1AKiZG
	sWnudXMsa3jjaPlZSFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHbm-0000000GqkS-3hju;
	Fri, 07 Nov 2025 08:14:10 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHbk-0000000Gqk2-3QNB
	for opensbi@lists.infradead.org;
	Fri, 07 Nov 2025 08:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762503246; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=NaVbllwoMzmAXLkipMyAwO7jSUyL2oeHBLcFBVDDr60=;
	b=Tvzri+25tg6Zsiq3+3Tr7qB4vTU3LQJpXhEi26CxyPG9Qen+ufUHprOQTRxa/ISpBCtLe+/lNltgeBdUf1FKqB19DsyFvZ6UPGcyPK5I8AEccVEwmfI/BMpV4gqgTy0Q5N8B/m1q71Y6/H00IKjIbvy5H/tb8+QDD4AvO/mIcP8=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WrsIyaS_1762503227 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Nov 2025 16:14:05 +0800
From: cp0613@linux.alibaba.com
To: anup@brainfault.org
Cc: samuel.holland@sifive.com,
	opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: sbi: Flush cache entries after writing PMP CSRs
Date: Fri,  7 Nov 2025 16:13:49 +0800
Message-ID: <20251107081349.1902-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAK9=C2VJ2Sib35b8LNrm4tSwMJ2R3V2ae-B2euE85WTTk5Y82g@mail.gmail.com>
References: <CAK9=C2VJ2Sib35b8LNrm4tSwMJ2R3V2ae-B2euE85WTTk5Y82g@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_001409_036276_8622A5F2 
X-CRM114-Status: GOOD (  20.65  )
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

On 2025-10-31 03:49 AM, Anup Patel wrote:

> > Yes, agreed, the TLB entries must be tagged with the privilege mode, but that's
> > not the problem here. The problem has nothing at all to do with privilege mode
> > transitions, and nothing to do with executing code in S-mode, either. The bug
> > can be observed purely within the scope of the function calling
> > sbi_hart_map_saddr().
> 
> The reserved PMP entry under consideration is disabled while in S-mode
> before sbi_hart_map_saddr() and sbi_hart_unmap_saddr() so there is no
> way the reserved PMP entry impacts S-mode. In other words, we are
> not changing any PMP entry which impacts address ranges accessed by
> S-mode.
> 
> >
> > sbi_hart_map_saddr() rewrites a PMP range to allow M-mode access to some address
> > range that it previously did not have permission to access. The problem is that
> > this PMP change may not be observed until software executes a sfence.vma
> > covering at least this address range. So without this patch, it is
> > architecturally valid to receive an access fault when M-mode attempts to access
> > this address range (i.e. on the very next line of code after calling
> > sbi_hart_map_saddr()).
> 
> This is a fair point but we don't need to nuke the entire TLB. To address this,
> sfence.vma to a particular address range is sufficient. Plus, hfence is not
> required at all. I think this patch needs a complete re-write with
> clear comments
> for sfence.vma after PMP entry change in sbi_hart_map_saddr().
> 
> Regards,
> Anup

Thank you very much for your review. The issue you mentioned earlier, which slows
down many SBI calls that use shared memory, is indeed something that needs to be
considered. I will try to make further modifications based on your suggestions.

Thanks,
Pei

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
