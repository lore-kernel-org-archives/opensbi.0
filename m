Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BFECD3447
	for <opensbi@archiver.kernel.org>; Sat,  9 May 2026 19:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONvOjpxwQbDgmlPjD2ZNkwyDDBkWtBe4jeJLYCwMC2Y=; b=zLOv7I6FVrJGlr
	+tryAXqPEgpV+kRmgrzeNql72VPR8bpvHtC8GdKuydK7CU4PddPwGXBs0TZ5K6r44y/xduzoNjCv4
	4hzpjfeHU4EUW4s84sKB5eFDt8hY0nzPI6huRqM/ITg7YAt103twRugHg+HpOVRfoAw6s0PratI8F
	AfmPXX5jWmMFMpb1NaE2yrIFIyaDa8WiQ96R2N2SdYyXVRgDzOV92rZ1ibn0JtTxRvupPaOls4Nt5
	dNWMqnzcQNVqNa3OBW35iTmxxEospbdsmPXnVbMkJutCZQldRm1QbA1d9H9YgGZlwQxIxP9AMsnwH
	wooU1AkRkoiTsng9292Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLnI2-00000009Wne-3S3k;
	Sat, 09 May 2026 19:24:42 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLnI0-00000009Wmz-2XvD
	for opensbi@lists.infradead.org;
	Sat, 09 May 2026 19:24:41 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-67b7c77865dso5008912a12.2
        for <opensbi@lists.infradead.org>; Sat, 09 May 2026 12:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778354679; cv=none;
        d=google.com; s=arc-20240605;
        b=KTlz0HQUbviXnjggLbJMY6WiDTC+HetkKT8wigoC6ZiR8RrwtlGcGhLAe7uRUr5UOh
         UMTAt17rAmVgSBxSfjDKE5n3cmOfUOUxcwp32qUlIfzKWq9sINuMJU2VSL8JM1az8n/b
         6KgvyjBifm0t8qi1BmLiaeuBlk0v3QpDgCjlil/dzB9gPse7AR5iGz6ZpL37n0JYqKFP
         2Y+YXD7XWATQGyKwIkz+TzABWGVdl7O7AhXArfZp4PHIfunpPlIYPK1aTIWxII9e1ZgC
         nm5jAF+UayzO74/7zlamU2B9zbAsVG1Ru0EoCFqj1hEzvYg+/YS8rmUpLh8+yixbzuDE
         WeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o97G15H2Zm3VOOA4oQ2NBHEWHBaj/E+OExMb48INqqY=;
        fh=ShLZuGA5Ga9ZSwTp3CGA04qdm0rmXd4x3VKZmN6jqbE=;
        b=L/BCbbegAdNHEjbyl8tL6blIxGmgrf8IezowhWNxWvJYaiaJs7Lmu8rNJXx7BKOgC6
         iBcSBzMZ046oUaCUy0oVVWcjUl815/YzG/sMdtXyyhag3e9OSzOxWx+7juvtwRSCj+X3
         gmbw2cx7uYRpPYIrNarPqRJqT0+wVngf2/uqfyqS/SObgHpY7fRpeLljKmT34ZLIxwXr
         3zCXzioCg1toTVQ7AtT330GsrFVQLHIEUieatAaG7jkZnc9IF89JXGxwckQyVwaJBlAk
         ntAVUbKdRHZBiIfaOSHjD2A4XCni3UKZ4CmM5852hkGBFCCSNr9stoc/ZoAr5HHaNR46
         mJFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778354679; x=1778959479; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o97G15H2Zm3VOOA4oQ2NBHEWHBaj/E+OExMb48INqqY=;
        b=mmwDrLuMMX4BfPpiLl5J6PjQImcNfZMXiM1GRmvn2VCjx7JLD7PeY//86uUBs/oQ8x
         w7VL1p07fwvoVvK3x9wSucfa36v8T6Y0bxeo8cgcMH6f97VsqWy9cDxMMkvTPskfDJ1Q
         nzeZmln6qTnDre0wXD4ykfg9yJ38Ax4wPQRG2M9VaUMMC/inLjJUasF5i52M+1dU+25M
         K+0d+OMrShTE/sMNCcv4JqNRZNoSXVcK75f3urBcxmIGIm4y9eDOwQtvJKfWpSvqbNDl
         IP6DHr2By1rKdkhDikpSqWzq42jnmu5OdZZO+STVyHQyjb1hq2FcwroO6nypNnTLpPxa
         P+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778354679; x=1778959479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o97G15H2Zm3VOOA4oQ2NBHEWHBaj/E+OExMb48INqqY=;
        b=MeJYArzcVg67A5JOpuUvmew5U7Y3BsD2a/yuQmV2YDxzCOCsoN5ag4dIJwv2YVlQJq
         Dk/dZfETUeTIgONCzjgDN+T1wIxQPcz/8z7oDJJyxQuYFPtKPTbLgc8VcPu1AJOXxert
         57hq8f3/TsgGqz1qXV+OmTURlm1TKclTpM5GZXzEQN3oda19T7lbxFtM0JokZzI9c3Le
         /TDe7LAOsf3zOyuweRhxPl0MvWY45HXreqAyt6BcrB+BfL7us2rj5sQJy/VwlJZfMT88
         lH1pp120/KsDTh85J5xaNxtfIswHg0Nbzr8gj+J+kK0tPl4OVBqb4Yq7g5EM7Rg3LnRg
         k06g==
