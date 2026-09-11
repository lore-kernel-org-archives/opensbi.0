Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4559C88E4C
	for <opensbi@archiver.kernel.org>; Fri, 11 Sep 2026 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puQZWgTiedKEsWlz4ns3ELAaWGONVzAuYaDdeXYP/gU=; b=fUzNnXmuKNqgPI
	tZVd3mvWnwNDQpQqlDfaY81Xrjji+Dfa1Wmw4VnGtzMXJDInq2Z295juY6hWAuhh4uU5qcJLYNHeE
	ptID8FBq9qMnNklCjv6WO+RQ/b2QnGMvuQErKtTb6tXwV7pGS7BA7ARGvRiXHx3sp10TrPJdTpM+m
	IR+qxX7MNjf/tyTPBOSTbWgoaCOaXq0KK1/KbdbHieXJKS+JEtNRlwhxMG+Ka+ZXmWxBQtebaRt7n
	2iPhBezRIM+oJPTKOdhhIe79yh3xv2iNTwys6K0Vow+seXnqx34Y3B+kJaEkpD6Xafv+uFbGvoIUl
	X75KybLntlhD11oBww1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xcB-0000000GH7J-0erU;
	Fri, 11 Sep 2026 09:32:11 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xc6-0000000GH6c-1wv2
	for opensbi@lists.infradead.org;
	Fri, 11 Sep 2026 09:32:09 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso851255a91.1
        for <opensbi@lists.infradead.org>; Fri, 11 Sep 2026 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789119125; x=1789723925; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdGx/qNuMaBjsD5htctjK+4dWz5CpdW/fXh26p6QDOQ=;
        b=lO8lWLa8lrGUxiLStpw68mEjFdvb1YlpfQM/pHYC4ivIuEwPbQ0pGAxRA+EVsNKiTB
         KAbjzWBTk/gjK2/e55/QrXD7s6e701Z5ePBCFA5NNAFo120HFKSpG2FlTE4WWKRLJVjk
         1lXnkBOjBTrX5FG518++VM6FDvp/7b9f9DOwbbGQPfFAp7pw12WZeqpYV2bmbc1/WRtt
         GDK9+VRCPH+Pfx3YOGg5YVt6PkH7fmTvHYP67oHktSI26DinCZAjivec3+6rLFJCWQtH
         Ol5Fv2ldGbQCpMugQauQd7E4jFbIkVgegOoCTnGeU2CMExuOPmAPj9S67bmhy0l876Ra
         9t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789119125; x=1789723925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdGx/qNuMaBjsD5htctjK+4dWz5CpdW/fXh26p6QDOQ=;
        b=sfl2QV+DGq6iljtUu3ifmAfg9rYOFwO+Sqfu1PwghAic0xjNcMbMyt9TYRDHYbw5U8
         Gj3+w/3HL+rNb4mS+yGceoD3cUHG6cW8/UE+ocMfL5tq8+2Mj/OTxRnlbdEaTAEHhfyF
         fIhU2Y2/jDWFm9AHoxSV8K98jWckE9whqe7qhLxTcEEs4MlpoMrEx+qlCyrW1l4Xs81D
         6KZNaaBwfMvJWcPBPCrChcZBKd0fkMXrYB8L58xU2PZ/Q79fGWb4hXVDnqHrsz1BKZWL
         YsSggy69yBmzBx09JAebKZVgHS1vDbVPSOuFwpF/VPl4T+nStO+Pybd9kRHVIsVmulVq
         hlkA==
X-Forwarded-Encrypted: i=1; AKwUvByMxIHqgSBv+9CJBMzRt3Ifor3Z4+XlDsEsqcfYPwZrsfremVANnWTE/UL6opYkIEpqpgIvJG7Y@lists.infradead.org
X-Gm-Message-State: AFuF++noge9dn3VMV82D8vGzqR5mc4hqiTO+DlGMX/IPLlZydcp6Qrz4
	cp/a3DWpeGQnwCVLMMYDYTKmC62G1e9NUw9zbsUr8U/FGPPYrY/awgQL
