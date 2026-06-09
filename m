Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9264ECD8CAD
	for <opensbi@archiver.kernel.org>; Tue,  9 Jun 2026 06:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgafLXRRSf2Rs5W3znbyRxDZZSZ3d+C68GODVTuS35Y=; b=MLZ8vCONtYye4H
	sobJ8IaglWwcqlJNff1LXIpCIu257reZOuXaFC+ephr3/zcZoY5T3ZEhQwYj8bwzAVv2qSlA4DLPw
	P4ehZvRnpYWuo2M1u/s1DY0n/cODesjmupOPbsD5Pr2Oiwb+4HC02FYhVTMeY6VwR5QJgq0tHjdug
	DSVnXWtAjmKd2CbWPZS3qgxTu3PxuUCZxcTAZeCVI11leZTeKSR8lRFtK2/Ps4BGZD+yQPwh9WxQd
	c59Bc38d92ID3sprbgIZOsZuPPlN11MyMivCXYhyqGmjjqxDnjqbVMxqwhp1sSn9DbTgXwvWEGKCi
	vPHsR8flhnkE3q8+ijlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpeJ-00000004pjs-345o;
	Tue, 09 Jun 2026 06:09:19 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpeG-00000004pjW-42cC
	for opensbi@lists.infradead.org;
	Tue, 09 Jun 2026 06:09:18 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c8629bed4e7so1423173a12.2
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 23:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780985356; x=1781590156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p8LPTwgKRZ+rhLLza+LYZ4DESoHokwlf9GySzOr8oos=;
        b=ctO9zcqTuZe9zBqAmI8N/gdA+akVbv1ivhXbwrktx3hnpcWOA66xEQ3SLQru1sFsJB
         Zc/J0C+ZWszru/H5CUl2KDHG8BcFvxzn4uqddHkA0O6rb3O1L/e6PE0xiQRTPZsF1jyk
         H0+ptYCh1lk1vA0OXu6x3l4dtXCfaVXGu/e/ZVKRYgGBKyrtaHrlFAuv6WDTvrAClpda
         dv8c6l796y1ZFZD+ipyN8L9VbQda4L/ZPsgXLTMymOQlLvMoegByxJkuPq0vTUbGV81d
         Z5MYsMbrbUIdk4AvCEpadbo9fXPFgdv0Z8IbIlRyD8ZSalYvRUwadbSaFaczs2gLNAQV
         Lpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780985356; x=1781590156;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p8LPTwgKRZ+rhLLza+LYZ4DESoHokwlf9GySzOr8oos=;
        b=Pp91D42NngRsyr/HBxiNI+eO3/dLDqIk/tnqSWdSsba99SOVwOuFJmNK5A5EcvYhYu
         wyM2W9xfIEc0IhYJuW8ZxNoqCFPNnMal8I120X83vWKEQQ3Sle1TnQQAcSJVLObo9oYt
         OWQzLstgyGDH4gL5WM/2Gw9Q38OpcPkMKiIKdyqsz5RwDCIuGTjKurxOqOMQDO0B/Cm7
         +RcUJkKm24KfkSnrIHzSklytfwbFykHQT5ttvnx2kDtAuPOTXA9q4cfvkTERInb1S1Yg
         b4lJbGrPkw2MhYxd3gI0oyGoSUVL6lgGzNV2pPdqP1iISMjUHGDBInCFeKY0JsyPIejj
         sDCg==
X-Gm-Message-State: AOJu0Yyw/ukYnc/HyN6y5eD7NGAemDbn2d0n7zpka2FfdZNeANDe/n35
	rvLh7DZB+OSsaZgV6woIi0jMf3RiM/4816Te2pFEfAOtvNVQcBsjbZs/U16/Ig==
