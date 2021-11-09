From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Tue, 9 Nov 2021 14:46:44 +0100
Subject: [PATCH v3 0/6] I2C framework, reboot Unmatched via PMIC
In-Reply-To: <20211109124128.19666-1-nikita.shubin@maquefel.me>
References: <20211109124128.19666-1-nikita.shubin@maquefel.me>
Message-ID: <e7c6518f-7cb5-20ec-9ff8-956571f0befb@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/9/21 13:41, Nikita Shubin wrote:
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


I have tested the series on the SiFive Unmatched in conjunction with 
upstream U-Boot. The following reset drivers are successfully probed:

Platform Reboot Device    : da9063-reset
Platform Shutdown Device  : gpio-poweroff

Both resetting and poweroff via U-Boot's SBI sysreset driver are working.

Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>


