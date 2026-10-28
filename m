Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A2E606A31A
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lyCNlNp3;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=pTcDuqi/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T6jqCPhHHn+xg+XNREOlYHhPhTeyWSWCxo6AI1ee+Ic=; b=lyCNlNp3ryAhOA+283MuDc2W+2
	V/idObBpnBX6Y3d+C/MBKd1c0zZFZpdLErUsUiyfVZhSME7FkF2bTeAueas7xhsdE06qHRlwGeGvK
	+4vpnWm8vGCKYcX2C5pLUIjwObiSGlr+Tb6QnUtvKi6h7n4HXlvXzUCMdPcxjjImGiNMYrsf5R4V8
	Fvk1i0uVhrxV7MV5rbvCgKv2YdzXWKyEtkcziXfVV+JusoCPVihAofY/sRPE7w75DjISD/ctKzxk2
	BONCKT2wJCcJdPXflOAHqffHzZMJW4LFuY+u46CxAhuJMzMfc24WFXyNFrkX8FpZbobvD8W8eheDy
	wLQF0E8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Jr-000000070UH-3vNU;
	Wed, 28 Oct 2026 13:03:55 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Jo-000000070Tc-23UP
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 13:03:55 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C9CB63F67C
	for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793192629;
	bh=ta6FBJVc23CZtkQm3pDGvJSxxRzB8QdBlwYOIxCgz9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=pTcDuqi/Id0v0Jk4NOiRHCivlDVJHh6llve0O8hdlpM+3rpcxR04Uwsl/hYLqvQAK
	 wuTi0RSFRGxCO7QTv1/03x8elF1cU0heSTxsgdNLIdFGi2EUSfopM/S8CDpjhZqvJG
	 mx21rwcCMHlb7sZke6pKlkV4KASenupjJCsKID3NAnbI5EQKuKzJM05g5/ic9SZzeP
	 QegMTq6w7HNnQtY3KPeSRVS6c2VZsZ996tfqcOLfyE+WnF9e7bPC7NDVyu/YMNJrR8
	 QqI8AxkqsxnvwTn8CXy6pDXkcGLSdG4xrZR34qTb67lnC4wuy4hXO7ec5E6xXVF0Vj
	 VQIv+YXmCEFs+4QYIq07EdToW+I3mefWTSaleTjh8XIwZaOckcVE76sTfY5lBN52wl
	 4lRPWxOwWTKJ+Va876FNS3Wx+l3/6Z0trwn4erZgIzmz2bVo8NNrwG1xk29dCKRmjS
	 qGhXok2itYQ8/idTPhpaQXKypC2IQQ21JXjOHebVb9vYXhjedXgLyF+EauEAVsyfME
	 aQQ2xNavhkYBtvDkly1PxvWW6Q9ETYfBj2Z6sYeTic/ALiIkBSQvFB/uP2HBEM+vqH
	 ndReSo0gg4gaz8TtQpoOxFckjhio4/rNZVKo28oULXACRkuu21fxBPPGeucQxgE/Yb
	 +9RufnPT8Y7kM+PNmm7V6eQY=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso6880995e9.0
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 06:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192629; x=1793797429;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ta6FBJVc23CZtkQm3pDGvJSxxRzB8QdBlwYOIxCgz9g=;
        b=c7m4RDkMu7ekZj5dnSBF14pjHtQTRM+kxwzJrfSU0vb3mXilrCHOBksRmY/2NeWB/l
         U1lUlM744GCMt6iV4rGD1bEOMu9uGMipUooyBOBRGnJICqFlGEPMwdDTs8ysndXzCyKg
         s/u1iokhIQALUK1VQzN9ONg1kAffwor7LrD2/4/PRt3rJuCGHNWSZDPiycFL80lV49mG
         8nMDcm0Xqsuo6Z4PSNahZOc8/LAp4hopQkKCuuRTo4eApgMY05yKPNyec8W+ifzLQifj
         BRcEcSjYuDRS8sBwoSlfr//jhukXG8Z+kQaWXHkNJLjMyAvON+xQkuFZojTIVpO/XOrJ
         0MhQ==
