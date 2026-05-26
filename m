Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02F8CD5BC9
	for <opensbi@archiver.kernel.org>; Tue, 26 May 2026 03:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EeI9d5O7RQ9ND+mbBFAT1UTIJmitiRVHaG8nkz6ldnw=; b=EEo5+wTyNR+jRv
	/YxPcsx6tunJJP7rw++pJ6yqscEZa3l1z+Bp3/ubmeGWbvEDkJHPizXfFB8Mftjl8zDLb6/fKPFEG
	r9jPyumM7gWU430UzxPE+sm+UviC1KvPhV3hgBKSmIMc+WNRPCXWTYNPxVZMmzhP3UEfFRhBqENR0
	1EeeXs++Pi1KnFbr2M29Eq8CdvkWpwuyOQCjpAdNAHJYLZibuB+Ms0VfDqepqPpWfHwnlRCnZCqv5
	5fmlXm3R08xkzPo4UCUelIM2p7EYhtEyMryWILKu3ggy/CvpFs9RQaPXtQH3U/zBaXw61Z2+e1tzO
	zSQNhHj5giwbVTwlfbOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRi3r-00000000uEW-0k9d;
	Tue, 26 May 2026 03:02:31 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRi3p-00000000uE1-0ZXV
	for opensbi@lists.infradead.org;
	Tue, 26 May 2026 03:02:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2be1dd4af34so89378935ad.1
        for <opensbi@lists.infradead.org>; Mon, 25 May 2026 20:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779764547; x=1780369347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8CQlU5Isdm9I0FNA5JVaF8rc++ZlRx77iPyJ5lHB6X8=;
        b=KyBgFqfTlkMF9dXBtZvb5i7YIE/APOiAP3FfpNt9gYeb/ghcckwkCjntBA3jhvbsCh
         MP7FMfgg0ORhAUKlgBhNYnP5+BMy7Qw0juQFGL8aaZxRHf9/Af76j67A/Pb3C2upStyS
         SvF5+eB7+RaOEFMAaxLajr2JpkEmBN+jWOtNdR0iR7NAREd7B8ddY8zi3bnf/Jw9jlli
         9IoxUL8PT1V3WKXLJ/ovg2VdgG1SMxxAVoG9la9VBuSgnsGWBy/saAqFqhzodpX9/WTK
         xfC+gNsI2sFcGUlggENsSyDbug1nC1l0YUZwtYK5HfEKU0cP7pU2cFga1BAtlXhlCJJr
         kehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779764547; x=1780369347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CQlU5Isdm9I0FNA5JVaF8rc++ZlRx77iPyJ5lHB6X8=;
        b=K40f2oo72wV64HtSVNAj+N+VbTV8EQHVk4yQGbHkbZ3xWPQCJ+1a80b+uAQ+isbcYp
         mbv2UdMu3SN+PDFQFsajVHoKQ/+Nz1g1tsYXrTCmlhgPyNYrV/0GyafVK9Yb212Een/f
         36E2fSiBfmbVxEc2EjXn9Us0ioL3UWjB9m6ojn48UkBEU0mmsWG5cVokKBzzKVS2v904
         5RBmzlKYShnHxrOYO5ewv061AyOfk+MmURMOgedXTXtQMc9dz6FnSr12UlqxEATq+88C
         Sp/WvU3FqUjbGoNEVQmoyjLIhg9MIKe0IrRUtN8DWy4xSX/nvDvGfnFTs2FT78P9nvfn
         3SWQ==
X-Gm-Message-State: AOJu0YxNIOBASyB90PVvBhS6TgvHZvoTAkIbvkMz9wfAioC+T4oD+oTV
	mRIv2pDWTejcwgoM+dzxhtxh7ZSGwCYUyMt9JOLfBEu18whHm0n2VZ7iMvvDgQ==
