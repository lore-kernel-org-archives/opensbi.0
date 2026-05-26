Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A360CD5BCF
	for <opensbi@archiver.kernel.org>; Tue, 26 May 2026 04:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rX2J6EoSDx0p03dOxiXhiU1pGSYbvjFz6ASc2rwB6LY=; b=KfSDlDzexSRlg3
	pYBkuRqWE6+zpLpTw55RAKymQNL/n6L6hrgXHujzZjVpqCun3i5GfbbnpzOk37gyUsBUo3jKlMBIc
	vEYHhz8mlTOdaPQoMVeQwwR1eJH72i7/45EC2z0rnV8j7VaeCmRbpiEGaYWnaw6noADaUddflsTsS
	lKA24f4FI/fEIn1MTRNURgjgAhdJB7F+e7bwfDAtGW6EptLQ1kXsTvwULOhbI1Q/ciPkGtKm444fl
	FoX1e52mujILQW7Wg9/62JE7GCH/hC10D2mkhOar2Hrwk6nlS3lzg0OTenIGJMJhB09plYKJdbSns
	1OPWH7tStgwiobBTtP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRjYp-000000011Fh-0oFV;
	Tue, 26 May 2026 04:38:35 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRjYm-000000011F6-4A5c
	for opensbi@lists.infradead.org;
	Tue, 26 May 2026 04:38:34 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso8146238b3a.2
        for <opensbi@lists.infradead.org>; Mon, 25 May 2026 21:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779770312; x=1780375112; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SkizFG4ueWgI/ycQGNUtpMyL/RPqKCZWt8XwnGnSrGM=;
        b=HLzJ5E30t1IVchIzQkJ35GFq5YxCxhIYa3I2NoE+Xm/O4b/SfmUoexl7TlkmjHcPMR
         5Y32cT5E3/uMXuDtqWMLKSjLKJNkVWtZPsVord9hiBBZFxLSlXqcte+WFz5cDrd6+Nve
         9NEKxZ0fVOW2gFcYgjc2NOecvzEIPD7rW6x6tti5Qf6aoXo0YlUnZWBL0y381Ztj5LBz
         JMGPbOjFQmxxa8M8z7S0eLRT7uFJFEKq+RkJH+n2AZC+r1u1ocgB5SGoUxQJ+GOG19kt
         8XD/tqdDkYKxeHqzGzboxKAq0KKCCKsPV1iY4sk2Nk6U3FQzUhq7fUuAGVd7pEYBDXJk
         o4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779770312; x=1780375112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkizFG4ueWgI/ycQGNUtpMyL/RPqKCZWt8XwnGnSrGM=;
        b=VP2yyBRb1BkSkpavDYA8VmHdX24GSVbUI0VgrSo+Hkj/iN7v3Ygf/KlLegH0PBtY1z
         40d2T3aNgGFwMTs+F5t0bTM3hbEQBhlo2q6+KgdG+2klK9u5nfmmZnjmLnvKikqdEShh
         Qj6l37lXX5JtbJ0ipM77N46PdQC9VdAGwSOOOWhQ/n9sWWkqSnx2AkflOquBLWHqmsyE
         oWvmrtXjVCs3rPsHwEtUmA/L0ceEXp+hndDLKqTRHql2jX9ICS5fCQXU0noB+PfLHhoI
         S0HW4BLAgtagGn9Hl6tL9VMXs4/WC5zhddyTqAKejTO6PBnLGRKBTdLBQkCxPhujixIn
         8v8A==
X-Gm-Message-State: AOJu0YztECz1oKAlk8hdsoYq/1h4/i3Yr92Cy/mo2cKBE/cQl7FCjaSn
	SlF+Do3H9u7qaQILMjChTG34VI2+/RzhfKH5nZqPfK/8cDQa6tpICr5EOUCwXQ==
