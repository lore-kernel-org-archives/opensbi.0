From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Thu, 30 Sep 2021 12:29:20 +0200
Subject: [PATCH 1/1] lib: utils: identify supported GPIO reset methods
In-Reply-To: <CAAhSdy0nhv5B4DUFEr+OB68z7w7ZmqYoQDoBJ6jz3MK2mxD+OQ@mail.gmail.com>
References: <20210928114246.46596-1-heinrich.schuchardt@canonical.com>
 <CAAhSdy1oEFKw6iE0Dc=cmRjhQWV_i6JvaB6u4P3ayWzKKXiXNw@mail.gmail.com>
 <627f1941-3e57-cf92-5e74-eebf0036ebc1@canonical.com>
 <CAAhSdy0nhv5B4DUFEr+OB68z7w7ZmqYoQDoBJ6jz3MK2mxD+OQ@mail.gmail.com>
Message-ID: <90c95c0f-ece1-91e2-3202-abe01542b6ff@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/29/21 14:38, Anup Patel wrote:
> On Wed, Sep 29, 2021 at 12:31 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>>
>>
>> On 9/29/21 6:16 AM, Anup Patel wrote:
>>> +Nikita
>>>
>>> On Tue, Sep 28, 2021 at 5:13 PM Heinrich Schuchardt
>>> <heinrich.schuchardt@canonical.com> wrote:
>>>>
>>>> The GPIO reset driver supports reset and poweroff. But not all boards
>>>> support both. gpio_system_reset_check() must detect this situation.
>>>>
>>>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>>>
>>> Looks good to me.
>>>
>>> Reviewed-by: Anup Patel <anup.patel@wdc.com>
>>>
>>> I had mentioned on the PMIC reset series that we need to improve
>>> the sbi_system.h device registration such that reset drivers can
>>> register a reset device for a range of reset types. This will allow
>>> separate reset drivers (e.g. PMIC+GPIO) for SiFive Unmatched.
>>> Also, reset_check() callback will not be required anymore.
>>
>> Hello Anup,
>>
>> thanks for reviewing.
>>
>> Currently we keep a list of drivers in a static array. As we are
>> acquiring more and drivers I would like to move to linker generated
>> lists as Linux and U-Boot use the for enumerating drivers.
>>
>> So a driver could look like:
>>
>> int drv1_check(unsigned int type, unsigned int reason) {...}
>>
>> void drv1_reset(unsigned int type, unsigned int reason) {...}
>>
>> SRST_DRIVER(drv1) = {
>>           .name = "driver_1",
>>           .check = drv1_check,
>>           .reset = drv1_reset,
>> };
>>
>> The linker will create a list of all SRST_DRIVER() instances over which
>> we can iterate in our code.
>>
>> Does this make sense to you?
>>
>> Example code is available in
>> https://github.com/xypron/linker_generated_lists
> 
> I certainly like the Linker list approach. In fact, I have
> implemented something similar in-past for Xvisor built-in
> modules.
> 
> We can go ahead with Linker list approach with
> following considerations:
> 1) The generic SBI library (i.e lib/sbi and include/sbi/
> directories) should not use linker list because we have
> couple of projects (e.g. Microchip HSS and EDK2)
> which directly link with the OpenSBI generic library
> instead of using OpenSBI firmwares.

The platform specification requires:

"the UEFI ResetSystem() service must be implemented via the SBI System 
Reset Extension."

Is this compatible with linking part of SBI as a library but excluding 
reset drivers?

> 2) This should only impact FDT based drivers in
> SBI utils (i.e. lib/utils and include/sbi_utils directories).
> 
> Basically, all FDT based driver frameworks under
> lib/utils can happily move to the Linker list approach
> so that we don't have to maintain various xyz_drivers[]
> arrays across different FDT based driver frameworks.
> 
> Agree ??

While trying to implement the linker list for OpenSBI I ran into some 
problem with the linker:

https://sourceware.org/bugzilla/show_bug.cgi?id=28398

So I would suggest we start by converting the interface using an array.

Best regards

Heinrich

> 
> Regards,
> Anup
> 


