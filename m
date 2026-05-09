Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801CBCD3447
	for <opensbi@archiver.kernel.org>; Sat,  9 May 2026 19:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1tCgrLrDWBY28VSYNPDWXKZNq6SNl0HO/J2H0A/04E=; b=HhlUMifozH5+cZ
	jTRir4qT5HdQFypeiAHmnaFdQ2Si0YIxukcHhzDArMT0tBJHWmLhXImPphFNJXNynXU9LOnbxOjpi
	TEh815zIkC7rsKkBGzZWCK5aLAw/so0QwYRQ3LVJR9fp3kVdXoYbjKZ7p2y8njI+BxGFBZ9HMCkKY
	AhFJ2btTJVboKP47jIck4fPpuWMynBdeWptgHGlyBOhgbgSbH22siTHd/JWU8ZB+VE+r/LEWAcSNY
	97mi7HWStcXRUW5+HCSkeH65J20JI2a3YqWZ3WKJTC6G1McJuKir9cIIci8TiXb2m+xWoX5tFa2wd
	r423hF+53mk/2GCpSjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLnHh-00000009Wk9-2xF6;
	Sat, 09 May 2026 19:24:21 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLnHf-00000009WjN-0YN9
	for opensbi@lists.infradead.org;
	Sat, 09 May 2026 19:24:20 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso5964923a12.1
        for <opensbi@lists.infradead.org>; Sat, 09 May 2026 12:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778354657; cv=none;
        d=google.com; s=arc-20240605;
        b=iqkDloQFWxj056G4czdUFPNoYhyKPeb8perKHQxNzNRtsH25CF5zTXnI5tOdwYj59r
         EDe3NXAzKkOrizCjC6ixX9ClRfUHxvQlG2PaWTcN2BR39i0XibnMoMhrUevyFguScA2t
         nQCAXT7vSBWPvRdGT+Cbwk4a27zABeeC1eG5iB0vYcQ/TYUSWcgZGU+MS2XaA1RbRXOh
         18XwFrQV5inLQVdDUq6ixEqsOm4YClIYxQvlUsgNMEHv7mfziFw6JH8O9b2qNGLXuU1+
         wx2faeG7qCSAx0fBi/q1c8vvlFYUHUcDLKjCkAziHeNEGzIoaZSmYqh7MMcoTITnJMXg
         ccrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QSO39wZblHc2MqV7f4dqmszPYEv/0ohHrHAUsXpDpeI=;
        fh=ShLZuGA5Ga9ZSwTp3CGA04qdm0rmXd4x3VKZmN6jqbE=;
        b=c1C4myEE3wxRTKDx/p9VGDDSLUxLKebYL9i3VzltU0BEwQTaZ2ITBgIs7PC6iI+qpt
         baR3VrnsFZB/9+CGk4p1nj5AUMFoobT8s9yvkmJDZ1jY4XVqhhPTpvvDqgHvwXEZwSoo
         0xpo0TDkZk7KIrsCiHBlP1nWmBp/uZt0lqn3VQMgV57eMuNcXIFiPkQV+C1KraKLe4P4
         q+L/VHADdRhgHb3kFaFN0fFaYn8c7ZKhp+MxS4lssN8xN+u4M/qvHKyqOUCb1BI63kck
         Juhkfivgi+v0WVlj33+CuoOcwTWI17bzrxI47g0/1N5mC5Ml0PFewk+3ra9C93yusbSm
         TRdw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778354657; x=1778959457; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QSO39wZblHc2MqV7f4dqmszPYEv/0ohHrHAUsXpDpeI=;
        b=OujVWz/LoQa0SDD1nUytWDCJ82A5566gjTBQVcnL8Y9m0xOicngOof0rQY/1O0+rOB
         in4oRf5hnd50TGODgi+bx8Ti+KHVXSmAvAEkelcfqp7pVH2elIBo6nrlN6sOKW3ukFXq
         RSnR3Kqp73mSpFrcqbHrWgQ+Kg0gWvwsX6JFH2/w5mKigSpVYzT/0P6XYFAAZkbxr00R
         N4G+sL/igtG66N6T+C4x1NMmOhZNNxsz60wn6TwyzC+jGdM17AXQ8ldmcwpjcyzYfQ2C
         R1x67RZ/mgwN2BQUyUZUSkB1qvlDYw1B2L5H9ROf6y7R3OloHXdBSgzsCFFa3bFPOIhi
         deIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778354657; x=1778959457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSO39wZblHc2MqV7f4dqmszPYEv/0ohHrHAUsXpDpeI=;
        b=sD9n4B1gKeGAWKjWnZMH9Q18EzqwKKrBY5LkutaC92CVGabHld7MnNb4gRKl0wuXXw
         U5gjbpKXrbo62EfgdZ3LxF/9Q09wc8bjhoBZwgFnqzY4vN/z1VIpHAKtR1FmiSYhLX38
         EeIvrjZ7JvZQibRow/PeUJgFS2Iu5f/JyMNVYcqBaW9zJ9qYtjipjRIYNlsjz+kxJWEZ
         kGpor52Yjqr+pffAFH7WlrcXDNOZJr0JIIcDg3lcoHE1M72sHzTJe42i2MAFXBntglx7
         QWVyknNoC7zTq+A30BabZx0qlKJ4+QX2plXpeOvN+W2QGSeKxEWMCpkdbn9puX/setNB
         9faw==
