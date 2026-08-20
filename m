Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F90C5DF82
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJati1Occxpuw5N16LfG8GT0Kj4E3Y6mEOFr5lbcdDk=; b=CPddn3IqgoMQIp
	JeEwMWW4ZBa5EZImsuKWwoUUoIy0aAC8TMzr82PzpnhaIJbX2Id8YTAEkTSY4PTbINMhX450c6/d4
	V2+LSPWpoUydLz4XNj3ekUfGJRm0T9vikIgx7czqH8k/0v87/u+zPU8Xwax8JVrrCP7psL0lCyLzx
	IpHAxQyJYLKA0QS5RTZSS15+lf7N8uN440yfuWEUN7hwmFkLIxXZEFzeKR9MC4wHz9dpvT/u8rCyr
	KXhOC4q3XjTQvNK6CYWd6XWfjdj/JmT1xH7c0vUTVK2jLwdJNKzD9MriLlYq7Z3EXpDKaTcXzntP3
	CCGG25Al9ofZTUc5OJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyJy-0000000BBO7-0zGn;
	Thu, 20 Aug 2026 08:40:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyJv-0000000BBMw-3f9l
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 08:40:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d5cad1a6baso15626005ad.3
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 01:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215219; x=1787820019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQomgXady4uPoFoOKKaFWzYRA9Bp5rOqjocVVeiVZhk=;
        b=owkXwf6fwiSzV9GjZabxvGQ/149IYyLqZF72Ht8Dl/IMkOZQAun7uyWfc8rku+cNHO
         wM3C3QcOJEpY6T0n6BSUhCjjeIrtsfjLjqV4jVDX+k3WOK5OV0HrQ7VZp8/Uvme7ukc7
         jsyuKxmeqXPO1AfFBkGDjljGofUHEmJ0ej57dLw0cMyUPss6XIHYYxeCmv0fc5kMxee/
         jYBFMPVZMsRktynyc3B4bt9XJIUonrrlhKggMWw8/p2kEdgj5EobQkiCMdfJw2wzgwxV
         2cLY7W0Qadqe9xf2n/nX7WtH1WweN6uF7LtpzTGC/UKKbsVEK3oEsenb1VsoeT2LmGqi
         vhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215219; x=1787820019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQomgXady4uPoFoOKKaFWzYRA9Bp5rOqjocVVeiVZhk=;
        b=gMHu/Eo1ov/iDZYAjk8lPBDRN5/RhorO1diN3TMr2zO2QSkiLgUTkWDl2O5xrnhljz
         xquEo8dhJpfwTSJqeMXfpvh/rfyxy7ZuB/xlZJq6jjdEGPasJ4Y94G187xb7BN9rUSFB
         sV+UNxDLdL3C+Xd3xRWH1+r0P0AwXnXaFjgyWXUdiylMaBQg9W2dLjQLyjuZN86Hte5X
         bsQXt5YTqthLsqZ9cFvmDvyGMKjXMkvqNGu1MCyqT4ocipPnvzjMi5f0HPwk4khXDNWS
         /HeXjwM1YsSoLyg9rhoAUwXoKaPG5Kp5m7hi6h5OL5Hru0Go+hU5oeD8xqswW8TR7m+L
         hnUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjUl777WPs/ouDaAPxO76QgbVkMMapJ17xbBOpH/r0A5fvqN2rlI37dlnEWg74sxxSvJlvA+3k@lists.infradead.org
X-Gm-Message-State: AFuF++lEl1GxrrxvZSRzV4ngxQAmx2om3AlWPbqcdjDH5KH0CyDcq3Ft
	BRhULcGo8xTZlvl87BePUVUWp7dyKeUGNeyG6F4rtTKnH30joDDTI/qAaAVULAhZ
