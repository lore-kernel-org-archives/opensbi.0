Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EDEF55425
	for <opensbi@archiver.kernel.org>; Tue, 24 Feb 2026 23:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=To6zr4BG9vaAslDYCU2nvp7MhY/6Ia1csD+/R95mTeI=; b=MUm077Xqnwyun5LdTlJLm+aIoG
	O2ZyuyXVUhrWjAPBZjClDXt1khImBMc/G0LJxXqts4qTN9MCHzQknUk1M4ft2AtOAjw4Hpm6CmZ8R
	huRjRWnN8cRi/8eR4hO33ElmlrQoiAxrQcH3TbBkjksZsuFfm0OWdY81FyGElknZr7EM1CjZUIx8F
	y9QI7+UwNeItYPKGLKUoTxGywfvDdhiWlLN/GHj4z1TNTQLb6bn+5wpd2QXg8v5peC67Nm1AAZ7eH
	v78pGEl0B3KPJ7iSv5FM+nn5AqesC+mtK10A3dtDKPMVBdV9/HQFlZL3RPdN9S3Zj1yUcRXRFRlo+
	jbyTJAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1WL-00000002uaG-2zZ6;
	Tue, 24 Feb 2026 23:08:49 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1WI-00000002uZe-3nDe
	for opensbi@lists.infradead.org;
	Tue, 24 Feb 2026 23:08:48 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2bdb7f185ceso1220238eec.0
        for <opensbi@lists.infradead.org>; Tue, 24 Feb 2026 15:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771974526; x=1772579326; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=16SO3W5TyyK0fI2nFqNcXOfJCqFywfqE3Y4i1RIkWNI=;
        b=mUbveJsBsws6C8Zpu+IrQ4ULs5zIAtxcPgTry05rgANyE0QqOwnvURbrPlEFxZCPAB
         FRV6QwWqYmlj3TIDPdWG/ueQ03/JxvoqzAOWOg3ThukBZcEVb6ikYO/eUtA6s8H+Zilu
         QPi9m2FmUyzF8VLzhr+LXQIMQQP7sEYS/XSIvDSQqtllRaoVGJdfniUGsu/HtSXtENfG
         cLoDnWcNQU9a3qmytQAUgbtH4vFnsFjWGbXjCJzcr1x6i3xViv3z8o4BIOPEjRm/PYSg
         MsdkfdpTcfYwGyAS60Fof8rbc4VtAwcsCJG9WGxj2hQMSztBgoEQLFqzz+O1Fxkl6d7G
         zzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974526; x=1772579326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16SO3W5TyyK0fI2nFqNcXOfJCqFywfqE3Y4i1RIkWNI=;
        b=XO0HWHRjOA6nV46vXHHycgpn/FXyMAr8H6RiVxLBH7cbZYe42vwesUWvtdosEuDXIn
         kaB4KqyF8gL5Gko+EfVEgN9tctkPQNHviR6ILL2LROMHx6RF2DgzcrODRu6lSUhQNa3Y
         2RpdEw5RXPw8YwKd75ZsSis6SFt//qi7wDDaVhA2tOScqYJKHGsZz+VSAa0Dqaliw3WW
         r8QTrWHP9Jn59qK3HdtyTKuPO/OuLulfnw9hTQeJ4qrJV+b3FXHjBmQZjbphVmnKLApW
         KcH1HJX1Dtuviha7hntHP6vWT0Bv6SJ8uM0Qa+CnsjwhNGTKlVFdzzUCbB56oBmSz6p6
         JP0A==
X-Forwarded-Encrypted: i=1; AJvYcCVI+VgJ6vqshTJqQgaag0nG8JKVdEVyQOBQAsBMORv6NtiOS43D9Z2FcbEYNGMGnI8aHLVDCow0@lists.infradead.org
X-Gm-Message-State: AOJu0YyTsaXu2D4wqCdo/2+jBoOA/N/FYkOpOIMj3J76rKPQbxvs1Xg6
	zhy2I3i11YLeoCrU1SNxehFlESQ3xqwA27ADzF9L4QZ1QIO18VnAYZQWfW3y0A==