X-Gm-Message-State: AOJu0YyGPAb5a+eb7FCr47luOvGZApxgFasminggjx/f3yruozdHeY3d
	gZA3ZHDIX+k4NQqXHehKxJwk9N8olY6OyGbD9piFkigomtEikHfM1b9NtKqmeADuzBJ1Vv++s7O
	QpxWqZK3KKZOebRGQBPRiMphGTLUW4RJAIA==
X-Gm-Gg: Acq92OFoyjxQp913BORTBWs0a25rUoEyE1HlcDUfrz4WknMPqtDQjeHQS5rKDVry6Im
	S+jUw7mvFzNN8hFpI/O2mHrm88D01NBMK2lQhqvPIP9USGfzW635EezyHJgosoOhP7UeXRzCzv5
	9KUYU2ZehaIyvmD6ydMSUBcm0YSQ390qTaMAO4+Zbw5MYzhUVjLY9uR+rgM3Mf2xR+4Kwmq6vQd
	7xE8sAsNw7vPPTpsRy8Tb4VJuyz7TvXtGD40J9r7B47Y7NbIPu6B5Uohhh2+gDL8lAhtP2Rlel6
	xzbh
X-Received: by 2002:a05:6402:529b:b0:662:ac7e:aac9 with SMTP id
 4fb4d7f45d1cf-67f716df31dmr1386735a12.20.1778354657035; Sat, 09 May 2026
 12:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260419150857.2705843-1-aurelien@aurel32.net> <20260419150857.2705843-2-aurelien@aurel32.net>
