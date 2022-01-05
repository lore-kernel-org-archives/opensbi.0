From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed, 5 Jan 2022 17:45:29 +0100
Subject: Fwd: [PATCH 2/2] platform: sifive_fu740: fix reset when watchdog
 is running
In-Reply-To: <77e2fbd5-aad6-b49b-0559-4f411e42d6d2@ghiti.fr>
References: <CAPSAq_w6vuWSQEyQKMNOGM-wiWq=ZGUsVebmkGNbD56Z9O28Vw@mail.gmail.com>
 <77e2fbd5-aad6-b49b-0559-4f411e42d6d2@ghiti.fr>
Message-ID: <c331ba5d-5821-efb9-0c74-9d43ef5e598a@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Abdurachmanov <david.abdurachmanov@sifive.com> wrote:
> On Wed, Jan 5, 2022 at 3:40 PM Nikita Shubin <nikita.shubin@maquefel.me> 
> wrote:
>> Hello Aurelien!
>>
>> Adding David from SiFive...
>>
>> On Wed,  5 Jan 2022 08:20:39 +0100
>> Aurelien Jarno<aurelien@aurel32.net>  wrote:
>>
>>> When the watchdog is running the HiFive Unmatched board does not
>>> reboot properly and shuts down itself a few seconds after reboot, in
>>> the early stages of the u-boot loading. On a Linux kernel this
>>> happens when the da9063_wdt module is loaded. This does not happen if
>>> the module is unloaded before reboot or if the watchdog module is
>>> loaded with "stop_on_reboot=1".
>>
>> | A running application is typically in ACTIVE mode. The DA9063
>> | transitions to ACTIVE mode after the host processor performs at least
>> | one initial ?alive? watchdog write (or alternatively an initial
>> | assertion of the KEEP_ACT port) inside the target time window. If the
>> | WATCHDOG function is disabled by setting TWDSCALE to zero, the DA9063
>> | transitions to ACTIVE mode when all of the sequencer IDs in the POWER
>> | domain are complete.
>>
>> Is this that's case mentioned ? What if we press a reset key when
>> watchdog is enabled ? Or if it was reseted by thermal sensor ?
>>
>> Can we disable watchdog on start instead of disabling it before a reset
>> ?
> 
> I would suggest doing this too. Disable watchdog on the start.


An operating system or a firmware (EDK II, U-Boot) may enable the 
watchdog for its internal use. When the SRST extension is called we 
should not assume any specific state of the watchdog. Instead put the 
watchdog into a known state.

Additionally putting the watchdog into a known state when OpenSBI is 
initialized is a sound idea.

After Linux crashes (missing root file system) of the Unmatched board I 
have reproducibly experienced a state where pressing the reset button 
did not lead to a reboot.

> 
> IIRC watchdog DA9063 can do 131 seconds (max). Alternative would be to
> reconfigure the timer for 131 seconds, kick it in OpenSBI to give the
> most possible time and reboot. Hopefully that would be enough time to
> reboot and take control of the watchdog again. I don't know if U-Boot
> has a DA9063 watchdog driver.

We should not make any assumptions about the next boot stage. Our 
solution must both work payloads with and without a driver for the 
watchdog. Hence the watchdog should be inactive when calling the payload.

Best regards

Heinrich

> 
> Disabling it is probably a better option :) System boot with watchdog
> disabled and then it can be enabled again.
> 
> david
> 
>> Could you please give us a link to actual report ?
>>
>>> Fix that by stopping the watchdog before attempting to reset the
>>> board. This is done by zeroing the TWDSCALE field of CONTROL_D
>>> register, unless it was already set to 0.
>>>
>>> Reported-by: Tianon Gravi<tianon@debian.org>
>>> Signed-off-by: Aurelien Jarno<aurelien@aurel32.net>
>>> ---
>>>   platform/generic/sifive_fu740.c | 25 +++++++++++++++++++++++++
>>>   1 file changed, 25 insertions(+)
>>>
>>> diff --git a/platform/generic/sifive_fu740.c
>>> b/platform/generic/sifive_fu740.c index 866e924..f595c04 100644
>>> --- a/platform/generic/sifive_fu740.c
>>> +++ b/platform/generic/sifive_fu740.c
>>> @@ -22,6 +22,7 @@
>>>
>>>   #define DA9063_REG_PAGE_CON          0x00
>>>   #define DA9063_REG_CONTROL_A         0x0e
>>> +#define DA9063_REG_CONTROL_D         0x11
>>>   #define DA9063_REG_CONTROL_F         0x13
>>>   #define DA9063_REG_DEVICE_ID         0x81
>>>
>>> @@ -29,6 +30,8 @@
>>>   #define DA9063_CONTROL_A_M_POWER_EN  (1 << 5)
>>>   #define DA9063_CONTROL_A_STANDBY     (1 << 3)
>>>
>>> +#define DA9063_CONTROL_D_TWDSCALE_MASK       0x07
>>> +
>>>   #define DA9063_CONTROL_F_WAKEUP      (1 << 2)
>>>   #define DA9063_CONTROL_F_SHUTDOWN    (1 << 1)
>>>
>>> @@ -79,6 +82,27 @@ static inline int da9063_sanity_check(struct
>>> i2c_adapter *adap, uint32_t reg) return 0;
>>>   }
>>>
>>> +static inline int da9063_stop_watchdog(struct i2c_adapter *adap,
>>> uint32_t reg) +{
>>> +     uint8_t val;
>>> +     int rc = i2c_adapter_reg_write(adap, reg,
>>> +                                     DA9063_REG_PAGE_CON, 0x00);
>>> +
>>> +     if (rc)
>>> +             return rc;
>>> +
>>> +     rc = i2c_adapter_reg_read(adap, reg, DA9063_REG_CONTROL_D,
>>> &val);
>>> +     if (rc)
>>> +             return rc;
>>> +
>>> +     if ((val & DA9063_CONTROL_D_TWDSCALE_MASK) == 0)
>>> +             return 0;
>>> +
>>> +     val &= ~DA9063_CONTROL_D_TWDSCALE_MASK;
>>> +
>>> +     return i2c_adapter_reg_write(adap, reg,
>>> DA9063_REG_CONTROL_D, val); +}
>>> +
>>>   static inline int da9063_shutdown(struct i2c_adapter *adap, uint32_t
>>> reg) {
>>>        int rc = i2c_adapter_reg_write(adap, reg,
>>> @@ -133,6 +157,7 @@ static void da9063_system_reset(u32 type, u32
>>> reason) break;
>>>                case SBI_SRST_RESET_TYPE_COLD_REBOOT:
>>>                case SBI_SRST_RESET_TYPE_WARM_REBOOT:
>>> +                     da9063_stop_watchdog(adap, reg);
>>>                        da9063_reset(adap, reg);
>>>                        break;
>>>                }
>>
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi
> 


