Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86064FCC9AE
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 02:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dOgpbUgrv0pJ24yZ0p4kuw8/aJCywWq58I4+O+S8PM=; b=ivnji2UB31A0S3
	J7d57KvFhr0Nx3zLm2fhvPkNsuQspAKFtJBOwMe3exHYQGBWLS6OY7KkCR3z5nKoeK5kZ68Dj0izo
	HO9dpWx0dGWyf5D50nMQAQpiqkUTbvWmsjUUU6subtY4yyNuMe42BOEWwH4iAUu416nkhAdByOseY
	GII8i9lml7xydoiKcz7E8OZ2YeQUt0aBWEGNxXP0royVSnC5fFMDxrtl3iatkIJ4i6pqw/oMIIFqe
	cobztCXeCfAisp7/z/FXDzJYwnrSQ/gVLtlzUVC5W82WVwpkOSpbIyjoZ/Hf2VHgiEnIyj6MxxMZ0
	hN8CmyQtE/A5tgt87rUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmpb-00000008ZeE-1AeG;
	Tue, 10 Mar 2026 02:28:23 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmpY-00000008ZdV-3UVR
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 02:28:22 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ae505619baso53134175ad.2
        for <opensbi@lists.infradead.org>; Mon, 09 Mar 2026 19:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773109700; x=1773714500; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FNqXzpoDjQhlUjM85ucTPRYtv3WKroaV72IH26TLL7A=;
        b=JlTTEgqRaAVZ8vH+dlGxnz2IUb/wRY51bzVX5DeJaNFEgqkmuzaNdMkDZYG8BsoLjE
         2KwgKY66n8aogjit3i1x8mxR4fAqdb0fkD4E5iuWvg1QA0U4/jo3j+AMuQHIawZEGsQX
         ise020RVF9dz1plvR6NZ2gNOSW6ZwptNNfbytltglIqVoz5JbxbCHFaduxAVp2TIcPpB
         6t80hZZPhFYMMafn8BO4oBCfkRvrApUD0wcMGsT3NOjEkI/Rwtricz29UOD1xBIl7v30
         v0fkqcHy1foPkA+HA/aA1CU4yQxyUapT0GE29Mm6fIE9AncLe2OvE00ystMsDvUwJYf6
         H9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773109700; x=1773714500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNqXzpoDjQhlUjM85ucTPRYtv3WKroaV72IH26TLL7A=;
        b=GcXjL0egwxut9A41ZS2E81hGPPFxdS75jC3fFi0GWxbQn4DABTwvfsl5z6R+c1LkF1
         RDHwpL5OymhgkwAafWfDSSoDCLvaPX7ujuQ/6KpPVMGtGm7ASMYX76IYdFW1a+w2CBW0
         ZwBItX7pBU8VEEo3MyN6mrnbmmI+Wkt+/MVcJBLnvDrxGZNuCTtsNHnZDUfy1P86bxPL
         +G/KFKk0h3wejRQ2XmmhoxYO+Y1m5UlbZk2eh9y17Ngi5c8fUlZI21qwyNcRGJr0+LkI
         qPgeujEL7OxbWMat7kSTvjlR8RN3NTFSNrCwGpc9JZe+ZE9L9NbuWq+kfvKfaLDIzBaO
         kXNA==
X-Forwarded-Encrypted: i=1; AJvYcCUBkouxulqqHGJzjbgL/Yx89z021+zRpjNKC6WWKab/dpN/DGtQZFvmNN6yNRGTBLArX7HnRRsM@lists.infradead.org
X-Gm-Message-State: AOJu0YxHcgK0ep00a1rSfSiz8cDKFtkp8Dwi4cimLPig/Ai+/btiY69l
	wByhGC/bB+gnwPq1DvdUJmHcO/9CjNz4zUloTVcEeqtQx/6/BBbpzBHX
X-Gm-Gg: ATEYQzw+SOIvPWo26Bk4BY+7eYiDNvawcipIHUK0HxR3vRnqjZ5YxaC+I7ivG4NnSFJ
	qEeUyxRaaBSmiMnC2AAUk5TcH3Xhrb+LCZAvFS+683QFCUzK9Wa+i13TeckbuUEKoJVQzzjNTcn
	z0+5fkxnstaLLfnfCyV6u2y43JeR5CD6MRyVFMazn69rGPitlmoKocX3sfjgrSMKhndtyLQCH4L
	wWqCtYkigMOUrdvGqGyNhXbm+gvBPym3NMzykTWQsM8oFj9guioZ+duTVH64ZJt2gkaNWQ2pIUx
	wrGA4kpiuE6DcVHWqSvo8QXNa3PcAEHydEvr5J5QB1ZA7YVjO+XvTiQwZSs5nWiYYeWCveZTPPa
	siGrQinlZ5ObruBKQ4AE5w/bk7Vzx7GYcINj1CuacAu4Ak5ukhaBCRNmiqWBQ8aDCJb24bPmfcl
	EkmuPvDaJJDrNkWh9DD9S5ljVOBIUkeJ/xFd832qPw5kLfnc36/qvFgJRBTe6150VM
