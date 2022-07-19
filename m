From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Tue, 19 Jul 2022 08:21:19 +0200
Subject: [PATCH v2 00/14] OpenSBI Kconfig Support
In-Reply-To: <CAK9=C2U7s1FKYw+FqBbZz5mTP=Gz9mRJ-CLr4m3+iqg9PWiQ8A@mail.gmail.com>
References: <20220718145611.2211638-1-apatel@ventanamicro.com>
 <20220718184807.dac3r5bvsublyj2n@kamzik>
 <CAEn-LToptF6LHHZ3nUzCe6KYXBT6FHk0uyVrNfubjC8MppSfhA@mail.gmail.com>
 <CAK9=C2UE088wC3TxUFhrRUNMYQpfzvaCZAt4AGMjBcjnvktqWw@mail.gmail.com>
 <CAK9=C2U7s1FKYw+FqBbZz5mTP=Gz9mRJ-CLr4m3+iqg9PWiQ8A@mail.gmail.com>
Message-ID: <44b673ad-6458-4d01-fc1d-5cb0a35946dc@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/19/22 06:17, Anup Patel wrote:
> On Tue, Jul 19, 2022 at 9:34 AM Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> +Heinrich
>>
>> On Tue, Jul 19, 2022 at 3:05 AM David Abdurachmanov
>> <david.abdurachmanov@gmail.com> wrote:
>>>
>>> On Mon, Jul 18, 2022 at 8:49 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>>>>
>>>> On Mon, Jul 18, 2022 at 08:25:57PM +0530, Anup Patel wrote:
>>>>> In future, we will see more drivers in OpenSBI for system reset, serial port,
>>>>> power management, etc platform specific devices. We need platform specific
>>>>> compile time configuration to allow users control the size of OpenSBI generic
>>>>> firmware binaries by only enabling desired drivers. In other words, users
>>>>> should be allowed to restrict the set of RISC-V platforms on which OpenSBI
>>>>> generic firmwares built by them can run.
>>>>>
>>>>> To address above, we add Kconfig support for OpenSBI platforms using the
>>>>> kconfig-frontends project which is a standalone kconfig parser.
>>>>>
>>>>> The kconfig-frontends is available as a package/receipe on various distros
>>>>> (such as Debian, UBuntu, OpenSUSE, etc) and Yocto project.
>>>>
>>>> Hi Anup,
>>>>
>>>> It doesn't look like Fedora provides that package. Also, is the source
>>>> for the packages of those other distros maintained? If I found the
>>>> correct source, then it's [1], which hasn't had any attention in five
>>>> years, even though there have been hundreds of commits to Linux's
>>>> scripts/kconfig. I wonder if we shouldn't consider adopting
>>>> scripts/minikconf.py from the QEMU sources and sticking to the kconfig
>>>> language subset that parser supports?
>>>
>>> After spending a bit of time googling about kconfig-frontends it seems
>>> to be a dead project.
>>
>> Yes, the kconfig-frontends project is not being developed but there are
>> forks of this project since quite a few distros and yocto have support for
>> it.

Ubuntu's package is based on 
https://salsa.debian.org/philou/kconfig-frontends which has not seen a 
code update for four years. The upstream project is obviously also dead.

>>
>> Is there a requirement that Fedora only adds packages for active projects ?
>>
>>>
>>> Would kconfiglib work? That seems to be alive. While not directly
>>> available in Fedora too it's on pip.
>>
>> I explored the kconfiglib project. It is only a library and we will endup
>> maintaining our own tools for menuconfig, defconfig, etc in the OpenSBI
>> sources.
> 
> I stand corrected. The kconfiglib project when installed using python-pip
> will install various tools menuconfig, defconfig, etc along with it which is
> very nice.

Securitywise pip is a not recommendable. There is no code review 
required before uploading to the Python package repository.

> 
> If we go with the kconfiglib project then we should expect users to install
> the kconfiglib package before building OpenSBI. Is this a reasonable
> requirement for Fedora and UBuntu ?
> 
> @Heinrich are you okay with this 

Ubuntu provides OpenSBI as a package. So it is package maintainers not 
users that are concerned. kconfig-frontends currently is in the Universe 
repository (community supported). This would have to change since 
OpenSBI is in the main repository (Canonical supported). Putting 
software based on a a dead project into main is not preferred.

Maintaining OpenSBI for a distro is easier with a single version of the 
the software instead of maintaining a package for each board. So I was 
quite happy with PLATFORM=generic ruling them all.

Kconfig is licensed under GPL. It will not be available in BSD 
distributions. Please, include BSD distros in your considerations.

Best regards

Heinrich

