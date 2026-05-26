Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1A1CD5BB4
	for <opensbi@archiver.kernel.org>; Tue, 26 May 2026 04:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0Vn/F+W2tpeoCZVApAPmlDEm5DGYdMABh4QOLiC/7E=; b=hxwaeutgwqcl+d
	9oeXcD5KHqRwUoBBsanhL7ylwPuaqPAT6xch2TKYXEleuRiN/icDaDcWz1d/lHRsLpRVatcaC93qv
	umf0qXYM7mZbrbp306/UYaHdGK2sv7nTDJuj/XEgH4mceuj9ji1N2lndScutwx1QMan+7BcQJAcGx
	gINJSZdy9On4FUG3NJoLW8gRC/WlTMELFzZ73iYIg34IPiGgu7wz3u5RGNd8ya9XIHamKslQgqET1
	+NaI6ZOq+WqWLFe1zBGOH5iwc4FKvx4xFOohjGkbxBtledZHBnENLn6ZkVGpvFZI42uNMqrPewceQ
	0ef2VQzDmDJ9stSvi3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRjVt-000000010vg-3CiZ;
	Tue, 26 May 2026 04:35:33 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRjVo-000000010uu-12Lg
	for opensbi@lists.infradead.org;
	Tue, 26 May 2026 04:35:32 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so5573691a91.2
        for <opensbi@lists.infradead.org>; Mon, 25 May 2026 21:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779770127; x=1780374927; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UhNakVW4WoEx0ABqEXMgSflrDK8Q/m29lMxY+cQTquc=;
        b=llytA1B4sl/xXfJipxjVNkHKEz3ndj9H98U8IIE129uOTmP2W7FqqD3nnIGbKrf9I4
         1vDEF7zESa1y6Z9Hy1qkOSiJ75O6+7d4cNqHNrsT3AavhNluszzzIOpENXpDCYDUG8MK
         KPvI8KqmwHQdCI30jolkDWIADtgFukQaWEnv76I9ZmQtUA6eaNXr4Xl1QEn6TthGB6LM
         cG69sZZNXweZS9pvrtPhlXZAmhOM7vSMWoZHRpdtBOmUZgk2DjvIsM5umfvmGmFQYRRn
         76JLyf1yx0bPN2hd7EA00Ql6kUvtEYo3zL8aFx+znyPtw51w5JSyV328a/yLnE2Dr+0r
         V9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779770127; x=1780374927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhNakVW4WoEx0ABqEXMgSflrDK8Q/m29lMxY+cQTquc=;
        b=tFVEa43DeeMltxwSlzFB0Uura1fxa29stVxyPu5WUht1P0wh3oBxBwCFKbafCJxH8C
         3iFMooyrJrx0A3LY+DJty3EZRLwdBQ+dfM79e8G5DeR/xG4ygpGYLkE+LB9+bAPg8Hap
         ASAe0RuTbC/wVycSUFjE26xs+7kyUG/BCvP38HLCQUMN5pLoOddTWhhaH0FrLKWQhWQa
         qqJgydERny8aEDUWSWdIU41lzW5EZaHnAozN0YHY1BYaIdSWJXfs79cBt6I5rTlO0RJQ
         LH2OgezXD5j0Z5kXTM5Pi8DgAELE5rBTlA1RX8jfiLPpqPByjmvIVEIfCfhACPEXJ6Nz
         eH4w==
X-Gm-Message-State: AOJu0YzzYGyT1DTrCkq1u485NNjsAAnsrE9HGgT2JqfyvqSAKX6px/lh
	f1O3cRWu9ebsUK/NB+lGBrRLYnpvEuns+zK3kvrY2zey33JLb34oR5TVi4tWSQ==
X-Gm-Gg: Acq92OEmFg5BXKP304TR9S87WY7jVYEvrj8DHbWM9V8Jhy4XH62JUuGfc+ZR+exMZS3
	NhFHCVChzaQ4JeP0kXViJLXylZX87SsR3hfntgn+TTMqV8TCAFbB5RVeN59zjhXO1QmLXvy5NQk
	fEzaw/VCMIA2zP635nRwfRrfflCAuHFB7vK8YcQ0RGSr8Y8XhGl4cmB144k3OtIpv8j3a3qhHW/
	PkBatj74/v4HEI/u/rE+obhVfqBxebM+Xx8h9+8uogABeBBg6TrTySK7s5/c+Rer1zG4g2g2YWE
	paYV+hPg2A2+ZHyfoqMEs5GNT5qWU/3gbt9+Eq3V+aCbwXtY2gLxIWludujAVydWV7VbdrK2bpF
	bREf0BqSPA+grYoEkjy58m9oacsUXcmdMRbgXjLrt9tDotAdppWMGITOMqOCT5SNtq/IGK1CeMK
	Q1kf8RCTYsdr4dQFYITR5xN258b+aSv8sEYp5foQx7WRxZ+WqluSijrxPg9t1rfzHyIqM0eg==
