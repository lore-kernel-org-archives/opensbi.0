From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Wed, 3 Nov 2021 10:59:40 +0300
Subject: [PATCH v2 5/5] lib: utils/reset: Add generic da9063 reset driver
In-Reply-To: <9953e984-dffa-400a-259f-b82a19d06a6f@canonical.com>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
 <20211015131925.22585-6-nikita.shubin@maquefel.me>
 <24ca9d4a-02c0-0d03-58da-3510162df2be@canonical.com>
 <9953e984-dffa-400a-259f-b82a19d06a6f@canonical.com>
Message-ID: <20211103105940.4c20e7bc@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello All!

On Tue, 26 Oct 2021 11:40:13 +0200
Heinrich Schuchardt <heinrich.schuchardt@canonical.com> wrote:

> On 10/26/21 10:04, Heinrich Schuchardt wrote:
> > On 10/15/21 15:19, Nikita Shubin wrote:  
> >> From: Nikita Shubin <n.shubin@yadro.com>
> >>
> >> da9063 PMIC can be used to reset/shutdown the
> >> Sifive Unmatched board.
> >>
> >> shutdown is done simply by writing SHUTDOWN bit to
> >> DA9063_REG_CONTROL_F register.
> >>
> >> reset via setting WAKEUP bit in DA9063_REG_CONTROL_F
> >> register followed by masking POWER and POWER1 domains
> >> and setting STANDBY bit in DA9063_REG_CONTROL_A,
> >> originally discovered by Alexandre Ghiti on linux-riscv
> >> maillists.
> >>
> >> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>  
> 
> Alexandre and I had the same finding for the driver:
> 
> Reset works fine after a hard reset (via the reset button) when
> coming from Linux.
> 
> After a poweroff reset in U-Boot does not work.
> 
> Our expectation is that OpenSBI ensures that the SBI system reset 
> extension works upon entry into the next firmware stage without 
> requiring any further initialization by that software.
> 
> When a reset is requested you should make not presumption about the 
> state of the system. Simply fully initialize the da9063 state to 
> guarantee a successful reset.

Heinrich and Alexandre, i have done a small investigation:

The RTC works fine on Unmatched, just had a small issue with PLIC driver
firing IRQ only once, here is a separate patch from Guo Ren:

https://patchwork.kernel.org/project/linux-riscv/patch/20211101131736.3800114-1-guoren at kernel.org/

And a small patch to enable da9063 as a wakeup source:

https://github.com/YADRO-KNS/linux/commit/37c2a5b2031a42af99dd7125f8c93ab71236d3fa

Indeed after power-cycle with RESET button or POWER button, I2C is
unavailable (not initialised by U-Boot):

First boot reset after powercycle with powerdown/reset button:
=> reset
resetting ...
da9063_system_reset: chip is not da9063 PMIC

After rebooting with Linux reboot:
=> reset
resetting ...

All okay and that's means that it's not a full reset, I2C was
initialised by linux, and not resetted.

However if we arm the clock and go shutdown:

sh -c "echo `date '+%s' -d '+ 1 minutes'` >
/sys/class/rtc/rtc0/wakealarm" shutdown
shutdown

We get:
=> reset
resetting ...
da9063_system_reset: chip is not da9063 PMIC

So "reset" with RTC is indeed a full reset...

All above also means that "sacrificing" RTC means sacrificing user
setted wakeup ALARM's.

May be it's worth splitting reset into WARM_REBOOT, COLD_REBOOT with
WARM reboot is going through method proposed by Alexandre and COLD
reboot via RTC, and explicitly specify that COLD reboot WILL overwrite
ALARM setting ?

What do you think about this ?

> 
> Best regards
> 
> Heinrich


