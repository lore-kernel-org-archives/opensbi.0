Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE46C55182
	for <opensbi@archiver.kernel.org>; Mon,  3 Aug 2026 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7a3RiJJVaUPUnfa1LM+3e417HFxOMCze8V9CQcVRecU=; b=L1ZKYrJhoHBh1C
	AXIA4M4xV4YLJUOpKGc22oQxXfcXgK5Qgnrxqui64i69/4nJQ2g1egMF01wkW9KaPPMfDVq37TCWn
	4hpiHOVKyEMWWAEzQrq+Hnp8RwAH748V5yzAvPiBlyZlEa86ikUQSxhdaOZOkolnPmaBRfhOMV7VD
	XqjrYkrg8y/jTEO+vErNni+aUsy5BVXH4JjMJZdBz5BFo7niIKbILfxMV8fe6s9qHZVyMew+63Pk3
	plmjzbsb1RHvRsQmmzJqVvOnvx5ltuSupXYWpPpfAhwo6j3tPnRL8AUwG0nEnCRxI5Lj6ldNRR8lR
	77J+rljSIc3L3W5qs1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqslv-0000000HATX-0Z8R;
	Mon, 03 Aug 2026 13:32:03 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqslr-0000000HARH-02eC
	for opensbi@lists.infradead.org;
	Mon, 03 Aug 2026 13:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785763910; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=tnG2qojSjCiplrU3rmcofFSjaLOvd8b2lReDThindEo=;
	b=kPTyIqssFBRXiJPEgffpF6LrImzFCEOHMSJDulyEuNkWdI4gb94M0CiweBmFp/nLoAh4sAlQIzhGTik5sNJUUXwl9nmbK5cvWMNLrwINqasO6/phrsJxCEhu9yHp/9577g7SyltE0krSLYVG5YAB37oWa8nlGt8ea7PTo676JG4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R291e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X8KsyMY_1785763905;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X8KsyMY_1785763905 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 03 Aug 2026 21:31:49 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@rivosinc.com,
	wangxiang@iscas.ac.cn,
	ganboing@gmail.com,
	guoren@kernel.org
Subject: Re: [PATCH] lib/utils/fdt: Reserve enough FDT space for fdt_cpu_fixup
Date: Mon,  3 Aug 2026 21:31:45 +0800
Message-ID: <20260803133145.10367-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612075502.76324-1-cp0613@linux.alibaba.com>
References: <20260612075502.76324-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_063201_165895_87B168ED 
X-CRM114-Status: UNSURE (   2.69  )
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

Gentle ping. Is there any comment on this fix?

Thanks,
Pei

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