In-Reply-To: <20260419150857.2705843-2-aurelien@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 10 May 2026 00:53:59 +0530
X-Gm-Features: AVHnY4Kr45BTEeZrXRGwB55yFg7HYVU2AQ0sWhQmnMewyKcpxoLytRmU0SQdHhA
Message-ID: <CANAwSgS7=ooyk_9MKatO7Oz3mz3=4CObYB6B70BgNZF7S462-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib: utils/i2c: add minimal SpacemiT I2C driver
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_122419_227676_2AFE8A01 
X-CRM114-Status: GOOD (  32.74  )
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
> Add a simple SpacemiT I2C driver for basic byte transfers over the I2C
> bus, prioritizing simplicity over performance. The driver operates in
> PIO mode and does not use interrupts, FIFO, or DMA.
>
> The controller is reset at the start of each transaction to ensure a
> known initial state, regardless of prior configuration by the kernel.
> This also avoids the need for additional error recovery code.
>
> This will be used for communication with onboard PMIC to reset and
> power-off the board.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
> ---
>  lib/utils/i2c/Kconfig              |   4 +
>  lib/utils/i2c/fdt_i2c_spacemit.c   | 220 +++++++++++++++++++++++++++++
>  lib/utils/i2c/objects.mk           |   3 +
>  platform/generic/configs/defconfig |   1 +
>  4 files changed, 228 insertions(+)
>  create mode 100644 lib/utils/i2c/fdt_i2c_spacemit.c
>
> diff --git a/lib/utils/i2c/Kconfig b/lib/utils/i2c/Kconfig
> index 7fa32fcf..bdaaff62 100644
> --- a/lib/utils/i2c/Kconfig
> +++ b/lib/utils/i2c/Kconfig
> @@ -14,6 +14,10 @@ config FDT_I2C_SIFIVE
>         bool "SiFive I2C FDT driver"
>         default n
>
> +config FDT_I2C_SPACEMIT
> +       bool "SpacemiT I2C FDT driver"
> +       default n
> +
>  config FDT_I2C_DW
>         bool "Synopsys Designware I2C FDT driver"
>         select I2C_DW
> diff --git a/lib/utils/i2c/fdt_i2c_spacemit.c b/lib/utils/i2c/fdt_i2c_spacemit.c
> new file mode 100644
> index 00000000..9009b6b6
> --- /dev/null
> +++ b/lib/utils/i2c/fdt_i2c_spacemit.c
> @@ -0,0 +1,220 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2026 Aurelien Jarno
> + *
> + * Authors:
> + *   Aurelien Jarno <aurelien@aurel32.net>
> + */
> +
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_heap.h>
> +#include <sbi/sbi_timer.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/i2c/fdt_i2c.h>
> +
> +/* Controller registers */
> +#define ICR_OFFSET     0x00            /* I2C control register */
> +#define IDBR_OFFSET    0x0c            /* I2C data buffer register */
> +
> +/* Control register bits */
> +#define ICR_START      BIT(0)          /* start */
> +#define ICR_STOP       BIT(1)          /* stop */
> +#define ICR_ACKNAK     BIT(2)          /* ACK(0) or NAK(1) */
> +#define ICR_TB         BIT(3)          /* transfer byte */
> +#define ICR_UR         BIT(10)         /* unit reset */
> +#define ICR_SCLE       BIT(13)         /* SCL enable  */
> +#define ICR_IUE                BIT(14)         /* unit enable */
> +
> +/* Timing */
> +#define I2C_RESET_US   10
> +#define I2C_TIMEOUT_US 1000
> +
> +struct spacemit_i2c_adapter {
> +       unsigned long base;
> +       struct i2c_adapter adapter;
> +};
> +
> +static inline void spacemit_i2c_set_reg(struct spacemit_i2c_adapter *adap,
> +                                       uint8_t reg, uint32_t val)
> +{
> +       writel(val, (void *)adap->base + reg);
> +}
> +
> +static inline uint32_t spacemit_i2c_get_reg(struct spacemit_i2c_adapter *adap,
> +                                           uint32_t reg)
> +{
> +       return readl((void *)adap->base + reg);
> +}
> +
> +static void spacemit_i2c_reset(struct spacemit_i2c_adapter *adap)
> +{
> +       /* disable unit */
> +       spacemit_i2c_set_reg(adap, ICR_OFFSET, 0);
> +       sbi_timer_udelay(I2C_RESET_US);
> +
> +       /* reset unit */
> +       spacemit_i2c_set_reg(adap, ICR_OFFSET, ICR_UR);
> +       sbi_timer_udelay(I2C_RESET_US);
> +
> +       /* clear reset and enable unit and SCL */
> +       spacemit_i2c_set_reg(adap, ICR_OFFSET, ICR_IUE | ICR_SCLE);
> +}
> +
> +static int spacemit_i2c_wait_xfer_done(struct spacemit_i2c_adapter *adap)
> +{
> +       for (int i = 0; i < I2C_TIMEOUT_US; i++) {
> +               uint32_t val = spacemit_i2c_get_reg(adap, ICR_OFFSET);
> +
> +               if (!(val & ICR_TB))
> +                       return 0;
> +
> +               sbi_timer_udelay(1);
> +       };
> +
> +       return SBI_ETIMEDOUT;
> +}
> +
> +static void spacemit_i2c_start_xfer(struct spacemit_i2c_adapter *adap,
> +                                   uint32_t ctrl)
> +{
> +       const uint32_t ctrl_mask = ICR_START | ICR_STOP | ICR_ACKNAK;
> +       uint32_t val;
> +
> +       val = spacemit_i2c_get_reg(adap, ICR_OFFSET);
> +       val &= ~ctrl_mask;
> +       val |= (ctrl & ctrl_mask);
> +       val |= ICR_TB;
> +
> +       spacemit_i2c_set_reg(adap, ICR_OFFSET, val);
> +}
> +
> +static int spacemit_i2c_xfer_write(struct spacemit_i2c_adapter *adap,
> +                                  uint8_t byte, uint32_t ctrl)
> +{
> +       spacemit_i2c_set_reg(adap, IDBR_OFFSET, byte);
> +       spacemit_i2c_start_xfer(adap, ctrl);
> +
> +       return spacemit_i2c_wait_xfer_done(adap);
> +}
> +
> +static int spacemit_i2c_xfer_read(struct spacemit_i2c_adapter *adap,
> +                                 uint8_t *byte, uint32_t ctrl)
> +{
> +       int rc;
> +
> +       spacemit_i2c_start_xfer(adap, ctrl);
> +
> +       rc = spacemit_i2c_wait_xfer_done(adap);
> +       if (rc)
> +               return rc;
> +
> +       *byte = spacemit_i2c_get_reg(adap, IDBR_OFFSET);
> +       return 0;
> +}
> +
> +static int spacemit_i2c_adapter_write(struct i2c_adapter *ia, uint8_t addr,
> +                                     uint8_t reg, uint8_t *buffer, int len)
> +{
> +       struct spacemit_i2c_adapter *adap =
> +               container_of(ia, struct spacemit_i2c_adapter, adapter);
> +       int rc;
> +
> +       /* reset controller to a known state */
> +       spacemit_i2c_reset(adap);
> +
> +       /* send device address (in write mode) */
> +       rc = spacemit_i2c_xfer_write(adap, addr << 1, ICR_START);
> +       if (rc)
> +               return rc;
> +
> +       /* send register + data bytes */
> +       for (int i = 0; i < len + 1; i++) {
> +               uint32_t ctrl = (i == len) ? ICR_STOP : 0;
> +               uint8_t byte = (i == 0) ? reg : buffer[i - 1];
> +
> +               rc = spacemit_i2c_xfer_write(adap, byte, ctrl);
> +               if (rc)
> +                       return rc;
> +       }
> +
> +       return 0;
> +}
> +
> +static int spacemit_i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr,
> +                                    uint8_t reg, uint8_t *buffer, int len)
> +{
> +       struct spacemit_i2c_adapter *adap =
> +               container_of(ia, struct spacemit_i2c_adapter, adapter);
> +       int rc;
> +
> +       /* reset controller to a known state */
> +       spacemit_i2c_reset(adap);
> +
> +       /* send device address (in write mode) */
> +       rc = spacemit_i2c_xfer_write(adap, addr << 1, ICR_START);
> +       if (rc)
> +               return rc;
> +
> +       /* send register */
> +       rc = spacemit_i2c_xfer_write(adap, reg, 0);
> +       if (rc)
> +               return rc;
> +
> +       /* repeated start and send device address (in read mode) */
> +       rc = spacemit_i2c_xfer_write(adap, (addr << 1) | 1, ICR_START);
> +       if (rc)
> +               return rc;
> +
> +       /* read data bytes */
> +       for (int i = 0; i < len; i++) {
> +               uint32_t ctrl = (i == len - 1) ? (ICR_ACKNAK | ICR_STOP) : 0;
> +
> +               rc = spacemit_i2c_xfer_read(adap, &buffer[i], ctrl);
> +               if (rc)
> +                       return rc;
> +       }
> +
> +       return 0;
> +}
> +
> +static int spacemit_i2c_init(const void *fdt, int nodeoff,
> +                            const struct fdt_match *match)
> +{
> +       struct spacemit_i2c_adapter *adapter;
> +       uint64_t base;
> +       int rc;
> +
> +       adapter = sbi_zalloc(sizeof(*adapter));
> +       if (!adapter)
> +               return SBI_ENOMEM;
> +
> +       rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &base, NULL);
> +       if (rc) {
> +               sbi_free(adapter);
> +               return rc;
> +       }
> +
> +       adapter->base = base;
> +       adapter->adapter.id = nodeoff;
> +       adapter->adapter.write = spacemit_i2c_adapter_write;
> +       adapter->adapter.read = spacemit_i2c_adapter_read;
> +       rc = i2c_adapter_add(&adapter->adapter);
> +       if (rc) {
> +               sbi_free(adapter);
> +               return rc;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct fdt_match spacemit_i2c_match[] = {
> +       { .compatible = "spacemit,k1-i2c" },
> +       { },
> +};
> +
> +const struct fdt_driver fdt_i2c_adapter_spacemit = {
> +       .match_table = spacemit_i2c_match,
> +       .init = spacemit_i2c_init,
> +};
> diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
> index d34d6648..91ac17ec 100644
> --- a/lib/utils/i2c/objects.mk
> +++ b/lib/utils/i2c/objects.mk
> @@ -15,6 +15,9 @@ libsbiutils-objs-$(CONFIG_FDT_I2C) += i2c/fdt_i2c_adapter_drivers.carray.o
>  carray-fdt_i2c_adapter_drivers-$(CONFIG_FDT_I2C_SIFIVE) += fdt_i2c_adapter_sifive
>  libsbiutils-objs-$(CONFIG_FDT_I2C_SIFIVE) += i2c/fdt_i2c_sifive.o
>
> +carray-fdt_i2c_adapter_drivers-$(CONFIG_FDT_I2C_SPACEMIT) += fdt_i2c_adapter_spacemit
> +libsbiutils-objs-$(CONFIG_FDT_I2C_SPACEMIT) += i2c/fdt_i2c_spacemit.o
> +
>  carray-fdt_i2c_adapter_drivers-$(CONFIG_FDT_I2C_DW) += fdt_i2c_adapter_dw
>  libsbiutils-objs-$(CONFIG_FDT_I2C_DW) += i2c/fdt_i2c_dw.o
>
> diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
> index 1d3431e7..a9cb0f06 100644
> --- a/platform/generic/configs/defconfig
> +++ b/platform/generic/configs/defconfig
> @@ -31,6 +31,7 @@ CONFIG_FDT_HSM_RPMI=y
>  CONFIG_FDT_HSM_SIFIVE_TMC0=y
>  CONFIG_FDT_I2C=y
>  CONFIG_FDT_I2C_SIFIVE=y
> +CONFIG_FDT_I2C_SPACEMIT=y
>  CONFIG_FDT_I2C_DW=y
>  CONFIG_FDT_IPI=y
>  CONFIG_FDT_IPI_MSWI=y
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
