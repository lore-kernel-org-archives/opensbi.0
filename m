Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ADAE8FDB1
	for <opensbi@archiver.kernel.org>; Mon, 29 Dec 2025 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hgXNEAdNJxOoTwZRhf5TVFdj+5HzWwb5PL5+Luuo/dA=; b=yqO
	14JkUhsz7kvLPgo5f2fQl3JhuNDrowUSCQbumg7TZlkd2XL7v51gn7jvj7HktFKveilccsaI7rM74
	l2PSq+7VIX5NYQWy9BLd4dtowkDEVoq55d8wdEjVzkP+k3PWGKGvrvO2TBbjyUfztbM1IHU0XyQ7b
	j4Nzku53Wri75tdPscDlDZPkmCb7seBlvdY1biLLGcUyeOBIzAgDT9ifEe8VJ0ohgzxO2AZzGIVHf
	4Uvt8na3V1shFTI4Yx1YtXrX00NDI1mxumVzNdRuI2X8Unfthpsz8JdRbrHZIv2XF9kxEjN1sfPbH
	dKbsbhADIxJfxjnuSS4WOvD3ubC0qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCPI-00000003g9k-4BFX;
	Mon, 29 Dec 2025 12:31:28 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCPF-00000003g9L-18jy
	for opensbi@lists.infradead.org;
	Mon, 29 Dec 2025 12:31:26 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7c6ce4f65f7so9511282a34.0
        for <opensbi@lists.infradead.org>; Mon, 29 Dec 2025 04:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767011483; x=1767616283; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CvCjQqsMlyQkFb61haZzELTqPt259gAs3WvWm81RZtQ=;
        b=Zu6Rih5uWFzJ7pFKBhIUbTCPy3LHROzZgz/UdJjggNxtz/uN2d8J9PCk1UQDQqAhnb
         1ystgblLtPfYV+3sPQoTnEsQqtm13+xn10njSiVy35AKbX8iwB6r5rCFhIxSMe7aHu5K
         gOq1qAchsB7O27HFkHy3Fj8UpBrUdLwKsAWwceI2Yg7tG0Ox9zr9gEOEyfE0nLgMSEie
         DsxocG6URPnLihNnbBN9lqNbs7nM/4rMDVbXHw3Ld+cncLrBDM4bDHftyTQLwNuVMfUR
         ak9TXlNoFQ/MLkwRpWlmCCJqCyYpsrMkNdvj5ZiPrJlY9ygHycbmE5XTsuDWEN3YqS6y
         B8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767011483; x=1767616283;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvCjQqsMlyQkFb61haZzELTqPt259gAs3WvWm81RZtQ=;
        b=PZDIOGBXsZLtX5nWm/QgDllrh3+onoidQJYIvmgScUL0v/Z4DLlMkXF9wzKhKpxlri
         c1qVjvNAMzmqhTSQTtPPtJG+k3Il/OKUh/ylUs2iR0mZRU0F3TFsThtteDZ2ps8MnfD5
         g1OwBrX8TyQ23ONqelnMqkff7wuIYTplgFhnKlXSrYpH6IQMdyTaPrBTvxxNarMVeqq8
         QZ4tb7B/GYUXUNv7vooTlAqiyxWKvtT8BzsbqeW9OGF9Buj2k+ZpeQtJFQCdZfAqqSpS
         m38zVJmp+lSwrGAcBVm2rqmD1p90hSIZCd2dQregx4m9BkVutgQI5Z03vOCKvqCMMYwP
         wtzA==
X-Gm-Message-State: AOJu0Ywtq5VNwcwZUtwvUwefp09FjPiAy5Y0pWXiAlQrxUc/HobkOIxI
	GeGBvhBiwN8hnXDgTT3Ffk7gvEEdo194XY0douWsqribvMhVe6OQ1YaQ6wQD5vPlf9lYu8JD2VO
	CBkS4RZCO962ImGT9l84Fz5AbpaI+3X+OmzNODt5E5RLfYSORkj1vWqyAoQ==
X-Gm-Gg: AY/fxX6e0iN7rbUKRHqgfWAfFtpCttDGl+8PnSRW62xFAQ1iec+jiVbGQzPjRN7LYaw
	wlpbUaX6GcWnUpI/XZ4svPSX3SZxfvg0+/7d7oesm2TNbSjBX4Yx0eJNXsiLpETpwJZnA7X1QeG
	Gg6ZM9lwEMrlWKadRn4yQQW/AdvaP3GRaRW7xRtYNoje3qs3tuhX6saDQ+qosedVUe8fvmDvZyS
	9ffQrwYa/Zkcnlo+rDz7CvG7sBjj/VL2CZ98IFIBSPXMFGzfjmY5gpKeTN7Yh2yRGYMHDE1meHz
	WYlSFCbSFqvjpBV0XQ8wbjnvUX8+o3lXwIl92hU4rlfKQ597tQtpNWjODskzqGleycKk
X-Google-Smtp-Source: AGHT+IH3bGyVPir958Jw1JCqG/+StBxN4u3j972PczZVnfmG7DIEEgasyhUXc5gWfGVb/FTqAA7RRUkxu1c4wWXmCcE=
X-Received: by 2002:a05:6820:222a:b0:659:9a49:8eb2 with SMTP id
 006d021491bc7-65d0eb4df20mr12487977eaf.54.1767011483331; Mon, 29 Dec 2025
 04:31:23 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Dec 2025 18:01:12 +0530
X-Gm-Features: AQt7F2pwjuZ7sgKoHasv-NnRFrndDon1E9qEvSX-U9iBWlbYKpoRs0j7l9vJDsw
Message-ID: <CAAhSdy07SwZZQsQrLd-R0oLDnb6fDwGkVMDCvHR3geXEVb896g@mail.gmail.com>
Subject: OpenSBI v1.8 Released
To: OpenSBI <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_043125_571637_FECBDA2B 
X-CRM114-Status: UNSURE (   4.00  )
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

Hi All,

The OpenSBI v1.8 is now available on GitHub at:
https://github.com/riscv-software-src/opensbi/releases

This release has:

* Safe and reverse list iteration
* Stack protector support
* Allocate heap housekeeping nodes dynamically
* IPI device ratings
* Andes QiLai SoC support
* SpacemiT K1 SoC support
* ESWIN Computing EIC7700 SoC support
* Moved Ariane and Openpiton to generic platform
* SiFive CLINT v2 support
* Simple FDT based cache library
* SiFive PL2 cache controller driver
* SiFive Extensible Cache (EC) driver
* SiFive TMC0 based HSM driver
* SiFive SMC0 based system suspend driver
* MPXY RPMI mailbox driver for voltage service group
* MPXY RPMI mailbox driver for device power service group
* MPXY RPMI mailbox driver for performance service group
* HART protection abstraction

Overall, this release has various domain related improvements
and also adds multiple platform support.

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
