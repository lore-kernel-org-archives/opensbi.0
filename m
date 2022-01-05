From: Aurelien Jarno <aurelien@aurel32.net>
Date: Wed, 5 Jan 2022 17:51:19 +0100
Subject: [PATCH 2/2] platform: sifive_fu740: fix reset when watchdog is
 running
In-Reply-To: <CAPSAq_w6vuWSQEyQKMNOGM-wiWq=ZGUsVebmkGNbD56Z9O28Vw@mail.gmail.com>
References: <20220105072039.2609845-1-aurelien@aurel32.net>
 <20220105072039.2609845-2-aurelien@aurel32.net>
 <20220105163959.000046ce@maquefel.me>
 <CAPSAq_w6vuWSQEyQKMNOGM-wiWq=ZGUsVebmkGNbD56Z9O28Vw@mail.gmail.com>
Message-ID: <YdXMhyrEzKMiZHrn@aurel32.net>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-01-05 18:16, David Abdurachmanov wrote:
> On Wed, Jan 5, 2022 at 3:40 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> >
> > Hello Aurelien!
> >
> > Adding David from SiFive...
> >
> > On Wed,  5 Jan 2022 08:20:39 +0100
> > Aurelien Jarno <aurelien@aurel32.net> wrote:
> >
> > > When the watchdog is running the HiFive Unmatched board does not
> > > reboot properly and shuts down itself a few seconds after reboot, in
> > > the early stages of the u-boot loading. On a Linux kernel this
> > > happens when the da9063_wdt module is loaded. This does not happen if
> > > the module is unloaded before reboot or if the watchdog module is
> > > loaded with "stop_on_reboot=1".
> >
> > | A running application is typically in ACTIVE mode. The DA9063
> > | transitions to ACTIVE mode after the host processor performs at least
> > | one initial ?alive? watchdog write (or alternatively an initial
> > | assertion of the KEEP_ACT port) inside the target time window. If the
> > | WATCHDOG function is disabled by setting TWDSCALE to zero, the DA9063
> > | transitions to ACTIVE mode when all of the sequencer IDs in the POWER
> > | domain are complete.

Yes, this seems to match that. The da9063_wdt module is responsible for
doing the ?alive? watchdog writes.

> > Is this that's case mentioned ? What if we press a reset key when
> > watchdog is enabled ? Or if it was reseted by thermal sensor ?

I am not sure what happens in that case and unfortunately I do not have
a board when I can try that.

> > Can we disable watchdog on start instead of disabling it before a reset
> > ?
> 
> I would suggest doing this too. Disable watchdog on the start.

What do you mean by on the start? At the beginning of OpenSBI, as soon
as it boots?

In that case it might be necessary to do an ?alive? watchdog write just
before the reset, as we do not know when the OS did the last write, and
we have no way of knowing that. Also in that case we might want to
increase the timeout, as currently the board gets powered-off in U-Boot
SPL, before displaying the OpenSBI banner, so the execution of OpenSBI
might not have started yet.

All the above looks complex compared to disabling the watchdog before
the reset sequence. And leaving the watchdog running does not seem to
bring any advantage, as it just powers off the board. I would have
expected it resets it again.

> IIRC watchdog DA9063 can do 131 seconds (max). Alternative would be to
> reconfigure the timer for 131 seconds, kick it in OpenSBI to give the
> most possible time and reboot. Hopefully that would be enough time to
> reboot and take control of the watchdog again. I don't know if U-Boot
> has a DA9063 watchdog driver.
> 
> Disabling it is probably a better option :) System boot with watchdog
> disabled and then it can be enabled again.

u-boot has support for watchdog, but there is no support for the DA9063
driver, so it's probably a good idea to just disable it.

> > Could you please give us a link to actual report ?

Unfortunately I do not have a link to share. This was discussed on IRC.
I built a Debian kernel with the SRST [1] patch and asked people to test
it on an Unmatched board against OpenSBI 1.0 to check if it was working.
Tianon reported me quickly that it was not working, the board starts to
reboot properly with:

| [  372.508832] reboot: Restarting system
|
| U-Boot SPL 2022.01-rc4+dfsg-1 (Dec 21 2021 - 02:38:20 +0000)
| Trying to boot from MMC1

But then the board powers off ("all the lights and even the fan are off
too").

We tracked that the issue was a bad interaction with the da9063 kernel
modules and then narrowed it down to the watchdog module.

Note that it is using kernel 5.16-rc7 with the DA9063 support enabled in
both the config and the DT [2].

If you need more details, Tianon (Cc:ed) can probably provide them.


[1] https://lists.infradead.org/pipermail/linux-riscv/2021-June/006998.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.16-rc8&id=cd29cc8ad2540a4f9a0a3e174394d39e648ef941

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien at aurel32.net                 http://www.aurel32.net

