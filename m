Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49BEFDEE28
	for <opensbi@archiver.kernel.org>; Fri, 24 Apr 2026 01:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDm82CbZndIEL9EHHe0Jl93Hq4jh9tsl1E9NMuVFRYM=; b=gopBitk/65gBus
	ZrROb9gmbPQ3kYnPpvwl3MsfCdLSkiBEuW35nYeieEnjuCT0YlKyMM4QOT0bpxx2kS/KNPW3vmvWM
	LIHYzB1zeVK019bqaO4fNVUDsCGWXlALMmCKfGwTAS3XXoIn2fBEUkspyc+o8sbSVCn7kYXcsM2/b
	MYTtDTbhs57gGxL2GPXJwJiPQ2+UM7Tw5n5g1dyuwBlTqdlZpmXzXPvzov9I666oa+kdA/toy3Aod
	cKYZSe7oVQKCplrPe4Huxf7hUnw/4jVFZTEPAaX3HveuyLnz/+adyJqMiMp5v0QV8uhid8HRY99Cn
	B9sYKZBpw0HbtU/UhVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG5Th-0000000CTe8-39Og;
	Fri, 24 Apr 2026 01:37:09 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG5Tf-0000000CTdn-0vNU
	for opensbi@lists.infradead.org;
	Fri, 24 Apr 2026 01:37:08 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82f69a286dbso5587170b3a.2
        for <opensbi@lists.infradead.org>; Thu, 23 Apr 2026 18:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776994626; x=1777599426; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rDfghCGgKNs/UCQ+W9ccAqMPtjx7ys8wwPvkYTSlCtc=;
        b=ThiFrlZg9lmRAZW9lJ5SLL+QD8CC2374xX7PT33Bk/6m3Go2IscoBk5DQ2jBrgMVKU
         JSEWZ+hrPE8fO96z8UEXbzVdof6soMuZlgnmLKND8udVw7obN1kEjl8y2AciqcxiNfHN
         AffwwzvoUeqRhcI1RVYAw/gWLTAy7exMPvS+AWrFIiHQgFsj87L+wXhlncp3E7UW1pQ4
         6oBNy3fdQ3S2Lz9/KPnTXyy4Bw5LsFEPjSixh8GhrAIm1BLm/qspfRM2B28j4Vw15TlT
         qFZCj1lNya+jiHl6Sfz+XECMOrrR0Q6pmCrikf7vcKmgk78FU5Gb6csYzapOHF6SyASN
         MDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776994626; x=1777599426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDfghCGgKNs/UCQ+W9ccAqMPtjx7ys8wwPvkYTSlCtc=;
        b=OxqxlVTw4w7TUAIyIrMZk9E4vhiCrGfW0/YilZQTiPlHUhbDrOLQOV5I+duZlDWNDN
         Ksn87kl/70XqiDeIBJ7qb7iWg9ZlfX3g4vYmw/A9rFTSg4jiRZWZgSKyKNONaFmEK00A
         pVBSamd2z2tUT0mN2m45Egn5OoHl2UkDCpVhIaHbGjCshITkX3bRSBxzvtOuPklD1Xy0
         VcDJOQUe4nTC9JN/R3skNY/WbFJRyj/piC7nnjXS/mUXt9p+ABgmnRPpvTTkYlQFGonV
         /13MaVgFKLL9mO8wRmFG7kBe2ThU+g2soKnydiasc3UtYBcuyBtsY+mbFwHqMJmKI3sI
         fpqQ==
X-Gm-Message-State: AOJu0YwPfJcpGpw8spOd8DJsSYpzo0VQ+hCV1ZplIV8pRzRFywCSJdjl
	wQ6ydENcEmtzNYhf0zsrhARMh7hk6ic5p+kB105NKsXe8uRRsTuOKrbS
