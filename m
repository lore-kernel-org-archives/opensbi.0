Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7D7F364B4
	for <opensbi@archiver.kernel.org>; Thu,  9 Apr 2026 19:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnP5SzjuyZuZjMp3hJoYTDDgpLs6Tm6FmgaH5IWamCQ=; b=oC17Qr2P9VmV9Y
	hs14zl6Q1oJDS06xo5Uk21pnABtIIRNYgyxuG6mlwpWOJA2MtA9ueMldYhpVxV/wyRwajWA0HT7E4
	O7aHM7TIBx2OUminAV5wTyRxG9nmvCLNariPTMQCdGl5B2u7132XIZMftOS+9g/fglxH1Cb/M3NOi
	potZUj5Ul4WdlBms4mUTIdiUDro6K1ZJ1HOJbr64ABcK4dSgc5DxwW0aE2jhsRIAe1gnqB2FZEUXd
	djDD+aSI2LhBDs1lPHeQGe2ARerdqgwK5MR3P+Qq/JeM9Rad3iVGdpklgxoFMs2by1cFnRcYjwLnE
	RKt8NCIqHF0Rif3eIDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuv9-0000000B97l-3c6U;
	Thu, 09 Apr 2026 19:20:07 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuv7-0000000B97M-0unQ
	for opensbi@lists.infradead.org;
	Thu, 09 Apr 2026 19:20:06 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2cc43ca447aso67092eec.1
        for <opensbi@lists.infradead.org>; Thu, 09 Apr 2026 12:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1775762404; x=1776367204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phyHgJpdfWS/vSlsNtTEeJdPw8Vzydg0XtJpIXKTexY=;
        b=QR5dZZQnqqDJC2RESmStelcp0gE+xe27GnB0ROIiMtfUGF8CmyH0TLyOUNh3SlOtbj
         8I9q+G+xaS9WD1xAauXEjRuLqzO1UGmkXT6pP53W0jouPbbKH8ygUbnO5sXXFyZB7959
         e8LdOYHo5HNU4PKUupc/VABJbAJ8ph0wSwWlK+Tt/A0HhnJbCyOatxxMyY6nOfVUs41a
         rtyFYdz1wdSL0PKHmXTsvlFzfqu/C7bixEYzEQP5JKTXXv078XxOF/bNi9UvqYYiKeBW
         TTUL1oU8nWXIYESNL0h4Ed52b7JyUlwuu4XWByVFegACTlDL0GhZ3cwwR2d5fouPBCvb
         XB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775762404; x=1776367204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=phyHgJpdfWS/vSlsNtTEeJdPw8Vzydg0XtJpIXKTexY=;
        b=WcVq5DEHD1yiF4DqNWz70qmhi1sPvfyEcyk7wYtyQGlVW+vXmRs59nr0iEz7mfqX7L
         N0XGSASYA7DPYOhbunKjQvWcxrNF9UkWxeMiC8sly7u6117eyjB029EUwbUbG8wey7QP
         OkApaB64p5oBH6myco4FOydHOgkDKG3cKc2+gOdYZORBgavzGEe3C0wadTbZnmHK2gER
         +rmHzlegr3pEOK+SFOO1SjIDqlh2xKlyRORDtLb51mTR/s0RmjW2sPCfbG8Asu5wB16i
         N4KIv7fdIauh1JkssvnF07zdrjsT8Xtz9uLHLrXnIIk7LPGjT4MkOmi31/UFjvPfhiVw
         BuNA==
X-Gm-Message-State: AOJu0YxU2Bf+J0z4XYfq7yec57QV7knPVCnTLZ4gvGMGcGdrxA/vEWLC
	2xwxjfuiBIq0yOJATiBVhNRmyrUSrwS1V0rQUepNxb8lHLSIb/6tznyFDrPCURoiecOhCrFk5Ax
	8Sw19
X-Gm-Gg: AeBDietMAaqbk0UeL+80aLoCfGz2bYxot7QoQRGzo6bGZnZzH1FFXZeAdHFC3lkVMpe
	oynXtNxJvxVs1E1uFgA/E79MO8ybisaltufGjpU5T3/SiR8x+sNrjLzsqG+qy+WQfTJy+TRsWMm
	Cp3hGq37NLScnW8VWCovceqmD9PNSeeBcb5DV6tDl66YwTGmAhKguDUHtOWEBCKcgdvkqhSIYBT
	amLM7MpNczI7i/p91lN/lx8PQOVFn3TMzaYscXi3XmyP21hQ7MriiMf+hmbCD6tHMe8UlnkikPa
	8cAGbQtZufANSwgPB/j+Bg2beTkSg0izXN3vqUB7YFvzAWaCT5jh8qYoWTW3x95ivZsGMc1HznB
	DIe5+cOhHOWeltNytOdeFeaY3VrPODbcloJ0qVFQKAN7RhL1i3CDdtx+CkLBMdOW9NPrxMqfBM1
	olhQ2xskIsEhPdqzPijRT6s95Zf9FIBS97jbjuzXqx7hWLgaX7qw==
