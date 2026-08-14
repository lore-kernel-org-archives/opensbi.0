Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FED3C5DF66
	for <opensbi@archiver.kernel.org>; Fri, 14 Aug 2026 03:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:In-Reply-To:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=taBIThatWGDs2C78NPIU3VcMLnMEYdlM2WU7qEqcTuQ=; b=TbRkqbWcdGKJKb1AFowYx7vRxi
	a5lQTeTqW+Dsf0p7g9KjimBmA8jKKL/NXPT1OBJL5w0ZxHrrcHBgB7o21oFfMDG3AlJY9RvqB8AP7
	hnp8xX1qpesPrRimNj/zub9KUKDRUOA5vdheY+Qc63X1msU+oPS8CpcArVkSfqB55UH55o+IV2RfG
	RJ+HIdcGTg4Cbhg2WfMHrvO++Wp2aQXTmAr5R694r/oEpYb5ONfxOHF5NGQLcc/ZQDU6yt9JLIepF
	8cqg7eFTRbRJ6Dl7Y3TlFfYFohDM9mk0YJ6FCVJvH6sn/G7aAyVJqstycmJ1lSktkCrbQcEgXmbqB
	gZEtesXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuiD1-00000001swc-2e8i;
	Fri, 14 Aug 2026 03:03:51 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuiCy-00000001swD-0Iir
	for opensbi@lists.infradead.org;
	Fri, 14 Aug 2026 03:03:49 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5b00d083818so1603304e87.1
        for <opensbi@lists.infradead.org>; Thu, 13 Aug 2026 20:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786676622; cv=none;
        d=google.com; s=arc-20260327;
        b=SRIyECKFoO5GTbv49g1K9UYkSjVFokdJJ9x8PItIQM5SKAs8JBZLOcoeCRVJkRclQs
         k3DQCXyvo3Oy70/uqxP53Ya/4EWYVfUxi2ooJaBb+YGPqmYBRyyUNJ2Fk1XtR0AvHiGv
         wLCQevL4PlPGw0x0UZd1TpbHeoP0FtmHyFhMHpfzmkAosFESDOJWowPO+irBppiekxRp
         jbbu3hdINupxkdttn08ivVFJb5XbN1BWMJNfZbSm8fFTFOoZa+0A327xMmlQonQnr2aK
         BsaYVLXIRbYG9o1ILAwABY9l4Y37yQP+raj+s2IP1vxk7oKyVsEQbA99w7KeAAY3Y+bQ
         jSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:user-agent
         :references:from:dkim-signature;
        bh=5ukYAG8KuzfNE63WcYxI+d0bUG66L5XWlsEIHRxVdSo=;
        fh=rhM9+DLGxzyhzd596wpCcRjzXckwLmCxj79AL/PlNew=;
        b=ZMY+JbZTw+E1t8HchsP/GubtLMFrYV1hEHOPaQLbxAB4Bw72B4TZFp4C8bCajUccll
         4dX02XxDSHnBJkTVjGXiCfZqXj8wwmq4MAu5P2OamHXGrY3NXx3QnIzXVeTex+PGx2Nw
         q5lHxhKyOydyws1uLMjG8gzUiAuUBu9xhZl0PiNqmInzlOqTVYkduYuqcESeUk5QnP8q
         56uM11XeReVMI4bAe1yBMx9bYOOC40vHmdsh8ASxfbPry+8j+61613OyQMx4ZwhlX4FR
         r3IyT11/BuuQSF0EpN8lP01qxztyefgH/E/pu8J7wmFEER35l2zXkXN0Z+yKwoI6nYgz
         vPPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786676622; x=1787281422; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:in-reply-to
         :user-agent:references:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5ukYAG8KuzfNE63WcYxI+d0bUG66L5XWlsEIHRxVdSo=;
        b=Tev4sVt68Vax5kVApNadct9W6xL157QqmFpVmufm3Z/1ZZYtHrNPOdRj4pWVYqWC1v
         dcmRLsIJ22eGQoblQEsjGhSQpHmQm2kPnJPTuoq3+veuV5VXvuwtJKTccawqLjSdSS4Q
         5enyzDprwQkj8EzzYAVPeyY1MFNB8UBRsKQYy/Pdpsp4RQ4hM+kd0TaOSZc2iDh0/ayx
         wwYFmof/ZwPn2EW5yHrzpyaLbyGHXwqHynIanu1iLk+bvbPVRK90Vr9GL7Vm72OidcIB
         +viAuPRg9cupGNMqzfO2LwVeaa00CCopDiB/gjY4QGvCPICt1MrJgqx2fc/y/byb+JhG
         S+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786676622; x=1787281422;
        h=content-type:cc:to:subject:message-id:date:mime-version:in-reply-to
         :user-agent:references:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5ukYAG8KuzfNE63WcYxI+d0bUG66L5XWlsEIHRxVdSo=;
        b=V/fKSnRTAb3qbt4gt2bNRASgblJ9ZcHqao6tWfpe9C6PiugjSoummnw0ZJHsEHY96g
         m+56k6iu4Qgg18YFEhzBVlsmi5lr03Yg0GMS+C85w/I2O0zimc/XHVUBmsHHUC3f7Q1j
         VRZJStnD23G+KolnSqK6BICm8N93K/oSCGAMshHN0qHkJcoeN0M7zH4SJ+ZyjHJUdOwZ
         Nuz+njUvqlILvRG7Sl/9nbemqDeVHYYMuFVGlQ1WCJZSTh6DgwexUAuIodppM5GSD1vz
         /lSVTuTDFNFmHau5caSUBByeEOz1iHhNkpbJhTDi34Cb0ZFJ4j9LdjBjGCPs4iADTJyH
         wyRA==