X-Gm-Gg: AR+sD11L/L4sr70mp4lXRiDJ/q1OBJhFiw+fDL+vpn2x5Jv1PJ+n0yw1bXUKpGbZCQm
	pRpVklPhZemxs/lJ0Ji9FXWpyN1lcBHh7xMvFfsy5aNv6eNRVXsuQm23WKEHQaMGrSUIZIKO+BE
	IjSmcjwqHH1i+FXhcezb/X2ccRXtGnhGgruVitqJ+8V72WPdtDw7cgd1I2Sy7xSg8h2CjWQBC+j
	orpZckb4FGf0UvOnAFDvrP9HkxJt4xDtNI41Bm/j0XbQa54CYede1VkRNHH78PSnRnxf7CjMfF4
	fglwD//1UHnVfAdERGhgYtk3n0z0/R1Ff+Cl73owR2cJNiD9U7zf0yUWnpWngYc43FHK5P50zWL
	mPyEjve5MESjkLNpOk0Jf9zzCkHBaACg2UDc2rbsE2wai5RoOn9UEP0WKo7xeZNKapknTWZZhtJ
	A88iJHKqKtgaFiQFLgbQuNPYd031Z7SkcmN6pfJzIMjUOPES4CpDle1tbIYfBNClLQvWA=
X-Received: by 2002:a17:902:d4c2:b0:2d5:2f49:b3f4 with SMTP id d9443c01a7336-2d5fd713157mr208283825ad.2.1787215218534;
        Thu, 20 Aug 2026 01:40:18 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e3affeesm3746845ad.65.2026.08.20.01.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 01:40:17 -0700 (PDT)
Message-ID: <2ab3f4f0-a3fc-41ea-ae1f-640871e76c8c@gmail.com>
Date: Thu, 20 Aug 2026 01:40:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] lib: sbi: select expected trap handler per hart
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
 <20260818-spacemit-k3-v2-1-84cb7773a481@linux.spacemit.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260818-spacemit-k3-v2-1-84cb7773a481@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_014019_932484_295ABFBF 
X-CRM114-Status: GOOD (  17.58  )
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

On 8/17/26 18:14, Troy Mitchell wrote:
> The expected trap handler is selected once by the cold boot hart. This
> breaks heterogeneous systems where the cold boot hart implements H but
> another hart does not, because the H-aware handler accesses mtval2 and
> mtinst.
> 
> Select the handler from the current hart's MISA at each use so every
> hart uses only the CSRs it implements.
> 
> Fixes: 1de66d170e71 ("lib: Optimize unpriv load/store implementation")
> Reported-by: Bo Gan <ganboing@gmail.com>
> Link: https://lore.kernel.org/r/e702f291-dde8-4b99-a65e-182d2b847720@gmail.com
> Suggested-by: Bo Gan <ganboing@gmail.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reading PATCH 5/5, I realized H can be dynamically turned on/off for X100,
so dynamically determine expected_trap_addr makes even more sense now.

Reviewed-by: Bo Gan <ganboing@gmail.com>

Bo

