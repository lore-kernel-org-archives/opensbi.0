Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB58C369A9
	for <opensbi@archiver.kernel.org>; Thu, 10 Apr 2025 19:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nSEqyjPgh5UzUZ1vZXf+nunEhhcWdZ8pjnYrQd+rQA=; b=IH5Yqymb7/nNdW
	VS7pIntMhBt/wQfx6FtBadsxiny0g9yUYJuXVM3zmzmCWjWZQdBRmoB5vOznWNlMxSSUFGtFR32Jq
	E9hV9aJw7giGYe7cZDqN0/BnSOi8e+GYUALp7HWsSYry0ihqKfzv/+NObu6DaQiFh4NVBrSiVSTf9
	73L3CWkZ42zvvH7YQulRs0KFPmaqNw8C0ANIP3o91u99FC22PE0197LuQQERmTPKrp4lkUX9HFGR7
	pZfDv4EJS5MwuDjoxicEczLIgx0rszntttizwQdiIZCOf4WB/0vQ5ce8z+gf29hzdKdLHoeoU/XGd
	mkNhokjUh1cZPZl0mIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xHL-0000000BbSr-1JkA;
	Thu, 10 Apr 2025 19:09:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xG1-0000000BbM3-2xj2
	for opensbi@lists.infradead.org;
	Thu, 10 Apr 2025 19:08:15 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-223f4c06e9fso12856935ad.1
        for <opensbi@lists.infradead.org>; Thu, 10 Apr 2025 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744312093; x=1744916893; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PueMuuRMPVRBNPfpCaE4M4V9f9yhDr2b+efNCce/PY4=;
        b=Jo2ShJ/mS+tOOnCYlfq4fVr6dYmkapwqQi8juKq0x2YhIbhiwPS6ikxk+UjYuA8cMK
         0MSei+LVIVi33gnK/v43v5nPjcIHonJV3bIN4oC3fK9hJYqn6RdMCxPUd49ZQ842D8rk
         sE9CQBHahYugJB+xG4KeTtgQAxWlsDGKn4rz4J01KOSL404ftn7mFKSnfRuUZeOnC7Z+
         rzLEYmRdgNaz45iEo1LOfiPvoeODH+IXX/N8ySbm7iqG/sxyEbu+R9+KtMr6c2ZgbdMe
         sSN8vpb6IHrFLr9CbRF/PQQ7/X32+KtgkB0mWosZoid9rCKdZPnEy8i0yWiYE+GKnVC1
         wtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744312093; x=1744916893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PueMuuRMPVRBNPfpCaE4M4V9f9yhDr2b+efNCce/PY4=;
        b=L+0wuNOdFZ2Dij9iNsjZhOMLeBB73qvwzJhsivp7jldIjMSroo1tevSEjo6qfnXhmr
         nq81kytMMb37eqSW/ggu46MMDf3u37tULiPCs81AuFwNJqDK5u6vex0p1JNdIVmwE9AN
         cwXtFmwehBs8Q+yaFrTKh3xZymJ2c5Fm4tgn4ki6vcHFYP+sz85298dXXMw04Dw2Rx6T
         gFZgkvxMapT3oX0kmKa5BB2eDwEL3pmr2Tx2aGHgX7aSm8czRSE0PLHQyjiju+KESZ0v
         4WNbjy+B5fg/4BLGfFWagH+c8HA/7bXaVt9NWFXRH2wwDBivYY8NJKNjRDprMQ9FApeN
         O4gw==
X-Forwarded-Encrypted: i=1; AJvYcCWGMsvka5krVavAnDkTq51rpdfBs+wZny0Fo0+dPUFf4lnIAoPkjaG9nci5/7GB7kSDPIe8bbF7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Kw399ajLlvAXUXROCH9qODeaCw6UCCXaNeohsHyV+/CLJ8Sm
	0aq7o7NnkHARXgYuuR5Ey9IQwjS+zfr6xa6xo7tOrnAW3bAYdMQDjozA3VZSOSg=
X-Gm-Gg: ASbGncvkMAT/42g6wFlTDJ+dAm+wmnettOhc2+svqUFf0BzKqKBPer9QVKB7jHNhruP
	/JZNJ0SdaZnteF+pmkx5leuQ0QpBLGWwAo6+INCJfLjmVdwmVHWofEIu7VCH+DF6sx4jtNoHKcT
	tmaspSsD+kI+B9SjVIjwOud6uk5hoVttXOqEtAUblBIw3inB8gkCzohY56xRkD/2kD57RRZne66
	t+uucP5V+yzAz7yIIA54UPvrWigSoa7knPllXgC9QMrqjIh0cLxwNK0dX4poBPeetm4hh52O/cP
	hLCR7JW6Q8Rg7Zar/n9o/HmGYHlQfMMA3kboF9TLeg==
X-Google-Smtp-Source: AGHT+IFw6iFPbdouJilL+9c/0VaVULoRMmCzYq0GTKBonyD3YWPaWcIU/Wmx/kbHX/JE8iobTNcNhg==
X-Received: by 2002:a17:903:3203:b0:216:271d:e06c with SMTP id d9443c01a7336-22bea0244b4mr1168915ad.4.1744312092651;
        Thu, 10 Apr 2025 12:08:12 -0700 (PDT)