X-Gm-Message-State: AOJu0YyFb+bXhfVpNQ7sqGUlN0eXd4xjWhVh6xFV+B6C8umt56y24YWg
	hvUxmVFD4wHsCap1hO1RtJy4S0Wi38b5ieeaVTJrXKoFswdpUoosQrRSY6dVNKkpYokENak4J9S
	TMfKSsltpEP9GlnHGVcZg+plmeVF/yAz8tEflxb+hegGalp7ab9um
X-Gm-Gg: AR+sD12AOR5JlWIw/iJXbDxdTizHWNZOApNPCW7+K7WAXzjpZwS3LKrmktLL3xZTk97
	tctZX7JLLxixySZZKVHOlsy3VwJeX99ESUtIK92kqURC/IfzJin5NMIFYdpfwFNg28b1r0/EIbN
	ddZJ8GvlxTjA7Ijn5WZ6Jg5sGJ8VvpwdRbBzv69JVs5FXNdH482UI94MZY5OFOEqA861ZhYMaYU
	j/jKkvomOf8TlA8OoECwTiTXB2ugSZgYv6idG8Pz+sU+d4YIV2hsNqNZ6R5RwYU7YCQEdibu9Qx
	hFBjp8lFm9pFH70Zz6vfJw170Tc9IaskBU7+XssaLQ==
X-Received: by 2002:a05:6512:39c7:b0:5b0:1186:fdf with SMTP id
 2adb3069b0e04-5b458f58c43mr440225e87.11.1786676621901; Thu, 13 Aug 2026
 20:03:41 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 13 Aug 2026 20:03:41 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 13 Aug 2026 20:03:41 -0700
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20260731071820.7318-1-zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
In-Reply-To: <20260731071820.7318-1-zhangzhanpeng.jasper@bytedance.com>
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Thu, 13 Aug 2026 20:03:41 -0700
X-Gm-Features: AUfX_mxJ21jpEL7VIjyXKnalJwTlA9jEibzZdIF9JBXmfi_BxViraxgWLDKfgyQ
Message-ID: <CACnXVnfypnh+zD4+gu7=7PbiWrj0jv8sN_2JiRSdHx-q70fj4g@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: sse: clear SPV for non-virtualized events
To: opensbi@lists.infradead.org, anup@brainfault.org, 
	himanshu.chauhan@oss.qualcomm.com
Cc: thecharlesjenkins@gmail.com, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_200348_281483_2BE03055 
X-CRM114-Status: GOOD (  18.94  )
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

Hi Anup and Himanshu,

On 7/31/26 3:18 PM, Zhanpeng Zhang wrote:
> SSE injection sets hstatus.SPV to the virtualization state of the
> interrupted context before entering the supervisor handler. This patch
> completes that existing requirement and does not change the SSE ABI.
>
> The existing code sets SPV when the interrupted context is virtualized,
> but leaves it unchanged otherwise. A stale SPV value can therefore make
> an event that interrupted host execution appear to have interrupted a
> guest. Event completion can then resume with virtualization enabled.
>
> Clear SPV when the interrupted context is not virtualized so the
> handler-visible state matches the interrupted context. This also lets
> supervisor software, such as the Linux PMU and perf code, reliably tell
> whether an SSE interrupted host or virtualized execution.
>
> Fixes: c8cdf01d8f3a ("lib: sbi: Add support for Supervisor Software Events extension")
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>   lib/sbi/sbi_sse.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index 818afb87..68e4fab4 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -563,15 +563,10 @@ static void sse_event_inject(struct sbi_sse_event *e,
>
>   	if (misa_extension('H')) {
>   		unsigned long hstatus = csr_read(CSR_HSTATUS);
> -
> -#if __riscv_xlen == 64
> -		if (regs->mstatus & MSTATUS_MPV)
> -#elif __riscv_xlen == 32
> -		if (regs->mstatusH & MSTATUSH_MPV)
> -#else
> -#error "Unexpected __riscv_xlen"
> -#endif
> +		if (sbi_regs_from_virt(regs))
>   			hstatus |= HSTATUS_SPV;
> +		else
> +			hstatus &= ~HSTATUS_SPV;
>
>   		hstatus &= ~HSTATUS_SPVP;
>   		if (hstatus & HSTATUS_SPV && regs->mstatus & SSTATUS_SPP)

A gentle ping on this SSE fix.

The SSE specification requires handler-entry hstatus.SPV to reflect the
interrupted virtualization state. The current code handles the
virtualized case, but can leave SPV stale when host execution is
interrupted.

This is also needed by the Linux PMU-SSE work to attribute host and
guest samples correctly. The patch only completes the existing
injection semantics and does not change the SSE ABI.

Any comments would be appreciated.

Thanks,
Zhanpeng

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
