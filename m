Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB4BC369D1
	for <opensbi@archiver.kernel.org>; Wed, 23 Apr 2025 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urUGQBb6W+JnLBeHWNwWuxLQkpxSE6jRzp72VHcXmU8=; b=00SX/I7msBsZfR
	f3mJIbBL3W8CPWaWOECZEBwrVmb81rx2McA4yFeAjl8anZ58rhAW+g/OfgfRDeofOtAAbRH5/gE7c
	Pbvv9Z+w1g6zn4XBarGQW3XtNl8tIuswQ4yCfJ5LvOXxho3+1QLx63aYgxpgmRJii26P91ssS/oCm
	ptsIWDoXfnbHUTaPMbC8wHbQo5GtDjpQtUb7BQN6AknJuLTjONJNsIRZEguZ+eiU83OQ2gUalTNd+
	gGkpEs6IIE0cyexWo1O7RIqloPhGLHIJDad3+ieXqX4hIAz4T3qgiuCofxTPjQlpsI+Yjbn2N419b
	fZcLLf736mJhj9U4+wgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ZnQ-0000000AXbW-1GLt;
	Wed, 23 Apr 2025 13:05:48 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YSc-0000000ANQn-1yb1
	for opensbi@lists.infradead.org;
	Wed, 23 Apr 2025 11:40:15 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-476ab588f32so91614141cf.2
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 04:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745408413; x=1746013213; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sGqZHDQ4/8Is1j2vzY+Fyf9O1bWXUigw9LVOrXlroww=;
        b=kHij22C2IPzFZ6ICZg0RN1r89I4hjZ++o7tCf7EeymGzTCcAC7AvwdGVsNpx2b1yE6
         9TfFm7dG0rTXXncUXIYDZjxrL75Llxavq/ybu4Fl3tUH5HD4tyTOhhFw/uoDsMHvJwUN
         IuQaXsKalT+LgBKE90KNmWqil4LEyVVtsLaoUAmHqW8eICmWxBuA025jL/a4JWa2EhWH
         6MJaIKC/F6H4Vg5yN9t89EV2MJNl9dUiy7izATQx0BmTWOkyeDFAmqSrW/uOPoSk/20T
         rcJIv3DaIbKwhWmxyusiyRNKV8AgVpFlWUXHWjDiZ/BD7Ga0v6+ChD98nLU09UWkeJvj
         +0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745408413; x=1746013213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGqZHDQ4/8Is1j2vzY+Fyf9O1bWXUigw9LVOrXlroww=;
        b=PgVk6ymY31lhhmaD4utUi3ySAKe12Z0Y/Z0MEBikfOvxJnr4usTpx9izdg9EDj34L2
         PEJHrFMK1zDNf3H7iMfM9AANq7bXB0L6G7zVdJ1KlRiibKBG06CnObQOamLG5xkrxlc0
         AjIZzH0ui9PfymhLFEC2H/0UrEpWdtFwOjOHoyju8OW4KYjE8kYnLMVGgb9cJP7HxiD/
         /RVVSY/8i7ISGxYL8MgPcuB4sEZBrgK9atElWacuLMJPFE+ssd5Mfv6B/9lolFdMT9WJ
         XGSov3WXkZVM3pxP6V39MnYqCKgBjVgGq+EQdVIsuoduNTgj6NV3UlTxn7NGlY3UT6Qy
         BhIw==
X-Forwarded-Encrypted: i=1; AJvYcCX1eVJSnttHbpQHK/cG+jjy6fvJ+V/Zulz6w7aL5qwpDYEXldQVyviCfqy4SeYT/HG1K6q5e80q@lists.infradead.org
X-Gm-Message-State: AOJu0YwhZ7pEhoKSo2LR5mky9Xa8Y2xA1ojWh4T+Ix9zkAddqQBhgYwE
	pWEOiP1z29WCVHqMcXyroEvL5EXmqWh6IPiiMYTJMAyUfgVjHvon
X-Gm-Gg: ASbGnctrPZHD+OmZI1e2dhzDDtzuV/IMWuHbEKweAjuNaXJdleReHOsOtvWsWSrYx8/
	J9diZiCBQcSonRuueSdLwsj8L7gNPxkvuLS5x88mwTQggCWTT0SgOPSEbav4yLamX7RkdZ3fSME
	HdYPrkkfzgG7mTykhLuD+SbKFNegBFbUWR4QlMxxstLpf2YictCTh7qhyg9XWnKjFLXab5DA7Fi
	51OTIO+e5jfcOSLL557M60uYCwlyi5Jp8t8MEawX/Hb7tQd6wLhGs4ulV2kyZGSY2DG7b0a1G++
	MGIKxalP9/aQFCI9
X-Google-Smtp-Source: AGHT+IE8mGZ8nYc1soQIdddU9deX0Gmss745OtJWOTfJ8VfAtqgZOsyGU8N6dWZP2PI0a1M6v/QV3w==
X-Received: by 2002:a05:622a:306:b0:477:5c51:dd10 with SMTP id d75a77b69052e-47aec4b25e4mr278794421cf.37.1745408413110;
        Wed, 23 Apr 2025 04:40:13 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47ae9cfa2e9sm67421871cf.76.2025.04.23.04.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 04:40:12 -0700 (PDT)
Date: Wed, 23 Apr 2025 19:40:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yao Zi <ziyao@disroot.org>, Inochi Amaoto <inochiama@gmail.com>, 
	opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: utils/irqchip: always parse msi information for
 each aplic device
Message-ID: <e4vasyo5t6q6ykuliv7h5iauvdmhkteskmorco27ylxfokuwyj@fusc6vq2gj4r>
References: <20250423080915.1101707-1-inochiama@gmail.com>
 <aAjPioFhjmdnPp5C@pie.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aAjPioFhjmdnPp5C@pie.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_044014_515218_04FD8D2D 
X-CRM114-Status: GOOD (  21.25  )
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

On Wed, Apr 23, 2025 at 11:31:22AM +0000, Yao Zi wrote:
> On Wed, Apr 23, 2025 at 04:09:14PM +0800, Inochi Amaoto wrote:
> > For a root domain, it may keep direct delivery mode as its subdomains
> > use msi to delivery interrupt. The currect parsing logic may lost this
> 
> Grammar: may lost -> may lose
> 
> > information and break the system if the domain is not set as MSI mode
> > or the MSI domain is not a direct children of the root domain.
> > 
> > For a non-root domain, it is safe to parse the MSI information of all
> > its domain and write the msiaddrcfg register. The bus should ignore the
> 
> Should "all its domain" be "all its subdomains"? This sentence is a
> little confusing.
> 

Yeah, it should be subdomains.

> > write on this readonly address.
> > 
> > Parse the aplic MSI information recursively for all aplic device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  lib/utils/fdt/fdt_helper.c | 138 ++++++++++++++++++-------------------
> >  1 file changed, 69 insertions(+), 69 deletions(-)
> > 
> > diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> > index 8939d90..0150725 100644
> > --- a/lib/utils/fdt/fdt_helper.c
> > +++ b/lib/utils/fdt/fdt_helper.c
> > @@ -6,6 +6,8 @@
> >   * Copyright (C) 2020 Bin Meng <bmeng.cn@gmail.com>
> >   */
> >  
> > +#include "sbi/sbi_error.h"
> > +#include "sbi/sbi_types.h"
> 
> I'd like to keep the including style consistent and sorted.
> 

Oh, I miss this. I think this is inserted by clangd plugin.
And they should be removed.

Regards,
Inochi

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
