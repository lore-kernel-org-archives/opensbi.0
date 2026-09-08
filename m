Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A22FC79F82
	for <opensbi@archiver.kernel.org>; Tue,  8 Sep 2026 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zp1/uDAJ0jIJVYpSsgswGLUmFc8yigb6JMeexT2yfUA=; b=s7avXeUZIuyVvv
	7uK10K7buRn6yfkvSqNg9DcFNx6glc2CP4OgzA1B0c/gUo/kjOov3dmeCRaitEJ/tkTxW1xl4Ccw2
	oaIdilZOdbl+VrlpFmo9l0U0hX4UI4JMAMEcy5q77HNo0UI5ZaV2GV8Ak6bixhf3qD+3+gPi5DL7O
	HoPuwGOx8vbBc62ldlWRH2kmjxokS7u/Ie/UWXnr5P4cs4T6bnjs5PsM1EIdV36kwUuIRftqeFkZF
	7kV9RJsYaXK+6QrakBo4RfxF716LSRXV9u6i+7jmGWW+LechfV/MEXktCfAbaIVlfGj4o76hQmq+/
	hpAYe/kxwbc5TNy2nFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rTs-00000008SGw-1Mfh;
	Tue, 08 Sep 2026 08:47:04 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rTp-00000008SFZ-3pw5
	for opensbi@lists.infradead.org;
	Tue, 08 Sep 2026 08:47:03 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so346310a91.0
        for <opensbi@lists.infradead.org>; Tue, 08 Sep 2026 01:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788857221; x=1789462021; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SNgTCFzAEIwWT3FnaNS2es8OZU4kV9RtsSKWjjZ647A=;
        b=D1BcTgE3+FhEU+LfSlREb9Zfsn07W5H71JSGwLuzTFS5z9oz3G1x6cUd6CB+kc/Rk2
         pmoV54vjcfg8b2lfxWlB6AX9nx2ir/bQmQokp+pwW6EXARM5Tfc0ocDvGSuXGe8C1lBC
         aErSy3UY/fbTJZkR31EmWx146YPYVcu5CfwguSyDgahGpQ+i/xQhYXVJxe8JxRSHWIYi
         rl26VMu3gIzDWlsYlG11gLNGmrgjfdz+8DzJEY5Uqoo2RK4MNl+AvyViXOC4VHF+tLPh
         IM+g2hSQ79tcwU93hCxNRuai9+we1x81ws20hOw9ZNtPvEOF2T13YbgWANpj21q9tECQ
         VyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857221; x=1789462021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNgTCFzAEIwWT3FnaNS2es8OZU4kV9RtsSKWjjZ647A=;
        b=Z7DtYsp/3PRL+rjkXc/j+UzcdwC9A3Ibku7apBQV4SvhUPr07ahpXGQTAUSjAZscyB
         +VGwXT9D2exmhKLL938RLgEo7N97jy8Oicu9AwpMiWJ4l3gs1SlSwrBXsdmiLf7+5TOP
         MW8YJMBEVoftoP94nsB7JbA49Xji029pFSMSZdpw1VfXP2BU0uJWchxyR3k+njpvTPiT
         TterAvb44KTx7BIAWazzAAaj12B0jogIbmVYwzYpn90+RAwgEug9BzF8BsicS/rquzY7
         1KiQQg7JxnqKbOGXsZ4fq+uZc2cuPmNpi7N3Qp+zpAKtpi85ieLLPazJLDFVN8XrBwQ5
         pHxg==
X-Forwarded-Encrypted: i=1; AKwUvBzwFlMiTPj3iDzXHpsvKg7iPDk1pLqbXQpqMhRmixRMS46QIsIrDRA3nJyup/Zy5lufDa+UxlpY@lists.infradead.org
X-Gm-Message-State: AFuF++kx0qMiSwp1JzFDd1vmXo4NpfKbDCVxVdJ8D1ubMeq96tWXo2/t
	oBoARGMjUV1EDXmK7ueTM/vTmn0rb8iF/IY7du5Mhhll5NmjZm1B5IGKftVQohe3+EE=
X-Gm-Gg: AYBFou1kjv5F4SIYhQUbOVo/viWeh+I8F8P8s4iOYOuwTin0tW+pRF4yKlWic/EZKzJ
	51KOatgHePH4xu3EuaFHtAz2x7dFNn43fSlivYLVEokbQ88QntxI46dmadjJwE1xDuIWCmqCONh
	R4lv15StugXwv4mzQAIvoX0LB8nbq+cx+BRsDZPuealzfzYMEovGXhrRPb8GtXzPUPqFWBwxU6w
	2r5j1HK45Sc2XLHHW6Bicr+Xe2V2i4Y7s7kPINO0Bbb+n9GgOuzB5nLzXMHwtVqfNbiakPZBqMO
	yK/QkDDWOI98FWOOSF4eZKvLlvGWwUd9v+CDILqWIDEy4UhExVxThutWnAqC9Hi4qOZA3ml2DmW
	xaQ4gvRFV5DpQwSEE63MhulKYa4cDqy8umxJLRLkxXDDLpzWqRMkGBIf6NmGDwXV4Z05iKb1mbz
	q2GzC/GxYoxpRAImT9FNzZRMKNKqjsC9KGim0gobkjZVVWyXz2RQPTjnZCUA==
X-Received: by 2002:a17:90b:4ad1:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39b8bd997f7mr4297715a91.8.1788857220794;
        Tue, 08 Sep 2026 01:47:00 -0700 (PDT)
Received: from plin-1878 ([136.226.240.205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm32922428a91.12.2026.09.08.01.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:47:00 -0700 (PDT)
Date: Tue, 8 Sep 2026 16:46:55 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
	Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] lib: sbi_domain: Introduce domain intialization
 order
Message-ID: <ap/Lf5kGH+GgFAEQ@plin-1878>
References: <20260905131748.922920-1-anup.patel@oss.qualcomm.com>
 <20260905131748.922920-4-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260905131748.922920-4-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_014701_958051_F4C49D0D 
X-CRM114-Status: GOOD (  11.04  )
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

On Sat, Sep 05, 2026 at 06:47:48PM +0530, Anup Patel wrote:
> Currently, the domain initialization order is implied by the order
> in which domains are populated by sbi_platform_domains_init() from
> sbi_domain_finalize(). This is not documented anywhere and forces
> unecessary ordering between domain DT nodes.
> 
> To address the above, introduce per-domain 32-bit integer to represent
> intialization order (aka "init_order") where domain with a lower
> initialization order will be booted first and two domains must not
> have same initialization order. For DT based domain creation, new
> "init-order" DT property can be used in domain DT node to specify
> the initialization order. The ROOT domain is assumed to have lowest
> initialization order (aka 0xffffffff).
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
> Tested-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>

Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
