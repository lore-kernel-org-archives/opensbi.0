Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9671EC43458
	for <opensbi@archiver.kernel.org>; Tue,  7 Jul 2026 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEsYwbvLCfL3U64U+P5wa6e7L35ldv0z7Agfp2jiGkM=; b=pJLWZHwZWMjpRu
	z+yrm250Kcnu4yVu8Yf36CifRzzlEGX+9x5q15stl3HNf9RB++ZCxCa/1mftgP+6PrRdZNfn/xCqw
	dAMhA2SKslqnjfAkri1BQXPUusNegGcUOUdLbHQGOzplru+tZohcClmqQWiuKvZnDFn96Pzq0q5yS
	DR3fax7lbwk4Afh4e/LmdTn/+QIVbqwnLxZiiKl/nnrXR9hqezHkGbBtN6rCmMhdg0rphjJ/D8fgt
	X/Rdx1jn0hWWnElO75ZI1i1d4tPg58tWxkR4ZoTW6xLjag7DXWfGdovx516PgJ0QauYtTl4dAbEke
	cHWJ3kkNjLBNff2A4DEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5Qn-0000000F0ul-0Ap1;
	Tue, 07 Jul 2026 13:01:45 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5Qk-0000000F0u9-44kf
	for opensbi@lists.infradead.org;
	Tue, 07 Jul 2026 13:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783429300; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=cpaKV2Sx1fRof82hfoFa0TrdNx5lkwZIlZslUu3zPzg=;
	b=Jfxu5iNzPoUBittxqiTimYIUsFD3w4+QwdHYei5zq/3meADeLnZLDkAqayyjoljjKjdVdzaDSZRlrqPf68lx2heKnyH8o+FdecQOdcg7XpRTKpldFGuv9sZ4S/nJRzJ50lFAt2WKUGX5mVYnb8BL8RpNuoBbEPzK47CIfTTarO0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0X6da6Pi_1783429296;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X6da6Pi_1783429296 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 07 Jul 2026 21:01:39 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@rivosinc.com,
	wxjstz@126.com,
	guoren@kernel.org
Subject: Re: [PATCH] lib/utils/fdt: Reserve enough FDT space for fdt_cpu_fixup
Date: Tue,  7 Jul 2026 21:01:35 +0800
Message-ID: <20260707130135.35276-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612075502.76324-1-cp0613@linux.alibaba.com>
References: <20260612075502.76324-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_060143_179594_37EE82F1 
X-CRM114-Status: UNSURE (   5.24  )
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

To summarize, this patch fixes a real issue where fdt_cpu_fixup()
reserves only a hardcoded +32 bytes when disabling HART DT nodes and
appending the "zicntr" isa-extension. On systems with many disabled
HARTs, fdt_setprop_string() silently returns -FDT_ERR_NOSPACE after
roughly 8 HARTs, leaving the remaining CPU nodes unexpectedly enabled
in the DTB passed to the OS.

The fix replaces the hardcoded reservation with a dynamic calculation
based on SBI_HARTMASK_MAX_BITS and removes the now-redundant per-HART
fdt_open_into() call in the zicntr loop.

Thanks,
Pei

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
