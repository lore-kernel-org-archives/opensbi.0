Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10217C61DD6
	for <opensbi@archiver.kernel.org>; Wed,  2 Sep 2026 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tp2IiU927ENAfDOb6nn++yZU2QYP1o02YO5TWc5/SMY=; b=ew5fM0tJwKcZ5g
	6O4flRAeijKyQm68wyYGhr9gdtBAd3kgvfymRuZ3cICUi080dCIkRKCn7tNfEhPjWBcJzGwVQ2a+f
	wZcwuEL3rSI4Id8PiZnSaC+QqI1PWKJwelkip+1hyO+D63jJZ5wk2MmVz03tsAi9qSFlhsSI3Fhcw
	eHvbvgvwTnA7WXqCL+XeIXc1uGT2o18V7SGiiN5tzfiw5GaFlEV1AiNb61iV5qAIN0K9n4wFxoEfq
	4AQxGrUr5la8IYmp6PKCGMuzilKecT7a4+F98lkcq1tGEZsuO5c2PMr1csQChzQxDb6vIyN21eUzi
	A2YgUcZxUPowxVIK1vZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jMw-0000000EXYB-3CNA;
	Wed, 02 Sep 2026 11:43:06 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jMs-0000000EXWJ-0S4u
	for opensbi@lists.infradead.org;
	Wed, 02 Sep 2026 11:43:05 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E89403F5E4
	for <opensbi@lists.infradead.org>; Wed,  2 Sep 2026 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788349376;
	bh=Zo1DiowXpV+shAhTfADTkXPRqGmxjwEfaIdnISkTR3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=cE3MKAGCl+ktNTjNekWR1lvKgH12yFamYjTKj7bwZvd+bNmDvcM5LqqoHBIecZdwb
	 zMaPQin4Y2awJN/OVFBFE+7qBME2ChRFXZeHcT2iqcup13p1+YQkGTDAErJ6WQ7WM0
	 PQokj9COBVDXOimzz2ZvBZnQFmyRkTInq4lp8VjyiVRwZdYOh/YqiuhoUJQDlPdWWZ
	 us0nvpFI70v5bWNzn2QEygZ4RAM1B1EOzquzE9ib0ZWeYnqswGS9dtZ7mnxTRKqVpL
	 n0ok6n1lb8WKgu6HvHXBMVQkqoW6bh2Sc6IpoZ0kSXbxYBtv2K6rK61WufVxoaz8YI
	 XoAzw8Re5mY4xzasZH2D2bY6U78Hk+p1wPn2lu8kZF/1kIYgbcdB+6mnywSzVcXFU3
	 vhvt1HNDKEdaLbVFQbQWftICDfJx3dRFKasm5o1Ystaya5rYyTOSEAKDSPUyVKc/hr
	 nKswvleo3HZnY/q4MtIs2V53+qTfs0RF/1YMZcsltdyx7FEyeziq0oUMSL55d+mUR7
	 AmiYGuLW1sDdpemldCt+lEkGAefXOgbE59rPrwaRTsjf8Nvj8H3E+hPB3roqWzSzkH
	 Y6sxCR2dSD1zDBlm9472OSZS3W+TnrE6ZNCCXOXHeuzknflrIA1mPw563SR8brOtsE
	 7FEwkkRjZxtzEjGRUprZW9ao=
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a6108d2987so1083493a12.1
        for <opensbi@lists.infradead.org>; Wed, 02 Sep 2026 04:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788349376; cv=none;
        d=google.com; s=arc-20260327;
        b=dM8OPgVhkuzakqEonZnr8mTRVOM3UQB8b8k5hc5DoOCkzCguTfmjkHqIP/g9B3fRYA
         EC0W7ThTiSpMNL3nN66tzm42uXFjcncvpAlbQStmxbLe7cbBl9avRMAUkTo3QIitdzlO
         9cGRv+ffIfW7pwToMUczTAy5UFHOfRg3VjHPie/Nal89FtstJQkBXgu33D7pXjSrm23V
         v8zQ6JclOBHLVRfgfa6csH7UgJ5q+JYfzNbBlfn9wWPI+sr4P/U+S8yiXhB6t0Yxlerg
         +TBWagCZJ1UY74Ifr60BuAoKHX04u7idEK1KePnlf4PJPYIeniChux8NPS8SdjzxIEZO
         9kJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=Zo1DiowXpV+shAhTfADTkXPRqGmxjwEfaIdnISkTR3A=;
        fh=4yC0ahJuG9fCLVfEPKa2lTyzkOR6h84Qvj0AylnMetY=;
        b=REUyTwLKmF/oywrkZ3/41/bz9cwFbx/Nq/RINT6tadbqFcn9ZMO9Aw7x2YlNEBLsQr
         GtBrrNy95oyH62HuAARfVql1cL/LZ7rFSW55295K9/uazRcbaAgX6XW1KIUUpdg1hECU
         lbmErkRiLt8atwle9J4a+rfMEvZ6aWfeYotTXrHGzxYEXUIhMTIuyxmmRsvtaYbP6/Kr
         9Wuqgmpd+wJRLcu7aMhetfTbiTSbqF1lwMPc+S8KfhY+SDHkMdpPXwJLLK8IjIhe8ufk
         U5YYgmGJN3Xgw9FcYOqPFOtqQDi0qV/941kSJe8KuaPIL1+XKYjBRc01H/Gv54gSFJV7
         aWOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349376; x=1788954176;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zo1DiowXpV+shAhTfADTkXPRqGmxjwEfaIdnISkTR3A=;
        b=K6oAiTjd27tChhklByRYgtXDAirRJ2vWfp9NRcsPn0yA2APWADn9D/rBIUHjA2RKel
         xjDcKRjoPmFfYzmo3kA9oxHP5tsBDv7rX+chAP47MR1msmlBdQJkfoUuNImrXCYke5xF
         kO/eeB8iK1/PISijVimNO5Vm4fTYDALjyuxdNdHKShHoC29rALZtGBvSWzbdG8ixOaoV
         YEx4tbLa8nFAHVlp2nMnfk6wSEn9YCRNA1UmQdaO6fF5BpVa1eRhb63fTBTeIpS/cRIM
         96TZ+b0e41GAyolthCmU2WSlSqFf9/I1HeZVbY1MtpW2yHtVzjg3A19yzJIzfGY5oMzi
         miqw==