X-Gm-Gg: ATEYQzxJ1hawnWWR5IWIuEtTZPCjmlj72ZEXWsOYbbS0oeeuMqoos8HUBZ0xfVY26hN
	lkmyAYrYh8WCBVJY6XZWCjd1shF5VZKB+RoSg0ojhPRTY7zyNDY71lWDmLx/JKxHP6kSpdtLMX9
	8f3PzLNZtlmOuq5CPkNfYXS58SEAHhFU774fhWQkdtE5ZVbX9CFeEGOKB+3ffvKieiG8GTyvrSH
	hdMJHeGRO0cXWWLqpCNnsF9edYcVHhd+KnfGUQgMK0vVN60MSEDUlVa4w/ClmoxWCmg+k2MhN+O
	7mzqVGkKJTeu/8znSLrD3rBkYbsxwcYiyH+9rYNXTfJ+AXI6XC7lEcK+r6Ys+/OLTQnbdtgDkZi
	emMr1Oyc/lRFTe1xgC14dP628OVnHeEwpSmQ8339/NywpISZWMLfGmMefwEEg7dc7aMHCIdnVIl
	6Zjf/QsiLg1RUeGhdqFKNpwpcliOTA7wnMNX+ilAv9IXIK538=
X-Received: by 2002:a05:7300:a497:b0:2ba:96d8:530b with SMTP id 5a478bee46e88-2bd7bd640b5mr7035982eec.32.1771974525648;
        Tue, 24 Feb 2026 15:08:45 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa3d77sm7525892eec.13.2026.02.24.15.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 15:08:45 -0800 (PST)
Message-ID: <f66e1ab3-3d0f-4cd8-a067-14ba946db529@gmail.com>
Date: Tue, 24 Feb 2026 15:12:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: support starriver 9530
To: 362800175 <362800175@qq.com>, opensbi <opensbi@lists.infradead.org>
References: <tencent_A98700944AE61B8E17C72D35E968CF123708@qq.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <tencent_A98700944AE61B8E17C72D35E968CF123708@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_150846_960620_63BE4692 
X-CRM114-Status: GOOD (  22.86  )
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

Hi,

Please state your real name and have proper signed-off-by.

What's starriver? A SoC vendor? Can't find anything online. Also, from
your code I think the platform init logic is not necessary. Why not get
rid of those hard-coded values and use device-tree instead?

Bo