X-Gm-Gg: AeBDietEXAHUnT2CwoRZ1jYYbCOxSlWGByiFQRF7Eja8LJ9MPrupeGZVF4cGvK5H97/
	dyB9bE2l56sjWJWqlHW6oGFH+Z2zKJbgpdXGFqZbv128XHDjU4V5sAD6dJxcLE/Fm/xelN7O4CV
	2T7taZLvI3ywvssDSvMwF2YeB4DY4cjLWK1L3BQFEPmYd7snBhbmnUODBQ2Uxk7A7PdZT/BdZ2I
	k1tT++Mz1V29w2eUe9iPtCGyJLTurrlsuqa8tfNrBMLczVKfVIkI+QdeW76kobkghPd/AsHmNRh
	ZWJfSrdfTIQWFmBk4cB908FMQYhMQvc2waDrod4GI6tXueyk+iLP4OPBucyQiRK5Q27tB3iQhZF
	XxElTFMMUTX86IgUDbn3ehGEBuaWoYM1GHcrHK17+6ZiqnhJhxKjleVIlc+lNXGBNsL5fsAPqz6
	xTrCnHtmLmCbrMnnKVnnt70FK5fQyzbARCXpcluXChH3EbADfi5GYU/tWWgyKkiTqYQMJAbg==
X-Received: by 2002:a05:6a00:2889:b0:81f:3f03:6838 with SMTP id d2e1a72fcca58-82f8c838e6dmr31741089b3a.15.1776994625918;
        Thu, 23 Apr 2026 18:37:05 -0700 (PDT)
Received: from localhost (193-119-51-209.tpgi.com.au. [193.119.51.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm25280764b3a.58.2026.04.23.18.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:37:05 -0700 (PDT)
Date: Fri, 24 Apr 2026 11:37:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Ilya Mamay <mmamayka01@gmail.com>
Cc: opensbi@lists.infradead.org, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: Re: [PATCH 01/18] dbtr: Add consistent range checks to trigger ecalls
Message-ID: <aerC4Qj7lMSkmIFK@lima-default>
References: <20260313051948.4017134-1-npiggin@gmail.com>
 <20260313051948.4017134-2-npiggin@gmail.com>
 <20260320124646.zd4cblhvoisk7flb@imamay-pc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260320124646.zd4cblhvoisk7flb@imamay-pc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_183707_290395_45B0FB8A 
X-CRM114-Status: GOOD (  16.47  )
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

On Fri, Mar 20, 2026 at 03:46:46PM +0300, Ilya Mamay wrote:
> Hi, Nicholas
> This is a significant improvement over the previous version!
> 
> I have a few comments below, though they may be off the mark since they're
> based on my own reading of the SBI and Sdtrig specifications.

Hey Ilya, thanks for the review, sorry to take a while to get back to it
I was on vacation for a few weeks.

> On Fri, Mar 13, 2026 at 03:19:30PM +1000, Nicholas Piggin wrote:
> > @@ -594,6 +597,9 @@ int sbi_dbtr_install_trig(unsigned long smode,
> >  	if (!hs)
> >  		return SBI_ERR_FAILED;
> >  
> > +	if (trig_count >= hs->total_trigs)
> > +		return SBI_ERR_BAD_RANGE;
> 
> According to the SBI specification (section 19.4):
> - "The sbiret.value is set to zero upon success or if shared memory is
>   disabled". I interpret this to mean that sbi_dbtr_install_trig must return a
>   trigger index along with an SBI_ERR_BAD_RANGE error.
> 
> - "sbiret.value is set to the array index i of the failing
>   trigger configuration". In this case, sbiret.value should be hs->total_trigs,
>   because that is the index of the first failing trigger configuration.
> 
> Same comment applies to sbi_dbtr_update_trig.

Shapr observation. I think it may be technically ambiguous, but I felt
the intention was the other way. That is, bad range is not any
particular trigger failing, but an overall error before we get to
individual trigger processing.

sbi_debug_read_triggers() can return SBI_ERR_BAD_RANGE too for example,
and that could not point to a bad trigger.

I would prefer to leave as is unless there is strong opinion or
requirement for now, since that is leaving existing behaviour unchanged.

Thanks,
Nick

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