X-Gm-Gg: Acq92OGzDJAIWp1dwg9GlDgtk2mbt2KP6/4nsWOWmF8c0U7eM1hPVB+xI9AaBS6eV0w
	vYaz2w3F7Ihf5pqRBDajDYCgr+/jU7b5Ehz1OaPpIxj7Yp1cX5iGt05E4j3EVMsBQjjKSmrs1ND
	mTmy4AJgkFMJX7SKz/juuD1WPkJj3h/erGeHx1DnfwzlnhTAHYc2AfIJWFIUHvaF2fdjWShgZgI
	dha1tptVf3sjzMFVZoO6/+JdtjNELfsbpg/sXld8BntLghPzNhvX4isEF3LLSnSICm1VtB9tZv/
	bGFCVF8m7v1F7a6Zs1KVMzhfMAhhoDr5Hwfv4kb8hwLYWRIH8TUMJNj4RZLY2ACREyjbZzQ51kU
	WcFX+e3Gv9QfZxHziQfXx7NMDSTet8dNnY+6jjpoGJvDvDW9aTIwA99ZJtAimRtKwZFf248UuGU
	XTeonKkPc76gAd1KfDflgwmp94bzODSNyOT94k02qg+qdd1SalRrtTKvsDCh/0QH6/LHsO8Q==
X-Received: by 2002:a17:902:f64e:b0:2b2:50bd:83b3 with SMTP id d9443c01a7336-2beb035c826mr177935025ad.10.1779764547348;
        Mon, 25 May 2026 20:02:27 -0700 (PDT)
Received: from localhost (124.158.97.178.qld.leaptel.network. [124.158.97.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5903bcasm114802465ad.77.2026.05.25.20.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:02:26 -0700 (PDT)
Date: Mon, 25 May 2026 20:02:22 -0700
From: Nicholas Piggin <npiggin@gmail.com>
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: sbi: dbtr: do not unconditionally access
 tdata2/tdata3 CSRs
Message-ID: <ahUDmImiqdlJAhdc@lima-default>
References: <20260525185033.4165210-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525185033.4165210-1-david.garcia@aheadcomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_200229_182925_0DD9EDF1 
X-CRM114-Status: GOOD (  17.47  )
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

On Mon, May 25, 2026 at 12:50:33PM -0600, David E. Garcia Porras wrote:
> The current SBI DBTR extension implementation accesses tdata2 and tdata3
> without first checking whether either register is implemented on the underlying hart.
> This produces an illegal instruction exception on otherwise
> spec-compliant cores that legitimately omit one or both registers.

Hey,

I attempted to fix this to work around a crash I saw with QEMU.

https://lists.infradead.org/pipermail/opensbi/2026-March/009600.html

I didn't actually dig far enough into the spec or see the CSR write
side of the issue because it was following the recipe from the spec, and
QEMU doesn't crash in that case.

AFAIKS you're right though, tdata2/3 must always be readable if they
are implemented for any trigger. so QEMU's implementation seems contrary
to the Section 5 introduction (I have a QEMU Sdtrig fix series, I'll add
a fix to it).

Unfortunately your fix here I think won't help the existing QEMU bug
because trap depends on the selected trigger type (see
tdata_available()). Arguably we could just ignore QEMU... but using
csr_read_allowed/csr_write_allowed would solve both cases. What do you
think?

[snip]

> @@ -619,6 +647,20 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  							trig_count * sizeof(*entry));
>  			return SBI_ERR_FAILED;
>  		}
> +
> +		if (recv->tdata2 && !hs->tdata2_supported) {
> +			*out = _idx;
> +			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
> +							trig_count * sizeof(*entry));
> +			return SBI_ERR_NOT_SUPPORTED;
> +		}
> +
> +		if (recv->tdata3 && !hs->tdata3_supported) {
> +			*out = _idx;
> +			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
> +							trig_count * sizeof(*entry));
> +			return SBI_ERR_NOT_SUPPORTED;
> +		}
>  	}

These checks seem consistent with the SBI spec, but even with them we
miss classes of these errors AFAIKS. To be comprehensive we might need
to program the trigger then read it back and compare. Which might
require some complicated unwinding.

In any case I don't dislike adding the checks, but perhaps they can be
addressed separately and we could decide whether to cover other cases
too.

Thanks,
Nick

> 
>  	if (hs->available_trigs < trig_count) {
> @@ -734,6 +776,16 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  			return SBI_ERR_FAILED;
>  		}
> 
> +		if (entry->data.tdata2 && !hs->tdata2_supported) {
> +			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
> +			return SBI_ERR_NOT_SUPPORTED;
> +		}
> +
> +		if (entry->data.tdata3 && !hs->tdata3_supported) {
> +			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
> +			return SBI_ERR_NOT_SUPPORTED;
> +		}
> +
>  		dbtr_trigger_setup(trig, &entry->data);
>  		sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
>  		dbtr_trigger_enable(trig);
> --

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
