Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FFDCA6009
	for <opensbi@archiver.kernel.org>; Thu,  8 Oct 2026 00:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRERxjnEQuSfeRWFueXuGRMKPgXbpujPyHiYM5gLo3U=; b=bsR9GeWr4LeQKH
	zEJX8Ersls3BD4+7ZA8kIJz4zYZxkwBSXZr9Ftzep0rkB/S3+MJRZeVZgGpMuht2umPOcL9P8vOVu
	ZZUDbfLOD9r4jpWjw33hixITaeHGr+aR6cqHPj8Mu3eNsPNp7K+7N12PxBb7nZ/UaOe9WdbdG2KY3
	4zIiSMd2fCmzb/AbW20+sgWBdecLtktJNRbLkz2Mx1a2S+hNznUdCKN2xsDlo0q9XZ3jR/bjLzPLH
	droCBdR6pXnmMlYOkMbRaMM2XSyCsrChPTV+Ocf4EfpGeWMITTo2syZjnjlspu6ZW7scMHTpz3lno
	/q8nUlVb/qCuSE4jJ4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEc1K-00000003KFs-3sMA;
	Thu, 08 Oct 2026 00:30:02 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEc1H-00000003KEN-2Laa
	for opensbi@lists.infradead.org;
	Thu, 08 Oct 2026 00:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1791419383;
	bh=em0aYQ+mIFHc59OeuHGtr1GjhMTGcRFUIrlOXAx3Fcg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gPMYbC7c3/3pmc1fAUKvWPYdYZjxDoxs4cgX3XnrRK0HfMq80ENecOc9U5qlcaJhe
	 j4EUBc9t6vFc1uJuN1hm8tjghgs0S+O71iigVDwk67VHQ/07Wf7XP3Fu5QTX6N/igv
	 +CiDR25DoUIJ3p+BheL1qQh6DbCBKRTnZG7ngNdsK66rR0F2us/FEwL1/sPcUzquDo
	 i8J44y2s74+Lo+DK2ES34nSGV6qLArEoTJLSKH49/CvIEV5k8bqO13RCrxocLVqrw5
	 CSTTVsAkVNENthJdwCBzD9e3oYvNg6IgRkll7f6NK41fcGzxqpdFaiiWuJIKczREEp
	 oBdBDTNBmjIwg==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 4F123B221ACF;
	Thu,  8 Oct 2026 02:29:41 +0200 (CEST)
Message-ID: <359c591c-9c6e-481a-8500-d4b6837ede88@freeshell.de>
Date: Wed, 7 Oct 2026 17:29:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] lib: sbi: select expected trap handler per hart
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Alvin Chang <alvinga@andestech.com>
References: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
 <20260910-spacemit-k3-v4-1-0793b62329f6@linux.spacemit.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260910-spacemit-k3-v4-1-0793b62329f6@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_172959_756650_BB5C45F4 
X-CRM114-Status: GOOD (  22.96  )
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