X-Gm-Message-State: AOJu0YzJsj+weWBRMlSYDc8lQ+yMTUU9w1YG50HJthlSEF6YDCSHvtqO
	GFehDfTlvnBqzZL01okkgxB0gbiTunyH6MLaKC70TZ4Fo7uxZDDjXe5WrPZml8/q8iRZ4aaonMs
	v3WZQighVGNVsvKXC5UUL8ozg/OPwUUcGaQ==
X-Gm-Gg: Acq92OH9yNhkzDfQMh3020H1D1Z1WphK30v0IUCoAdQAI/r8Gg+D/0RV4Wdgn5nMqga
	2Mf9CybebtB95hSHNU/rYSbTgcSACZ0jHXTnOpd+cYDD1Gv4NLEW+ctlt3avsyLJhv1XvoQlCKf
	SGmWwkEoeR8o4VAQxVfSg6YG0ozpCA4NjVsaNwkf3Hi+eXeMiWEevw/e/9O+lw70EkDBjCfHvIk
	mN/cxg9pFjJjTB1ah17qTHB2mFN+Py67cwMlN0RX0Z0RsMEiAim3VGJYzSLwDkF0YSCP/9KTwPO
	7G2zMrZEuiTdLWI=
X-Received: by 2002:a05:6402:e08:b0:67c:1ed6:2790 with SMTP id
 4fb4d7f45d1cf-67d6489faf8mr9078222a12.20.1778354678616; Sat, 09 May 2026
 12:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260419150857.2705843-1-aurelien@aurel32.net> <20260419150857.2705843-3-aurelien@aurel32.net>
In-Reply-To: <20260419150857.2705843-3-aurelien@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 10 May 2026 00:54:21 +0530
X-Gm-Features: AVHnY4Kh-8Z3W2MjKplAz3_1wB0vpKb0TSRR4CR0NYybGzVO7lkeebeRlObDQRk
Message-ID: <CANAwSgS21243A+v_+ruLVTAZB2=SNp0pFxjMGXz1OENon13tjA@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib: utils/reset: add SpacemiT P1 PMIC support
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_122440_686479_4820457A 
X-CRM114-Status: GOOD (  26.99  )
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

Hi Aurelien,

