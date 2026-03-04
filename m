Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E48EDEC1E
	for <opensbi@archiver.kernel.org>; Wed,  4 Mar 2026 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuD2O3q1PbGJP2J52DjTG7w7sPPQGPiK7OpPO6EeoQA=; b=Q8kLmt1z514e43
	v2/Y9B02b4D9UH1SL6ggOM8f4jF2LGfKs2/z1LXDyTsEsEUYipaXmTRsepekTqImMQNXg+eZ9luVk
	S+ngRsrenisiWtrMlWLVQTpHGUlkkZPS+eHReoc+WiKjyf06j2DT8o4gvxBhO8nmlf3kc9YxZwQ3r
	XDDFFfZ/33rZbiXiLxO9RlNkYkzOPOrIVwa7V/pb+JYQ8aEfYQtdQR3WAF7+lf1LO/i8ca9l3/hF3
	Bvtyg7sP2qisrfTBoI3H5wv+bZai6VJrvg9XbvTddaHqvfoJpAXtr8qQcOsMpsbO5wPJEemk4XTOD
	VM8JYBSi3W9NmTFfZG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxh44-0000000Gg4U-2fXu;
	Wed, 04 Mar 2026 07:54:40 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxh40-0000000Gg3w-46iG
	for opensbi@lists.infradead.org;
	Wed, 04 Mar 2026 07:54:38 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-506a3400f30so57099261cf.1
        for <opensbi@lists.infradead.org>; Tue, 03 Mar 2026 23:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772610875; x=1773215675; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=53D8+19yXtXvwX1VF+x5FXAukIt7CZeR8Wv4TeWxW8g=;
        b=YoMTv6NRCLh20SXRX2unaw6MwdOHdvYMVgTBe+9HL2Qr06UD0nhVrBIn+y+ljD1GhM
         5TfxT/vdHQmhr+NpHxeX7JOFhVkEClmXUtQGmjqjxlvm3ndHamONNmeS1TUinX0OLtcG
         nqLgG+n0NW0EkFVhbepOrSx8ZbzxPygWvyFB5RL5Rv6acGb6gvOCRSU9Z9p/Qxt9Vbyj
         CYwxwkPyKbQY9Puv4g6/yaZgLLt/EEqpNC5xhCVhftVDCrV9exP98kJK7DXj+XxbHfjp
         AUfxHU7vzdJ2dnQSsY5FUQ4/sQK2Sf0h1S8KoG/zENsZtnLdWa0FxngMb51GotEvA6/A
         +2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772610875; x=1773215675;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=53D8+19yXtXvwX1VF+x5FXAukIt7CZeR8Wv4TeWxW8g=;
        b=mLlPCoayLXM1W4Uv6GLA5yy9PJrk7ER/EueI+K5cA+PNODgwTSnw9snjJny96Pp9Q1
         P51uVaGbUwe/H9cJZ1Lx4UFT5qI21wNxgcxbXKQ7V5Ih0UrtfP3vDU+V6UApTRz5oAws
         4/ayz6Jf661nlCZWHf9RoAj6LZddVZsVMEmjC5auz1acxLrVJPtfrdDe09x4fHYjYFQ3
         70cuoAcJraMv4/6SeDkSl8Ps3dpF3XUhuNnPUfs6Hjru1yPEEKSpjPazlyavk13ug3Xc
         ksROr4CmZX/NytreOKbK4Ro8u9NodrD3VDDtV717S0fX/VuW4q28lVWxQ/VNxkcM6CX4
         JfxQ==
X-Gm-Message-State: AOJu0YyebMfjNI/QMZZSePC0KBiNNKYvGhd34X9B2QfGLGbEEpCTpkYC
	Mr/D9iNCVoaok71iREx8TiNzY/dRij+C8d4i19FfkVxjatIs+PS6qvVesnOG+WDL
X-Gm-Gg: ATEYQzyjTUZNyUMbr4ujSkKb4fIRcF1JJ0K9GxNqg+P0aUop32Fx0uXqUZuybFfc1CO
	q243BOwFZFby5pYESUh/2Ewj0J5k6t0LLPMzhXjxJSBtUnRmb2LwNcgsmECZ31/w2hc1YsaXYqw
	qqV8V4q65uNu4fdPHTSKvIAhu9oTN+oIA2SUDixMAvgsbHCtdkk5WSzm7GrhbVG96ewotWkDTTw
	RteuA72y2gguOawQ9/LPN3matD7lT4dM6ih7q4mn0FXDeLLnQxbgle3M9Xef+weP7JAUILTeXZv
	fA19bgOkEne0FdvaLLBMifn1a8xfYlLzo+rg+7AXL3e983MF97JXNW+qY3CLaEFv9RrzpQbLD91
	tCZCZQrHBqOemf2i1dp+n74OL3bjiq3uKErNvqF7UwqpCR9Vss4cWKpoWM0gyG/9E/TsWPdezpx
	GjybeZzi7Dg8BeffmE+puDOwzOQTf/Feh712Y=
