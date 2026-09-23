Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17681C982FA
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIaQ5zPfyXJo4UAs6lHRetbNgB4Q12QY5IC4E9M6N9M=; b=KWCyiPdzjnKjpS
	ikoAXH0u5mxvo78zARwNxIDfxc9snr1wOQ7g1Ck66T0khK6Y1hWj3P9hOh0XvdioNZVKt+ZeM8L0i
	mpCnKQW/B7Fsrj7kKWvjYbvmkgB+Q2YHHilJBt8D7UleDDR0dKibfZvE1CFUiXsn3OCYCKDz3+o5S
	AptGufmhPHS0rjf3oC0K4k0vGiIxdumPpWE1cnyewE3dg6KnTZoD4kI5E+YOOvpZCea4XrhFaVjeP
	m8pOdVqnpxWAwqSx/W881C55dBU0BJp3Mbi9cR4wSqH5vDpg38Owr3e8nI9IkhjRrlJVKk/wmGTZ4
	2FCfXIKw7cDN+A+wCnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MEZ-00000008Gon-3weh;
	Wed, 23 Sep 2026 12:37:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MEW-00000008Gnx-18pc
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 12:37:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 58AD44E41029;
	Wed, 23 Sep 2026 12:37:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 200C560580;
	Wed, 23 Sep 2026 12:37:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66040103281E0;
	Wed, 23 Sep 2026 14:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790167069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pr/yVGebFHa7EHz7010auGBl14rp/Nnf+0FsrpkNvsA=;
	b=k8HCr6PaiXjI49QsKBymyMZsX6ycurBB3g6yPH6QLmciX44nMvoWNDYkrmeeO9xsqWqgmK
	yys99NWFvLWVzwXjwcIEykVtgO0QzYcVhiQ32xQ1bv0CYgtO/X10RQeJyCvTa9HDDEghHb
	2ONGaFolEpTKV6pcguhmWPJ03/oN7Vt8Xf7FtMUBw6W3vBeAC/3x6+0kavvoPmVNEtlBav
	F3j9bkYu9sGceI8L3hvfx+q7ByEIZbbtGyZwsGRz6rkLnv2ghdnhLNKx73t2ru05DxdF8T
	IzGd6aIkfK8ioTOr82JGtQgwfLu8HIYAGcrh2+OYnTKwNdouccz0SQRPX1QE0w==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
 Randolph Sheng-Kai =?UTF-8?B?TGluKOael+iBluWHsSk=?= <randolph@andestech.com>,
 Jun Chang <jun.chang@metanoia-comm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] platform: generic: metanoia/mt2824: configure PMA for DSP memory
 regions
Date: Wed, 23 Sep 2026 14:37:41 +0200
Message-ID: <EbPlUAIxQm2zOAYIbSlpmg@bootlin.com>
In-Reply-To: <20260902-mt2824-pma-v1-1-ada8f836365d@bootlin.com>
References: <20260902-mt2824-pma-v1-1-ada8f836365d@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_053756_473677_E11CC831 
X-CRM114-Status: UNSURE (   4.93  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

SGVsbG8gYWxsLAoKT24gV2VkbmVzZGF5LCAyIFNlcHRlbWJlciAyMDI2IGF0IDE3OjA0OjA3IENF
U1QsIEJlbm/DrnQgTW9uaW4gd3JvdGU6Cj4gU2V0IHVwIHRoZSBtZW1vcnkgYXR0cmlidXRlIGZv
ciB0aGUgWE9SIFJBTSwgTVJBUyBtZW1vcnksIGFuZCBSU0MgdGFibGUKPiB1c2VkIGJ5IHRoZSBE
U1BzIGFzIG5vbi1jYWNoZWFibGUgYW5kIGJ1ZmZlcmFibGUgZHVyaW5nIGZpbmFsIGluaXQuCgpT
bWFsbCBwaW5nIG9uIHRoaXMgcGF0Y2g6IEFueSByZXZpZXdzIG9yIGNvbW1lbnRzIGFyZSB3ZWxj
b21lLgoKQmVzdCByZWdhcmRzLAotLSAKQmVub8OudCBNb25pbiwgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCgoKCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