X-Gm-Message-State: AFq9FYLsUG+epbs6KngdkREWWahokd6DZ40+9oX7c1NwQ24sYHG1K3g7
	DTvPBcdjRjO9k0sdWEiKXnCpzQHMFLb9h5XvJ9eydl7yhfqnkYJ2rkXtUFC6aJ89Y5kxw4z31TA
	h8VN4kqWmaJ5usTyTeA5bbXngWdkfVbrliIJQrZJQ+GmcOWYMerFq74T0S+BmT8W6I/oPAX+ids
	oNjkAdYmdQ0tWAv1Y=
X-Gm-Gg: AYBFou3ksJfRAe24G0J5517TahtgDNS0PW6CTi34KcbFqad1a3s9BPy0xNNopRY62lx
	KuDrPtYHBVesFNhLAnPp4qCkHsp6YDFvDTSoS3+exxf+jaChRhANicAUFy4rinEhSMlLo9zPpVU
	fmwL3DoFHEkmqcwDBvLl/TfIsLFQ8xeoWlMn0TPXXoxM0an1OfKBZU3lcEKB+7Ecg+Xfqs4gc2P
	v3NysatmPpS46a67byPf9Lrid8K8F269OWJOLaYsb5Lfpl2Cj22aZR8OrigDC3ORhcQcSb/fNqj
	pSFbr51AMqQgvGicRk0OSaR+DaEKNy2cYHe+z0BxqQXQLkVIZnra40ADxJF2iKlpGBS0tCaTvfb
	5OkueFvkwHMHAcBLy3d0sLHnhCplHBTS80DyBjA9vLnDye5o9JAomahWx0LTqiiXDEZUMdkIohu
	ygEsLe13pJKBcJBEVSNIML3Ait9Cg=
X-Received: by 2002:a05:600c:524c:b0:4a2:86b7:b76e with SMTP id 5b1f17b1804b1-4a9661ab517mr45608315e9.13.1793192629233;
        Wed, 28 Oct 2026 06:03:49 -0700 (PDT)
X-Received: by 2002:a05:600c:524c:b0:4a2:86b7:b76e with SMTP id 5b1f17b1804b1-4a9661ab517mr45607815e9.13.1793192628830;
        Wed, 28 Oct 2026 06:03:48 -0700 (PDT)
Received: from [10.148.245.15] ([46.255.74.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a977edc08fsm43131675e9.4.2026.10.28.06.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:03:48 -0700 (PDT)
Message-ID: <ccc05b39-807b-4619-8819-4644133c73f4@canonical.com>
Date: Wed, 28 Oct 2026 14:03:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] libfdt: error handling fdt_open_into()
To: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org
References: <20261028002152.506228-1-heinrich.schuchardt@canonical.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20261028002152.506228-1-heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_060353_962565_A8D7ABD1 
X-CRM114-Status: GOOD (  14.75  )
X-Spam-Score: -4.4 (----)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 01:21, Heinrich Schuchardt wrote:
> fdt_num_mem_rsv() may return -FDT_ERR_TRUNCATED.
> 
> fdt_open_into() should handle this error condition instead of blindly
> continuing.
> 
> Addresses-Coverity-ID: ("1595097 Overflowed integer argument")
> Fixes: e2ce15cb3be9 ("platform: Add libfdt support.")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

We should better apply the upstream fix which corrects more issues:

47d7c01ba8a1 ("libfdt: Fix bugs with unchecked usage of fdt_num_mem_rsv()")

Or should we upgrade the whole of libfdt to v1.8.1?

Best regards

Heinrich

> ---
>   lib/utils/libfdt/fdt_rw.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/utils/libfdt/fdt_rw.c b/lib/utils/libfdt/fdt_rw.c
> index b3b8e73c..207b5ffc 100644
> --- a/lib/utils/libfdt/fdt_rw.c
> +++ b/lib/utils/libfdt/fdt_rw.c
> @@ -427,7 +427,10 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
>   
>   	FDT_RO_PROBE(fdt);
>   
> -	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
> +	mem_rsv_size = fdt_num_mem_rsv(fdt);
> +	if (mem_rsv_size < 0)
> +		return mem_rsv_size;
> +	mem_rsv_size = (mem_rsv_size + 1)
>   		* sizeof(struct fdt_reserve_entry);
>   
>   	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
