From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 23 Jul 2021 00:46:35 +0200
Subject: [PATCH 2/2] lib: utils: support both of gpio-poweroff, gpio-reset
In-Reply-To: <35DD8491-3162-458D-97C3-BC09E1F2ABC1@jrtc27.com>
References: <20210722105359.18622-1-xypron.glpk@gmx.de>
 <20210722105359.18622-3-xypron.glpk@gmx.de>
 <35DD8491-3162-458D-97C3-BC09E1F2ABC1@jrtc27.com>
Message-ID: <e472fd95-1cbb-f1d3-d421-52096f96f10e@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 7/22/21 9:33 PM, Jessica Clarke wrote:
> On 22 Jul 2021, at 11:53, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>
>> The generic GPIO reset driver has two entries in the match table:
>> "gpio-poweroff", "gpio-reset". Only the first entry is considered by
>> fdt_reset_init().
> 
> This is inaccurate. fdt_reset_init does consider all entries in turn.
> The problem is that OpenSBI?s driver attachment is backwards from
> normal operating systems. Normal operating systems will iterate over
> all devices, and for each device will iterate over all drivers trying
> to find the best one, if any. This means multiple instances of the same
> driver (including for very different compatible strings) can exist. In
> OpenSBI, however, this is turned on its head, with it iterating over
> all drivers, trying to find a device that each driver can attach to.
> This means multiple instances of the same driver cannot exist, so
> whichever of gpio-poweroff and gpio-reset appears in the device tree
> first is the one that gets attached to. Splitting the two sets of
> functionality out into their own drivers therefore works around this
> limitation, though arguably it would be better to alter OpenSBI to
> follow a normal driver attachment process as I?m sure this will come up
> again eventually.
> 
> Jess
> 
Hello Jess,

Thanks for taking the discussion to the overall design.

The same logic as in fdt_reset_init() is used in:

* fdt_serial_init() - lib/utils/serial/fdt_serial.c
* fdt_ipi_cold_init() - lib/utils/ipi/fdt_ipi.c
* fdt_irqchip_cold_init() - lib/utils/irqchip/fdt_irqchip.c
* fdt_timer_cold_init() - lib/utils/timer/fdt_timer.c

Should we first merge this patch and then start to rework the whole 
driver binding process or would you suggest to apply only patch 1 of the 
series and do the redesign first?

An advantage of iterating over the occurrences of "compatible" 
properties in the device-tree instead of iterating over drivers is that 
we parse the device-tree only once.

Concerning the new design I see two alternatives:

Currently we follow an early probing approach where the init routines of 
the drivers determine if a device is usable before it is ever requested.

U-Boot follows a late probing approach where in a binding phase devices 
that could be available according to the device-tree are put into a tree 
structure. Actual probing occurs when the class of driver is actually 
accessed. This speeds up the boot process by not probing unused devices 
but increases the code complexity.

Late probing in the case of the system reset extension would mean that 
you only probe the reset drivers once sbi_probe_extension() or a 
function of the extension is called for the first time.

Best regards

Heinrich