> 
> Regards,
> Anup
> 
>>
>> The best thing would be if we can avoid adding more tools and scripts
>> in OpenSBI for kconfig. The kconfig-frontends allows us to do that.
>>
>> If we have to add some tool/script in OpenSBI then I would prefer
>> something (like QEMU scripts/minikconf.py) which is minimalistic
>> and does not add maintenance burden.
>>
>> Regards,
>> Anup
>>
>>>
>>>>
>>>> [1] http://ymorin.is-a-geek.org/projects/kconfig-frontends
>>>>
>>>> Thanks,
>>>> drew
>>>>
>>>>>
>>>>> To try OpenSBI Kconfig support with generic platform, here are few
>>>>> example commands:
>>>>> make PLATFORM=generic             <-- builds OpenSBI using "defconfig"
>>>>> make PLATFORM=generic menuconfig  <-- launches graphical interface for changes
>>>>>
>>>>> These patches can also be found in the kconfig_v2 branch at:
>>>>> https://github.com/avpatel/opensbi.git
>>>>>
>>>>> Changes since v1:
>>>>>   - Fix SPDX license specifier in new Kconfig files
>>>>>
>>>>> Anup Patel (14):
>>>>>    Makefile: Add initial kconfig support for each platform
>>>>>    Makefile: Compile lib/utils sources separately for each platform
>>>>>    lib: utils/serial: Use kconfig for enabling/disabling drivers
>>>>>    lib: utils/reset: Use kconfig for enabling/disabling drivers
>>>>>    lib: utils/sys: Use kconfig for enabling/disabling drivers
>>>>>    lib: utils/timer: Use kconfig for enabling/disabling drivers
>>>>>    lib: utils/ipi: Use kconfig for enabling/disabling drivers
>>>>>    lib: utils/irqchip: Use kconfig for enabling/disabling drivers
>>>>>    lib: utils/i2c: Use kconfig for enabling/disabling drivers
>>>>>    lib: utils/gpio: Use kconfig for enabling/disabling drivers
>>>>>    lib: utils/fdt: Use kconfig for enabling/disabling
>>>>>    platform: generic: Use kconfig for enabling/disabling overrides
>>>>>    platform: Remove redundant config.mk from all platforms
>>>>>    docs: Update documentation for kconfig support
>>>>>
>>>>>   Kconfig                                   |  23 +++++
>>>>>   Makefile                                  | 102 ++++++++++++++++------
>>>>>   README.md                                 |  25 +++++-
>>>>>   docs/firmware/fw_dynamic.md               |   2 +-
>>>>>   docs/firmware/fw_jump.md                  |   4 +-
>>>>>   docs/firmware/fw_payload.md               |   4 +-
>>>>>   docs/library_usage.md                     |   6 +-
>>>>>   docs/platform/platform.md                 |   4 +-
>>>>>   docs/platform_guide.md                    |   9 +-
>>>>>   firmware/Kconfig                          |   1 +
>>>>>   include/sbi_utils/fdt/fdt_domain.h        |   9 ++
>>>>>   include/sbi_utils/fdt/fdt_pmu.h           |  10 +++
>>>>>   include/sbi_utils/ipi/fdt_ipi.h           |   9 ++
>>>>>   include/sbi_utils/irqchip/fdt_irqchip.h   |  10 +++
>>>>>   include/sbi_utils/irqchip/imsic.h         |  10 +++
>>>>>   include/sbi_utils/reset/fdt_reset.h       |  12 +++
>>>>>   include/sbi_utils/serial/fdt_serial.h     |   8 ++
>>>>>   include/sbi_utils/timer/fdt_timer.h       |   9 ++
>>>>>   lib/utils/Kconfig                         |  25 ++++++
>>>>>   lib/utils/fdt/Kconfig                     |  18 ++++
>>>>>   lib/utils/fdt/objects.mk                  |   8 +-
>>>>>   lib/utils/gpio/Kconfig                    |  23 +++++
>>>>>   lib/utils/gpio/objects.mk                 |  10 +--
>>>>>   lib/utils/i2c/Kconfig                     |  23 +++++
>>>>>   lib/utils/i2c/objects.mk                  |  10 +--
>>>>>   lib/utils/ipi/Kconfig                     |  23 +++++
>>>>>   lib/utils/ipi/objects.mk                  |  10 +--
>>>>>   lib/utils/irqchip/Kconfig                 |  41 +++++++++
>>>>>   lib/utils/irqchip/objects.mk              |  22 ++---
>>>>>   lib/utils/libfdt/Kconfig                  |   5 ++
>>>>>   lib/utils/libfdt/objects.mk               |   4 +-
>>>>>   lib/utils/reset/Kconfig                   |  37 ++++++++
>>>>>   lib/utils/reset/objects.mk                |  28 +++---
>>>>>   lib/utils/serial/Kconfig                  |  73 ++++++++++++++++
>>>>>   lib/utils/serial/objects.mk               |  44 +++++-----
>>>>>   lib/utils/sys/Kconfig                     |  13 +++
>>>>>   lib/utils/sys/objects.mk                  |   4 +-
>>>>>   lib/utils/timer/Kconfig                   |  23 +++++
>>>>>   lib/utils/timer/objects.mk                |  10 +--
>>>>>   platform/andes/ae350/Kconfig              |   8 ++
>>>>>   platform/andes/ae350/config.mk            |  36 --------
>>>>>   platform/andes/ae350/configs/defconfig    |   0
>>>>>   platform/andes/ae350/objects.mk           |  29 ++++++
>>>>>   platform/fpga/ariane/Kconfig              |  10 +++
>>>>>   platform/fpga/ariane/config.mk            |  36 --------
>>>>>   platform/fpga/ariane/configs/defconfig    |   0
>>>>>   platform/fpga/ariane/objects.mk           |  35 ++++++++
>>>>>   platform/fpga/openpiton/Kconfig           |  10 +++
>>>>>   platform/fpga/openpiton/config.mk         |  35 --------
>>>>>   platform/fpga/openpiton/configs/defconfig |   0
>>>>>   platform/fpga/openpiton/objects.mk        |  35 ++++++++
>>>>>   platform/generic/Kconfig                  |  26 ++++++
>>>>>   platform/generic/allwinner/objects.mk     |   4 +-
>>>>>   platform/generic/config.mk                |  40 ---------
>>>>>   platform/generic/configs/defconfig        |  29 ++++++
>>>>>   platform/generic/objects.mk               |  33 +++++++
>>>>>   platform/generic/sifive/objects.mk        |   8 +-
>>>>>   platform/kendryte/k210/Kconfig            |  10 +++
>>>>>   platform/kendryte/k210/config.mk          |  19 ----
>>>>>   platform/kendryte/k210/configs/defconfig  |   0
>>>>>   platform/kendryte/k210/objects.mk         |  12 +++
>>>>>   platform/nuclei/ux600/Kconfig             |  10 +++
>>>>>   platform/nuclei/ux600/config.mk           |  30 -------
>>>>>   platform/nuclei/ux600/configs/defconfig   |   0
>>>>>   platform/nuclei/ux600/objects.mk          |  22 +++++
>>>>>   platform/nuclei/ux600/platform.c          |   1 -
>>>>>   platform/template/Kconfig                 |   9 ++
>>>>>   platform/template/config.mk               |  77 ----------------
>>>>>   platform/template/configs/defconfig       |   0
>>>>>   platform/template/objects.mk              |  72 +++++++++++++++
>>>>>   platform/template/platform.c              |   2 +-
>>>>>   scripts/create-binary-archive.sh          |   2 +-
>>>>>   72 files changed, 948 insertions(+), 403 deletions(-)
>>>>>   create mode 100644 Kconfig
>>>>>   create mode 100644 firmware/Kconfig
>>>>>   create mode 100644 lib/utils/Kconfig
>>>>>   create mode 100644 lib/utils/fdt/Kconfig
>>>>>   create mode 100644 lib/utils/gpio/Kconfig
>>>>>   create mode 100644 lib/utils/i2c/Kconfig
>>>>>   create mode 100644 lib/utils/ipi/Kconfig
>>>>>   create mode 100644 lib/utils/irqchip/Kconfig
>>>>>   create mode 100644 lib/utils/libfdt/Kconfig
>>>>>   create mode 100644 lib/utils/reset/Kconfig
>>>>>   create mode 100644 lib/utils/serial/Kconfig
>>>>>   create mode 100644 lib/utils/sys/Kconfig
>>>>>   create mode 100644 lib/utils/timer/Kconfig
>>>>>   create mode 100644 platform/andes/ae350/Kconfig
>>>>>   delete mode 100644 platform/andes/ae350/config.mk
>>>>>   create mode 100644 platform/andes/ae350/configs/defconfig
>>>>>   create mode 100644 platform/fpga/ariane/Kconfig
>>>>>   delete mode 100644 platform/fpga/ariane/config.mk
>>>>>   create mode 100644 platform/fpga/ariane/configs/defconfig
>>>>>   create mode 100644 platform/fpga/openpiton/Kconfig
>>>>>   delete mode 100644 platform/fpga/openpiton/config.mk
>>>>>   create mode 100644 platform/fpga/openpiton/configs/defconfig
>>>>>   create mode 100644 platform/generic/Kconfig
>>>>>   delete mode 100644 platform/generic/config.mk
>>>>>   create mode 100644 platform/generic/configs/defconfig
>>>>>   create mode 100644 platform/kendryte/k210/Kconfig
>>>>>   delete mode 100644 platform/kendryte/k210/config.mk
>>>>>   create mode 100644 platform/kendryte/k210/configs/defconfig
>>>>>   create mode 100644 platform/nuclei/ux600/Kconfig
>>>>>   delete mode 100644 platform/nuclei/ux600/config.mk
>>>>>   create mode 100644 platform/nuclei/ux600/configs/defconfig
>>>>>   create mode 100644 platform/template/Kconfig
>>>>>   delete mode 100644 platform/template/config.mk
>>>>>   create mode 100644 platform/template/configs/defconfig
>>>>>
>>>>> --
>>>>> 2.34.1
>>>>>
>>>>>
>>>>> --
>>>>> opensbi mailing list
>>>>> opensbi at lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/opensbi
>>>>
>>>> --
>>>> opensbi mailing list
>>>> opensbi at lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/opensbi