X-Received: by 2002:ac8:7dcf:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-508ce99c4bcmr53823141cf.14.1772610874856;
        Tue, 03 Mar 2026 23:54:34 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ae9313sm149717041cf.29.2026.03.03.23.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 23:54:33 -0800 (PST)
Message-ID: <a5064a0a-be3c-45a5-9166-a965cbc158c7@gmail.com>
Date: Tue, 3 Mar 2026 23:52:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform: generic: eswin: Add eic770x_hsm and fix
 warm reset issues
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: nick.hu@sifive.com, linmin@eswincomputing.com, gaohan@iscas.ac.cn,
 me@ziyao.cc
References: <20260302084029.428-1-ganboing@gmail.com>
 <20260302084029.428-3-ganboing@gmail.com>
Content-Language: en-US
In-Reply-To: <20260302084029.428-3-ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_235437_071715_F80294FB 
X-CRM114-Status: GOOD (  39.06  )
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

Hi All,

An issue is reported by Linmin (ESWIN) in a separate discussion with me.
Specifically, the mcput_cease_from_tile_x bit will not properly reflect
hart cease status if the remote hart hasn't undergone a round of HSM
start->stop, and its 0x7c1 CSR is still at reset value. I'm working on
a fix and will push v2 shortly. Thanks.

Bo

