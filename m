Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF26C61DE2
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 02:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTTxqHLmP8Uk3qa3sLmkLltOB3JXuuMKN3SBv9zrAi0=; b=vvii28Yr9pmnR4
	zVM2Z/amFHIG+n+MuejLLkNAEf2EVWDvBUSQDBjYz+fbeDpXMnLZlbqDRtBKRyagIZQIkEhmU9o1L
	MbuZ5ePV26Yy6EKl4xBlN9Uj2n5uCt0Z++8P649Rfvfr+6kfCmAHMgo7DNhjNGvVz58zyQk3EfuW7
	42pR/Ez0GyhlS/hV86odJbIXv0dX5so77B+DIlTUdGJGnQ1fAAnk4qGPCc8ibrJCcKUf0PeO6oa64
	J9VU/wwq6wuWp8Sn9o1Ymvuat6C+mLZY4hW+pcITqg9t+BB6PpGAl6vnf85JcOHNGC5GLEILuKWpi
	2I1UuDQcleZiNT5G6p4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rfY-00000008M7H-14e4;
	Mon, 31 Aug 2026 02:22:44 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rfT-00000008M5E-2ukv
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 02:22:42 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 67V2M95E023621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 10:22:09 +0800 (+08)
	(envelope-from alvinga@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.43; Mon, 31 Aug
 2026 10:22:09 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Aug
 2026 10:22:09 +0800
From: Alvin Chang <alvinga@andestech.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
CC: <opensbi@lists.infradead.org>,
        Xianbin Zhu
	<xianbin.zhu@linux.spacemit.com>,
        Anup Patel <anup@brainfault.org>, Bo Gan
	<ganboing@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        "Heinrich
 Schuchardt" <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH v3 1/5] lib: sbi: select expected trap handler per hart
Date: Mon, 31 Aug 2026 10:21:56 +0800
Message-ID: <20260831022156.2060561-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827-spacemit-k3-v3-1-5d8dbb68539d@linux.spacemit.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com> <20260827-spacemit-k3-v3-1-5d8dbb68539d@linux.spacemit.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 67V2M95E023621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_192240_106678_7EEF2752 
X-CRM114-Status: GOOD (  20.02  )
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


Hi Troy,

Have you tried stack protector?

I changed them to use extern symbol directly because they break stack protector.
Please check my patchset sent last year:
https://lore.kernel.org/all/20250703151957.2545958-1-alvinga@andestech.com/


Thanks,
Alvin

On Thu, 27 Aug 2026 17:19:19 +0800, Troy Mitchell wrote:
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
> Reviewed-by: Bo Gan <ganboing@gmail.com>
> ---
>  include/sbi/sbi_csr_detect.h | 4 ++--
>  include/sbi/sbi_hart.h       | 2 +-
>  lib/sbi/sbi_hart.c           | 9 +++++----
>  lib/sbi/sbi_illegal_atomic.c | 4 ++--
>  lib/sbi/sbi_unpriv.c         | 6 +++---
>  5 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/include/sbi/sbi_csr_detect.h b/include/sbi/sbi_csr_detect.h
> index 097c31c8..31e50db9 100644
> --- a/include/sbi/sbi_csr_detect.h
> +++ b/include/sbi/sbi_csr_detect.h
> @@ -16,9 +16,9 @@
>  
>  #define csr_read_allowed(csr_num, trap)					\
>  	({								\
> +	register ulong mtvec = sbi_hart_expected_trap_addr();		\
>  	register ulong tinfo asm("a3") = (ulong)trap;			\
>  	register ulong ttmp asm("a4");					\
> -	register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
>  	register ulong ret = 0;						\
>  	((struct sbi_trap_info *)(trap))->cause = 0;			\
>  	asm volatile(							\
> @@ -35,9 +35,9 @@
>  
>  #define csr_write_allowed(csr_num, trap, value)				\
>  	({								\
> +	register ulong mtvec = sbi_hart_expected_trap_addr();		\
>  	register ulong tinfo asm("a3") = (ulong)trap;			\
>  	register ulong ttmp asm("a4");					\
> -	register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
>  	((struct sbi_trap_info *)(trap))->cause = 0;			\
>  	asm volatile(							\
>  		"add %[ttmp], %[tinfo], zero\n"				\
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 543393bb..6f4ee31e 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -135,7 +135,7 @@ struct sbi_scratch;
>  int sbi_hart_reinit(struct sbi_scratch *scratch);
>  int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
>  
> -extern void (*sbi_hart_expected_trap)(void);
> +ulong sbi_hart_expected_trap_addr(void);
>  
>  unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
>  void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index bee88557..14e44955 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -25,7 +25,11 @@
>  extern void __sbi_expected_trap(void);
>  extern void __sbi_expected_trap_hext(void);
>  
> -void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
> +ulong sbi_hart_expected_trap_addr(void)
> +{
> +	return misa_extension('H') ? (ulong)&__sbi_expected_trap_hext :
> +				     (ulong)&__sbi_expected_trap;
> +}
>  
>  unsigned long hart_features_offset;
>  
> @@ -712,9 +716,6 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
>  	csr_write(CSR_MIP, 0);
>  
>  	if (cold_boot) {
> -		if (misa_extension('H'))
> -			sbi_hart_expected_trap = &__sbi_expected_trap_hext;
> -
>  		hart_features_offset = sbi_scratch_alloc_offset(
>  					sizeof(struct sbi_hart_features));
>  		if (!hart_features_offset)
> diff --git a/lib/sbi/sbi_illegal_atomic.c b/lib/sbi/sbi_illegal_atomic.c
> index 977a9ad0..30f5118e 100644
> --- a/lib/sbi/sbi_illegal_atomic.c
> +++ b/lib/sbi/sbi_illegal_atomic.c
> @@ -30,7 +30,7 @@ int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
>  	{									\
>  		register ulong tinfo asm("a3");					\
>  		register ulong mstatus = 0;					\
> -		register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
> +		register ulong mtvec = sbi_hart_expected_trap_addr();		\
>  		type ret = 0;							\
>  		trap->cause = 0;						\
>  		asm volatile(							\
> @@ -57,7 +57,7 @@ int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
>  	{									\
>  		register ulong tinfo asm("a3");					\
>  		register ulong mstatus = 0;					\
> -		register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
> +		register ulong mtvec = sbi_hart_expected_trap_addr();		\
>  		type ret = 0;							\
>  		trap->cause = 0;						\
>  		asm volatile(							\
> diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
> index 60becedc..1550d111 100644
> --- a/lib/sbi/sbi_unpriv.c
> +++ b/lib/sbi/sbi_unpriv.c
> @@ -33,9 +33,9 @@ union sbi_unpriv_data {
>  	type sbi_load_##type(const type *addr,                                \
>  			     struct sbi_trap_info *trap)                      \
>  	{                                                                     \
> +		register ulong mtvec = sbi_hart_expected_trap_addr();         \
>  		register ulong tinfo asm("a3") = (ulong)trap;                 \
>  		register ulong mstatus = 0;                                   \
> -		register ulong mtvec = (ulong)sbi_hart_expected_trap;         \
>  		type ret = 0;                                                 \
>  		trap->cause = 0;                                              \
>  		asm volatile(                                                 \
> @@ -58,9 +58,9 @@ union sbi_unpriv_data {
>  	void sbi_store_##type(type *addr, type val,                           \
>  			      struct sbi_trap_info *trap)                     \
>  	{                                                                     \
> +		register ulong mtvec = sbi_hart_expected_trap_addr();         \
>  		register ulong tinfo asm("a3") = (ulong)trap;                 \
>  		register ulong mstatus = 0;                                   \
> -		register ulong mtvec = (ulong)sbi_hart_expected_trap;         \
>  		trap->cause = 0;                                              \
>  		asm volatile(                                                 \
>  			"csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"      \
> @@ -207,7 +207,7 @@ ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
>  	register ulong tinfo asm("a3");
>  	register ulong ttmp asm("a4");
>  	register ulong mstatus = 0;
> -	register ulong mtvec = (ulong)sbi_hart_expected_trap;
> +	register ulong mtvec = sbi_hart_expected_trap_addr();
>  	ulong insn = 0;
>  
>  	trap->cause = 0;
>
> -- 
> 2.55.0
>
>
> -- 
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
