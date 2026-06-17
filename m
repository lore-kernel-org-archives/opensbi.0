Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852FDCD98E4
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93IXezLBUPMCWpI9NMVgUYZN8ZKuvxd5wVBYuMFnn3g=; b=Z6VxhqFAdyblsS
	s+tKBcYlFQjWGPodfX2VBoe9v9kCubfmYConqxmrJaDj16CbDKMeprlzOGvpnSIRhRQXf/xASL3ql
	FnF3WLvt9M5G9xkp43TW6p/sfg862YIFbhT1CLJbDzeMMvg4xL3GA2oow/rhZ6wb14zm96ixkhqKt
	asQjHOYoVsE1qk23CDyxmvtKze116qI8FxA4VEhKoHtr/06sFgdKN7KE4nzeXRIi4DyXAuWWr75RP
	KnbNhzF+qQv/c+C5ogLdbDI+fWIQ6eRqFtqPeLVTpWSjrrxL2ebvGc1HZS7+rl4blLjir2PycvwSv
	LQTX1Ug0DWeZ8AAQsOhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZr1U-0000000HT6f-1nRH;
	Wed, 17 Jun 2026 14:13:44 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZr1R-0000000HT69-1hUt
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 14:13:42 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7e6dcc22cbcso4845731a34.1
        for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 07:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1781705620; x=1782310420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Unzb6FX/Abd5qJDFKXpDk9c/QZAPHHaPRn8roV8+RPY=;
        b=BO2UGGf4oz0TMey6k8rIRzTHIPn35Gt2jRrZ6Klo6OUBKTq2g+RU0J1fWRA89T4xTS
         q1Umvuehq88WqmMYW1HdTgC1UtnUn5pD5sA9b5SKTm6ma52fZrW+K3gKxdZFTy/3MwTZ
         gO+sjfncCHSBAvcB1SuvNRYUBUYLmOiPP2PCuYfYWHfGFitmK7Vi5zxoozc6BUh1ijhY
         ifGP68HeKqH8/EwXadFeTEUlBYCsvYAvbi/cWQZjG6cnIlBvd9LKCykys62UzjbC/m4n
         wzxmyWwQDknGCNIWRM4J3GgLt6IVLprP8ptIDEQgk/n2XLF8lJJv/xl90Z4dI0QH7fXe
         8P7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781705620; x=1782310420;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Unzb6FX/Abd5qJDFKXpDk9c/QZAPHHaPRn8roV8+RPY=;
        b=L3VTarrUKvoLLMQ3k7f0wF6g0yfJ7vMJrH35dtHiuTUPpMdx4wmk8CpfXi9VD3Fr9Y
         A3/lKvPdduvkPOH0KxEzSLuybbE8VDNrBcE4+sUuDTHFB37ynoRcPJsV+jJ7EZ7jGXwJ
         u5IND9FfDJBEUjpkyHRBXLL1dfX0Ohn8iya/KaB0uJkDnLAQgKRipe4/ty7tD6NXtUkv
         kWbjUfSFoaimtpUGJoW5EI35iXfsalrF7CFOt3g2IeN7pBcc3pZmtEIOfsQDv43YXvQs
         Wu3r+FidW4ipHMDTtusz7NqG0lFYEsnwgafq+P0ISXN9AQQw0gaOh8JKDI5pO8c3D6a4
         CyeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XWWCV4THymdmXhpNVLxdsX0lcIDIcLsnNjbCocn3vz1ZTKvPDGbgRtKOQitZhpLlHWSkMOn0u@lists.infradead.org
X-Gm-Message-State: AOJu0Yztn6Vewbp7/7gGVOf4LVKiGCjgHsmlU0AIdoZVZvKneNpwVR2N
	dcuaowoeouJolKHLKJQrefix0wA0hBxeI863Ck6Onf45pit/U4XXjg75MKWS9Qz7loVe33+pbDF
	IlSvHFMc=
X-Gm-Gg: Acq92OEI1JHzFa/AFUrPB/NF5Hk38sb2CSXT5X7XyDAF+tdqTHCb0Kh546WS2UWv5Tp
	d8iMaYvv60DbPRcc5vU1ICrM/n1Aepbi0ScEG7HsrooL0Fx+5yHBRw7Va3USuvD2tYgk3aQm6Rh
	somAZIrQdzI4WWnjdOZ0OLpOFe0jDHf7qcCbzu5qD3ExbWbV0JGrcV5lZ9ZrO2edpdt2b3pjPRK
	WaeVhfu8sEtRMRPMZJJqdrsJ4wjDXmcpceN1SAqx8HaFd0lxFFC3jZCEFKcmVUX0Qik82yiRI5h
	9OJsxuj2uXyG7WbwnygptcWwFDrJTQemnT+YWenrLCg1j3djM1p1J3lHEgjEnkIFQ0+tt9v0EyM
	SQYXC/9dXbUWbAqfEuKTDMoxZhKIRp4djjeYocaecwMra06QPFst2jMk2Gynn8DpavcTUeJj3k4
	LzZuVerSKl/29OJmlq7Rm5tCXmznDRxTKMBtSI
X-Received: by 2002:a05:6830:4120:b0:7de:d056:19d with SMTP id 46e09a7af769-7e90b14a7f7mr4283612a34.0.1781705620096;
        Wed, 17 Jun 2026 07:13:40 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.100.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f5bb344sm9902872a34.7.2026.06.17.07.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 07:13:39 -0700 (PDT)
Message-ID: <f9968540-afe2-495d-8744-98548880c27e@sifive.com>
Date: Wed, 17 Jun 2026 09:13:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib: sbi: Allow platforms to override local TLB
 operations
To: Xiang W <wangxiang@iscas.ac.cn>, opensbi@lists.infradead.org
Cc: anup@brainfault.org, inochiama@gmail.com, Han Gao <gaohan@iscas.ac.cn>
References: <20260617112925.1144190-2-wangxiang@iscas.ac.cn>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260617112925.1144190-2-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_071341_574987_29AB2DAD 
X-CRM114-Status: GOOD (  11.39  )
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

Hi,

On 2026-06-17 6:29 AM, Xiang W wrote:
> Some T-Head based processors, for example the Sophgo SG2044, have a
> JTLB errata that requires special handling of certain TLB maintenance
> instructions (sfence.vma).
> 
> Introduce a sbi_tlb_local_operations structure so platforms can provide
> custom local TLB flush implementations. Use it to implement the JTLB
> workaround on affected SoCs (currently Sophgo SG2044).
> 
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  include/sbi/sbi_tlb.h                        | 31 +++++++++++++
>  lib/sbi/sbi_tlb.c                            | 46 +++++++++++++++++---
>  platform/generic/include/thead/c9xx_errata.h |  1 +
>  platform/generic/thead/thead-generic.c       | 31 ++++++++++++-
>  4 files changed, 101 insertions(+), 8 deletions(-)
> 
> [...]
> +static void thead_jtlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
> +{
> +	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_RCVD);
> +	__asm__ __volatile__("sfence.vma");
> +}
> +
> +static void thead_jtlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
> +{
> +	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_ASID_RCVD);
> +	/* Flush entire MM context for a given ASID */
> +	__asm__ __volatile__("sfence.vma x0, %0"
> +			     :
> +			     : "r"(tinfo->asid)
> +			     : "memory");
> +}

This looks similar to the bug seen on older SiFive chips, where we must always
flush the full address space. If so, there is already a much simpler workaround
available, using get_tlbr_flush_limit. See platform/generic/sifive/fu540.c.

Regards,
Samuel


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