On 3/2/26 00:40, Bo Gan wrote:
> During warm reset, my EIC770X/Hifive Premier P550 can sometimes
> encounter memory corruption issue crashing Linux boot. Currently the
> issue is mitigated by having a sbi_printf before writing to the reset
> register. I analyzed the issue further since then. From the SoC
> datasheet[1], it's recommended to implement power-down flow as:
> 
>    a. Designate a primary core, and let it broadcast requests to other
>       cores to execute a CEASE insn. Primary core also notifies an
>       "Externel Agent" to start monitoring.
>    b. Primary core waits for other cores to CEASE before it CEASEs.
>    c. "External Agent" waits for primary core to CEASE before resets
>       the Core Complex.
> 
> It's possible that EIC770X can trigger undefined behavior if the core
> complex is reset while the harts are actively running. The sbi_printf
> in the reset handler effectively hides the problem by delaying the
> reset -- by the time sbi_printf finishes, all other harts will have
> already landed in the loop in sbi_hsm_hart_wait(), which parks the hart.
> Without the sbi_printf, I confirmed that other harts haven't reached
> sbi_hsm_hart_wait yet before current hart resets the SoC. (by debugging)
> 
> To safely reset, and inspired by the datasheet, the warm reset logic
> in eic770x.c now use the current hart as both primary core and the
> "External Agent", and other harts as secondary cores. It leverages
> the HSM framework and a new eic770x_hsm device to CEASE other harts,
> and wait for them to CEASE before resets the SoC. with the sbi_printf
> before reset removed, and this logic in place, stress test shows that
> the memory corruption issue no longer occurs.
> 
> The new eic770x_hsm device is only used for the reset-CEASE logic at
> the moment, and may be extended to a fully functional HSM device in
> the future.
> 
> [1] https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual
> 
> Fixes: e5797e0688c1 ("platform: generic: eswin: add EIC7700")
> Signed-off-by: Bo Gan <ganboing@gmail.com>
> ---
>   platform/generic/eswin/eic770x.c         | 105 ++++++++++++++++++++---
>   platform/generic/eswin/hfp.c             |   4 +-
>   platform/generic/include/eswin/eic770x.h |  20 +++--
>   3 files changed, 113 insertions(+), 16 deletions(-)
> 
> diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
> index 7330df9f..237fb06d 100644
> --- a/platform/generic/eswin/eic770x.c
> +++ b/platform/generic/eswin/eic770x.c
> @@ -10,14 +10,96 @@
>   #include <sbi/sbi_console.h>
>   #include <sbi/sbi_system.h>
>   #include <sbi/sbi_math.h>
> +#include <sbi/sbi_hsm.h>
> +#include <sbi/sbi_ipi.h>
>   #include <sbi/sbi_hart_pmp.h>
>   #include <sbi/sbi_hart_protection.h>
> +#include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
>   #include <eswin/eic770x.h>
>   #include <eswin/hfp.h>
>   
>   static struct sbi_hart_protection eswin_eic7700_pmp_protection;
> +static volatile bool eic770x_power_down = false;
>   
> -static int eic770x_system_reset_check(u32 type, u32 reason)
> +static int eic770x_hart_start(u32 hartid, ulong saddr)
> +{
> +	u32 hartindex = sbi_hartid_to_hartindex(hartid);
> +
> +	/*
> +	 * saddr is ignored intentionally.
> +	 * For non-power-down scenarios, eic770x_hart_stop simply
> +	 * returns, putting the hart in atomic_read(&hdata->state)
> +	 * loop in sbi_hsm_hart_wait. We wake it up if it's in wfi()
> +	 */
> +	return sbi_ipi_raw_send(hartindex, true);
> +}
> +
> +static int eic770x_hart_stop()
> +{
> +	/*
> +	 * fence to enforce all previous ipi clears are done
> +	 * Refer to comments below in eic770x_cease_other_harts
> +	 */
> +	asm volatile ("fence o, r");
> +
> +	if (!eic770x_power_down)
> +		return SBI_ENOTSUPP;
> +
> +	sifive_cease();
> +}
> +
> +void eic770x_cease_other_harts(void)
> +{
> +	u32 to_cease[2] = {};
> +
> +	eic770x_power_down = true;
> +	sbi_for_each_hartindex(i) {
> +		u32 hartid = sbi_hartindex_to_hartid(i);
> +		u32 die    = hart_die(hartid);
> +		u32 core   = hart_core(hartid);
> +
> +		/* Only wait for other harts */
> +		if (i == current_hartindex())
> +			continue;
> +		/*
> +		 * Bring harts out of WFI in sbi_hsm_hart_wait
> +		 * Harts won't miss this IPI, because:
> +		 *  1. If hart goes to wfi() in sbi_hsm_hart_wait,
> +		 *     it must have not observed eic770x_power_down
> +		 *  2. If it hasn't observed eic770x_power_down,
> +		 *     then it must haven't observed the IPI sent,
> +		 *     given the wmb() in sbi_ipi_raw_send
> +		 *  3. Given the fence o, r, any previous ipi_clear
> +		 *     can't fall-through the read of eic770x_power_down
> +		 */
> +		sbi_ipi_raw_send(i, false);
> +		to_cease[die] |= EIC770X_MC_CEASE_BIT(core);
> +	}
> +
> +	for (u32 die = 0; die < array_size(to_cease); die++) {
> +		/*
> +		 * MCPU status indicates the wfi/debug/halt/cease status
> +		 * of each individual harts in the same die. The value
> +		 * can change on the fly, but for ceased harts, the cease
> +		 * bit remains high until reset
> +		 */
> +		u32 *status = (u32*)EIC770X_MCPU_STATUS(die);
> +
> +		if (!to_cease[die])
> +			continue;
> +
> +		/* Wait for mcput_cease_from_tile_x */
> +		while ((readl(status) & to_cease[die]) != to_cease[die]);
> +	}
> +}
> +
> +static const struct sbi_hsm_device eswin_eic770x_hsm = {
> +	.name	      = "eic770x_hsm",
> +	.hart_start   = eic770x_hart_start,
> +	.hart_stop    = eic770x_hart_stop,
> +};
> +
> +static int eic7700_system_reset_check(u32 type, u32 reason)
>   {
>   	switch (type) {
>   	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> @@ -28,23 +110,23 @@ static int eic770x_system_reset_check(u32 type, u32 reason)
>   	}
>   }
>   
> -static void eic770x_system_reset(u32 type, u32 reason)
> +static void eic7700_system_reset(u32 type, u32 reason)
>   {
>   	switch (type) {
>   	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
>   	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> -		sbi_printf("%s: resetting...\n", __func__);
> -		writel(EIC770X_SYSCRG_RST_VAL, (void *)EIC770X_SYSCRG_RST);
> +		eic770x_cease_other_harts();
> +		writel(EIC770X_SYSRST_VAL, (void *)EIC770X_SYSCRG_SYSRST);
>   	}
>   
> -	sbi_hart_hang();
> +	sifive_cease();
>   }
>   
>   static struct sbi_system_reset_device *board_reset = NULL;
> -static struct sbi_system_reset_device eic770x_reset = {
> -	.name = "eic770x_reset",
> -	.system_reset_check = eic770x_system_reset_check,
> -	.system_reset = eic770x_system_reset,
> +static struct sbi_system_reset_device eic7700_reset = {
> +	.name = "eic7700_reset",
> +	.system_reset_check = eic7700_system_reset_check,
> +	.system_reset = eic7700_system_reset,
>   };
>   
>   #define add_root_mem_chk(...) do { \
> @@ -145,7 +227,7 @@ static int eswin_eic7700_early_init(bool cold_boot)
>   
>   	if (board_reset)
>   		sbi_system_reset_add_device(board_reset);
> -	sbi_system_reset_add_device(&eic770x_reset);
> +	sbi_system_reset_add_device(&eic7700_reset);
>   
>   	/* Enable bus blocker */
>   	writel(1, (void*)EIC770X_TL64D2D_OUT);
> @@ -231,6 +313,9 @@ static int eswin_eic7700_final_init(bool cold_boot)
>   	int rc;
>   
>   
> +	if (cold_boot)
> +		sbi_hsm_set_device(&eswin_eic770x_hsm);
> +
>   	/**
>   	 * Do generic_final_init stuff first, because it touchs FDT.
>   	 * After final_init, we'll block entire memory port with the
> diff --git a/platform/generic/eswin/hfp.c b/platform/generic/eswin/hfp.c
> index eabed191..a6e73e18 100644
> --- a/platform/generic/eswin/hfp.c
> +++ b/platform/generic/eswin/hfp.c
> @@ -11,6 +11,7 @@
>   #include <sbi/sbi_hart.h>
>   #include <sbi/sbi_ecall_interface.h>
>   #include <sbi_utils/serial/uart8250.h>
> +#include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
>   #include <eswin/eic770x.h>
>   #include <eswin/hfp.h>
>   
> @@ -94,6 +95,7 @@ static int hfp_system_reset_check(u32 type, u32 reason)
>   
>   static void hfp_system_reset(u32 type, u32 reason)
>   {
> +	eic770x_cease_other_harts();
>   	switch (type) {
>   	case SBI_SRST_RESET_TYPE_SHUTDOWN:
>   		hfp_send_bmc_msg(HFP_MSG_NOTIFY, HFP_CMD_POWER_OFF,
> @@ -104,7 +106,7 @@ static void hfp_system_reset(u32 type, u32 reason)
>   				NULL, 0);
>   		break;
>   	}
> -	sbi_hart_hang();
> +	sifive_cease();
>   }
>   
>   static struct sbi_system_reset_device hfp_reset = {
> diff --git a/platform/generic/include/eswin/eic770x.h b/platform/generic/include/eswin/eic770x.h
> index 67764ec0..fe7c1f58 100644
> --- a/platform/generic/include/eswin/eic770x.h
> +++ b/platform/generic/include/eswin/eic770x.h
> @@ -14,6 +14,8 @@ struct eic770x_board_override {
>   	struct sbi_system_reset_device *reset_dev;
>   };
>   
> +void eic770x_cease_other_harts(void);
> +
>   /* CSRs */
>   #define EIC770X_CSR_BRPREDICT	0x7c0
>   #define EIC770X_CSR_FEAT0	0x7c1
> @@ -55,11 +57,16 @@ struct eic770x_board_override {
>   #define EIC770X_UART_REG_SHIFT	2
>   #define EIC770X_UART_REG_WIDTH	4
>   
> -#define EIC770X_SYSCRG		(EIC770X_SYSPORT_LOCAL + 0x11828000UL)
> -#define EIC770X_SYSCRG_LSPCLK0	(EIC770X_SYSCRG + 0x200UL)
> -#define EIC770X_SYSCRG_SYSCLK	(EIC770X_SYSCRG + 0x20cUL)
> -#define EIC770X_SYSCRG_RST	(EIC770X_SYSCRG + 0x300UL)
> -#define EIC770X_SYSCRG_RST_VAL	0x1AC0FFE6UL
> +#define EIC770X_SYSCON(d)	(EIC770X_SYSPORT_BASE(d) + 0x11810000UL)
> +#define EIC770X_MCPU_STATUS(d)	(EIC770X_SYSCON(d) + 0x608UL)
> +#define EIC770X_MC_CEASE_BIT(c)	(1UL << (15 - c))
> +
> +#define EIC770X_SYSCRG(d)	(EIC770X_SYSPORT_BASE(d) + 0x11828000UL)
> +#define EIC770X_SYSCRG_LOCAL	(EIC770X_SYSPORT_LOCAL + 0x11828000UL)
> +#define EIC770X_SYSCRG_LSPCLK0	(EIC770X_SYSCRG_LOCAL + 0x200UL)
> +#define EIC770X_SYSCRG_MCCLK(d) (EIC770X_SYSCRG(d) + 0x208UL)
> +#define EIC770X_SYSCRG_SYSCLK	(EIC770X_SYSCRG_LOCAL + 0x20cUL)
> +#define EIC770X_SYSCRG_SYSRST	(EIC770X_SYSCRG_LOCAL + 0x300UL)
>   
>   /* Memory Ports */
>   #define EIC770X_MEMPORT_BASE	0x0080000000UL // 2G
> @@ -98,4 +105,7 @@ struct eic770x_board_override {
>   		divisor > 2 ? divisor : 2; 		\
>   	})
>   
> +/* Reset definitions */
> +#define EIC770X_SYSRST_VAL	0x1AC0FFE6UL
> +
>   #endif


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
