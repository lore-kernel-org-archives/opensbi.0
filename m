From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 24 Sep 2021 16:02:07 +0000
Subject: [PATCH 0/4] reboot SiFive Unmatched via PMIC
In-Reply-To: <BCDA27E8-DCA4-4621-8E7C-D0DD8632C710@jrtc27.com>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <BCDA27E8-DCA4-4621-8E7C-D0DD8632C710@jrtc27.com>
Message-ID: <AE4ED4C2-7921-4CF2-A813-FDF25778F855@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



?On 24/09/21, 9:24 PM, "Jessica Clarke" <jrtc27@jrtc27.com> wrote:

    On 24 Sep 2021, at 12:33, Nikita Shubin <nikita.shubin@maquefel.me> wrote:
    > 
    > From: Nikita Shubin <n.shubin@yadro.com>
    > 
    > This series introduce rebooting via i2c PMIC, currently on
    > SiFive Unmatched board.
    > 
    > teseted via Linux with reset extension and direct ecall from 
    > u-boot.
    > 
    > With this it becomes possible to reboot/shutdown the board 
    > if Linux or u-boot is accompanied with OpenSBI reset extension.
    > 
    > "gpio-poweroff" is required to be removed from u-boot dts file, as
    > it overrides fdt_reset_da9063.

    I disagree with this. The GPIO has been provided by SiFive specifically
    for powering off and so should be used. The DA9063 is only used for
    reset because there is no reset GPIO, but it?s a bit of a hacky way of
    resetting. IMO the DA9063 driver should be the lowest priority and only
    used for poweroff or reset when there is no alternative.

We need to improve sbi_system.h APIs so that platform/drivers can
register callback for particular reset types. This will help reset types
provided different reset drivers and we can use GPIO (for poweroff)
+ DA9063 (for reset) on SiFive Unmatched.

Regards,
Anup

    Jess