> ---
>   include/sbi/sbi_csr_detect.h | 4 ++--
>   include/sbi/sbi_hart.h       | 2 +-
>   lib/sbi/sbi_hart.c           | 9 +++++----
>   lib/sbi/sbi_illegal_atomic.c | 4 ++--
>   lib/sbi/sbi_unpriv.c         | 6 +++---
>   5 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/include/sbi/sbi_csr_detect.h b/include/sbi/sbi_csr_detect.h
> index 097c31c8..31e50db9 100644
> --- a/include/sbi/sbi_csr_detect.h
> +++ b/include/sbi/sbi_csr_detect.h
> @@ -16,9 +16,9 @@
>   
>   #define csr_read_allowed(csr_num, trap)					\
>   	({								\
> +	register ulong mtvec = sbi_hart_expected_trap_addr();		\
>   	register ulong tinfo asm("a3") = (ulong)trap;			\
>   	register ulong ttmp asm("a4");					\
> -	register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
>   	register ulong ret = 0;						\
>   	((struct sbi_trap_info *)(trap))->cause = 0;			\
>   	asm volatile(							\
> @@ -35,9 +35,9 @@
>   
>   #define csr_write_allowed(csr_num, trap, value)				\
>   	({								\
> +	register ulong mtvec = sbi_hart_expected_trap_addr();		\
>   	register ulong tinfo asm("a3") = (ulong)trap;			\
>   	register ulong ttmp asm("a4");					\
> -	register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
>   	((struct sbi_trap_info *)(trap))->cause = 0;			\
>   	asm volatile(							\
>   		"add %[ttmp], %[tinfo], zero\n"				\
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 543393bb..6f4ee31e 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -135,7 +135,7 @@ struct sbi_scratch;
>   int sbi_hart_reinit(struct sbi_scratch *scratch);
>   int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
>   
> -extern void (*sbi_hart_expected_trap)(void);
> +ulong sbi_hart_expected_trap_addr(void);
>   
>   unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
>   void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index bee88557..14e44955 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -25,7 +25,11 @@
>   extern void __sbi_expected_trap(void);
>   extern void __sbi_expected_trap_hext(void);
>   
> -void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
> +ulong sbi_hart_expected_trap_addr(void)
> +{
> +	return misa_extension('H') ? (ulong)&__sbi_expected_trap_hext :
> +				     (ulong)&__sbi_expected_trap;
> +}
>   
>   unsigned long hart_features_offset;
>   
> @@ -712,9 +716,6 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
>   	csr_write(CSR_MIP, 0);
>   
>   	if (cold_boot) {
> -		if (misa_extension('H'))
> -			sbi_hart_expected_trap = &__sbi_expected_trap_hext;
> -
>   		hart_features_offset = sbi_scratch_alloc_offset(
>   					sizeof(struct sbi_hart_features));
>   		if (!hart_features_offset)
> diff --git a/lib/sbi/sbi_illegal_atomic.c b/lib/sbi/sbi_illegal_atomic.c
> index 977a9ad0..30f5118e 100644
> --- a/lib/sbi/sbi_illegal_atomic.c
> +++ b/lib/sbi/sbi_illegal_atomic.c
> @@ -30,7 +30,7 @@ int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
>   	{									\
>   		register ulong tinfo asm("a3");					\
>   		register ulong mstatus = 0;					\
> -		register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
> +		register ulong mtvec = sbi_hart_expected_trap_addr();		\
>   		type ret = 0;							\
>   		trap->cause = 0;						\
>   		asm volatile(							\
> @@ -57,7 +57,7 @@ int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
>   	{									\
>   		register ulong tinfo asm("a3");					\
>   		register ulong mstatus = 0;					\
> -		register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
> +		register ulong mtvec = sbi_hart_expected_trap_addr();		\
>   		type ret = 0;							\
>   		trap->cause = 0;						\
>   		asm volatile(							\
> diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
> index 60becedc..1550d111 100644
> --- a/lib/sbi/sbi_unpriv.c
> +++ b/lib/sbi/sbi_unpriv.c
> @@ -33,9 +33,9 @@ union sbi_unpriv_data {
>   	type sbi_load_##type(const type *addr,                                \
>   			     struct sbi_trap_info *trap)                      \
>   	{                                                                     \
> +		register ulong mtvec = sbi_hart_expected_trap_addr();         \
>   		register ulong tinfo asm("a3") = (ulong)trap;                 \
>   		register ulong mstatus = 0;                                   \
> -		register ulong mtvec = (ulong)sbi_hart_expected_trap;         \
>   		type ret = 0;                                                 \
>   		trap->cause = 0;                                              \
>   		asm volatile(                                                 \
> @@ -58,9 +58,9 @@ union sbi_unpriv_data {
>   	void sbi_store_##type(type *addr, type val,                           \
>   			      struct sbi_trap_info *trap)                     \
>   	{                                                                     \
> +		register ulong mtvec = sbi_hart_expected_trap_addr();         \
>   		register ulong tinfo asm("a3") = (ulong)trap;                 \
>   		register ulong mstatus = 0;                                   \
> -		register ulong mtvec = (ulong)sbi_hart_expected_trap;         \
>   		trap->cause = 0;                                              \
>   		asm volatile(                                                 \
>   			"csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"      \
> @@ -207,7 +207,7 @@ ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
>   	register ulong tinfo asm("a3");
>   	register ulong ttmp asm("a4");
>   	register ulong mstatus = 0;
> -	register ulong mtvec = (ulong)sbi_hart_expected_trap;
> +	register ulong mtvec = sbi_hart_expected_trap_addr();
>   	ulong insn = 0;
>   
>   	trap->cause = 0;
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
