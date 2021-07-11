From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 Jul 2021 21:30:43 +0530
Subject: [PATCH v3 0/5] GPIO reset support
In-Reply-To: <CAJivOr5S5qiZnEM9TDxKoTq3p6FMt7QChmHfsDNWchVmPa1sgA@mail.gmail.com>
References: <20210710055827.1535906-1-anup.patel@wdc.com>
 <CAJivOr5S5qiZnEM9TDxKoTq3p6FMt7QChmHfsDNWchVmPa1sgA@mail.gmail.com>
Message-ID: <CAAhSdy1PsHqKbzLPcKVXS_8y8T8dj3ezyuONtK1K_VZjmJqLmg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 12, 2021 at 7:46 AM Green Wan <green.wan@sifive.com> wrote:
>
> will give it a try and get back.

Thanks. If possible please implement set() callback in
fdt_gpio_sifive.c. I missed
adding set() callback because it worked fine without it on QEMU sifive_u machine
but on real HW we might need set() callback.

Regards,
Anup

>
> On Sat, Jul 10, 2021 at 1:58 PM Anup Patel <anup.patel@wdc.com> wrote:
>>
>> This series adds generic GPIO reset (poweroff/restart) support which is
>> required by SiFive platforms.
>>
>> These patches can be found in gpio_reset_v3 branch at:
>> https://github.com/avpatel/opensbi.git
>>
>> Changes since v3:
>>  - Simplified GPIO reset driver in PATCH5
>>  - Dropped PATCH6
>>
>> Changes since v2:
>>  - Re-designed the GPIO framework to probe GPIO drivers on demand
>>    and avoid touching generic OpenSBI library.
>>
>> Anup Patel (3):
>>   lib: utils/fdt: Add fdt_parse_phandle_with_args() API
>>   lib: utils/gpio: Add generic GPIO configuration library
>>   lib: utils/gpio: Add simple FDT based GPIO framework
>>
>> Green Wan (2):
>>   lib: utils/gpio: Add minimal SiFive GPIO driver
>>   lib: utils/reset: Add generic GPIO reset driver
>>
>>  include/sbi_utils/fdt/fdt_helper.h |  11 +++
>>  include/sbi_utils/gpio/fdt_gpio.h  |  34 +++++++
>>  include/sbi_utils/gpio/gpio.h      |  99 ++++++++++++++++++++
>>  lib/utils/fdt/fdt_helper.c         |  47 ++++++++++
>>  lib/utils/gpio/fdt_gpio.c          | 135 +++++++++++++++++++++++++++
>>  lib/utils/gpio/fdt_gpio_sifive.c   |  90 ++++++++++++++++++
>>  lib/utils/gpio/gpio.c              | 116 ++++++++++++++++++++++++
>>  lib/utils/gpio/objects.mk          |  12 +++
>>  lib/utils/reset/fdt_reset.c        |   2 +
>>  lib/utils/reset/fdt_reset_gpio.c   | 141 +++++++++++++++++++++++++++++
>>  lib/utils/reset/objects.mk         |   1 +
>>  11 files changed, 688 insertions(+)
>>  create mode 100644 include/sbi_utils/gpio/fdt_gpio.h
>>  create mode 100644 include/sbi_utils/gpio/gpio.h
>>  create mode 100644 lib/utils/gpio/fdt_gpio.c
>>  create mode 100644 lib/utils/gpio/fdt_gpio_sifive.c
>>  create mode 100644 lib/utils/gpio/gpio.c
>>  create mode 100644 lib/utils/gpio/objects.mk
>>  create mode 100644 lib/utils/reset/fdt_reset_gpio.c
>>
>> --
>> 2.25.1
>>