X-Received: by 2002:a17:90b:56cd:b0:367:bc89:546e with SMTP id 98e67ed59e1d1-36a6778bc05mr14924377a91.12.1779770127245;
        Mon, 25 May 2026 21:35:27 -0700 (PDT)
Received: from localhost (124.158.97.178.qld.leaptel.network. [124.158.97.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71dc0f5csm11072861a91.7.2026.05.25.21.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 21:35:26 -0700 (PDT)
Date: Mon, 25 May 2026 21:35:23 -0700
From: Nicholas Piggin <npiggin@gmail.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: Re: [PATCH 05/18] dbtr: Do not support chain bit
Message-ID: <ahUhMP55WbZfP_aC@lima-default>
References: <20260313051948.4017134-1-npiggin@gmail.com>
 <20260313051948.4017134-6-npiggin@gmail.com>
 <afi4AiIcdJk7fEru@hu-himchau-blr.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afi4AiIcdJk7fEru@hu-himchau-blr.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_213528_296414_2B129A32 
X-CRM114-Status: GOOD (  26.57  )
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

On Mon, May 04, 2026 at 08:45:14PM +0530, Himanshu Chauhan wrote:
> On Fri, Mar 13, 2026 at 03:19:34PM +1000, Nicholas Piggin wrote:
> > There is no chain bit validation in in SBI, so do not support it.
> > 
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  lib/sbi/sbi_dbtr.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> > index 65c3b2df..224f2350 100644
> > --- a/lib/sbi/sbi_dbtr.c
> > +++ b/lib/sbi/sbi_dbtr.c
> > @@ -466,11 +466,21 @@ static void dbtr_trigger_clear(struct sbi_dbtr_trigger *trig)
> >  	csr_write(CSR_TDATA2, 0x0);
> >  }
> >  
> > -static int dbtr_trigger_supported(unsigned long type)
> > +static int dbtr_trigger_supported(unsigned long type, unsigned long tdata)
> >  {
> >  	switch (type) {
> >  	case RISCV_DBTR_TRIG_MCONTROL:
> > +		/*
> > +		 * SBI currently does not validate chain bit in install/update
> > +		 * so we do not support it.
> > +		 */
> > +		if (tdata & RV_DBTR_BIT_MASK(MC, CHAIN))
> 
> Just a minor suggestion. Since it may be supported in future, I would suggest that
> we print a warning message that a trigger with chain support was asked for.

I'm not sure that is an appropriate way to report this.

There are already, in theory, certain configurations that may be
supported by the underlying hardware, but are today rejected due
to opensbi not having support for it (e.g., the other trigger
types).

The idea of logging / warning is interesting, maybe under a "verbose"
boot/build option? And the issue of missing hardware vs opensbi support
for a feature is certainly something a user might be interested in. But
I think it's for another patch series.

Thanks,
Nick

> 
> > +			return 0;
> > +		return 1;
> >  	case RISCV_DBTR_TRIG_MCONTROL6:
> > +		if (tdata & RV_DBTR_BIT_MASK(MC6, CHAIN))
> ditto
> 
> Otherwise looks good.
> 
> Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> 
> Thanks
> Regards
> Himanshu
> 
> > +			return 0;
> > +		return 1;
> >  	case RISCV_DBTR_TRIG_ICOUNT:
> >  		return 1;
> >  	default:
> > @@ -613,7 +623,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
> >  		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
> >  		tdata1 = lle_to_cpu(recv->tdata1);
> >  
> > -		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(tdata1))) {
> > +		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(tdata1), tdata1)) {
> >  			*out = _idx;
> >  			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
> >  							trig_count * sizeof(*entry));
> > -- 
> > 2.51.0
> > 
> > 
> > -- 
> > opensbi mailing list
> > opensbi@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> -- 
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