Received: from [192.168.1.27] ([50.35.45.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5332sm34477105ad.190.2025.04.10.12.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 12:08:12 -0700 (PDT)
Message-ID: <5fa2aa42-9438-47f5-93c5-406cd9996765@rivosinc.com>
Date: Thu, 10 Apr 2025 12:08:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] lib: sbi: Enable Control Transfer Records (CTR) Ext
 using xstateen.
To: Samuel Holland <samuel.holland@sifive.com>,
 Rajnesh Kanwal <rkanwal@rivosinc.com>, opensbi@lists.infradead.org
Cc: alistair.francis@wdc.com, apatel@ventanamicro.com, beeman@rivosinc.com
References: <20250307124451.122828-1-rkanwal@rivosinc.com>
 <bb9d0867-0aea-46b7-9f8c-3a700081c086@sifive.com>
Content-Language: en-US
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <bb9d0867-0aea-46b7-9f8c-3a700081c086@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_120813_951992_6DE10E9C 
X-CRM114-Status: GOOD (  22.63  )
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

On 3/31/25 5:46 PM, Samuel Holland wrote:
> Hi Rajnesh,
> 
> On 2025-03-07 6:44 AM, Rajnesh Kanwal wrote:
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
> 
> If you want to use the trap and enable approach, then you cannot enable the
> mstateen0 bit by default, or you will never trap. This is also missing the code
> for the trap handler.
> 

I think you mean you can't trap in M-mode. However, there is no use case 
for M-mode profiling.

The PRS discussion was around how we handle CTR state for guests where 
the earlier approach used FWFT instead of the trap/enable.

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
>>   #define CSR_SSTATEEN2			0x10E
>>   #define CSR_SSTATEEN3			0x10F
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
>>   #define SMSTATEEN0_CS			(_ULL(1) << SMSTATEEN0_CS_SHIFT)
>>   #define SMSTATEEN0_FCSR_SHIFT		1
>>   #define SMSTATEEN0_FCSR			(_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
>> +#define SMSTATEEN0_CTR_SHIFT		54
>> +#define SMSTATEEN0_CTR			(_ULL(1) << SMSTATEEN0_CTR_SHIFT)
>>   #define SMSTATEEN0_CONTEXT_SHIFT	57
>>   #define SMSTATEEN0_CONTEXT		(_ULL(1) << SMSTATEEN0_CONTEXT_SHIFT)
>>   #define SMSTATEEN0_IMSIC_SHIFT		58
>> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
>> index 4c36c778..c3a7feb7 100644
>> --- a/include/sbi/sbi_hart.h
>> +++ b/include/sbi/sbi_hart.h
>> @@ -75,6 +75,10 @@ enum sbi_hart_extensions {
>>   	SBI_HART_EXT_ZICFISS,
>>   	/** Hart has Ssdbltrp extension */
>>   	SBI_HART_EXT_SSDBLTRP,
>> +	/** HART has CTR M-mode CSRs */
>> +	SBI_HART_EXT_SMCTR,
>> +	/** HART has CTR S-mode CSRs */
>> +	SBI_HART_EXT_SSCTR,
>>   
>>   	/** Maximum index of Hart extension */
>>   	SBI_HART_EXT_MAX,
>> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
>> index 8e2979b5..c343805c 100644
>> --- a/lib/sbi/sbi_hart.c
>> +++ b/lib/sbi/sbi_hart.c
>> @@ -105,6 +105,11 @@ static void mstatus_init(struct sbi_scratch *scratch)
>>   		else
>>   			mstateen_val &= ~(SMSTATEEN0_SVSLCT);
>>   
>> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCTR))
>> +			mstateen_val |= SMSTATEEN0_CTR;
>> +		else
>> +			mstateen_val &= ~SMSTATEEN0_CTR;
> 
> The purpose of the Smstateen extension is to prevent side channels between
> contexts, by blocking access to registers that are not context switched. That
> means any code that sets a new mstateen0 bit needs to also include code to
> perform the context switch, or you are creating the side channel anyway.
> 

yes. We need to save/restore the CTR state during domain context switch.
I am not aware of any use cases where we are actually running two 
different worlds with opensbi domains that require this at this point.

Once we have full supervisor domain extension support, these must be 
taken care of. Can we merge this with a TODO item about domain context
switch issue ?

> Regards,
> Samuel
> 
>> +
>>   		csr_write(CSR_MSTATEEN0, mstateen_val);
>>   #if __riscv_xlen == 32
>>   		csr_write(CSR_MSTATEEN0H, mstateen_val >> 32);
>> @@ -688,6 +693,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>>   	__SBI_HART_EXT_DATA(zicfilp, SBI_HART_EXT_ZICFILP),
>>   	__SBI_HART_EXT_DATA(zicfiss, SBI_HART_EXT_ZICFISS),
>>   	__SBI_HART_EXT_DATA(ssdbltrp, SBI_HART_EXT_SSDBLTRP),
>> +	__SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
>> +	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
>>   };
>>   
>>   _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
> 
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