On 2/24/26 06:03, 362800175 wrote:
>  From f93376ac9420836b1c23e885c2dafa30da96aeb3 Mon Sep 17 00:00:00 2001
> From: nwumengfei <362800175@qq.com>
> Date: Tue, 24 Feb 2026 21:34:09 +0800
> Subject: [PATCH] platform: support starriver 9530
> 
> ---
>   lib/utils/serial/Kconfig                   |   3 +
>   lib/utils/serial/objects.mk                |   1 +
>   lib/utils/serial/starriver_uart.c          |  55 ++++++++
>   platform/generic/Kconfig                   |   4 +
>   platform/generic/configs/defconfig         |   1 +
>   platform/generic/starriver/9530/9530.c     | 141 +++++++++++++++++++++
>   platform/generic/starriver/9530/objects.mk |   3 +
>   7 files changed, 208 insertions(+)
>   create mode 100755 lib/utils/serial/starriver_uart.c
>   create mode 100755 platform/generic/starriver/9530/9530.c
>   create mode 100755 platform/generic/starriver/9530/objects.mk
> 
> diff --git a/lib/utils/serial/Kconfig b/lib/utils/serial/Kconfig
> index 21619d0d..75334425 100644
> --- a/lib/utils/serial/Kconfig
> +++ b/lib/utils/serial/Kconfig
> @@ -101,4 +101,7 @@ config SERIAL_SEMIHOSTING
>   	bool "Semihosting support"
>   	default n
>   
> +config SERIAL_STARRIVER
> +	bool "Starriver support"
> +	default y
>   endmenu
> diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
> index 94cf3a4b..24b57133 100644
> --- a/lib/utils/serial/objects.mk
> +++ b/lib/utils/serial/objects.mk
> @@ -50,3 +50,4 @@ libsbiutils-objs-$(CONFIG_SERIAL_LITEX) += serial/litex-uart.o
>   libsbiutils-objs-$(CONFIG_SERIAL_UART8250) += serial/uart8250.o
>   libsbiutils-objs-$(CONFIG_SERIAL_XILINX_UARTLITE) += serial/xlnx-uartlite.o
>   libsbiutils-objs-$(CONFIG_SERIAL_SEMIHOSTING) += serial/semihosting.o
> +libsbiutils-objs-$(CONFIG_SERIAL_STARRIVER) += serial/starriver_uart.o
> diff --git a/lib/utils/serial/starriver_uart.c b/lib/utils/serial/starriver_uart.c
> new file mode 100755
> index 00000000..47247a93
> --- /dev/null
> +++ b/lib/utils/serial/starriver_uart.c
> @@ -0,0 +1,55 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Authors:
> + *   362800175 <362800175@qq.com>
> + *
> + */
> +
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_types.h>
> +#include <sbi/sbi_console.h>
> +
> +#define UART0_BASE              0x9000000UL
> +#define PADDR_UARTCR            (UART0_BASE + 0x030)
> +#define PADDR_UARTDR            (UART0_BASE + 0x000)
> +#define PADDR_UARTSR            (UART0_BASE + 0x4)
> +#define PADDR_UARTFR            (UART0_BASE + 0x18)
> +#define UART0                   PADDR_UARTDR
> +#define STAR_UART_TXFIFO_FULL   (1<<3)
> +
> +void starriver_uart_putc(char c)
> +{
> +    volatile uint64_t *dr_addr = (volatile uint64_t *)PADDR_UARTDR;
> +    volatile uint64_t *fr_addr = (volatile uint64_t *)PADDR_UARTFR;
> +
> +    while(*(fr_addr) & STAR_UART_TXFIFO_FULL);
> +
> +    *dr_addr = c & 0xff;
> +}
> +
> +unsigned long starriver_uart_puts(const char *str, unsigned long len)
> +{
> +    unsigned long i;
> +    for (i = 0; i < len; i++) {
> +        if (str[i] == '\n')
> +            starriver_uart_putc('\r');
> +        starriver_uart_putc(str[i]);
> +    }
> +
> +    return len;
> +}
> +
> +
> +struct sbi_console_device starriver_console = {
> +    .name = "starriver_uart",
> +    .console_putc = starriver_uart_putc,
> +    .console_puts = starriver_uart_puts,
> +};
> +
> +int starriver_uart_init(void)
> +{
> +    sbi_console_set_device(&starriver_console);
> +
> +    return 0;
> +}
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index 0c11fbd2..4a783bff 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -99,6 +99,10 @@ config PLATFORM_SPACEMIT_K1
>   	bool "Spacemit K1 support"
>   	select FDT_HSM_SPACEMIT
>   	default n
> +
> +config PLATFORM_STARRIVER_9530
> +	bool "StarRiver 9530 support"
> +	default n
>   
>   source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
>   source "$(OPENSBI_SRC_DIR)/platform/generic/eswin/Kconfig"
> diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
> index 727c5f4a..b531b73e 100644
> --- a/platform/generic/configs/defconfig
> +++ b/platform/generic/configs/defconfig
> @@ -12,6 +12,7 @@ CONFIG_PLATFORM_STARFIVE_JH7110=y
>   CONFIG_PLATFORM_THEAD=y
>   CONFIG_PLATFORM_MIPS_P8700=y
>   CONFIG_PLATFORM_SPACEMIT_K1=y
> +CONFIG_PLATFORM_STARRIVER_9530=y
>   CONFIG_FDT_CACHE=y
>   CONFIG_FDT_CACHE_ANDES_LLCACHE=y
>   CONFIG_FDT_CACHE_SIFIVE_CCACHE=y
> diff --git a/platform/generic/starriver/9530/9530.c b/platform/generic/starriver/9530/9530.c
> new file mode 100755
> index 00000000..37705692
> --- /dev/null
> +++ b/platform/generic/starriver/9530/9530.c
> @@ -0,0 +1,141 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Authors:
> + *   362800175 <362800175@qq.com>
> + *
> + */
> +#include <platform_override.h>
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_console.h>
> +
> +#include <sbi_utils/irqchip/plic.h>
> +#include <sbi_utils/timer/aclint_mtimer.h>
> +
> +#define STARRIVER_HART_COUNT            2
> +#define STARRIVER_TIMER_FREQ            375000
> +#define STARRIVER_TIMER_ADDR            0x2000000
> +
> +#define STARRIVER_ACLINT_MSWI_ADDR      (STARRIVER_TIMER_ADDR + CLINT_MSWI_OFFSET)
> +#define STARRIVER_ACLINT_MTIMER_ADDR    (STARRIVER_TIMER_ADDR + 0xbff8)
> +#define STARRIVER_ACLINT_MTIMECMP_ADDR  (STARRIVER_TIMER_ADDR + 0x4000)
> +
> +#define STARRIVER_PLIC_ADDR             0xc000000
> +#define STARRIVER_PLIC_SIZE             0x10000000
> +
> +#define STARRIVER_PLIC_NUM_SOURCES      0x35
> +#define STARRIVER_PLIC_NUM_PRIORITIES   7
> +
> +#define STARRIVER_MTIMECMP_SIZE         0xbff8
> +#define STARRIVER_MTIME_SIZE            0x8
> +
> +#define UART0_BASE                      (0x09000000UL) /*!< (UART0) Base Address */
> +#define PADDR_UARTCR                    (UART0_BASE + 0x030)
> +#define PADDR_UARTDR                    (UART0_BASE + 0x000)
> +#define SOC_DEBUG_UART                  PADDR_UARTDR
> +#define PADDR_UARTIBRD                  (UART0_BASE + 0x024)
> +#define PADDR_UARTFBRD                  (UART0_BASE + 0x028)
> +#define PADDR_UUARTLCR_H                (UART0_BASE + 0x02c)
> +
> +#define STARRIVER_TIMER_VALUE()         readl((void *)STARRIVER_ACLINT_MTIMER_ADDR)
> +
> +static struct plic_data plic = {
> +    .addr = STARRIVER_PLIC_ADDR,
> +    .size = STARRIVER_PLIC_SIZE,
> +    .num_src = STARRIVER_PLIC_NUM_SOURCES,
> +};
> +
> +static struct aclint_mtimer_data mtimer = {
> +    .mtime_freq = STARRIVER_TIMER_FREQ,
> +    .mtime_addr = STARRIVER_ACLINT_MTIMER_ADDR,
> +    .mtime_size = STARRIVER_MTIME_SIZE,
> +    .mtimecmp_addr = STARRIVER_ACLINT_MTIMECMP_ADDR,
> +    .mtimecmp_size = STARRIVER_MTIMECMP_SIZE,
> +    .first_hartid = 0,
> +    .hart_count = STARRIVER_HART_COUNT,
> +    .has_64bit_mmio = true,
> +};
> +
> +static u32 measure_cpu_freq(u32 n)
> +{
> +    u32 start_mtime, delta_mtime;
> +    u32 mtime_freq = STARRIVER_TIMER_FREQ;
> +    u32 tmp = (u32)STARRIVER_TIMER_VALUE();
> +    u32 start_mcycle, delta_mcycle, freq;
> +    /* Don't start measuring until we see an mtime tick */
> +    do {
> +        start_mtime = (u32)STARRIVER_TIMER_VALUE();
> +    } while (start_mtime == tmp);
> +    start_mcycle = csr_read(mcycle);
> +    do {
> +        delta_mtime = (u32)STARRIVER_TIMER_VALUE() - start_mtime;
> +    } while (delta_mtime < n);
> +
> +    delta_mcycle = csr_read(mcycle) - start_mcycle;
> +
> +    freq = (delta_mcycle / delta_mtime) * mtime_freq
> +        + ((delta_mcycle % delta_mtime) * mtime_freq) / delta_mtime;
> +
> +    sbi_printf("%s: delta_mcycle = %u delta_mtime = %u mtime_freq = %u freq = %u\n",
> +        __func__, delta_mcycle, delta_mtime, mtime_freq, freq);
> +
> +    return freq;
> +}
> +
> +extern int starriver_uart_init(void);
> +
> +static int starriver_console_init(void)
> +{
> +    return starriver_uart_init();
> +}
> +
> +static int starriver_irqchip_init(bool cold_boot)
> +{
> +    int rc = 0;
> +
> +    if (cold_boot) {
> +        rc = plic_cold_irqchip_init(&plic);
> +    }
> +
> +    return rc;
> +}
> +
> +static int starriver_timer_init(bool cold_boot)
> +{
> +    int rc = 0;
> +
> +    if (cold_boot) {
> +        measure_cpu_freq(100);
> +        rc = aclint_mtimer_cold_init(&mtimer, NULL);
> +    }
> +
> +    return rc;
> +}
> +
> +static int starriver_early_init(bool cold_boot)
> +{
> +    starriver_console_init();
> +
> +    starriver_irqchip_init(cold_boot);
> +
> +    starriver_timer_init(cold_boot);
> +
> +    return 0;
> +}
> +
> +static int starriver_9530_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
> +{
> +    generic_platform_ops.final_init = starriver_early_init;
> +
> +    return 0;
> +}
> +
> +static const struct fdt_match starriver_9530_match[] = {
> +	{ .compatible = "starriver,9530" },
> +	{ },
> +};
> +
> +const struct fdt_driver starriver_9530 = {
> +	.match_table = starriver_9530_match,
> +	.init = starriver_9530_platform_init,
> +};
> \ No newline at end of file
> diff --git a/platform/generic/starriver/9530/objects.mk b/platform/generic/starriver/9530/objects.mk
> new file mode 100755
> index 00000000..b88af7cd
> --- /dev/null
> +++ b/platform/generic/starriver/9530/objects.mk
> @@ -0,0 +1,3 @@
> +carray-platform_override_modules-$(CONFIG_PLATFORM_STARRIVER_9530) += starriver_9530
> +
> +platform-objs-$(CONFIG_PLATFORM_STARRIVER_9530) += starriver/9530/9530.o


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
