Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9062606A31E
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3PgCVHbk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=aW8eW4ro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jo4rsgPEktCAYAXQOWniQwEBw/wxN/HshXAZK5bIuo4=; b=3PgCVHbkERhILMI9WvfStqap5w
	kj1gPXq9BmSCemeYQG6/MU1P6fG261ZhWenb+yUE6p11U+kebSqYTn2Sv1aFfGm/9WW31Tq1Qac0E
	iR/AeJ7uTmQRheplul7A4yCR6gAoyD+u98QWdQln+Q1htrvM6mUwmzBZXdC/ioIvEWk7aZZXLzPPo
	OIDYcbt+tkcN22ucMaEbpq3uAnTFjcmXRUUtpGAsZ/Q3l27+Ke7X9Msy0P2vurXbSq4APr13ZDZXe
	4qkp1P/JUK3imUUe+MDfGxTaY5ocv2WCw4VBPRfGDxzwkrS0L5Lf0VjOg6jTAqYVfV81VTphev7fW
	qI9//7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMG-0000000Ft5H-1lhx;
	Fri, 23 Oct 2026 08:10:36 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMC-0000000Ft3m-0Ap0
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 08:10:35 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso313708a91.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1792743031; x=1793347831; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HDtHpdwmk7fNieQ/5ozXWvrEn5yEPvluVu8eQLErvus=;
        b=aW8eW4roTa/n34nBUCs7Gf7uJdm91lm0cAzY08eOoU+zfycXdE3+4BKUs/x0OLHAGH
         E43wmxUWUuVXmnUys8JIey9eg+ZmF0D7XP9OB/hk+mxSLjN1dskKEwOle6E7E146FUBR
         POq9l69M5HPyPbkgjD4baPJuqNO30ox5kNj3pEbHSSezhpeIFy1U4qFpoQCCaZqG1J2s
         vqTlUuzg8Y0DeVJfJ0ZnUe1Tqr3jvVoN7Vg06BEK4GCaWHGg2Vt1ZLBXZt3yjevPPNxT
         4qDhfMpdcOxiCNa9XaneOomMVdFKc3TZLw6An2d0bZanIBfFI/WxBopQD7XY5odjXKxs
         JslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743031; x=1793347831;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDtHpdwmk7fNieQ/5ozXWvrEn5yEPvluVu8eQLErvus=;
        b=jLLdwJzZKGpQsIVjdReK7NMcOwsRoC/m+IlF20osiJALZypw+MyzE2PU+RSXHM5rR+
         0g9nf0IooEueRthSfIHbrYcn0scOAGQ9yfL8UJOPATff0m5nsEGUH4ix8pK0M0n/wOTW
         LNyjcfVeUxmO6zBTUdGiobPJeXJeEL5r0PybGd831PR/sKA2FQ4vtdjjGwK0xAIyaboN
         IxXD/gsxob5DKVXzKoUjmR9gMEBo7hsOB8UVN12Cw/J0+b9jGUeZ/9k+Kmg75tw1DQPk
         R6x3JHHWFvPzcrO4kzmOYNVeLNm8TGHLqgCA3h7sS5U9xUlS/Ph+3uMMJ0PEOV6Za205
         tTuQ==
X-Gm-Message-State: AFq9FYLDaAe6nzDiGwhs3SH9iZnmICaa1HBndEZBMdp02RjqFrwAkUIF
	ro8qwwEfRKQHSGp1c2xhnLPBSVBsceePUW6dRBQZSkTced4asLH32noSgWuPrfg4FhU=
X-Gm-Gg: AYBFou3RhykcxinLw5UMea4Vz3E2bvoz3tKhzZn4K9WjtPDkof+vNzieP40aTI4lDy+
	kWIxl+w0LrT/9a6AlMPPg57iAS21uxTYDduXKm22wpn6qlcT8TLco/2ZedYESqW4TvG5cqjp2H2
	4C5HzwxHAnV/8tIB4tnsMSlr4/jSuXq7ofzvU0lM4MtPY/MQjdDzFKpjv5PnmETgFnAdxxwhw7k
	BmIlkmB9WtgXMCokHCVicSG+JYYbn+WzzFfrHro6GkqXgkJ9pKgmA11zV7AEk4Bh17+wGGrmAbW
	yY7f3B7FLs65/bQ2ykwa0DQUzH8eO0V2wPnTiI4FjN7C10zudkCNtKDUMfTGLzzdibT7yHSMHzN
	NCva7mQeSPvqIb1pV4u6jS8oQ6YwOjQgTIf5DiWpyFeBGS3ZvbrkBd1c8ZiFKkw6G7ZtrUNcrCU
	kyH3hvYIMrd95vwxFNPVIHs3r212v51IhNnCDeE0hmAlsGSViKpXt0Z4MXRjxvS13/H3K4WYWDt
	hPv32x2e34H2qB3+SkSgSzPfVygShYHJzm5ixtFboQFYWG2HfK7IdqKEExQnzJh4f6f9od4kZI=
