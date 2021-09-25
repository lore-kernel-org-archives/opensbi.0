From: Anup Patel <anup@brainfault.org>
Date: Sat, 25 Sep 2021 12:04:15 +0530
Subject: [PATCH 0/4] reboot SiFive Unmatched via PMIC
In-Reply-To: <CAEUhbmWD9PaLkaudLEfUy_3npwe-omYFWKsHXhxkEkzDyvDjng@mail.gmail.com>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <CAEUhbmWUiTWuVNxEDo3mRCAh2KBfYs8Y46egsAoNenKy=wVa8w@mail.gmail.com>
 <CAAhSdy1iHHvtvy+ZXo7LsK9gYAWbR_j=kS7Rsvf2dtcvJvMkug@mail.gmail.com>
 <CAEUhbmWD9PaLkaudLEfUy_3npwe-omYFWKsHXhxkEkzDyvDjng@mail.gmail.com>
Message-ID: <CAAhSdy1m7DQuR8HttCMbce0-AGpnC_Ak0dK33zYYCgn72ZtUew@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 25, 2021 at 10:16 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Sep 25, 2021 at 11:56 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Sat, Sep 25, 2021 at 6:40 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Fri, Sep 24, 2021 at 7:34 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> > > >
> > > > From: Nikita Shubin <n.shubin@yadro.com>
> > > >
> > > > This series introduce rebooting via i2c PMIC, currently on
> > > > SiFive Unmatched board.
> > > >
> > > > teseted via Linux with reset extension and direct ecall from
> > > > u-boot.
> > > >
> > > > With this it becomes possible to reboot/shutdown the board
> > > > if Linux or u-boot is accompanied with OpenSBI reset extension.
> > > >
> > > > "gpio-poweroff" is required to be removed from u-boot dts file, as
> > > > it overrides fdt_reset_da9063.
> > > >
> > > > fdt_reset_da9063 is loaded if "dlg,da9063" is present in device tree.
> > > >
> > > > Moreover it's look like we require a convenient "sleep" functionality,
> > > > currently i've implemented sleep via CSR_MCYCLE, assuming we don't normally
> > > > communicate with device while operational only on start/shutdown.
> > > >
> > > > ```
> > > > static inline void wait_cycles(unsigned long cycles)
> > > > {
> > > >         csr_write(CSR_MCYCLE, 0);
> > > >         while (cycles > csr_read_num(CSR_MCYCLE));
> > > > }
> > > > ```
> > > >
> > > > The original sequence was discovered by Alexandre Ghiti posted a patch on
> > > > linux-riscv mail-lists.
> > > >
> > > > https://patchwork.kernel.org/project/linux-riscv/patch/20210921053356.1705833-1-alexandre.ghiti at canonical.com/
> > > >
> > > > These magick numbers are readed as:
> > > > - select PAGE0
> > > > - set WAKE_UP bit in CONTROL_A reg
> > > > - mask setting POWER1, POWER domain and STANDBY, and poweroff SYSTEM domain
> > > >
> > > > Nikita Shubin (4):
> > > >   lib: utils/i2c: Add generic I2C configuration library
> > > >   lib: utils/gpio: Add simple FDT based I2C framework
> > > >   lib: utils/gpio: Add minimal SiFive I2C driver
> > > >   lib: utils/reset: Add generic da9063 reset driver
> > > >
> > >
> > > It looks like we will end up having lots of reset drivers in OpenSBI
> > > in the future, no surprise, as this is what the spec requires, sigh.
> > >
> > > Alexandre Ghiti has posted U-Boot patches to reset Unmatched via PMIC as well.
> > > http://patchwork.ozlabs.org/project/uboot/patch/20210924084231.3311216-5-alexandre.ghiti at canonical.com/
> >
> > This diversity with reset drivers is not a problem just for OpenSBI
> > but it applies to all OSes (Linux, FreeBSD, VxWorks, ....),
> > Bootloaders (U-Boot, EDK2, Coreboot, ....), and Hypervisors
> > (Xvisor, Xen, Bao, ....).
> >
> > Just imagine, each hypervisor having its own reset mechanism
> > for Guest/VM and suddenly we start having hypervisor specific
> > reset drivers in various OSes and Bootloaders.
> >
> > Even more critical issue is TEE where we can't let non-secure
> > domains directly reset the system without the secure domain
> > knowing about it.
> >
> > With SBI SRST extension the above issues are handled
> > as follows:
> > 1) The diversity in platform specific resets is restricted to
> > M-mode runtime firmware (OpenSBI)
> > 2) All hypervisors provide SBI SRST to Guest/VM as the
> > standard reset mechanism
> > 3) Reset requests from TEE non-secure domains come to
> > M-mode runtime firmware (OpenSBI) which can then
> > notify the TEE secure domain to take necessary action.
> > Also, reset request from the TEE secure domain will
> > directly reset the system.
> >
> > Point#3 above has been already implemented in OpenSBI
> > domains.
> >
> > We have been discussing SBI SRST for almost 2 years now.
> >
> > We also had extensive discussion about this at LPC 2020.
> > https://linuxplumbersconf.org/event/7/contributions/810/attachments/631/1144/RISCV_EBBR_lpc2020.pdf
> >
>
> I understand the rationale behind this. I just have a concern about
> various reset drivers being put in the OpenSBI, which will bloat its
> size (the generic firmware) very quickly.

I was thinking of upgrading sifive_test reset driver into syscon
poweroff/reboot driver.

This will give us two generic reset drivers (GPIO and Syscon) which
pick-up most details from DT.

In future, platform specs can make recommendations around
reset mechanisms which will align with GPIO or Syscon reset.
Although, platforms not complying with platform specs might
still come-up with their own reset mechanism.

>
> We've spent lots of time standlizing the ACLINT/AIA stuff as we don't
> want each hardware vendor to invent his own interrupt system. Could we
> do something similar to the system reset controller to go a step
> further?

Agree. At least ACLINT and AIA will certainly save us efforts on
the timer and interrupt controller front.

>
> I don't have a historical reason why the Arm ecosystem has not come to
> such a path regarding system reset controllers. I am sure I missed
> something. x86 does this with a hardware that conforms with the ACPI
> programming interface so there is only one reset driver.

ARM only standardized a PSCI call for reset but they did not
standardize HW device/registers for reset. I am not sure why.

>
> Regards,
> Bin

Regards,
Anup

