From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed, 29 Sep 2021 14:03:19 +0200
Subject: [PATCH 1/1] lib: utils: identify supported GPIO reset methods
In-Reply-To: <20210929121411.4af6684d@redslave.neermore.group>
References: <20210928114246.46596-1-heinrich.schuchardt@canonical.com>
 <CAAhSdy1oEFKw6iE0Dc=cmRjhQWV_i6JvaB6u4P3ayWzKKXiXNw@mail.gmail.com>
 <20210929121411.4af6684d@redslave.neermore.group>
Message-ID: <e747166b-0f6e-3a48-5dbc-8831aa4abbcb@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/29/21 11:14, Nikita Shubin wrote:
> On Wed, 29 Sep 2021 09:46:55 +0530
> Anup Patel <anup@brainfault.org> wrote:
> 
>> +Nikita
>>
>> On Tue, Sep 28, 2021 at 5:13 PM Heinrich Schuchardt
>> <heinrich.schuchardt@canonical.com> wrote:
>>>
>>> The GPIO reset driver supports reset and poweroff. But not all
>>> boards support both. gpio_system_reset_check() must detect this
>>> situation.
>>>
>>> Signed-off-by: Heinrich Schuchardt
>>> <heinrich.schuchardt@canonical.com>
>>
>> Looks good to me.
>>
>> Reviewed-by: Anup Patel <anup.patel@wdc.com>
>>
>> I had mentioned on the PMIC reset series that we need to improve
>> the sbi_system.h device registration such that reset drivers can
>> register a reset device for a range of reset types. This will allow
>> separate reset drivers (e.g. PMIC+GPIO) for SiFive Unmatched.
>> Also, reset_check() callback will not be required anymore.
>>
>> Regards,
>> Anup
> 
> Looks good to me, however
> 
>>> +       /* hang !!! */
>>> +       sbi_hart_hang();
>>>   }
> 
> Heinrich do we really need to hang here ?
> 
> Despite the gpio_system_reset should never reach the end of function,
> i remember you talked something about returning from function back to
> the sbi_system_reset.

Thanks for reviewing.

As we are calling the check function before invoking the reset function 
this hang will only be running until the power supply is drained.

A calling function is defined as __no_return. Once we correct the whole 
reset driver framework as proposed by Anup we have to remove the 
sbi_hart_hang() here and in other drivers. We then need a small wait 
here and shall return SBI_EFAIL in the most improbable case.

Best regards

Heinrich