X-Gm-Gg: Acq92OHBjRcn1OYqMyro4SFMRjfNDE7nQ/bbBYGKcZKQr86Y0mtStKzBUH25ZzmQv1P
	Q41YiYLKSR+33n5gGEqYJdeFvUVvwZbLCnKIj9wrg8+3zFmlfcC3PJy2QFonpz+1U6U/gqb4oZZ
	k57FaH8SbLMvoPjVaibKSBZvNy6PyJooDEhdb+gw8+I4+d3g1AoajQw8E2rbgYSW80Awa2cGVAB
	XiQyvRBdxap0JeD2PYYbQ9V/GgONtYJm64dhkZZSjyl1SdQyWrkJynsXqsklopoToi31Y2VvGqv
	6VQqFtWpvRpy5qvT8mJVhoffDgM1BtDUT6SqJIlyiWBUz/dcRv40BbWPEiwjX9F7cnoBbXyoq9a
	favhOV1isw+MPR96b0yPALXwmSmvoBRIIdwMfrojO/YMUKOUz/9nJqP2L8MixMlOAf0vcGA3jRG
	b9drQxTSolvlSwjwsRCj2jUE8cBRYKEKtoOoweDBMufxgfGg==
X-Received: by 2002:a05:6a20:d48f:b0:3aa:f9cb:d43a with SMTP id adf61e73a8af0-3b4cccf7d06mr20425706637.5.1780985356177;
        Mon, 08 Jun 2026 23:09:16 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm16909599a12.9.2026.06.08.23.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 23:09:15 -0700 (PDT)
Message-ID: <89240780-7934-4056-96f9-35b945b0ca8c@gmail.com>
Date: Mon, 8 Jun 2026 23:06:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fixes for vector misaligned load/store handlers
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org, wangruikang@iscas.ac.cn,
 dramforever@live.com, andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com, pjw@kernel.org, asrinivasan@oss.tenstorrent.com
References: <20260608211703.571-1-ganboing@gmail.com>
Content-Language: en-US
In-Reply-To: <20260608211703.571-1-ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_230917_007946_80145FC5 
X-CRM114-Status: GOOD (  12.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Please disregard this series and use v2 instead:

https://lore.kernel.org/opensbi/20260609060024.706-1-ganboing@gmail.com/

Made some mistake during merge, and the PATCH 4/4 is messed up. sorry.

Bo


On 6/8/26 14:16, Bo Gan wrote:
> Re-visit the vector misaligned load/store handlers and fix:
> 
> a. Avoid stack overflow by using a small sliding mask[] buffer,
>     thus optimizes stack usage *IMPORTANT* (correctness). There's no-
>     longer a need to have a pre-defined vlen maximum, and worry about
>     whether the stack can hold the mask[] variable.
> 
> b. Maintain the value of vstart when redirecting uptrap. (optmization)
>     Avoids doing duplicate work when the instruction gets restarted.
> 
> c. Explicitly set VS dirty in (V)SSTATUS. (correctness), VS in
>     VSSTATUS must be set dirty if coming from V=1.
> 
> d. Zero out tinst in uptrap if not guest-page fault (correctness).
> 
> This is a follow up patch to [1] and should be applied on top.
> [1] https://lore.kernel.org/opensbi/CAEev2e_Vg1mMP4mOKanFX_EGeUzpczRcWW++vBBuN1CfyM0BJw@mail.gmail.com/T/#t
> 
> Bo Gan (4):
>    lib: sbi: cosmetic changes to reduce indentation
>    lib: sbi: Rework and split sbi_misaligned(_v)_tinst_fixup
>    lib: sbi: Add variable-length unprivilege access functions
>    lib: sbi: Rework misaligned vector load/store
> 
>   include/sbi/sbi_trap_ldst.h |   3 -
>   include/sbi/sbi_unpriv.h    |  16 +++
>   include/sbi/sbi_vector.h    |   6 ++
>   lib/sbi/sbi_trap_ldst.c     |  66 +++++++-----
>   lib/sbi/sbi_trap_v_ldst.c   | 198 +++++++++++++++++++++++-------------
>   lib/sbi/sbi_unpriv.c        |  88 ++++++++++++++--
>   6 files changed, 269 insertions(+), 108 deletions(-)
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
