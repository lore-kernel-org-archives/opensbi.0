Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D163CCD19A
	for <opensbi@archiver.kernel.org>; Tue, 18 Nov 2025 08:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3DDGr05NmQqXQrHV8+0tGDC4kT0eUB3wc7RW94voP8=; b=Ua4HVn639tsYCt
	lfdzkCyi/bC9LyUarNogDnxp0bAUR/5T0JW+4jFuREpE1ji/ifRqJsx6QP/lxc2Ha88lmqBN5LZtM
	6+PL+NRIwlU5Pp6i6slQuyiS+aGK+u4ltG2xfqF3uJXp/GWJ2F9rmIw1TLecxGQKFYCvDt24N0E+g
	OLxQHJCBqLgMimj8nwTlqypwJDXgpCzgMhvjKXRXKHYXKUW9hStpklVpqU/xnPQrniRjPtUdiFkrI
	umEUxC/bAghD1zBv8FZDYfETTW4bWGBX5P4CUCbhrpjlxgKrNP7QpKuAwO1eBTFUTPcQRWny6Uarj
	i4tEfFdYO9ybO5eRex7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHKg-000000004a8-15nR;
	Tue, 18 Nov 2025 08:45:02 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHKY-000000004Xv-0RO9
	for opensbi@lists.infradead.org;
	Tue, 18 Nov 2025 08:44:57 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso5432121b3a.2
        for <opensbi@lists.infradead.org>; Tue, 18 Nov 2025 00:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763455493; x=1764060293; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csL2wKAyZvw9sDWQhCFkajxYjfCsDvGs+iG0MG5ZzB8=;
        b=gzbt1OuP23pElEZ2hSJJmWeWH+D1owL5R3yJeetJMo+ajq5Y3paXGYlInhw1LdcM+I
         bNNUI1y3iQ+CinvmUcFzMJoD94Olo27bEo1xFOqu4jdO0/SpRpwMjqcl1Cy4z6I03FU6
         WiFpOcCqQK95ldiDt/NzX9JFEHUkagNjpFw9WZB+DAz9X1w8hTt0cteT9QNKxzffnjtI
         PjPi/r1NDptSjSvMKfRJUEDHAqAc12RyVSlvA7LDCvKP89VgN5FruN4HfMj3cOpRH97K
         /946x8WaE3E4RMzzx9qM0I90868285SGQI/iXinBrRBLu8S8RzuId9b/zF1z68MAXx3V
         PQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455493; x=1764060293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csL2wKAyZvw9sDWQhCFkajxYjfCsDvGs+iG0MG5ZzB8=;
        b=IVdv1dv/BdwIYp6yfZTFIMXHeiuziiLiJxXXe5vY9aaMo/+FIGLHT6OtXA32DFUeXM
         /xqvSdDi13hnblC6cfpn7fzQBl+1EccOKzCCJ/E0eno6cap3SfnkZtK9ZWRLK+MLbx6B
         /ZWpr5hWAMIYw4nK33ZoaKEWElkR19e6HBrpOdc52CiYbKLcDAy5FCgvI1DIkcK6DUnq
         31RxqhgbiMcLr5UDJkLJS1PiU1NfgcAPis5Cc1KahgftV0xvlVBnh4Xppu8ETkhn3oE6
         n7sTIP3aMRyGpQDvtlF2ef4f7SMnX3XmmJ2phVAYC8KPXI1JxX30QpC6gX7PSeY68wPf
         AXHA==
X-Forwarded-Encrypted: i=1; AJvYcCU/p+nsrtn/cbsgSFsq2JFuIpWeZelRN21uCfxJ4z3i+cmqnTzxqh1uIEthrC40XOfLp7gwINGa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/EoaYL/GprhnJiWk3DHErPbrjCH85KtX8P2vpe+E85ymJu4AD
	Yx7dR+DGsJzL72HhhHxIwUu2rxgPmexsckKvJxdn8Sm9EnfZG6HEZ0Ai
