Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50157C3600C
	for <opensbi@archiver.kernel.org>; Tue,  1 Apr 2025 00:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wf70O+W+9d/q5jaDgl5D+4BRKFsKvcBvQjgtIFGSBU=; b=ZWvG5F9G1gt90d
	HyPLEdOF+EKZ00b9o8THH2UZZNLW74PMangoYpCFHyCi5HqMFyAuXB17EytWqcuXTpR0zl/iRxGdG
	YpM6ZNef1F1FTUBZ/Q8335lqN4zNjmTnXSzyP6dydEpY0rraqIgsJ0F7FISgP14j1UoQCxKJzfaLS
	9+qcRXgociA8zPOtvz/OwnByLML5izVzsrBCGvHkLpqVyRfjQ6ZC09mps908F6lYPsVUOP6dWQNqq
	8vmhV6cqZpnCTV4VJdkyAN7nxh4gHLkduly5JQtfoZ1Rhwoahbc78NzaFZWMgrebpREREOnv5aLZE
	m82T2+dcUBA6z17MRxRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzPmP-00000001g80-3PEB;
	Tue, 01 Apr 2025 00:47:01 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzPmN-00000001g7e-0DoI
	for opensbi@lists.infradead.org;
	Tue, 01 Apr 2025 00:47:00 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3d589ed2b47so13649365ab.2
        for <opensbi@lists.infradead.org>; Mon, 31 Mar 2025 17:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1743468417; x=1744073217; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cXvbGi8018dcfWdIvYyqNAdbe14s9FpPIJzTjAlhg40=;
        b=KxIbeCTLHHN5BGtBAQAvfQfDkr7beea4q41oasGKWyvdN8ZgQ/yoh2gbTK3aPOT4Us
         c06Q9A1zWu0T0mUZX41G0RR37XTGzP0K/AsPtMCuFT7RgMjquB1BBRI7OBgy+Q/DKSMY
         yJPrj9ltUtN6MtMD7ozGpFimpZ1LtSYkiXmAnLvDa4eqnof9Z36zbzXa6LvL+VuGd23a
         FE9YDFNMNVdyD3NwdkIl+3RUSOMqOHbK8xe3Ss8TtjLrqfSJ5NA1cx4OHD5AHK9yGtGR
         oMU9+eJRs9FrgYjy4GOcziRrcNOrN7nms5eGCuisMxDiG/QiRdpndZdO/cRIPNJOzdWC
         5puQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743468417; x=1744073217;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cXvbGi8018dcfWdIvYyqNAdbe14s9FpPIJzTjAlhg40=;
        b=e3RtraGEk1IbHoZskuESIzqqZSl5nT++HWqNkc1prJnTVILR4FDpc/I5Z8vnOBmD1U
         DEzzfigdCJOH9KlEcxViFxp9Oj9lXd5hM78pRKBIHzRK8GXUtV7Oj2L1mQppV8K3QcNF
         xWqouZQZpVZrW7E7xQ3UyqBCtAV2ehuUnPK6Fq/CyLaQ8bBtTThfSPHEyOk28iJ4mjdc
         7uNR0xRSVFJyb+iMhjbdL0SYVgrcFyga5Q3iXmFpnKsJuxP6LiLSvrGScV6D3XUQuI74
         QOWZDli7remschmHDA0J2s7uAt5BuRxMHyqCS1wnHncvB5CmqOk2n9LfPdl3RsJdh780
         I02A==
X-Forwarded-Encrypted: i=1; AJvYcCXc4J4TTSKyBN2lVuePEXhAiMuWw82HklOqmHROY5BcAWc01ct2B7PQlCWO+fLtGZHHEpLO8o/z@lists.infradead.org
X-Gm-Message-State: AOJu0YwF8T9jEsUzSNUc6Ije1nwHWub6ygf+1BFppFg3w5XfBJtRkGah
	O3kqLK1rvtz9izadIwSxMc1XZIT8Z/5K8qwMAlHtWuDZLsU56MNm/FCMMWQ+MhY=
X-Gm-Gg: ASbGnctx3iOzOSjSvM/qWzV898DABWZaW6HXwLfFFKLRaGItH9KZfcBKtUEP3AoSRLD
	SQnPnGlgIw+itZmnPKvNZj6cjlxWG3NV+4bvP771CfrivtCAhv09ntMxkCXTGIZK0W/wuEwHSDO
	EoM6ADW7bcngbYB92Tx/eNa6AgJvW9Xk3zE/KVa7ttZw2m/Zdv4bfCPVTBdAs2uh05hIFFnzXiw
	a91kCh909Z5HEX8UyuQG10mVSFDggjqorbo4OPp7WAUIujQDCkB6wkbVRNXzlTi9QX7J56fUND6
	jm1cVQqOxXC6DqD15g/1ETH9A9J/DlCCRgnnPHpBd1GvqPqOujFZQoVHmBrdJQ==
X-Google-Smtp-Source: AGHT+IEf/aSjCT3Yt5Kr1p5SckoBQYxku3dMJQ4GMch7bSt8i8XRWIB4lCSYywNL7LuHEJmIf+MTjQ==
X-Received: by 2002:a05:6e02:3e05:b0:3d5:d6ad:286a with SMTP id e9e14a558f8ab-3d5e09395a5mr84213485ab.13.1743468417574;
        Mon, 31 Mar 2025 17:46:57 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f46470fe1esm2171001173.1.2025.03.31.17.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 17:46:57 -0700 (PDT)