X-Received: by 2002:a17:903:189:b0:2ae:47c9:68c0 with SMTP id d9443c01a7336-2ae824fe082mr137955315ad.40.1773109699902;
        Mon, 09 Mar 2026 19:28:19 -0700 (PDT)
Received: from localhost (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2ae83e57b14sm170989405ad.19.2026.03.09.19.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 19:28:18 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:28:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: Nylon Chen <nylon.chen@sifive.com>, 
	"opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	opensbi <opensbi-bounces@lists.infradead.org>, Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
Subject: Re: [PATCH 2/3] lib: sbi: Enable Smrnmi extension handler
Message-ID: <ajsifrry25y4ogzupvkl4bplklqppquexfw4erorqsn3nlmtpy@b3qqdlrgd3kd>
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
 <20260129-smrnmi-v3-v1-2-5d297d3e2027@sifive.com>
 <DG4KXRI812NK.1R8OG8O0MZ5A2@qti.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DG4KXRI812NK.1R8OG8O0MZ5A2@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_192820_897957_EE3461EF 
X-CRM114-Status: GOOD (  23.49  )
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

On Mon, Feb 02, 2026 at 03:26:33PM +0000, Radim Krcmar wrote:
> 2026-01-29T00:13:42-08:00, Nylon Chen <nylon.chen@sifive.com>:
> > Enable the Smrnmi extension by:
> > 1. Adding sbi_rnmi_vector_init() to allocate per-HART RNMI context and enable RNMI via MNSTATUS.NMIE
> > 2. Saving and restoring CSR_MNSCRATCH and CSR_MNSTATUS across non-retentive suspend/resume
> > 3. Calling sbi_rnmi_vector_init() from the cold and warm init paths
> >
> > Co-developed-by: Zong Li <zong.li@sifive.com>
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Suggested-by: Nick Hu <nick.hu@sifive.com>
> > Suggested-by: Samuel Holland <samuel.holland@sifive.com>
> > Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > ---
> > diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> > @@ -149,6 +149,15 @@ struct sbi_platform_operations {
> >  			unsigned long log2len);
> >  	/** platform specific pmp disable on current HART */
> >  	void (*pmp_disable)(unsigned int n);
> > +	/**
> > +	 * Platform-specific helper to program the RNMI trap vector.
> > +	 *
> > +	 * The core will call this from sbi_rnmi_vector_init() with the
> > +	 * firmware RNMI handler entry address (rnmi_handler) and the
> > +	 * cold_boot flag. Platforms that support Smrnmi should implement
> > +	 * this; others can leave it NULL.
> > +	 */
> 
> If the hart supports Smrnmi, then it begins with nmstatus.NMIE=0, which
> means that any exception is going to enter a critical state.
> The platform must somehow support Smrnmi to be useful, and I think it
> would be better not to do it behind opensbi's back.
> 
> If the platform wants to handle Smrnmi itself, it can hide Smrnmi from
> opensbi, so I think the requirement here would be better as MUST.
> 
> > +	int (*set_rnmi_trap_vector)(uintptr_t handler_addr, bool cold_boot);
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> > @@ -273,6 +273,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
> >  	if (rc)
> >  		sbi_hart_hang();
> >  
> > +	rc = sbi_rnmi_vector_init(scratch, true);
> 
> Are we sure that earlier opensbi code won't try to trigger a trap before
> this point?  OpenSBI would fail to boot if it did...

This appears to come right after sbi_hart_init() which does a bunch of
CSR detection using traps, so I'm not sure if it can work.

Evgeny (+cc) has been doing a lot of work to enable Smrnmi on Ascalon
and unfortunately we did not see there is this duplicate work happening
upstream. His changes also has a few other things such as RNMI exception
vector setting, permits a platform specific handler, and has an Ascalon
platform implementation.

So I asked him to post what he has. The intention is not to disregard
this series, but to just show what he has. Hopefully the best of both
can be used.

Thanks,
Nick

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
