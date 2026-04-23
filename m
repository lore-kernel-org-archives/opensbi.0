Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D07FAD3E6
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 00:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eD9NS0I/5IC64cbyH9DceeviGnxhg3a/rjNMS2yeyD4=; b=iW2yYt2MubG/Ny
	cGXFypO3va8uXuFOYO11+CIU3EIHiF3Rhy12hYIqw9/4IwLArz5OnHU2/HDmi0GfBS/3H1BSKCi+K
	aEJ1e3Bp4DaSt7ge9VQAY0Kc79qIr/G+g6P6G44PgZw/C5K6kKsVpPAJw8Bz07kaZpiyRuaWgyiPl
	gOnw9S1tejirOwxEE2hCw0Qrj7g/4jMh6mz8qHa6BzpTzsGkoKoH9HCDX1yFd0V+oZT0oTYhnS5Mm
	LQNKHhVbSAPitpqEa3KChmwBowQx99bEKZy6dbbcmZiws89DR9oKcIXIdDf+BVgb6OUP+AFcmqcUh
	wra8AR1V9E11qTmXkkLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFiPv-0000000Aszf-1bb8;
	Thu, 23 Apr 2026 00:59:43 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFiPs-0000000AszJ-3gXT
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 00:59:41 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c7973bbc16dso3962478a12.0
        for <opensbi@lists.infradead.org>; Wed, 22 Apr 2026 17:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776905979; x=1777510779; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KFGVZhnJTKrzlrgKhO3gaiGedd72ydZdkBs/nRUsP3g=;
        b=Q5ZRkwKXYYskg54sDi7w3Ims+MR3o7+/6HpW7mj99tu7h3K8sKEn509hlgCEicDf4n
         4CGsAZQFcMS2e4STJgG6jFtYx7u27AxlAgeniZ0CV5MAuS6mFw2ZHKELfzsBK/D8GYfn
         q7aLDeOEu0+FdBRAmgBpprGpFEkibEaT+aDjURUsHmacSHQYCfFbS+FvsMWZN9ZTKM+N
         ZfgSN50gBItAmHinZS2m9Y9OsIOMfQTYGJg3ivW2MkHMizRKNApiFLun/rMqEFKZilgB
         rydOsAKVBDEYxa2gGciGTG7ziRnQo3Q/sHWFsNa90M7cnHSN09KcjDk3DBnLfjeQVREd
         Y03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776905979; x=1777510779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFGVZhnJTKrzlrgKhO3gaiGedd72ydZdkBs/nRUsP3g=;
        b=KYxYxaI8KUhYYts2QxCO4mHG9b5WIogfinGtEsak97gCogcTfTCBrpmjL+o9+YeWAn
         1pdlmqvcUY1qmw06RMwXmx9M5EDZ5cO2d8HY3ED58nQKnjkudOWW/jw7oB5z0aIQi2/G
         LNJWvpCuLtWFLSKXHw10qetTrCdKIEolj1VkSV1zKXXf576frchiVMR1fi0uVVfl7THO
         juR6ALANLd4/ERZ87AzHipGSxLxdRNgBzgh3PEiBvx7vbdqYZJUaKi9VJfO22g8Kwxb5
         T9zSQKz0hlqBcRG5IKpb8QZtfG1qXFIGAJwpSzgPjdLz+J/Bfa0Ti0bxxdarb2MMfqqg
         Ir5g==
X-Gm-Message-State: AOJu0Yw9o46fQwfOKYjyxMQVd1zIysCfFUXt9qbhMgu3vWDQgu/iRPx+
	MEqnYcmtmI69zm9dr6JM+JEEn3Iueg9F4ZX49bG/wekhtVi9qupnFn9vKSFnTw==
X-Gm-Gg: AeBDiesD1WoVJ9VeKwt2MIrnsM6Jh+tUx7Q2tJ+61rOGOxhR9mmdxRv2SIa8wHBUi7l
	2zWpGs8QxBZZAryBgDJF4NX7m/nzluYD+012yeZQJcUJX1ppnXPUrBWqrgLOeG3v9slTwb/Guw5
	9M05/c+Z3pwfb5qT0aklEwzDApjrt4gGoeYFc3zIOKwXHIKSXQ0Hn0qb/Axb9fj1ehAMzUpjC2t
	Ud7nEuIINHkqtJoKMyB1UAKEmS730uLwHpfUIizkGMM16Qwmo9WyVvAogyCwf++cRPWvWVl6XKV
	zDUQwclaxaL1jEOznlh6fS1tYTJQp5zdja+j4LBAMEW1NZZ3x5KSsJwua+OWXWjxoojWG7J10Mv
	Ujwj2Jc6UKb3URLT7BPUPH24EZYsa+cBPbhDp4bwqpDbIdLkyuqNHVB58tIiKlAkF5atlhQEvwb
	cbCQfVODkWlWVQSvq9pETSz9rTh+9nzDcH82Q=