On 9/10/26 07:00, Troy Mitchell wrote:
> The expected trap handler is selected once by the cold boot hart. This
> breaks heterogeneous systems where the cold boot hart implements H but
> another hart does not, because the H-aware handler accesses mtval2 and
> mtinst.
> 
> Select the handler from each hart's MISA at entry to sbi_init(), before
> platform hooks can probe CSRs, and store its address in that hart's
> scratch space. Load the address directly at each use. This avoids an
> accessor call and its stack-protector instrumentation in the CSR probing
> and unprivileged memory access paths.
> 
> Align scratch allocations after the enlarged fixed scratch area so that
> the new field preserves the allocator's cache-line alignment guarantee.
> 
> Fixes: 1de66d170e71 ("lib: Optimize unpriv load/store implementation")
> Reported-by: Bo Gan <ganboing@gmail.com>
> Link: https://lore.kernel.org/r/e702f291-dde8-4b99-a65e-182d2b847720@gmail.com
> Suggested-by: Bo Gan <ganboing@gmail.com>
> Link: https://lore.kernel.org/r/20260831022156.2060561-1-alvinga@andestech.com
> Cc: Alvin Chang <alvinga@andestech.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  include/sbi/sbi_csr_detect.h | 4 ++--
>  include/sbi/sbi_hart.h       | 5 ++++-
>  include/sbi/sbi_scratch.h    | 7 ++++++-
>  lib/sbi/sbi_hart.c           | 8 --------
>  lib/sbi/sbi_illegal_atomic.c | 4 ++--
>  lib/sbi/sbi_init.c           | 7 +++++++
>  lib/sbi/sbi_scratch.c        | 4 ++++
>  lib/sbi/sbi_unpriv.c         | 6 +++---
>  8 files changed, 28 insertions(+), 17 deletions(-)
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
> index 543393bb..f0a4be61 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -12,6 +12,7 @@
>  
>  #include <sbi/sbi_types.h>
>  #include <sbi/sbi_bitops.h>
> +#include <sbi/sbi_scratch.h>
>  
>  /** Possible privileged specification versions of a hart */
>  enum sbi_hart_priv_versions {
> @@ -135,7 +136,9 @@ struct sbi_scratch;
>  int sbi_hart_reinit(struct sbi_scratch *scratch);
>  int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
>  
> -extern void (*sbi_hart_expected_trap)(void);
> +/* Keep the load free of function calls, including stack-protector code. */
> +#define sbi_hart_expected_trap_addr() \
> +	(sbi_scratch_thishart_ptr()->expected_trap)
>  
>  unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
>  void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 06097c8a..20e7dcd0 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -46,8 +46,10 @@
>  #define SBI_SCRATCH_OPTIONS_OFFSET		(14 * __SIZEOF_POINTER__)
>  /** Offset of hartindex member in sbi_scratch */
>  #define SBI_SCRATCH_HARTINDEX_OFFSET		(15 * __SIZEOF_POINTER__)
> +/** Offset of expected_trap member in sbi_scratch */
> +#define SBI_SCRATCH_EXPECTED_TRAP_OFFSET		(16 * __SIZEOF_POINTER__)
>  /** Offset of extra space in sbi_scratch */
> -#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(16 * __SIZEOF_POINTER__)
> +#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(17 * __SIZEOF_POINTER__)
>  /** Maximum size of sbi_scratch (4KB) */
>  #define SBI_SCRATCH_SIZE			(0x1000)
>  
> @@ -91,6 +93,8 @@ struct sbi_scratch {
>  	unsigned long options;
>  	/** Index of the hart */
>  	unsigned long hartindex;
> +	/** Address of the expected trap handler for this HART */
> +	unsigned long expected_trap;
>  };
>  
>  /**
> @@ -113,6 +117,7 @@ assert_member_offset(struct sbi_scratch, tmp0, SBI_SCRATCH_TMP0_OFFSET);
>  assert_member_offset(struct sbi_scratch, tmp1, SBI_SCRATCH_TMP1_OFFSET);
>  assert_member_offset(struct sbi_scratch, options, SBI_SCRATCH_OPTIONS_OFFSET);
>  assert_member_offset(struct sbi_scratch, hartindex, SBI_SCRATCH_HARTINDEX_OFFSET);
> +assert_member_offset(struct sbi_scratch, expected_trap, SBI_SCRATCH_EXPECTED_TRAP_OFFSET);
>  
>  /** Possible options for OpenSBI library */
>  enum sbi_scratch_options {
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index bee88557..61c5f945 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -22,11 +22,6 @@
>  #include <sbi/sbi_string.h>
>  #include <sbi/sbi_trap.h>
>  
> -extern void __sbi_expected_trap(void);
> -extern void __sbi_expected_trap_hext(void);
> -
> -void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
> -
>  unsigned long hart_features_offset;
>  
>  static void mstatus_init(struct sbi_scratch *scratch)
> @@ -712,9 +707,6 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
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
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 9bb1a37e..76b4fd91 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -36,6 +36,9 @@
>  #include <sbi/sbi_version.h>
>  #include <sbi/sbi_unit_test.h>
>  
> +extern void __sbi_expected_trap(void);
> +extern void __sbi_expected_trap_hext(void);
> +
>  #define BANNER                                              \
>  	"   ____                    _____ ____ _____\n"     \
>  	"  / __ \\                  / ____|  _ \\_   _|\n"  \
> @@ -585,6 +588,10 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
>  	u32 hartid			= current_hartid();
>  	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>  
> +	/* Platform hooks may probe CSRs before sbi_hart_init(). */
> +	scratch->expected_trap = misa_extension('H') ?
> +		(ulong)&__sbi_expected_trap_hext : (ulong)&__sbi_expected_trap;
> +
>  	switch (scratch->next_mode) {
>  	case PRV_M:
>  		next_mode_supported = true;
> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> index bb14a1a2..88ef1547 100644
> --- a/lib/sbi/sbi_scratch.c
> +++ b/lib/sbi/sbi_scratch.c
> @@ -97,6 +97,10 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
>  
>  	spin_lock(&extra_lock);
>  
> +	/* The fixed scratch fields need not end on a cache-line boundary. */
> +	extra_offset = (extra_offset + scratch_alloc_align - 1) &
> +		       ~(scratch_alloc_align - 1);
> +
>  	if (SBI_SCRATCH_SIZE < (extra_offset + size))
>  		goto done;
>  
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

Tested-by: E Shattow <e@freeshell.de>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