X-Received: by 2002:a05:7022:6183:b0:12a:7181:2f12 with SMTP id a92af1059eb24-12c34eda887mr81803c88.3.1775762403799;
        Thu, 09 Apr 2026 12:20:03 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c3459faa7sm769481c88.2.2026.04.09.12.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 12:20:03 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org
Subject: Re: [PATCH 3/7] firmware: Add RNMI/RNME handler infrastructure
Date: Thu,  9 Apr 2026 19:19:43 +0000
Message-ID: <20260409191943.291207-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy2PHSsMNib5Bscp1mWvdQTii_PG7jDpgR9vf_f=7x04sw@mail.gmail.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com> <20260310183155.2186463-4-evvoevod@oss.tenstorrent.com> <CAAhSdy2PHSsMNib5Bscp1mWvdQTii_PG7jDpgR9vf_f=7x04sw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_122005_313562_40F25A7E 
X-CRM114-Status: GOOD (  17.82  )
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

On Wed, Apr 9, 2026 at 8:21 AM Anup Patel <anup@brainfault.org> wrote:
> On Wed, Mar 11, 2026 at 12:03 AM Evgeny Voevodin
> <evvoevod@tenstorrent.com> wrote:
> >
> > +.macro TRAP_CALL_C_RNME_ROUTINE
> > +       /* Call C routine */
> > +       add     a0, sp, zero
> > +       call    sbi_rnme_handler
> > +.endm
> > +
>
> s/TRAP_CALL_C_RNME_ROUTINE/TRAP_CALL_C_RNMI_ROUTINE/

This macro is used in the RNME (exception) path to call
sbi_rnme_handler(), so the current name is intentional.
See below for why RNME needs a separate path.

> > +_rnmi_handler:
>
> s/_rnmi_handler/_trap_rnmi_handler/

Will fix. I'll also rename _rnme_handler to _trap_rnme_handler
for consistency.

> > +_rnme_handler:
> > [...]
> > +       /* mret - return from exception */
> > +       mret
> > +
>
> Drop this _rnme_handler because C handler can differentiate
> between NME and NMI based on the MSB of mncause CSR.

Per the Smrnmi extension specification, when an
exception occurs with NMIE=0:

  "the actions taken are the same as if the exception had
   occurred while mnstatus.NMIE were set, except that the
   program counter is set to the RNMI exception trap handler
   address (rather than the address specified by mtvec)"

This means RNME takes the normal M-mode trap action: it writes
mepc, mcause, mstatus -- the regular M-mode CSRs, not MN* CSRs.
mncause is not written by the RNME trap action (it only
writes mepc, mcause, mstatus), so it retains whatever value
it had before -- either from a preceding RNMI (MSB=1) or its
unspecified reset value. In neither case does it reflect the
RNME exception, so checking mncause MSB cannot reliably
distinguish RNMI from RNME.

mncause is only written with MSB=0 for exceptions when Smdbltrp
is also implemented (from the mncause CSR description: "exception
within M-mode that results in a double trap as specified in the
Smdbltrp extension").
With Smdbltrp, both paths go to NMIVEC and use MN* CSRs, so a
single handler would work. Without it, they differ fundamentally:

  RNMI: MNSCRATCH, MNEPC/MNSTATUS/MNCAUSE, mnret
  RNME: MSCRATCH,  MEPC/MSTATUS/MCAUSE,    mret

A single assembly entry point cannot serve both because the very
first instruction must choose which scratch CSR to swap (MNSCRATCH
vs MSCRATCH), and there is no CSR that can distinguish the two
cases at that point.

I'd like to keep both handlers for correctness with pure Smrnmi.
Smdbltrp support (and the single-handler optimization) could be
added in a follow-up series. Would that work?

> > +       int (*rnme_handler)(struct sbi_trap_context *tcntx);
> > +
> > +       int (*rnmi_handler)(struct sbi_trap_context *tcntx);
>
> Drop these platform callbacks from this patch. We will be
> extending sbi_irqchip to support NMIs. For NME, we will
> can simply crash.

Agreed. I'll remove the platform callbacks. For RNMI, I'll
route through sbi_irqchip once that support is in place. For
RNME, I'll simplify to just print diagnostics and hang.

> > +struct sbi_trap_context *sbi_rnme_handler(struct sbi_trap_context *tcntx);
> > +
> > +struct sbi_trap_context *sbi_rnmi_handler(struct sbi_trap_context *tcntx);
> > +
>
> Only one sbi_trap_rnmi_handler() needed here which will be
> called for both NMI and NME.

As described above, since the assembly entry points must be
separate (different CSR sets), I'll keep two C functions:

  - sbi_trap_rnmi_handler(): handles NMI interrupts, will
    route through sbi_irqchip
  - sbi_trap_rnme_handler(): handles exceptions with NMIE=0,
    prints diagnostics and hangs

Both will be renamed with the trap_ prefix as you suggested.

Thanks,
Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
