From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 23 Jul 2021 00:01:44 +0100
Subject: [PATCH 2/2] lib: utils: support both of gpio-poweroff, gpio-reset
In-Reply-To: <942DCA4C-3579-44A9-9A91-6E438D88F0B0@jrtc27.com>
References: <20210722105359.18622-1-xypron.glpk@gmx.de>
 <20210722105359.18622-3-xypron.glpk@gmx.de>
 <35DD8491-3162-458D-97C3-BC09E1F2ABC1@jrtc27.com>
 <e472fd95-1cbb-f1d3-d421-52096f96f10e@canonical.com>
 <942DCA4C-3579-44A9-9A91-6E438D88F0B0@jrtc27.com>
Message-ID: <F38D291C-9BFE-4D97-B7DB-946139FD2638@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 23 Jul 2021, at 00:00, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> 
> On 22 Jul 2021, at 23:46, Heinrich Schuchardt <heinrich.schuchardt@canonical.com> wrote:
>> 
>> 
>> 
>> On 7/22/21 9:33 PM, Jessica Clarke wrote:
>>> On 22 Jul 2021, at 11:53, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>> 
>>>> The generic GPIO reset driver has two entries in the match table:
>>>> "gpio-poweroff", "gpio-reset". Only the first entry is considered by
>>>> fdt_reset_init().
>>> This is inaccurate. fdt_reset_init does consider all entries in turn.
>>> The problem is that OpenSBI?s driver attachment is backwards from
>>> normal operating systems. Normal operating systems will iterate over
>>> all devices, and for each device will iterate over all drivers trying
>>> to find the best one, if any. This means multiple instances of the same
>>> driver (including for very different compatible strings) can exist. In
>>> OpenSBI, however, this is turned on its head, with it iterating over
>>> all drivers, trying to find a device that each driver can attach to.
>>> This means multiple instances of the same driver cannot exist, so
>>> whichever of gpio-poweroff and gpio-reset appears in the device tree
>>> first is the one that gets attached to. Splitting the two sets of
>>> functionality out into their own drivers therefore works around this
>>> limitation, though arguably it would be better to alter OpenSBI to
>>> follow a normal driver attachment process as I?m sure this will come up
>>> again eventually.
>>> Jess
>> Hello Jess,
>> 
>> Thanks for taking the discussion to the overall design.
>> 
>> The same logic as in fdt_reset_init() is used in:
>> 
>> * fdt_serial_init() - lib/utils/serial/fdt_serial.c
>> * fdt_ipi_cold_init() - lib/utils/ipi/fdt_ipi.c
>> * fdt_irqchip_cold_init() - lib/utils/irqchip/fdt_irqchip.c
>> * fdt_timer_cold_init() - lib/utils/timer/fdt_timer.c
> 
> Yeah, this was indeed meant to be a general statement about all the device driver classes.
> 
>> Should we first merge this patch and then start to rework the whole driver binding process or would you suggest to apply only patch 1 of the series and do the redesign first?
> 
> Yes, I think given the importance of the functionality your patch adds I think it?s best to merge that and then think about a more robust design for OpenSBI.

(though with the commit message rewritten since as it stands it is rather incorrect)

Jess