X-Gm-Gg: AYBFou1ZCyR/13qs100u2gedWhI3RNu0V/WM4ThnAVs+XsnbNXm2OuLUi2wSuPn8CMH
	DmeDhs30mfAuOUK+q+jki3YRdNYlpEHmKJCmmHayIR8bRURJ7PHhd4M38jU0RzLBh2jhRFAuKRv
	vvzVhe3ryyghRE+5EPmhpMMNg2E7fv5cAVnNobM/KsQHvUObg/EcFPA+aZplRk1Ocv1PN9Mdu0k
	cFLndBjO7/IhZvsTCsr7kSjLjiZmZ4t7iAVrQu6gJCaljxaULjzUqMTMrcBjWvMEJcNd3/MrDdD
	x4l9ZqG4SJ5AQvpNNTaSTkHaFf1mu3J7bRvoQacX3eRKNiRCBZHntsU1pxUWQJiILii/v/cBH6l
	/qUxUfM2bH2LWQANRucmSreqwe9D8obUKaoSkiB8Xtcb8jSGFNicEpO13hbBjcxJy3kFTBfN7ln
	h842jJD/uZu41zJmz4Ocs+C2033l73kg29LqtuuQ/SlX1rbFsFLyf8X8kaj352KqipFbzoJ7sLb
	5zMzUrFvmc=
X-Received: by 2002:a17:90b:3c89:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-39d9c39625dmr5755938a91.23.1789119125256;
        Fri, 11 Sep 2026 02:32:05 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9540fd76sm4719209a91.9.2026.09.11.02.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:32:04 -0700 (PDT)
Message-ID: <6cd2145e-b2fb-4f11-ba24-0c9b56554b40@gmail.com>
Date: Fri, 11 Sep 2026 02:32:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: sbi: Clear all IPI devices when processing an IPI
To: Troy Mitchell <troy.mitchell@linux.dev>, opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Nick Hu <nick.hu@sifive.com>,
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20260908-ipi-clear-all-v1-1-b1bd5d016eb6@linux.dev>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260908-ipi-clear-all-v1-1-b1bd5d016eb6@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_023208_450946_C5886CEB 
X-CRM114-Status: GOOD (  22.15  )
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

Hi Troy,

On 9/8/26 06:00, Troy Mitchell wrote:
> Hart start sends wake-up IPIs through all registered IPI devices, but
> sbi_ipi_process() only clears the preferred device. A notification from
> another device can arrive after warm initialization has cleared it.
> 
> With both IMSIC and ACLINT MSWI, IMSIC is preferred and has no ipi_clear
> callback: its interrupts are acknowledged through MTOPEI. A late ACLINT
> notification therefore leaves MSIP asserted, trapping the hart in the
> machine-mode interrupt handler and potentially timing out Linux CPU
> bring-up.
> 
> Clear all registered IPI devices before consuming the software IPI event
> bits so that late wake-up notifications are acknowledged too.
> 
> Fixes: 94f0f8465622 ("lib: sbi: Extends sbi_ipi_raw_send() to use all available IPI devices")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>   lib/sbi/sbi_ipi.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index b04a5877..683d559d 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -263,7 +263,12 @@ void sbi_ipi_process(void)
>   			sbi_scratch_offset_ptr(scratch, ipi_data_off);
>   
>   	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
> -	sbi_ipi_raw_clear(false);
> +	/*
> +	 * A wake-up IPI is sent through all devices. A notification from a
> +	 * non-preferred device can arrive after warm-boot initialization
> +	 * cleared it, so acknowledge all devices when processing the IPI.
> +	 */
> +	sbi_ipi_raw_clear(true);

I feel like this is not the proper way to fix the issue. It introduces
unnecessary overhead for *every* IPI processing, because you need to call
clear on all IPI devices, even the non-preferred, inactive ones.

IMO, the "int sbi_ipi_raw_send(u32 hartindex, bool all_devices)"
interface is a bad idea. It opened the door for such issues. AFAIK, the
only reason such interface exists is that sometimes, some platform
requires the use of a different IPI device during HSM kicking. E.g.,
some Sifive cores can't use imsic, but only aclint. Why not introduce
another interface "int sbi_ipi_raw_send_safe(u32 hartindex)" just for this
purpose? Then we can have a separate rating on how safe that IPI device
could be for cold startup, and pick the right one in the function. E.g.,
favor clint over imsic for sbi_ipi_raw_send_safe.

In this way, we ensure that only 1 IPI is active at any given time, and
ipi_process can still use sbi_ipi_raw_clear(false) to clear the preferred
IPI device, and HSM/init code still does sbi_ipi_raw_clear(true). There'd
be no more cases like Troy encountered, where IPI from another device
arrives late, and you have no ideal way of dealing with it other than what
Troy was proposing.

Let me test with this approach and prepare a patchset.

>   
>   	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
>   	ipi_event = 0;
> 
> ---
> base-commit: 3593a5facc4c6938b90429a6973ba9ee21fc5899
> change-id: 20260908-ipi-clear-all-54c3def85689
> 
> Best regards,
> --
> Troy Mitchell <troy.mitchell@linux.dev>
> 
> 

Bo

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