X-Received: by 2002:a17:90b:2887:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3adce0ca364mr1248308a91.3.1792743031057;
        Fri, 23 Oct 2026 01:10:31 -0700 (PDT)
Received: from plin-1878 ([136.226.240.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada47f8ff1sm7978106a91.0.2026.10.23.01.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:10:30 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:10:25 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>,
	"zong.li@sifive.com" <zong.li@sifive.com>,
	"greentime.hu@sifive.com" <greentime.hu@sifive.com>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"scott@riscstar.com" <scott@riscstar.com>,
	"conor@kernel.org" <conor@kernel.org>,
	"dave.patel@riscstar.com" <dave.patel@riscstar.com>,
	"raymond.mao@riscstar.com" <raymond.mao@riscstar.com>,
	"robin.randhawa@sifive.com" <robin.randhawa@sifive.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"pawandeep.oza@oss.qualcomm.com" <pawandeep.oza@oss.qualcomm.com>,
	"krzk@kernel.org" <krzk@kernel.org>,
	opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 6/9] lib: sbi_domain_context: add slwid to per-domain
 S-mode context
Message-ID: <atsWcaYb+h9FVvDy@plin-1878>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-7-peter.lin@sifive.com>
 <DM6FF21LWS2G.2ROYH5Q2IQWOL@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6FF21LWS2G.2ROYH5Q2IQWOL@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_011032_087003_6AB00E4C 
X-CRM114-Status: GOOD (  21.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Radim,

On Fri, Oct 16, 2026 at 05:08:14PM +0000, Radim Krcmar wrote:
> 2026-08-17T17:05:00+08:00, Yu-Chien Peter Lin <peter.lin@sifive.com>:
> > slwid is the S-mode CSR that controls U-mode's World ID. Since
> > each domain may run different U-mode workloads with different
> > WID isolation requirements, slwid must be part of the per-domain
> > S-mode context.
> >
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > ---
> > diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> > @@ -145,6 +147,17 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
> >  		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
> >  	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
> >  		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
> > +	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSWID)) {
> > +		/*
> > +		 * Temporarily enable Sswid so slwid is accessible for
> > +		 * swap. The target domain's mwiddeleg is restored by
> > +		 * sbi_hart_protection_reconfigure() below.
> > +		 */
> > +		csr_write(CSR_MWIDDELEG, ~0UL);
> > +		if (csr_read(CSR_MWIDDELEG))
> 
> The slow verification isn't necessary on each switch -- either check the
> hart capabilities during initialization and mask widdeleg from DT, or
> just trust the DT.
> We know what we've written to mwiddeleg for the current domain, so we
> could just read it from context.
> 
> > +			ctx->slwid = csr_swap(CSR_SLWID, dom_ctx->slwid);
> > +		csr_write(CSR_MWIDDELEG, 0);
> 
> Setting mwiddeleg to 0 is dangerous, because the specification isn't
> clear whether zeroing mwiddleg and hence disabling Sslwid preserves
> slwid CSR.  In any case, there is no reason to write 0 here, because we
> can be writing the correct mwiddeleg.
> 
> To optimize a bit, I think we only need 2 CSR accesses to handle
> delegation:
> 
>   if (ctx->mwiddeleg) {
>     ctx->slwid = csr_swap(CSR_SLWID, dom_ctx->slwid);
>     csr_write(CSR_MWIDDELEG, dom_ctx->mwiddeleg);
>   } else if (dom_ctx->mwiddeleg) {
>     csr_write(CSR_MWIDDELEG, dom_ctx->mwiddeleg);
>     csr_write(CSR_SLWID, dom_ctx->slwid);
>   }
> 
> Feel free to keep mwiddeleg write in sbi_hart_protection_reconfigure,
> but then please consider moving the slwid logic there as well.
> The current split seems suboptimal.

You are right. The mwiddeleg=0 write indeed does not guarantee
that slwid is preserved while Sswid is disabled. So my sequence
was unsafe.

There is no perfectly clean implementation either way, so I would
like to optimize for matching the configure/reconfigure semantics
of sbi_hart_protection, which I think map well onto "build up" and
"tear down" the WID isolation of a domain, including enabling and
disabling the Sswid capability.

Concretely, I plan to:
- Remove slwid from struct hart_context and stop touching mwiddeleg in
  sbi_domain_context.c entirely. slwid is an S-mode CSR, but its accessibility
  is gated by the M-mode mwiddeleg CSR, so saving and restoring it requires
  the mwiddeleg life cycle managed by sbi_hart_worlds.c
- Cache slwid as per-domain, per-hart state in sbi_hart_worlds.c using
  sbi_domain_data.

The downside is that this split means mwiddeleg is written twice per
domain switch (zeroed in unconfigure(), then set in configure()),
rather than the one CSR access your version achieves. But this shouldn't
introduce noticeable performance impact.

I will soon post the PATCHv3, happy to discuss more there!

> 
> Thanks.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