X-Gm-Gg: ASbGncsGxFv7Uke/22mQGEa3TZezrFSTPKw76eysJzeLBlatdTAs6Ir0jRIloq0QUNx
	lJDayldzFs8l/CLAsm1v99jgy1Bfr8nATnM9BWy63KhxZrUeCrqFRK9cuT1NUO9FQkelwtTmIzt
	yZxW3FxTqbGsPg86fp2Q42EU3PPGyLHJKj361dDzLYO8cGKbHj/KZuzZ6Wfb3CVku2j7w8tbSEC
	Of3Oo5Bag1w9MqP8d0sjOybMRIRHFd0DREJ0E3TPj0phfzUO+ZrrTbb1wUog/1IDVLXjh9Gydnx
	uAh4JHMjCAkgZ4qBqERUggGq3srW8SkezqPuQr4jwe1tG5Y0k6LheEQYEqIjPWPHQbj58yaDtR4
	a/znPDnwYSPNTb3jjlCrjDzy8SN196DP7LUS+NWnbESHilLemIF3MxpxZZfZcvXvKL0WQd7CnHY
	3F4Q==
X-Google-Smtp-Source: AGHT+IHzs+UhuCsJmWwB7Tciqfbpd/ypedCJkuQ2F1t0IjHE2oisr1zZ2O+bJAD8EJudRLd/o0dpMw==
X-Received: by 2002:a05:6a20:a104:b0:35d:3bcf:e518 with SMTP id adf61e73a8af0-35d3bcfe660mr11892388637.0.1763455493162;
        Tue, 18 Nov 2025 00:44:53 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc3761d0109sm14407803a12.27.2025.11.18.00.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 00:44:52 -0800 (PST)
Message-ID: <97960cc7-8d37-4105-abe5-681ec5bbe334@gmail.com>
Date: Tue, 18 Nov 2025 00:43:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: sbi: Add runtime stack overrun detection
To: Xiang W <wxjstz@126.com>, opensbi@lists.infradead.org
Cc: Xiang W <wangxiang@iscas.ac.cn>
References: <20251118041948.1331562-1-wxjstz@126.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251118041948.1331562-1-wxjstz@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_004455_552349_15E2754F 
X-CRM114-Status: GOOD (  17.74  )
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

Hi Xiang,

