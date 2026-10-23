Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA6F606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J2Uojq8D;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ndZ417PL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GwkewzJE5k6/fVe2bsA/OAw4+6rM3CI3t8mNp24/eu8=; b=J2Uojq8D8WxcaVujA5xunSsYg5
	rrL/9EiIIdm93DJ+EjOOKzUalspb7lK+XX53Q6RIhNc+alvqd+Mz2CKp7TmJaJmz/Zfx4ErKy0TWv
	eymqLVv879Aj0Bnb9Hgpi6Z63ryUEe0Wi8IzxqBEKaroJuGDhhcxNyp24liGl/9/ncucWt7mHq72h
	6KSC62MlTQrwuZDQvVsK069kJT/A7ObRG/hwU/is0xFEKY2HF+t2A05H62hHsB4jgMu0oJMOyuntE
	GuIGcGcCZ6KcnQzlFwzMrREIq18xbaWA1Yg0wN8L/aPYRREPyW+NUpVt7urPAxiqCr/s7TBWdcqvR
	GjR0OFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKANh-0000000FtsE-43Fm;
	Fri, 23 Oct 2026 08:12:05 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKANf-0000000FtrI-2zhy
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 08:12:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e942864693so3041025ad.1
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1792743123; x=1793347923; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vq42KF+4bXY5CvvE61DbJlk0S/4JSgarHRagtgnno5k=;
        b=ndZ417PLGBXM2L0p6FAWzG9IK89afSJ6BYuQAILwVymcITJ0KPbj30nTvx4PwwuD8s
         bpu+FheHBnmYfk2xWeVpFltjKLqyFV5+UweP9USl1DIupiMdYmKTVZlrUx4TXMZ2J+NC
         kjBq/nEKUnVnSD10/rDZYL4uOH60BdxsDi6OrV/FW4E0lQQUm6iwgVopyaF8r6mjA8iT
         IXjCB98hNCFPviU8Y9yInQd8NQPmaOqZrhZyDamXpR2zPfBrCB7wcJ+NXvmPxPjFlLIT
         MvGRxmYda2VR3hNn9HXGXjTwiZxLtcQTmniSbFhxezGfYWiBw8vo7OwY+qTuCq/YElQe
         FFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743123; x=1793347923;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vq42KF+4bXY5CvvE61DbJlk0S/4JSgarHRagtgnno5k=;
        b=cKiQ52lG3b1ljqsDQHnZ2V2gAPFWJzA6Zaov73O+q5Nyw6JmT97gedVmdIk6ey7qny
         H8S++FjO0Pv2E+QlnNVpAvnB4kAuzN+S3xZlNmRP66eVkGJwf/E/Dkm0OHrv8GxYlINs
         lw0PZFs7Zn0z0eAcislnlUD+GoP0Z+sTnq+nIjjQA9yG8LHdArSAU9RO785xs9/+clyJ
         9WUGizON3yjJC93HOLlTroRI8njlWF/0N5GRfTI8fy0aZx9c/vE0oTvqW8VzUV1IqgYS
         eerktJxgmm1iWZnlT7UYAVP3/m+it8yV9iLzLNzhlpKAbG7SnedWE2EboqVanjHHEFMr
         YJkQ==
X-Gm-Message-State: AFq9FYJGM0fSCuCCLzohc0gkf5orzF+nsOmiEAbxe+sdYhsXQvLpkI6d
	ut8GW2BzAc3pRT+Jt+otSGj7MYwvED57HEX2KQfETjLT/fuPfl0DuDqjlXv4e8txjqo=
X-Gm-Gg: AYBFou3syMNPIB3xXuVF51O6CaFZMWQN1wDhb5iweREVTwfZUb3I2wZWz5K7DgncLTN
	aiGsIg/KA2jf81orNutUliMv8ZSCrVTg0EaJeOmpP40vSEXvsRacWf5E2NrYzo1IIJNhqhASgwZ
	bb2EWDJLolBSsNHQ19v6v9kLRYmAdE9oAF8CCowrxXzUHfKFkyQxOTsKME3dD+bETmZBjhjjzWe
	pKfkQO8j9W8n8zmoj6sUO8s7QhZUo1HYI9Ly4JJGLoqmBa/JkDQoOu+CkI31X9F93OrXSjaJzFc
	63a5BQKMMulPOE8+EWFV56sib/w90DZzyBYWCuFQcHh6UMxBhd6TxuE5WatZbmwld73Iol86Ckk
	8gvXXRF27jnxejcU+PGisgRR34mSFBOl3c0Ujj09P3wGfRcWmSeAQS/XCkcWcYmeDFM2ijpPDpu
	o+KG75RBOKVSliIeFwEoTypCfMi26QgXZ5DoMMIyiYouH036KFJ95nKes6DSKNN85LbQUIVoots
	Aw8beUi1UuTzoUnHQEcAu1pwlQGAdRh9Wle2874q5r/d8JrTC3Igg==
X-Received: by 2002:a17:902:e88a:b0:2e2:dc50:16a8 with SMTP id d9443c01a7336-2ea7d0e6938mr14160725ad.27.1792743122868;
        Fri, 23 Oct 2026 01:12:02 -0700 (PDT)
Received: from plin-1878 ([136.226.240.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b4ff12dsm7045845ad.71.2026.10.23.01.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:12:02 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:11:56 +0800
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
Subject: Re: [PATCH v2 5/9] lib: sbi_hart: add WID protection mechanism
Message-ID: <atsWzOgv5zPGLmj5@plin-1878>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-6-peter.lin@sifive.com>
 <DM6FR879EC0N.1XXM04LPUG5F0@qti.qualcomm.com>
 <DM6H86ZBKPDR.MIW2U5VUWC33@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6H86ZBKPDR.MIW2U5VUWC33@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_011203_760571_30D3AB8D 
X-CRM114-Status: GOOD (  17.00  )
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 06:33:17PM +0000, Radim Krcmar wrote:
> 2026-10-16T17:24:07+00:00, Radim Krcmar <rkrcmar@qti.qualcomm.com>:
> > 2026-08-17T17:04:59+08:00, Yu-Chien Peter Lin <peter.lin@sifive.com>:
> >> +static struct sbi_hart_protection wid_protection = {
> >> +	.name		= "wid",
> >> +	.rating		= 100,
> >> +	.type		= SBI_HART_PROTECTION_TYPE_ID,
> >> +	.configure	= sbi_hart_worlds_configure,
> >> +	.unconfigure	= NULL
> >> +};
> >> +
> >> +int sbi_hart_worlds_init(struct sbi_scratch *scratch)
> >> +{
> >> +	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID))
> >> +		return 0;
> >> +
> >> +	return sbi_hart_protection_register(&wid_protection);
> >
> > All that I said above applies to domain intialization.
> > The actual code during context switch should be much simpler:
> >
> >   {
> >     csr_write(CSR_MLWID, dom->wid);
> >     if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG))
> >       csr_write(CSR_MWIDDELEG, dom->widdeleg);
> >   }
> >
> > Or only
> >
> >   {
> >     csr_write(CSR_MLWID, dom->wid);
> >   }
> >
> > since we have to touch mwiddeleg when switching slwid anyway and the
> > unconfigure/configure is not good.
> > Alternatively, we can add a `switch` function to sbi_hart_protection and
> > move the slwid switching here.
> 
> Taking a step back, what is actually the benefit of fitting WID into
> sbi_hart_protection instead of simple domain state?
> 
> Thanks.

I'd like to keep this inside the sbi_hart_protection layer mainly for
consistency with other protection mechanisms, rather than swapping
it as plain domain context.

Thanks,
Peter Lin

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
