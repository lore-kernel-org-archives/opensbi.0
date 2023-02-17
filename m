From: wangliu <wangliu@iscas.ac.cn>
Date: Fri, 17 Feb 2023 17:38:49 +0800
Subject: [PATCH] lib: utils: Mark only the largest region as reserved in
 FDT
In-Reply-To: <CAMSwOgqPJPJpRdXsvj-cdStwQoSFBQFMmen_RU3_EPGRro+_PQ@mail.gmail.com>
References: <CAAhSdy3ddbpDc7Wix2EqdO-geTiiLTHRnLvvGb2BNr8dcWw1Aw@mail.gmail.com>
 <1ac79baf-bef3-9d9a-a151-9cbaf88e61ff@iscas.ac.cn>
 <CAMSwOgpcL7-0hT1tmWssoN0_HUvtqQD2oe_7PLhZ6ZtA1Y-Lkg@mail.gmail.com>
 <901927b1-7ce9-724e-90b8-4a99a9178973@iscas.ac.cn>
 <CAMSwOgqPJPJpRdXsvj-cdStwQoSFBQFMmen_RU3_EPGRro+_PQ@mail.gmail.com>
Message-ID: <412775aa-47d0-455e-5af2-b1023255cd45@iscas.ac.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

My server's gcc version is 10.2.1, it seems like too old.

$ gcc --version
gcc (Debian 10.2.1-6) 10.2.1 20210110
Copyright (C) 2020 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



