From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Sat, 25 Sep 2021 10:11:29 +0200
Subject: [PATCH 0/4] reboot SiFive Unmatched via PMIC
In-Reply-To: <CAEUhbmWUiTWuVNxEDo3mRCAh2KBfYs8Y46egsAoNenKy=wVa8w@mail.gmail.com>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <CAEUhbmWUiTWuVNxEDo3mRCAh2KBfYs8Y46egsAoNenKy=wVa8w@mail.gmail.com>
Message-ID: <05f7cf09-a0a4-0f53-6e82-5d0873cf430f@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 9/25/21 3:10 AM, Bin Meng wrote:
> On Fri, Sep 24, 2021 at 7:34 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>>
>> From: Nikita Shubin <n.shubin@yadro.com>
>>
>> This series introduce rebooting via i2c PMIC, currently on
>> SiFive Unmatched board.
>>
>> teseted via Linux with reset extension and direct ecall from
>> u-boot.
>>
>> With this it becomes possible to reboot/shutdown the board
>> if Linux or u-boot is accompanied with OpenSBI reset extension.
>>
>> "gpio-poweroff" is required to be removed from u-boot dts file, as
>> it overrides fdt_reset_da9063.
>>
>> fdt_reset_da9063 is loaded if "dlg,da9063" is present in device tree.
>>
>> Moreover it's look like we require a convenient "sleep" functionality,
>> currently i've implemented sleep via CSR_MCYCLE, assuming we don't normally
>> communicate with device while operational only on start/shutdown.
>>
>> ```
>> static inline void wait_cycles(unsigned long cycles)
>> {
>>          csr_write(CSR_MCYCLE, 0);
>>          while (cycles > csr_read_num(CSR_MCYCLE));
>> }
>> ```
>>
>> The original sequence was discovered by Alexandre Ghiti posted a patch on
>> linux-riscv mail-lists.
>>
>> https://patchwork.kernel.org/project/linux-riscv/patch/20210921053356.1705833-1-alexandre.ghiti at canonical.com/
>>
>> These magick numbers are readed as:
>> - select PAGE0
>> - set WAKE_UP bit in CONTROL_A reg
>> - mask setting POWER1, POWER domain and STANDBY, and poweroff SYSTEM domain
>>
>> Nikita Shubin (4):
>>    lib: utils/i2c: Add generic I2C configuration library
>>    lib: utils/gpio: Add simple FDT based I2C framework
>>    lib: utils/gpio: Add minimal SiFive I2C driver
>>    lib: utils/reset: Add generic da9063 reset driver
>>
> 
> It looks like we will end up having lots of reset drivers in OpenSBI
> in the future, no surprise, as this is what the spec requires, sigh.

At some point we will have to decide on a configuration system to enable 
only those drivers that are needed for the current hardware. 
Unfortunately we cannot reuse Linux Kconfig as our license is BSD-2.

Currently if a reset driver fails it simply ends up hanging in an 
endless loop.

The SiFive Unmatched will use GPIO for poweroff and I2C for reset.

We need the ability to iterate through multiple reset drivers. If 
resetting is not possible, we should return to the caller with an error 
code.

Best regards

Heinrich

> 
> Alexandre Ghiti has posted U-Boot patches to reset Unmatched via PMIC as well.
> http://patchwork.ozlabs.org/project/uboot/patch/20210924084231.3311216-5-alexandre.ghiti at canonical.com/
> 
> Regards,
> Bin
> 