On 11/17/25 20:19, Xiang W wrote:
> Implement lightweight stack overrun detection using toolchain's
> -finstrument-functions instrumentation
> 
> Reviewed-by: Xiang W <wangxiang@iscas.ac.cn>
> ---
>   Makefile                      |  4 +++
>   firmware/fw_base.S            |  3 +++
>   firmware/payloads/test_head.S | 16 ++++++++++++
>   lib/sbi/Kconfig               |  4 +++
>   lib/sbi/objects.mk            |  2 ++
>   lib/sbi/sbi_sochk.c           | 47 +++++++++++++++++++++++++++++++++++
>   6 files changed, 76 insertions(+)
>   create mode 100644 lib/sbi/sbi_sochk.c
> 
> diff --git a/Makefile b/Makefile
> index 398eabe8..cd7d1ad5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -449,6 +449,10 @@ else
>   CFLAGS		+=	-O2
>   endif
>   
> +ifneq ($(CONFIG_SBI_SOCHK),)
> +CFLAGS		+=	-finstrument-functions
> +endif
> +
>   # Setup functions for compilation
>   define dynamic_flags
>   -I$(shell dirname $(2)) -D__OBJNAME__=$(subst -,_,$(shell basename $(1) .o))
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 5300ecf2..6cd5725f 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -366,6 +366,9 @@ _start_warm:
>   	/* Setup stack */
>   	add	sp, tp, zero
>   
> +#ifdef CONFIG_SBI_SOCHK
> +	call	sbi_sochk_init
> +#endif
>   	/* Setup trap handler */
>   	lla	a4, _trap_handler
>   	csrr	a5, CSR_MISA
> diff --git a/firmware/payloads/test_head.S b/firmware/payloads/test_head.S
> index 070ce8aa..de4e334f 100644
> --- a/firmware/payloads/test_head.S
> +++ b/firmware/payloads/test_head.S
> @@ -112,3 +112,19 @@ _boot_a1:
>   	.type __stack_chk_guard, %object
>   __stack_chk_guard:
>   	RISCV_PTR	0x95B5FF5A
> +
> +#ifdef CONFIG_SBI_SOCHK
> +	.section .text
> +	.align 3
> +	.weak __cyg_profile_func_enter
> +	.type __cyg_profile_func_enter, %function
> +__cyg_profile_func_enter:
> +	ret
> +
> +.section .text
> +	.align 3
> +	.weak __cyg_profile_func_exit
> +	.type __cyg_profile_func_exit, %function
> +__cyg_profile_func_exit:
> +	ret
> +#endif
> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
> index c6cc04bc..77077991 100644
> --- a/lib/sbi/Kconfig
> +++ b/lib/sbi/Kconfig
> @@ -6,6 +6,10 @@ config CONSOLE_EARLY_BUFFER_SIZE
>   	int "Early console buffer size (bytes)"
>   	default 256
>   
> +config SBI_SOCHK
> +	bool "Enable Stack Overflow runtime checking"
> +	default n
> +
>   config SBI_ECALL_TIME
>   	bool "Timer extension"
>   	default y
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 8abe1e8e..ed6107ad 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -64,6 +64,8 @@ libsbi-objs-$(CONFIG_SBI_ECALL_SSE) += sbi_ecall_sse.o
>   carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_MPXY) += ecall_mpxy
>   libsbi-objs-$(CONFIG_SBI_ECALL_MPXY) += sbi_ecall_mpxy.o
>   
> +libsbi-objs-$(CONFIG_SBI_SOCHK) += sbi_sochk.o
> +
>   libsbi-objs-y += sbi_bitmap.o
>   libsbi-objs-y += sbi_bitops.o
>   libsbi-objs-y += sbi_console.o
> diff --git a/lib/sbi/sbi_sochk.c b/lib/sbi/sbi_sochk.c
> new file mode 100644
> index 00000000..950275d1
> --- /dev/null
> +++ b/lib/sbi/sbi_sochk.c
> @@ -0,0 +1,47 @@
> +
> +#include <sbi/sbi_scratch.h>
> +#include <sbi/sbi_platform.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_hart.h>
> +
> +extern struct sbi_platform platform;
> +
> +static bool __scratch_init_done = false;
> +
> +__attribute__((no_instrument_function, weak))
> +void sbi_sochk_init(void)
> +{
> +	__scratch_init_done = true;
> +}
> +
> +
> +__attribute__((no_instrument_function, weak))
> +void __cyg_profile_func_enter(void *this_func, void *call_site)
> +{
> +	struct sbi_scratch * scratch;
> +	unsigned long sp, stack_start, stack_end;
> +
> +	if (!__scratch_init_done)
> +		return;
> +
> +	scratch = sbi_scratch_thishart_ptr();
> +
> +	asm volatile("mv %0, sp" : "=r"(sp));
> +	stack_start = (unsigned long)scratch + SBI_SCRATCH_SIZE - platform.hart_stack_size;
> +	stack_end = (unsigned long)scratch;
> +
> +	if (sp < stack_start || sp > stack_end) {
> +		/* Reset SP to output error messages */
> +		asm volatile("mv sp, %0"::"r"(stack_end));

I don't think it's safe to switch stack in C function. I know you want
to avoid re-entrant, but do it in C function is way too risky. Better
have an asm wapper over this function and do it before invoking the C
portion.

Bo

> +		sbi_printf("Stack overflow detected in function %p (caller %p), "
> +			   "sp=%p (%p - %p)\n",
> +			   this_func, call_site, (void*)sp,
> +			   (void*)stack_start, (void*)stack_end);
> +		sbi_hart_hang();
> +	}
> +}
> +
> +__attribute__((no_instrument_function, weak))
> +void __cyg_profile_func_exit(void *this_func, void *call_site)
> +{
> +}


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
