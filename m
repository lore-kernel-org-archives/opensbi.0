From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Wed, 10 Nov 2021 08:43:45 +0100
Subject: [PATCH v3 0/6] I2C framework, reboot Unmatched via PMIC
In-Reply-To: <20211109124128.19666-1-nikita.shubin@maquefel.me>
References: <20211109124128.19666-1-nikita.shubin@maquefel.me>
Message-ID: <CA+zEjCvaZHcJLRNzFNz138wSEvrLO6+RXWOJmhzuBFqHXJGvyw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 9, 2021 at 1:41 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> This series introduce rebooting via i2c da9063 PMIC, currently on
> SiFive Unmatched board.
>
> "gpio-poweroff", "gpio-reset" remains with default priority of 128 - default priority,
> da9063 is 1 by default the least priority for shutdown and highest priority for
> reset.
>
> da9063 resides in platform/generic code and is used only for sifive_fu740, in case if
> da9063 is found in device tree.
>
> Alexandre, Heinrich and Anup, the reason of "da9063_system_reset: chip is not
> da9063 PMIC" wasn't the initialization, the peripheral clocks are initiated by ZSBL,
> the reason was incorrect timeouts in sifive_i2c_adapter_poll (100ms is really too much,
> my bad), with polling reworked everything is working smooth regardless of
> last reset type.
>
> The RTC ALARM reboot seems working, but implementing it in OpenSBI will require a
> full-scale calendar logic (for day/month correct rollover) which is undesirable, also
> we sacrifice the ability to wake up on ALARM.
>
> I am currently experimentings with TICK ALARM approach which should behave just like
> the ALARM one, but i get wierd results with board being powered off and then preventing
> the onKEY power it back again (turns off shortly after key pressed),
> until cable plugged/unplugged (the BATTERY is missing).
>
> It looks like OTP settings are messing with logic, a comment from SiFive is really
> needed.
>
> So we should currently stick to approuch proposed by Alexandre it hasn't failed
> me so far.

I have tested this on u-boot and linux (with the SRST patchset) and
this seems to work reliably.

Nice you came up with this revision for the openSBI release, well done ;)

Thanks,

Alex

>
> v2->v3:
> - new "lib: utils/reset: separate driver init func" patch
> - dropped separate DT bindings for da9063
> - dropped priority bindings
> - moved fdt_reset_da9063 to generic platform code
> - fdt_reset_da9063 is instatated by sifive_fu740 final init
>
> Alexandre Ghiti:
> - removed fdt_i2c_adapter_driver
> - fixed sifive_i2c_setreg/sifive_i2c_getreg to use uint8_t for reg
> - dropped configure method
> - dropped unneeded register's defines
>
> Nikita Shubin (6):
>   lib: utils/reset: add priority to gpio reset
>   lib: utils/reset: separate driver init func
>   lib: utils/i2c: Add generic I2C configuration library
>   lib: utils/i2c: Add simple FDT based I2C framework
>   lib: utils/i2c: Add minimal SiFive I2C driver
>   platform: sifive_fu740: add platform reset driver
>
>  include/sbi_utils/i2c/fdt_i2c.h     |  26 +++
>  include/sbi_utils/i2c/i2c.h         |  85 +++++++++
>  include/sbi_utils/reset/fdt_reset.h |   5 +
>  lib/utils/i2c/fdt_i2c.c             |  90 ++++++++++
>  lib/utils/i2c/fdt_i2c_sifive.c      | 262 ++++++++++++++++++++++++++++
>  lib/utils/i2c/i2c.c                 |  75 ++++++++
>  lib/utils/i2c/objects.mk            |  12 ++
>  lib/utils/reset/fdt_reset.c         |  37 ++--
>  lib/utils/reset/fdt_reset_gpio.c    |  10 +-
>  platform/generic/fdt_reset_da9063.c | 186 ++++++++++++++++++++
>  platform/generic/objects.mk         |   1 +
>  platform/generic/sifive_fu740.c     |  22 +++
>  12 files changed, 793 insertions(+), 18 deletions(-)
>  create mode 100644 include/sbi_utils/i2c/fdt_i2c.h
>  create mode 100644 include/sbi_utils/i2c/i2c.h
>  create mode 100644 lib/utils/i2c/fdt_i2c.c
>  create mode 100644 lib/utils/i2c/fdt_i2c_sifive.c
>  create mode 100644 lib/utils/i2c/i2c.c
>  create mode 100644 lib/utils/i2c/objects.mk
>  create mode 100644 platform/generic/fdt_reset_da9063.c
>
> --
> 2.31.1
>

