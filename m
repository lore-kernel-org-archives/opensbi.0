From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Fri, 26 Feb 2021 10:19:04 +0100
Subject: [PATCH v2 1/1] platform: implement K210 system reset
In-Reply-To: <BL0PR04MB6514A3D1939678DEB282BE45E79D9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210226011957.19830-1-xypron.glpk@gmx.de>
 <7B40790D-64FB-4625-B267-9FCC9A9636AF@jrtc27.com>
 <BL0PR04MB6514A3D1939678DEB282BE45E79D9@BL0PR04MB6514.namprd04.prod.outlook.com>
Message-ID: <efa34d18-db6b-dcc5-1ee2-b1718f609593@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/26/21 2:59 AM, Damien Le Moal wrote:
> On 2021/02/26 10:28, Jessica Clarke wrote:
>> On 26 Feb 2021, at 01:19, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>
>>> Implement rebooting the K210 via the system reset extension.
>>>
>>> All reset types are treated in the same way.
>>> A request for shutdown results in a reboot.
>>>
>>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
>>> ---
>>> v2:
>>> 	use a constant for the reset bit mask
>>> ---
>>> platform/kendryte/k210/platform.c | 19 +++++++++++++++++++
>>> platform/kendryte/k210/platform.h |  9 +++++++++
>>> 2 files changed, 28 insertions(+)
>>>
>>> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
>>> index 944b388..247cb86 100644
>>> --- a/platform/kendryte/k210/platform.c
>>> +++ b/platform/kendryte/k210/platform.c
>>> @@ -129,6 +129,22 @@ static int k210_timer_init(bool cold_boot)
>>> 	return clint_warm_timer_init();
>>> }
>>>
>>> +static int k210_system_reset_check(u32 type, u32 reason)
>>> +{
>>> +	return 1;
>>> +}
>>> +
>>> +static void k210_system_reset(u32 type, u32 reason)
>>> +{
>>> +	u32 val;
>>> +
>>> +	val = k210_read_sysreg(K210_RESET);
>>> +	val |= K210_RESET_MASK;
>>> +	k210_write_sysreg(val, K210_RESET);
>>> +
>>> +	while(1);
>>
>> Formatting requires a space.

Thank you for reviewing.

>>
>>> +}
>>> +
>>
>> It strikes me that this is just a kind of syscons-reset device. Should
>> we not be implementing that slightly more generic driver and have the
>> k210 use a suitable device tree (or hard-code it if you really want)?

Yes, this is a syscon reboot. The relevant part of the device tree is:

syscon at 50440000 {
         compatible = "kendryte,k210-sysctl", "syscon", "simple-mfd";
         reg = <0x50440000 0x00000100>;
         reg-io-width = <0x00000004>;
         phandle = <0x0000000b>;
         reboot {
                 compatible = "syscon-reboot";
                 regmap = <0x0000000b>;
                 offset = <0x00000030>;
                 mask = <0x00000001>;
                 value = <0x00000001>;
         };
};

Implementation of a driver would require to write library code first for
handling regmaps and reg-io-widths.

>
> Device tree for this using generic syscon-reboot is queued on the kernel side
> for 5.12. That can be reused, but there are many dependencies on other drivers
> though (clock and sysctl). A syscon-reboot like generic driver in opensbi would
> be good too, as long as there is more than one user. Not sure if other platform
> in opensbi can benefit from it. This exercise can be left for another patch I think.

Currently I do not see that a device-tree based driver would simplify
the coding.

I will resend the patch with the requested formatting changes.

Best regards

Heinrich

>
>>
>>> const struct sbi_platform_operations platform_ops = {
>>> 	.final_init	= k210_final_init,
>>>
>>> @@ -142,6 +158,9 @@ const struct sbi_platform_operations platform_ops = {
>>> 	.ipi_send  = clint_ipi_send,
>>> 	.ipi_clear = clint_ipi_clear,
>>>
>>> +	.system_reset_check = k210_system_reset_check,
>>> +	.system_reset = k210_system_reset,
>>
>> The ='s are generally kept aligned within blocks.
>>
>> Jess
>>
>>> +
>>> 	.timer_init	   = k210_timer_init,
>>> 	.timer_value	   = clint_timer_value,
>>> 	.timer_event_stop  = clint_timer_event_stop,
>>> diff --git a/platform/kendryte/k210/platform.h b/platform/kendryte/k210/platform.h
>>> index 5269bc4..e425faf 100644
>>> --- a/platform/kendryte/k210/platform.h
>>> +++ b/platform/kendryte/k210/platform.h
>>> @@ -27,10 +27,19 @@
>>> /* Registers */
>>> #define K210_PLL0		0x08
>>> #define K210_CLKSEL0		0x20
>>> +#define K210_RESET		0x30
>>> +
>>> +/* Register bit masks */
>>> +#define K210_RESET_MASK		0x01
>>>
>>> static inline u32 k210_read_sysreg(u32 reg)
>>> {
>>> 	return readl((volatile void *)(K210_SYSCTL_BASE_ADDR + reg));
>>> }
>>>
>>> +static inline void k210_write_sysreg(u32 val, u32 reg)
>>> +{
>>> +	writel(val, (volatile void *)(K210_SYSCTL_BASE_ADDR + reg));
>>> +}
>>> +
>>> #endif /* _K210_PLATFORM_H_ */
>>> --
>>> 2.30.0
>>>
>>>
>>> --
>>> opensbi mailing list
>>> opensbi at lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/opensbi
>>
>>
>
>