X-Gm-Gg: Acq92OEU2UgtahfnKzQy3GmvWFxzexQnLIV03NDM1rPc81hSeKco4Hu/tQKf/diasOz
	/NUbvzD3d4f7HDSArLbiT1NgjKLxSSvuE2Ew6GqVtby28vA/SN5lzK5aSVggEm8q3SRjPjtgtkp
	FP6YNb0PnhNjilrjgPYt+GDjJ0eNj1W+a20kgOvYfHclcRSVmjFkj0KWLhN/t5UaOu3ZrRxIhCp
	1m9aBrBC3GZ9mU+VVMaDcVQ2Qr6WyJGV/NfbYJvJ5vhMrb5vkp28PtKHiPd2DG7TPU2h3BBBOHK
	dOrjy1f/KheH7044Uk4Ers2j8ZvMigYApPHjx7q3rozd98HnbiEejGskOF60l77HuVNSOHvpHq3
	MPXYwxMn/FjY6sByyP0qy74ifiXLpyoz41eXyXKSu0NMDgY3+UL7M/qtqPnUuSJKyM5zU+MmFKH
	eYlTjYaufg7zlSutlHTRZZSWsRZbcc6F6YZcmaJDeQzTrdICmU8kllrZ+13xA9A3zW8uZHAg==
X-Received: by 2002:a05:6a00:39a1:b0:82f:1b42:11d0 with SMTP id d2e1a72fcca58-8415f17b893mr17425054b3a.15.1779770311907;
        Mon, 25 May 2026 21:38:31 -0700 (PDT)
Received: from localhost (124.158.97.178.qld.leaptel.network. [124.158.97.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm10857194b3a.5.2026.05.25.21.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 21:38:30 -0700 (PDT)
Date: Mon, 25 May 2026 21:38:28 -0700
From: Nicholas Piggin <npiggin@gmail.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: Re: [PATCH 06/18] dbtr: Improve trigger update error checking
Message-ID: <ahUjIlb-fwx_rtP2@lima-default>
References: <20260313051948.4017134-1-npiggin@gmail.com>
 <20260313051948.4017134-7-npiggin@gmail.com>
 <afi55pkq49uS6KAx@hu-himchau-blr.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afi55pkq49uS6KAx@hu-himchau-blr.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_213833_065696_B395A630 
X-CRM114-Status: GOOD (  20.24  )
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

On Mon, May 04, 2026 at 08:53:18PM +0530, Himanshu Chauhan wrote:
> On Fri, Mar 13, 2026 at 03:19:35PM +1000, Nicholas Piggin wrote:
> > Trigger updates should ensure all triggers can be upated without failure
> > before making any changes. Updates that change the trigger type must
> > also be disallowed according to SBI specification.
> > 
> > Change the style of shmem access and checking to match the trigger
> > install code and perform all checks first. Add the missing check to
> > prevent type change.
> > 
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  lib/sbi/sbi_dbtr.c | 33 ++++++++++++++++++++++++++-------
> >  1 file changed, 26 insertions(+), 7 deletions(-)
> > 
> > diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> > index 224f2350..d2845fec 100644
> > --- a/lib/sbi/sbi_dbtr.c
> > +++ b/lib/sbi/sbi_dbtr.c
> > @@ -727,9 +727,9 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
> >  int sbi_dbtr_update_trig(unsigned long smode,
> >  			 unsigned long trig_count, unsigned long *out)
> >  {
> > -	unsigned long trig_idx;
> >  	struct sbi_dbtr_trigger *trig;
> >  	union sbi_dbtr_shmem_entry *entry;
> > +	struct sbi_dbtr_data_msg *recv;
> >  	void *shmem_base = NULL;
> >  	struct sbi_dbtr_hart_triggers_state *hs = NULL;
> >  
> > @@ -744,30 +744,49 @@ int sbi_dbtr_update_trig(unsigned long smode,
> >  		return SBI_ERR_NO_SHMEM;
> >  
> >  	shmem_base = hart_shmem_base(hs);
> > +	sbi_hart_protection_map_range((unsigned long)shmem_base,
> > +				      trig_count * sizeof(*entry));
> Hi Nicholas,
> 
> I would suggest to verify the value of trig_count before making a large map entry.
> It would also help in the two loops below.
> 
> >  
> > +	/* Check requested triggers configuration */
> >  	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
> > -		sbi_hart_protection_map_range((unsigned long)entry, sizeof(*entry));
> > -		trig_idx = entry->id.idx;
> > +		unsigned long trig_idx, tdata1;
> >  
> > +		trig_idx = entry->id.idx;
> >  		if (trig_idx >= hs->total_trigs) {
> > -			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
> >  			*out = _idx;
> > +			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
> > +							trig_count * sizeof(*entry));
> 
> A forward goto to bailout in success/error condition would be better.

Hey Himanshu,

Thanks for the reviews, I'll take a look at these suggestions and see
how they look.

I should repost this series soon, I will do so after hearing from David
about the tdata2/tdata3 issue.

Thanks,
Nick

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
