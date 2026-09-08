Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A471C79F82
	for <opensbi@archiver.kernel.org>; Tue,  8 Sep 2026 07:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdyv9Ikzt16Aef2J+LErxiTTXLBpRLC8JgfLlOAFkQw=; b=d6JcwS8J8H6iv3
	YdqmUlR4PwshLZXvsC9wTTdKwlPlgi0J0/xSMZyU95FTy7Po13zd3hYjUhKdRubHEKpcyZixqnNh6
	PuHVcPttDj8B1ZiuSbtpxU3ZPX8t724/zBkXK7sxJTpxLnpYQpYUsFg65pvyDsxzPw7l9cQZ8OKTX
	IUeJMeDBQOaqv/WzPiAT4RKtfvEizPjIjO4gj41WSLjRZxcc+IqX3j97K0DgSOpL41NXPw3WSiNB5
	vVfPFX0UCkB73rfV4i3fXkXry5w9WK1NTaCVTUDOJhNUV859GzVjctTAifOA5DT5LhxXrXLJNMQlR
	Djn2mZnq0OT73vFzc0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qNP-00000008I1c-2PGn;
	Tue, 08 Sep 2026 07:36:19 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qNM-00000008Hzq-0l7I
	for opensbi@lists.infradead.org;
	Tue, 08 Sep 2026 07:36:18 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-39266382df6so3353391a91.3
        for <opensbi@lists.infradead.org>; Tue, 08 Sep 2026 00:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788852972; x=1789457772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FUb3b7A4qRFPKos2NkavXnDcIiGLrQI+gQwR3OW0V7M=;
        b=Dm0Dbe84BiYjnvrGBZGMthNDKuxdR/m1zkB77smHq5Ke6vdLOvZFL0QFsy0owZWEo5
         /R2Hb9NEC8QxnTMm0gOH5A6knS4ZOtyQbYiPM2vnHcJ6NVZkFzMaoYmJ1VJNrXS36bqp
         btScvavC7bTXSLMVwhgf6WPr/CWQTW3Bpq9HDUoCoieRbnYpJv0/RxWm8Bh611vZI6jI
         HHhFnoclX5cb59gJHqBE6hDqZW4elpzjN50xl0CEEwZ/Cj21RbRgta1Bu1AmMAv1ccw5
         aEJjzdYqwUciwZBv1QTlhnT+eoq7n2dQ4SugpTnEhdasD6zF0wcI5cCRBnxJXqg1JkkG
         OHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852972; x=1789457772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUb3b7A4qRFPKos2NkavXnDcIiGLrQI+gQwR3OW0V7M=;
        b=mPh7FsCkCzYOoWMAO7agB4q1s4FL2apt67tv5RtlFwGUxD0oH0PWLQljS2XL/Dd42T
         a1cXcFopDMXDRyNVpY3JdJhe6tNM4EMabjhfYd/Q18TFDRGv+xr1FdmEGtitSe1H2hWN
         SmoFS2SprbIku6yhtG1zlDVY/RpEtro6Kgi498aFqtxmk1LbWOrYrkVahep4tmEReo8Y
         DgEyhkfamNcB642SvaFrHtJLPjJORUGHc72MyXHrJWYKZ9zOHgVVh3y1CZnzh+FH5g8Y
         OYNyW+iSXSNTgq4/Po3as8Pg5t15z38umwniAvJ8atPIqgiA4CWA/c7sYt9AvsfZh4i+
         3+/w==
X-Forwarded-Encrypted: i=1; AKwUvBwlzP6+R52WQNrgCqyOG4PSlHqWxKRJRXwFlRujmQvASBIIY+2k6pmfPamcLGARh41PHimRVe8f@lists.infradead.org
X-Gm-Message-State: AFuF++nDQF8/oWtSgIeufw/34V/GSwJ46XM05ObzwBHoZWegXsNOEmcT
	lK764fo0yMxbtZvwSNDU90LqoRSf41Yb+evxMYcFQacWhz5oVaOgWiU7CiVDxqaaE9M=
X-Gm-Gg: AYBFou2rlxMrXSQmDUg75DrdwvHMKlBJCZWViIauhal6yZkm1NKABY8LOhFhKXTPY5A
	RLwh32Hle4srYWDJR94y9kD0auKLIcDrbEGj+yVQVICx4qt7sTTAj040t4uzkCH5GLw/Mb9BlhQ
	3IWwal183b1+/kVzWVwktY5RZj0iZpvFnLH8BaZYZb9/ntA9QVhZUifd+VZ0W0XgJBbiPQgAKqm
	eegCxXizj2VeJFePfqwrKBTNi6v0iBAeg1UCijLzeKRiyvrZ7aB+RvOTlBgSIBE/J8R+AlNb94s
	YnEdfsViAz2hSknBn5jvfnAg4kw1xWn2fEiyb44JqTegbSOpv7T/Y/AaZyYu1i2YJe7cIarfAk/
	u7rD3NN2CuXwliCSL43WueUY2L98340BQNvMh+zal+7fKNDVaH6VvJvpQ8PVJgMUHfwnCAP713j
	0lo2LdS7fr1inREUV5m3C4AeHswFq8lymjW4DqmxTol7mFbv/ecHyXe+oDD3FTg6y4OtRt
X-Received: by 2002:a17:90b:2b8c:b0:398:9be6:f995 with SMTP id 98e67ed59e1d1-39b262aaf48mr44671715a91.20.1788852972226;
        Tue, 08 Sep 2026 00:36:12 -0700 (PDT)
Received: from plin-1878 ([136.226.240.205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26155324sm24272705a91.17.2026.09.08.00.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:36:11 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:36:07 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
	Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] lib: sbi_domain: Re-work boot-time assignment of
 HARTs to non-ROOT domains
Message-ID: <ap+653WY99Lto7CW@plin-1878>
References: <20260905131748.922920-1-anup.patel@oss.qualcomm.com>
 <20260905131748.922920-3-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260905131748.922920-3-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_003616_225134_3C35FA03 
X-CRM114-Status: UNSURE (   9.70  )
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

On Sat, Sep 05, 2026 at 06:47:47PM +0530, Anup Patel wrote:
> Assign a non-ROOT domain to a HART on first come first serve basis if the
> HART is listed as a possible HART of the non-ROOT domain. If no non-ROOT
> domain list a HART as possible HART then the HART is assigned to the ROOT
> domain.
> 
> This allows us to drop the OpenSBI specific DT property from each CPU DT
> node (aka "opensbi-domain" Dt property).
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
> Tested-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>

Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