X-Forwarded-Encrypted: i=1; AKwUvBxLsf6gvLTP8Ldgu41gEOnDkOD5/32ggxj4boNdk8sq1+jtvbsFVGcLGe7zgQNCmJsagXeiKPK6@lists.infradead.org
X-Gm-Message-State: AFuF++lUDDvj9mqqtPbDwESag8Sqmph95IzHVVV+KloK80NS5doJhzKK
	MEF0luGOsGgzVJO/3reiaUPKR5kvWMMYvvnwRm0OlJOeAVA0BOcMU0KSZb9gzYq8H1Cc6Z2wXDR
	HoSx6TAWlXyzTI+EIQTjz68IGtryRbphA/ZRK1PcvEIvo+3B3zCOkdvbQToJnqNTNVtOLhbYBWW
	QKks+uPJrcIbheMksGutybLMbsMa6fG+zwkqUQHASdaalUbNt0y8qqRiM=
X-Gm-Gg: AYBFou2e56a4gyHAMSUVUggh+gy07/S8++sfvVCT/MPe1IxN5QAd43BeycO/0p7bxGC
	+hys5w4aWAcURCBhzi2VI/8OHSvq6e4MMwae43MtPcSecApuhfm/rLSWi5U6+BHV3GsaIA/Kr5n
	s3TpWxwn7SWxlihZ/7nsChV4/TXZWRN64h9xQE88yjIKLraMq5A2DPZOoe
X-Received: by 2002:a05:6402:530d:b0:6a6:32f6:c with SMTP id 4fb4d7f45d1cf-6a6828a0c6amr3032498a12.18.1788349376334;
        Wed, 02 Sep 2026 04:42:56 -0700 (PDT)
X-Received: by 2002:a05:6402:530d:b0:6a6:32f6:c with SMTP id
 4fb4d7f45d1cf-6a6828a0c6amr3032464a12.18.1788349375891; Wed, 02 Sep 2026
 04:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
 <20260831200832.404000-1-valentin.haudiquet@canonical.com>
 <DL3QRSFAH67P.3K76LXQO2VWBC@linux.spacemit.com> <a2f37394-2cce-4168-9d84-df51aade028b@gmail.com>
 <DL4QAFEBOHOQ.DSF67YYWU9N4@linux.spacemit.com>
In-Reply-To: <DL4QAFEBOHOQ.DSF67YYWU9N4@linux.spacemit.com>
From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Date: Wed, 2 Sep 2026 13:42:44 +0200
X-Gm-Features: AcwNN1W1vP4Rb1fVWhmaNgy1ndPp54vR74y5GCZYLT9Q1F-r4XNAxEG3c_21J9E
Message-ID: <CAPEPrSMsnbuPOUuvj06+PtczdokK42vSpy8n_0hCLh0cEO-QkQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] platform: generic: spacemit: k3: follow-up fixes
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Bo Gan <ganboing@gmail.com>, opensbi@lists.infradead.org, 
	Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, Anup Patel <anup@brainfault.org>, 
	Samuel Holland <samuel.holland@sifive.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Sarah Emery <sarah.emery@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_044302_575094_F395B0A7 
X-CRM114-Status: GOOD (  38.03  )
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

Hi Troy, Bo,

Thanks all for the clarifications. Sorry I misunderstood the
architecture and thought ESOS was using A100, I now understand that
this is not the case and that it should not be needed for the upstream
kernel boot.

Troy,
I agree that the vendor path not being part of this series makes
sense. However, you said in cover letter:

> U-Boot and Linux 6.18.3 started, Linux detected SBI v3.0 and the HSM extension, and all 16 CPUs came online.

The "Linux 6.18.3" made me think this was the vendor kernel. The
upstream kernel patches are based on 7.2/7.3 (or at least I thought?).
Thanks for confirming that you tested an upstream-based tree as well
(with backporting of the patches, then?). Also, the upstream kernel
only sees the 8 X100 cores AFAIK, so how did the 16 cores (i.e.
including the A100?) came online?
This is the reason why I assumed you were testing the vendor kernel.

I'm still debugging the issues I have with the upstream 7.2 kernel. I
believe that is the main difference between our tests: you must have
used U-Boot DTB where I used the upstream DTB (force-fed to the kernel
using Grub `devicetree` or an EFI stub), which only describe the 8
X100 cores.

It seems I was mistaken with the ESOS explanation, but I now have a
new theory :)

Here's what I believe is happening:

The v3 pre_init enables CCI-550 snoop and DVM requests for all seven
slave interfaces, including interfaces 3-6 (clusters 2-3, the A100
clusters). The CCI-550
broadcasts every snoop to all enabled slave interfaces. It doesn't
matter that only X100
CPUs are running; every coherent memory access from any X100 core
triggers a snoop to the A100 clusters interfaces.

With the upstream kernel DTB (8 X100 CPUs, clusters 0-1), the kernel
never onlines harts
8-15, so the HSM hart_start is never called for clusters 2-3. Those
clusters stay
unpowered. But the CCI is already snooping their interfaces from
pre_init. Snoops to an
unpowered cluster stall the issuing CPU in a memory instruction: a hard lockup.

I tested this by applying the patches incrementally:

1. v3 unmodified: hard lockup during udev coldplug. The clusters are
still voted for
power-down; the CCI snoop to a fully-dead interconnect can't respond at all.
2. De-vote all clusters + pin cold boot to hart 0: the hang moves
later but still occurs.
A soft hang at basic.target that changes location between reboots.
3. Wake core 8 in pre_init (without the A100 perf CSRs): boots
reliably. Waking core 8
powers up cluster 2, CCI snoops to interfaces 3-4 complete reliably.
(I believe cluster 3 does not need powering up as its L2 was never
touched, and empty L2 returns clean immediately on snoop).

If you used U-Boot DTB, with 16 CPUs, then the kernel onlines all
harts and HSM de-votes
and powers clusters 2-3 before doing coherent memory operations. With
upstream kernel DTB, HSM path never runs.

I'm still trying to figure out all the hardware details and fully
grasp the issues.

I guess I see two paths forward:
- Make the platform X100-only: enable CCI snoop/DVM for interfaces 0-2
(AIDMA + clusters 0-1 only), and drop the A100 HSM support. This
matches the upstream kernel DTB and avoids the stall, but limits the
platform to 8 harts.
- Keep the full 16-hart support, but power all clusters before
enabling CCI snoop. De-vote all clusters and wake core 8 in pre_init
so the interconnects are alive before the CCI starts snooping them.
This is my modified patches 1 and 3 (de-vote all clusters + wake core
8, without the A100 perf CSRs).

Does that make sense? What do you think?

Thanks for the comments and the patience while I try to figure out how
the internals of the K3 platform work.

--
Valentin Haudiquet




On Wed, 2 Sept 2026 at 11:38, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> On Wed, Sep 2, 2026 at 01:41:16AM -0700, Bo Gan wrote:
> > Hi Troy,
> >
> > I missed this one earlier. So basically I need the latest upstream kernel
> > to be able to test this patchset,
>
> Yes, that is correct. I have only tested this series with the upstream
> kernel, not the vendor kernel. Sorry for not pointing this out in the
> cover letter.
>
> >
> > because all the rpmi backed devices in
> > vendor kernel device-tree just won't work. Perhaps this should be called
> > out in the cover letter, so I don't have to waste time debugging vendor
> > stuff. IMO, leaving the rpmi stuff out is the right approach for initial
> > work. I feel that path needs to be properly reviewed and make sure it
> > fully conforms to the standard.
>
> I will state this explicitly in the next cover letter. This series
> only provides the basic K3 platform initialization and start-only HSM
> support needed to bring up the X100 and A100 harts. It does not include
> the vendor-specific OpenSBI RPMI support required by the vendor kernel
> and DT.
>
> The relevant public documentation is available here:
>
>   CCI and PMA [1]
>   HSM-related power management [2]
>   Clock and reset [3]
>   SoC address map [4]
>
> We do not currently plan to publish additional K3 hardware details.
> Before doing so, we would need to reorganize the documentation and review
> which parts can be made public. This is a substantial amount of work and
> is not currently scheduled.
>
> Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/08_cpu.md [1]
> Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/16_peripherals/power_management.md [2]
> Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/17_clock_reset.md [3]
> Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/06_address_map.md [4]
>
>                                             - Troy

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
