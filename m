Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5F0C87FD3
	for <opensbi@archiver.kernel.org>; Fri,  8 Aug 2025 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZ9+jLV3wGhQoj3KOWbznDFFid6ITBt4vgb3q0ombgI=; b=lJHDQHv29Y2xEo
	gOpDt9IEiyO2ZaeVBCaSGlHkMJvLza4PC42Ejnd+TVe5rU+mP+65fSojUyrdp/N3gjPANwswUyIY2
	cJ1Ds0DkkodbqnkPqvGu4WkAaM+W+raC5CHgj7ShOMTL4UMuqJM/FYVaM77QcrhqwI521jiQvaqW1
	TtUHSPIuVs7FjHUzpKuyxUE/VVwXyooio9fD65srtNv7lgc3GepZ5wjwP7Tv9qisgvDj2MiG45Xns
	KkMClwtmoCbi8t9gaeirqaT5G9OJkkOu5y/BX+KrFGcRqLURLKL7OVzDULq3GRoDDfagrAN2oc3jW
	OpX45oBsMVAXHmj3R0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNLu-00000002wWp-0skp;
	Fri, 08 Aug 2025 13:41:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNLs-00000002wWM-0gjK
	for opensbi@lists.infradead.org;
	Fri, 08 Aug 2025 13:41:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-459e210bd2dso10806655e9.1
        for <opensbi@lists.infradead.org>; Fri, 08 Aug 2025 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1754660502; x=1755265302; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcrkMTgtIuSMQsJSPujTyAZZ8VuRPO/2M2Z38gxgKF4=;
        b=kYQo5jj6KxF3qOSIy2zoTofeARaHDZsa7TC2NqHIKbWdulcb5nrTSDeZCUXu9aOiRO
         oeu/IKnVC0LctRNOwNea70xSpQKtI04VA5WAE7k0OWpRWPyxdxqPhiRC9qps6IjD8QVs
         4CkbvgNGcwQytAACrCqH/bA3xL+IBirgkEJy9be8iWq8AihsRTPDC9xQliSc3BgvxZn/
         3cIbYKRIl1pdKdDwM8FyOCdYE9qAEHFdzS2wMTYUq8L7unJVb8jx0BPQzGLhoNlS9rs7
         tgP6hw6h95s8xsncuNjXcU40Di6YW1Ypsfh/Y8LTDea9RVuAhpU+WAj1Kr+31mlaDZcc
         JuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754660502; x=1755265302;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcrkMTgtIuSMQsJSPujTyAZZ8VuRPO/2M2Z38gxgKF4=;
        b=kJFBJ6en4DiBBpCGlxTkj+AHzOUNGFT7ohq8VYJBgk/KBQIzcvPf834OZ+tF6C08Ip
         2qgoAZNe7FJlnLZOETCH3pGNeP94FCESHGvHWQkFupDrqfv19pDjHBjJjuvDGNBqm8jv
         e7YgWPvLr6UFn43h0BVjTol+RckkJwAvxdBe0hQR36bm9hJmZx8H5bBj6YVGhz2lhU4P
         m8td1tOPCb1/OXjRog5AE3IxEpihy5rwig6VPWondGsuSLZeIVgq6eBKv9dZzsrLFuYZ
         lbcZA3+mhzKXOuQjqp8bzs9gbLaYOm9UUpKZ4lYS73K6R+6NpYoIH50O9YYYl+qImPKJ
         4WQg==
X-Gm-Message-State: AOJu0YxiwQwDrikMBtRELKXH3fFtY1svwlTg0JFnQmrmamK2fk48WK0y
	BuGfloqN0Vgroq9QFw8ewI/2bE2fuetuDkLNa2M3f5BIYETxVlg1fLl4Kjtk4w/2tFEEVt+YCjk
	3o8O9
X-Gm-Gg: ASbGncv71PTIwjXnyq4g3R+BMwaNEGH6c7oSte65ya/rj6mhJdEdIb1JvCyLJrv6iAY
	65YD29c4oBPs/ZBOKmaZotuSvJKa1ootqGor+DlU5Gkx7XH63E09hERwIRU79MXKsrXvCCod73B
	IEkuvzkdjUtYJjnmt0S7CSN77xb+RKnCd/+GjQUO/0b/uX67tdwwVWoHXO9taqOFdtqNT9Cmw8h
	xoDCEZiRY1Wv+9Ayrpuj7mx9QUcbbVhRGHCKbdnmve1M8ysPNyaOQRNUAyIyGMG1mIXG+FQWsNk
	dYf4sF6hJXbzTJGEQ211mjsuJsN4gWtshuE84nf1E+PU12RVUdCxOuMGMi5+E0OrE9V5bG5FCJf
	WHbuUm2okaXeBtmORoXV9dkIB9FI5tMy0h48k+rEn0RzjruqpGAwQRBh4AOhZ1w42j68jIQ==
X-Google-Smtp-Source: AGHT+IFenqeoFvVjhWhEfkZApe6+NvUckZJJsRW4P+JUpqZ8321nwTFqUOqYK2x7tY1nJWY3vtQyEw==
X-Received: by 2002:a05:6000:4308:b0:3b7:915c:5fa3 with SMTP id ffacd0b85a97d-3b900fe7e69mr2777042f8f.24.1754660502055;
        Fri, 08 Aug 2025 06:41:42 -0700 (PDT)
Received: from smtpclient.apple (global-184-99.n-1.net.cam.ac.uk. [131.111.184.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9c7dsm30167232f8f.26.2025.08.08.06.41.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Aug 2025 06:41:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: platform: add CVA6 platform and support for PMU.
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <1aadc5594074447a8c38da0ac33b5235@thalesgroup.com>
Date: Fri, 8 Aug 2025 14:41:31 +0100
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
Message-Id: <1FC085FD-22F6-4FFF-854F-8E1186C46FD8@jrtc27.com>
References: <1aadc5594074447a8c38da0ac33b5235@thalesgroup.com>
To: LE RHUN Jimmy <jimmy.lerhun@thalesgroup.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_064144_223422_28C05062 
X-CRM114-Status: UNSURE (   9.73  )
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

On 8 Aug 2025, at 14:35, LE RHUN Jimmy <jimmy.lerhun@thalesgroup.com> wrote:
> 
> Classified as: {OPEN}
> 
> 
> Add a new platform called CVA6 (https://github.com/openhwgroup/cva6).
> Add support for Performance Monitoring Unit for this platform.
> This development starts from tag v1.5.

Does generic not work for it? My understanding was it did, and if
support for anything is missing in generic it should be added to
generic.

Jessica

> Signed-off-by: Jimmy Le Rhun <jimmy.lerhun@thalesgroup.com> 
> 
> {OPEN}
> <OpenSBI_1.5_add_CVA6_PMU.patch>-- 
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