? 2/17/23 17:34, Rahul Pathak ??:
> I am though surprised that for me it's not happening with gcc.
> What is the gcc version for you?
> 
> I have 12.2.1
> 
> On Fri, Feb 17, 2023 at 2:59 PM wangliu <wangliu@iscas.ac.cn> wrote:
>>
>> It works, the opensbi can build successful.
>> This is the diff:
>> $ git diff
>> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
>> index 619e4f5..1e84361 100644
>> --- a/lib/utils/fdt/fdt_fixup.c
>> +++ b/lib/utils/fdt/fdt_fixup.c
>> @@ -374,6 +374,7 @@ int fdt_reserved_memory_fixup(void *fdt)
>>                   filtered_order[i] = reg->order;
>>                   i++;
>>           next_entry:
>> +       {}
>>           }
>>
>>           for (j = 0; j < i; j++) {
>>
>>
>>
>> ? 2/17/23 17:15, Rahul Pathak ??:
>>> For me gcc does not beak, but clang does
>>>
>>> Can you try with this -
>>>
>>> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
>>> index 619e4f5cbaf7..f00f3d6c94b6 100644
>>> --- a/lib/utils/fdt/fdt_fixup.c
>>> +++ b/lib/utils/fdt/fdt_fixup.c
>>> @@ -374,6 +374,7 @@ int fdt_reserved_memory_fixup(void *fdt)
>>>     filtered_order[i] = reg->order;
>>>     i++;
>>>     next_entry:
>>> + {}
>>>     }
>>>
>>>     for (j = 0; j < i; j++) {
>>>
>>> On Fri, Feb 17, 2023 at 1:27 PM wangliu <wangliu@iscas.ac.cn> wrote:
>>>>
>>>> Hi,
>>>> I am trying to generate a fw_payload.bin, but the mainline opensbi
>>>> failed to compile.
>>>> I have retried the operation in the newly installed system environment,
>>>> please do let me know if more info are to be provided.
>>>>
>>>> This is my server information:
>>>>       $ uname -a
>>>>       Linux debian 5.10.0-19-amd64 #1 SMP Debian 5.10.149-2 (2022-10-21)
>>>> x86_64 GNU/Linux
>>>>       $ cat /etc/debian_version
>>>>       11.5
>>>>
>>>> This is my operation:
>>>>       $ make     CROSS_COMPILE=riscv64-linux-gnu-     PLATFORM=generic
>>>> FW_PAYLOAD_PATH=../u-boot/u-boot.bin
>>>>
>>>> And this is my log:
>>>>
>>>> Loaded configuration
>>>> '/home/snail/opensbi/platform/generic/configs/defconfig'
>>>> Configuration saved to
>>>> '/home/snail/opensbi/build/platform/generic/kconfig/.config'
>>>>     CPP-DEP   platform/generic/firmware/fw_payload.elf.dep
>>>>     CPP-DEP   platform/generic/firmware/fw_jump.elf.dep
>>>>     CPP-DEP   platform/generic/firmware/fw_dynamic.elf.dep
>>>>     CPP-DEP   platform/generic/firmware/payloads/test.elf.dep
>>>>     AS-DEP    platform/generic/firmware/fw_payload.dep
>>>>     AS-DEP    platform/generic/firmware/fw_jump.dep
>>>>     AS-DEP    platform/generic/firmware/fw_dynamic.dep
>>>>     AS-DEP    platform/generic/firmware/payloads/test_head.dep
>>>>     CC-DEP    platform/generic/firmware/payloads/test_main.dep
>>>>     MERGE-DEP platform/generic/firmware/payloads/test.dep
>>>>     AS-DEP    lib/sbi/sbi_expected_trap.dep
>>>>     CC-DEP    lib/sbi/sbi_unpriv.dep
>>>>     CC-DEP    lib/sbi/sbi_trap.dep
>>>>     CC-DEP    lib/sbi/sbi_tlb.dep
>>>>     ...
>>>>
>>>>     ...
>>>>
>>>>     ...
>>>>
>>>>     CC        platform/generic/lib/utils/ipi/fdt_ipi_drivers.o
>>>>     CC        platform/generic/lib/utils/ipi/fdt_ipi_mswi.o
>>>>     CC        platform/generic/lib/utils/ipi/fdt_ipi_plicsw.o
>>>>     CC        platform/generic/lib/utils/i2c/i2c.o
>>>>     CC        platform/generic/lib/utils/i2c/fdt_i2c.o
>>>>     CARRAY    platform/generic/lib/utils/i2c/fdt_i2c_adapter_drivers.c
>>>>     CC        platform/generic/lib/utils/i2c/fdt_i2c_adapter_drivers.o
>>>>     CC        platform/generic/lib/utils/i2c/fdt_i2c_sifive.o
>>>>     CC        platform/generic/lib/utils/gpio/fdt_gpio.o
>>>>     CARRAY    platform/generic/lib/utils/gpio/fdt_gpio_drivers.c
>>>>     CC        platform/generic/lib/utils/gpio/fdt_gpio_drivers.o
>>>>     CC        platform/generic/lib/utils/gpio/fdt_gpio_sifive.o
>>>>     CC        platform/generic/lib/utils/gpio/gpio.o
>>>>     CC        platform/generic/lib/utils/fdt/fdt_domain.o
>>>>     CC        platform/generic/lib/utils/fdt/fdt_pmu.o
>>>>     CC        platform/generic/lib/utils/fdt/fdt_helper.o
>>>>     CC        platform/generic/lib/utils/fdt/fdt_fixup.o
>>>> /home/snail/opensbi/lib/utils/fdt/fdt_fixup.c: In function
>>>> ?fdt_reserved_memory_fixup?:
>>>> /home/snail/opensbi/lib/utils/fdt/fdt_fixup.c:376:2: error: label at end
>>>> of compound statement
>>>>      376 |  next_entry:
>>>>          |  ^~~~~~~~~~
>>>> make: *** [Makefile:569:
>>>> /home/snail/opensbi/build/platform/generic/lib/utils/fdt/fdt_fixup.o]
>>>> Error 1
>>>>
>>>> The opensbi v1.2 version I have success to build.
>>>> I try to revert this commit code
>>>> (https://github.com/riscv-software-src/opensbi/commit/199189bd1c172aab5a9733c0ffaaa14bbebb3323),
>>>> then the code build successful.
>>>>
>>>>
>>>> --
>>>> opensbi mailing list
>>>> opensbi at lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/opensbi
>>