Message-ID: <bb9d0867-0aea-46b7-9f8c-3a700081c086@sifive.com>
Date: Mon, 31 Mar 2025 19:46:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] lib: sbi: Enable Control Transfer Records (CTR) Ext
 using xstateen.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>, opensbi@lists.infradead.org
Cc: alistair.francis@wdc.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 beeman@rivosinc.com
References: <20250307124451.122828-1-rkanwal@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250307124451.122828-1-rkanwal@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_174659_117795_703670CE 
X-CRM114-Status: GOOD (  20.77  )
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

Hi Rajnesh,

On 2025-03-07 6:44 AM, Rajnesh Kanwal wrote:
> The Control Transfer Records (CTR) extension provides a method to
> record a limited branch history in register-accessible internal chip
> storage.
> 
> This extension is similar to Arch LBR in x86 and BRBE in ARM.
> The Extension has been stable and the latest release can be found here
> https://github.com/riscv/riscv-control-transfer-records/release
> 
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> 
> ---
> Changes in V3:
>         Removed FWFT bit. It was discussed in tech-prs group to
>         use trap and enable approach rather than FWFT bit. Trap
>         and enable approach leads to letter number of traps than
>         enabling and disabling FWFT bit on each CTR usage.
>         https://lists.riscv.org/g/tech-prs/message/1339

If you want to use the trap and enable approach, then you cannot enable the
mstateen0 bit by default, or you will never trap. This is also missing the code
for the trap handler.

> 
> Changes in V2:
>         Added FWFT bit for CTR.
> ---
>  include/sbi/riscv_encoding.h | 13 +++++++++++++
>  include/sbi/sbi_hart.h       |  4 ++++
>  lib/sbi/sbi_hart.c           |  7 +++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 03c68a57..f3e2afd5 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -375,6 +375,17 @@
>  #define CSR_SSTATEEN2			0x10E
>  #define CSR_SSTATEEN3			0x10F
>  
> +/* Machine-Level Control transfer records CSRs */
> +#define CSR_MCTRCTL                     0x34e
> +
> +/* Supervisor-Level Control transfer records CSRs */
> +#define CSR_SCTRCTL                     0x14e
> +#define CSR_SCTRSTATUS                  0x14f
> +#define CSR_SCTRDEPTH                   0x15f
> +
> +/* VS-Level Control transfer records CSRs */
> +#define CSR_VSCTRCTL                    0x24e
> +
>  /* ===== Hypervisor-level CSRs ===== */
>  
>  /* Hypervisor Trap Setup (H-extension) */
> @@ -799,6 +810,8 @@
>  #define SMSTATEEN0_CS			(_ULL(1) << SMSTATEEN0_CS_SHIFT)
>  #define SMSTATEEN0_FCSR_SHIFT		1
>  #define SMSTATEEN0_FCSR			(_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
> +#define SMSTATEEN0_CTR_SHIFT		54
> +#define SMSTATEEN0_CTR			(_ULL(1) << SMSTATEEN0_CTR_SHIFT)
>  #define SMSTATEEN0_CONTEXT_SHIFT	57
>  #define SMSTATEEN0_CONTEXT		(_ULL(1) << SMSTATEEN0_CONTEXT_SHIFT)
>  #define SMSTATEEN0_IMSIC_SHIFT		58
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 4c36c778..c3a7feb7 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -75,6 +75,10 @@ enum sbi_hart_extensions {
>  	SBI_HART_EXT_ZICFISS,
>  	/** Hart has Ssdbltrp extension */
>  	SBI_HART_EXT_SSDBLTRP,
> +	/** HART has CTR M-mode CSRs */
> +	SBI_HART_EXT_SMCTR,
> +	/** HART has CTR S-mode CSRs */
> +	SBI_HART_EXT_SSCTR,
>  
>  	/** Maximum index of Hart extension */
>  	SBI_HART_EXT_MAX,
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 8e2979b5..c343805c 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -105,6 +105,11 @@ static void mstatus_init(struct sbi_scratch *scratch)
>  		else
>  			mstateen_val &= ~(SMSTATEEN0_SVSLCT);
>  
> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCTR))
> +			mstateen_val |= SMSTATEEN0_CTR;
> +		else
> +			mstateen_val &= ~SMSTATEEN0_CTR;

The purpose of the Smstateen extension is to prevent side channels between
contexts, by blocking access to registers that are not context switched. That
means any code that sets a new mstateen0 bit needs to also include code to
perform the context switch, or you are creating the side channel anyway.

Regards,
Samuel

> +
>  		csr_write(CSR_MSTATEEN0, mstateen_val);
>  #if __riscv_xlen == 32
>  		csr_write(CSR_MSTATEEN0H, mstateen_val >> 32);
> @@ -688,6 +693,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>  	__SBI_HART_EXT_DATA(zicfilp, SBI_HART_EXT_ZICFILP),
>  	__SBI_HART_EXT_DATA(zicfiss, SBI_HART_EXT_ZICFISS),
>  	__SBI_HART_EXT_DATA(ssdbltrp, SBI_HART_EXT_SSDBLTRP),
> +	__SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
> +	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
>  };
>  
>  _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