On Sun, 19 Apr 2026 at 20:40, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> The SpacemiT P1 is a PMIC commonly found with SpacemiT CPU like K1. Add
> a reset driver for it.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
> ---
>  lib/utils/reset/Kconfig                 |   4 +
>  lib/utils/reset/fdt_reset_spacemit_p1.c | 112 ++++++++++++++++++++++++
>  lib/utils/reset/objects.mk              |   3 +
>  platform/generic/configs/defconfig      |   1 +
>  4 files changed, 120 insertions(+)
>  create mode 100644 lib/utils/reset/fdt_reset_spacemit_p1.c
>
> diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
> index 4835921f..f98926e5 100644
> --- a/lib/utils/reset/Kconfig
> +++ b/lib/utils/reset/Kconfig
> @@ -33,6 +33,10 @@ config FDT_RESET_SG2042_HWMON_MCU
>         bool "Sophgo SG2042 hwmon MCU FDT reset driver"
>         default n
>
> +config FDT_RESET_SPACEMIT_P1
> +       bool "SpacemiT P1 reset driver"
> +       default n
> +
>  config FDT_RESET_SUNXI_WDT
>         bool "Sunxi WDT FDT reset driver"
>         default n
> diff --git a/lib/utils/reset/fdt_reset_spacemit_p1.c b/lib/utils/reset/fdt_reset_spacemit_p1.c
> new file mode 100644
> index 00000000..5312e741
> --- /dev/null
> +++ b/lib/utils/reset/fdt_reset_spacemit_p1.c
> @@ -0,0 +1,112 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2026 Aurelien Jarno
> + * Authors:
> + *   Aurelien Jarno <aurelien@aurel32.net>
> + */
> +
> +#include <libfdt.h>
> +#include <platform_override.h>
> +#include <sbi/sbi_bitops.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_system.h>
> +#include <sbi_utils/fdt/fdt_driver.h>
> +#include <sbi_utils/i2c/fdt_i2c.h>
> +
> +/* SpacemiT P1 Power Control Register 2 */
> +#define PWR_CTRL2              0x7e
> +#define PWR_CTRL2_SHUTDOWN     BIT(2)  /* Shutdown request */
> +#define PWR_CTRL2_RST          BIT(1)  /* Reset request */
> +
> +static struct i2c_adapter *p1_adapter = NULL;
> +static uint32_t p1_reg = 0;
> +
> +static int p1_system_reset_check(uint32_t type, uint32_t reason)
> +{
> +       switch (type) {
> +       case SBI_SRST_RESET_TYPE_SHUTDOWN:
> +               return 1;
> +       case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> +       case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> +               return 255;
> +       }
> +
> +       return 0;
> +}
> +
> +static void p1_ops(uint32_t type)
> +{
> +       uint8_t byte;
> +       int rc;
> +
> +       rc = i2c_adapter_reg_read(p1_adapter, p1_reg, PWR_CTRL2, &byte);
> +       if (rc) {
> +               sbi_printf("%s: cannot read P1 Power Control Register 2\n", __func__);
> +               return;
> +       }
> +
> +       if (type == SBI_SRST_RESET_TYPE_SHUTDOWN)
> +               byte |= PWR_CTRL2_SHUTDOWN;
> +       else
> +               byte |= PWR_CTRL2_RST;
> +
> +       rc = i2c_adapter_reg_write(p1_adapter, p1_reg, PWR_CTRL2, byte);
> +       if (rc)
> +               sbi_printf("%s: cannot write P1 Power Control Register 2\n", __func__);
> +}
> +
> +static void p1_system_reset(uint32_t type, uint32_t reason)
> +{
> +       switch (type) {
> +       case SBI_SRST_RESET_TYPE_SHUTDOWN:
> +       case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> +       case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> +               p1_ops(type);
> +               break;
> +       }
> +}
> +
> +static struct sbi_system_reset_device p1_reset = {
> +       .name = "spacemit-p1-reset",
> +       .system_reset_check = p1_system_reset_check,
> +       .system_reset = p1_system_reset
> +};
> +
> +static int p1_reset_init(const void *fdt, int nodeoff,
> +                        const struct fdt_match *match)
> +{
> +       int rc, i2c_bus;
> +       uint64_t addr;
> +
> +       /* we are spacemit,p1 node */
> +       rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
> +       if (rc)
> +               return rc;
> +
> +       p1_reg = addr;
> +
> +       /* find i2c bus parent node */
> +       i2c_bus = fdt_parent_offset(fdt, nodeoff);
> +       if (i2c_bus < 0)
> +               return i2c_bus;
> +
> +       /* i2c adapter get */
> +       rc = fdt_i2c_adapter_get(fdt, i2c_bus, &p1_adapter);
> +       if (rc)
> +               return rc;
> +
> +       sbi_system_reset_add_device(&p1_reset);
> +
> +       return 0;
> +}
> +
> +static const struct fdt_match p1_reset_match[] = {
> +       { .compatible = "spacemit,p1", .data = (void *)true },
> +       { },
> +};
> +
> +const struct fdt_driver fdt_reset_spacemit_p1 = {
> +       .match_table = p1_reset_match,
> +       .init = p1_reset_init,
> +};
> diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
> index ac38b49d..3c681c27 100644
> --- a/lib/utils/reset/objects.mk
> +++ b/lib/utils/reset/objects.mk
> @@ -20,6 +20,9 @@ libsbiutils-objs-$(CONFIG_FDT_RESET_HTIF) += reset/fdt_reset_htif.o
>  carray-fdt_early_drivers-$(CONFIG_FDT_RESET_SG2042_HWMON_MCU) += fdt_reset_sg2042_mcu
>  libsbiutils-objs-$(CONFIG_FDT_RESET_SG2042_HWMON_MCU) += reset/fdt_reset_sg2042_hwmon_mcu.o
>
> +carray-fdt_early_drivers-$(CONFIG_FDT_RESET_SPACEMIT_P1) += fdt_reset_spacemit_p1
> +libsbiutils-objs-$(CONFIG_FDT_RESET_SPACEMIT_P1) += reset/fdt_reset_spacemit_p1.o
> +
>  carray-fdt_early_drivers-$(CONFIG_FDT_RESET_SUNXI_WDT) += fdt_reset_sunxi_wdt
>  libsbiutils-objs-$(CONFIG_FDT_RESET_SUNXI_WDT) += reset/fdt_reset_sunxi_wdt.o
>
> diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
> index a9cb0f06..ae278856 100644
> --- a/platform/generic/configs/defconfig
> +++ b/platform/generic/configs/defconfig
> @@ -51,6 +51,7 @@ CONFIG_FDT_RESET_GPIO=y
>  CONFIG_FDT_RESET_HTIF=y
>  CONFIG_FDT_RESET_RPMI=y
>  CONFIG_FDT_RESET_SG2042_HWMON_MCU=y
> +CONFIG_FDT_RESET_SPACEMIT_P1=y
>  CONFIG_FDT_RESET_SUNXI_WDT=y
>  CONFIG_FDT_RESET_SYSCON=y
>  CONFIG_FDT_SERIAL=y
> --
> 2.53.0
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
