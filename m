Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D301C3600C
	for <opensbi@archiver.kernel.org>; Mon, 31 Mar 2025 22:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+MApGO+P5qNGt/QIsnx5x8ojCYE4q/xTb28G8a7zbQ=; b=rCUfOyqu9Swfxe4W5scIAVLVY4
	q0gnRSTK6kjxHtSpQema2iQN1OmNyC021V0NKioufYfWlFOQb67ee5KgVEdd58fc8yPaO8wLBqd72
	aW22khQ5X6QzIbzJ+t1rpTH4GbeF91Bns1oqfcuOIAB5x8C2BdnUiYZIITNyIXR0C2yulZJHagxWG
	zN7zbURB4qnRYZaIOJgvF5O7TPlk/u63hg7JvRk7mA14M9mTdKIQ6KPazzWCpehdHJN6g7pihTPX/
	gHIn8Gf2Wp5H14/7UA2CESHjMuFhGPIHBtQQR3LZdgX76XZCKtFooaV2H+3YdQLlVW32DNUBXmL/k
	vMTjctBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzO4X-00000001YMf-0PFM;
	Mon, 31 Mar 2025 22:57:37 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzO4T-00000001YKx-37ik
	for opensbi@lists.infradead.org;
	Mon, 31 Mar 2025 22:57:35 +0000
Message-ID: <0f75f756-9883-40b4-8ecf-5f3eba4f41f4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743461849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3qXdeXnWWXcEOtaf9BAn7ReWSTrhMWRLA22sL0kQ2P0=;
	b=rz51UEs6Azpcc9ck7KYqmMpLBsnq+JhlGNJlHTXLorLWXNsphDcCAic6q83k/gb1BzTzmR
	ew7/0NyGdYHU1FX+0tKMsnAdYr5j5fuU3zsKGBU0RiDVAqueTJMJugpsokAJ+6eLcQ/bvN
	caOjVKQj8iDjPbyorUu/19701rNpjfA=
Date: Mon, 31 Mar 2025 15:57:26 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3] lib: sbi: Enable Control Transfer Records (CTR) Ext
 using xstateen.
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
References: <20250307124451.122828-1-rkanwal@rivosinc.com>
 <CAHBxVyFuiDRQhMkV7SV7toDCt6atNJT4cpkPG=aevVMfH_vx1w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHBxVyFuiDRQhMkV7SV7toDCt6atNJT4cpkPG=aevVMfH_vx1w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_155734_215875_E7E98CEA 
X-CRM114-Status: GOOD (  13.77  )
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

On 3/7/25 10:00 AM, Atish Kumar Patra wrote:
> On Fri, Mar 7, 2025 at 4:44?AM Rajnesh Kanwal <rkanwal@rivosinc.com> wrote:
>>
>> The Control Transfer Records (CTR) extension provides a method to
>> record a limited branch history in register-accessible internal chip
>> storage.
>>
>> This extension is similar to Arch LBR in x86 and BRBE in ARM.
>> The Extension has been stable and the latest release can be found here
>> https://github.com/riscv/riscv-control-transfer-records/release
>>
>> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
>>
>> ---
>> Changes in V3:
>>          Removed FWFT bit. It was discussed in tech-prs group to
>>          use trap and enable approach rather than FWFT bit. Trap
>>          and enable approach leads to letter number of traps than
>>          enabling and disabling FWFT bit on each CTR usage.
>>          https://lists.riscv.org/g/tech-prs/message/1339
>>
>> Changes in V2:
>>          Added FWFT bit for CTR.
>> ---
>>   include/sbi/riscv_encoding.h | 13 +++++++++++++
>>   include/sbi/sbi_hart.h       |  4 ++++
>>   lib/sbi/sbi_hart.c           |  7 +++++++
>>   3 files changed, 24 insertions(+)
>>
>> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
>> index 03c68a57..f3e2afd5 100644
>> --- a/include/sbi/riscv_encoding.h
>> +++ b/include/sbi/riscv_encoding.h
>> @@ -375,6 +375,17 @@
>>   #define CSR_SSTATEEN2                  0x10E
>>   #define CSR_SSTATEEN3                  0x10F
>>
>> +/* Machine-Level Control transfer records CSRs */
>> +#define CSR_MCTRCTL                     0x34e
>> +
>> +/* Supervisor-Level Control transfer records CSRs */
>> +#define CSR_SCTRCTL                     0x14e
>> +#define CSR_SCTRSTATUS                  0x14f
>> +#define CSR_SCTRDEPTH                   0x15f
>> +
>> +/* VS-Level Control transfer records CSRs */
>> +#define CSR_VSCTRCTL                    0x24e
>> +
>>   /* ===== Hypervisor-level CSRs ===== */
>>
>>   /* Hypervisor Trap Setup (H-extension) */
>> @@ -799,6 +810,8 @@
>>   #define SMSTATEEN0_CS                  (_ULL(1) << SMSTATEEN0_CS_SHIFT)
>>   #define SMSTATEEN0_FCSR_SHIFT          1
>>   #define SMSTATEEN0_FCSR                        (_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
>> +#define SMSTATEEN0_CTR_SHIFT           54
>> +#define SMSTATEEN0_CTR                 (_ULL(1) << SMSTATEEN0_CTR_SHIFT)
>>   #define SMSTATEEN0_CONTEXT_SHIFT       57
>>   #define SMSTATEEN0_CONTEXT             (_ULL(1) << SMSTATEEN0_CONTEXT_SHIFT)
>>   #define SMSTATEEN0_IMSIC_SHIFT         58
>> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
>> index 4c36c778..c3a7feb7 100644
>> --- a/include/sbi/sbi_hart.h
>> +++ b/include/sbi/sbi_hart.h
>> @@ -75,6 +75,10 @@ enum sbi_hart_extensions {
>>          SBI_HART_EXT_ZICFISS,
>>          /** Hart has Ssdbltrp extension */
>>          SBI_HART_EXT_SSDBLTRP,
>> +       /** HART has CTR M-mode CSRs */
>> +       SBI_HART_EXT_SMCTR,
>> +       /** HART has CTR S-mode CSRs */
>> +       SBI_HART_EXT_SSCTR,
>>
>>          /** Maximum index of Hart extension */
>>          SBI_HART_EXT_MAX,
>> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
>> index 8e2979b5..c343805c 100644
>> --- a/lib/sbi/sbi_hart.c
>> +++ b/lib/sbi/sbi_hart.c
>> @@ -105,6 +105,11 @@ static void mstatus_init(struct sbi_scratch *scratch)
>>                  else
>>                          mstateen_val &= ~(SMSTATEEN0_SVSLCT);
>>
>> +               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCTR))
>> +                       mstateen_val |= SMSTATEEN0_CTR;
>> +               else
>> +                       mstateen_val &= ~SMSTATEEN0_CTR;
>> +
>>                  csr_write(CSR_MSTATEEN0, mstateen_val);
>>   #if __riscv_xlen == 32
>>                  csr_write(CSR_MSTATEEN0H, mstateen_val >> 32);
>> @@ -688,6 +693,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>>          __SBI_HART_EXT_DATA(zicfilp, SBI_HART_EXT_ZICFILP),
>>          __SBI_HART_EXT_DATA(zicfiss, SBI_HART_EXT_ZICFISS),
>>          __SBI_HART_EXT_DATA(ssdbltrp, SBI_HART_EXT_SSDBLTRP),
>> +       __SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
>> +       __SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
>>   };
>>
> 
> LGTM.
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> 
Hi Anup,
Can we pick this patch if no other concerns are there ?


>>   _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
>> --
>> 2.43.0
>>
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