X-Received: by 2002:a05:6a21:328b:b0:3a2:7ef4:81e7 with SMTP id adf61e73a8af0-3a27ef485cemr18614989637.45.1776905978821;
        Wed, 22 Apr 2026 17:59:38 -0700 (PDT)
Received: from localhost ([203.38.38.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703df68sm14271703a12.27.2026.04.22.17.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 17:59:37 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:59:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: opensbi@lists.infradead.org
Subject: Re: [PATCH 2/4] lib: sbi: Move PMP encoding into a new file
Message-ID: <aelrWTQA5dRlC_aM@lima-default>
References: <20260310005000.3837512-1-npiggin@gmail.com>
 <20260310005000.3837512-2-npiggin@gmail.com>
 <CACPK8Xc_q-N7kNtixS75z8=cX3ryHY6Kw-+S-8NjZhd+q4173Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8Xc_q-N7kNtixS75z8=cX3ryHY6Kw-+S-8NjZhd+q4173Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_175940_941597_D4AA8ACE 
X-CRM114-Status: GOOD (  25.68  )
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

On Wed, Apr 01, 2026 at 11:20:53PM +1030, Joel Stanley wrote:
> On Tue, 10 Mar 2026 at 11:19, Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > The Tenstorrent RISC-V IOMMU PMP MMRs use the same encoding as PMP CSRs.
> > In preparation to support it, move the non hart-specific PMP operations
> > into their own file where they will also be used to build the IOMMU
> > PMPs.
> >
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> 
> > --- a/lib/sbi/riscv_asm.c
> > +++ b/lib/sbi/riscv_asm.c
> 
> > +int is_pmp_entry_mapped(unsigned int entry)
> > +{
> > +       pmp_t pmp;
> 
> > +       if (hart_pmp_read(entry, &pmp))
> > +               return pmp_enabled(&pmp);
> 
> The diff is a bit all over the place so I may have confused myself.
> The patch keeps is_pmp_entry_mapped but changes the body from
> 
>     if (pmp_get(entry, &prot, &addr, &log2len) != 0)
>         return false;
> 
> to
> 
>     if (hart_pmp_read(entry, &pmp))
>         return pmp_enabled(&pmp);
> 
> but hart_pmp_read returns SBI_OK (0) on success. So we should keep the !=0?

Yes, you're right.

> 
> > +int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
> > +           unsigned long *log2len)
> > +{
> > +       pmp_t pmp;
> > +       int rc;
> >
> > -       /* return details */
> > -       *prot_out    = prot;
> 
> It looks like prot_out is no longer written to after your patch. This
> hunk never made it into the new pmp_decode:
> 
>        /* decode PMP config */
>        cfgmask = (0xffUL << pmpcfg_shift);
>        pmpcfg  = csr_read_num(pmpcfg_csr) & cfgmask;
>        prot    = pmpcfg >> pmpcfg_shift;

Good catch.

> > --- /dev/null
> > +++ b/lib/sbi/sbi_pmp.c
> > @@ -0,0 +1,91 @@
> 
> > +int pmp_create(pmp_t *pmp, unsigned long prot, unsigned long addr,
> > +           unsigned long log2len)
> > +{
> > +       unsigned long addrmask, pmpaddr;
> > +
> > +       /* check parameters */
> > +       if (log2len > __riscv_xlen || log2len < PMP_SHIFT)
> > +               return SBI_EINVAL;
> 
> Here we check that log2len <=__riscv_xlen, but in pmp_decode below we
> set log2len =  __riscv_xlen + 3. Is that just how it works, or should
> pmp_decode be able to decode what pmp_create does?

That + 3 looks wrong, I'll have to dig a bit more into it. I think I
need to simplify and/or split the patch up so it's a bit more feasbile
to review (and hopefully less buggy).

Thanks,
Nick

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
