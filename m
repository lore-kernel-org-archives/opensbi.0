From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 13 Aug 2020 19:44:17 +0100
Subject: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
In-Reply-To: <904177D8-F733-4987-8CFD-37EC3DBC95C5@jrtc27.com>
References: <20200813162415.124469-1-xypron.glpk@gmx.de>
 <B98172B0-5CAA-48D2-A2F3-B4DB6B66FB16@jrtc27.com>
 <e3f6b789-0fa6-51f1-4cc4-f5eaa625b8df@gmx.de>
 <B63355E7-4A46-4492-A97F-DE576FB0DDA0@jrtc27.com>
 <6d7b8314-499e-07ef-36e9-8a14e8461bba@gmx.de>
 <126C21E4-08E4-42BE-9BE2-FA2D1C2B4EB6@jrtc27.com>
 <40d31312-c0ae-cecf-e1a6-75e51cb0a1df@gmx.de>
 <904177D8-F733-4987-8CFD-37EC3DBC95C5@jrtc27.com>
Message-ID: <D8A34F50-F66A-4FA4-A869-FDBF015A9C46@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 13 Aug 2020, at 19:37, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> On 13 Aug 2020, at 19:31, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>> 
>> On 13.08.20 20:11, Jessica Clarke wrote:
>>> On 13 Aug 2020, at 19:03, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>> On 13.08.20 19:03, Jessica Clarke wrote:
>>>>> On 13 Aug 2020, at 17:51, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>>>> On 13.08.20 18:36, Jessica Clarke wrote:
>>>>>>> On 13 Aug 2020, at 17:24, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>>>>>> 
>>>>>>>> OpenSBI hangs in wake_coldboot_harts() indefinitely on the MaixDuino board
>>>>>>>> when trying to boot U-Boot as FW_PAYLOAD.
>>>>>>> 
>>>>>>> This smells of there being a more fundamental issue that's not being
>>>>>>> addressed which this manages to work around, either reliably or by
>>>>>>> chance. What is the actual deadlock condition you observe?
>>>>>> 
>>>>>> There are only two function using coldboot_lock spinlock:
>>>>>> 
>>>>>> * wake_coldboot_harts()
>>>>>> * wait_for_coldboot()
>>>>>> 
>>>>>> wake_coldboot_harts() was entered but never left without patching one of
>>>>>> the functions.
>>>>>> 
>>>>>> The Kendryte K210 has two harts. One goes the cold boot path while the
>>>>>> other is sent to the warm boot path.
>>>>> 
>>>>> The K210's platform definition uses clint_ipi_send, which as far as I
>>>>> can tell is entirely non-blocking. The only thing wake_coldboot_harts
>>>>> does with the lock held is set coldboot_done to 1 and send an IPI to
>>>>> all the other harts. Thus wake_coldboot_harts should never be able to
>>>>> block holding the spin lock, meaning wait_for_coldboot should
>>>>> eventually wake up and be able to acquire the lock (on platforms that
>>>>> implement WFI fully it shouldn't have to wait long for the lock, though
>>>>> on platforms that make it a NOP there might be a bit of .
>>>>> 
>>>>> Please further investigate (or explain if you already know) exactly how
>>>>> you end up in a deadlock situation between wake_coldboot_harts and
>>>>> wait_for_coldboot, as I cannot currently see how it could ever be
>>>>> possible.
>>>>> 
>>>>>>>> Even if reading and writing coldboot_done is not atomic it is safe to check
>>>>>>>> it without using a spinlock.
>>>>>>> 
>>>>>>> Maybe microarchitecturally on the specific hardware in question (though
>>>>>>> I wouldn't even be so certain about that), but definitely not in C. You
>>>>>>> now have a data race in reading coldboot_done, which isn't even
>>>>>>> volatile^, so a sufficiently smart compiler would be completely within
>>>>>>> its right to do whatever it wants to the code, including things like
>>>>>>> delete the loop entirely (or, slightly less dramatic, turn it into an
>>>>>>> if). This patch introduces undefined behaviour.
>>>> 
>>>> The cold boot path prints out over the serial console so it is the slow
>>>> path. When it arrives at wake_coldboot_harts() the spinlock is already
>>>> held by wait_for_coldboot().
>>>> 
>>>> You have two loops running at the same time:
>>>> 
>>>> A loop in wait_for_coldboot() which switches the lock on and off
>>>> repeatedly and a second loop in wake_coldboot_harts' spin_lock().
>>>> 
>>>> The warm hart releases the spin lock. This is detected by the cold hart
>>>> in spin_lock_check(). In the meantime the warm hart locks the spinlock
>>>> again and the cold hart fails in amoswap.w. This can go forever.
>>>> 
>>>> It is only by different relative speed of the loops if other processor
>>>> got out of this situation.
>>>> 
>>>> A loop as in wait_for_coldboot() reaquiring a lock immediately without
>>>> giving sufficient time for other threads to acquire the lock is simply
>>>> incorrect coding.
>>>> 
>>>> The following change also resolves the problem:
>>>> 
>>>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
>>>> index a7fb848..68be58f 100644
>>>> --- a/lib/sbi/sbi_init.c
>>>> +++ b/lib/sbi/sbi_init.c
>>>> @@ -132,12 +132,12 @@ static void wake_coldboot_harts(struct sbi_scratch
>>>> *scratch, u32 hartid)
>>>> {
>>>>      const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>>>> 
>>>> -       /* Acquire coldboot lock */
>>>> -       spin_lock(&coldboot_lock);
>>>> -
>>>>      /* Mark coldboot done */
>>>>      coldboot_done = 1;
>>>> 
>>>> +       /* Acquire coldboot lock */
>>>> +       spin_lock(&coldboot_lock);
>>>> +
>>>>      /* Send an IPI to all HARTs waiting for coldboot */
>>>>      for (int i = 0; i <= sbi_scratch_last_hartid(); i++) {
>>>>              if ((i != hartid) &&
>>> 
>>> You don't want that; that causes the same kinds of data races for
>>> coldboot_done as before. What could be done is to instead release
>>> coldboot_lock earlier, provided it doesn't matter that the IPIs haven't
>>> been sent yet (I don't think it does, because they're already
>>> inherently asynchronous, so there's currently no guarantee that the
>>> IPIs have actually occurred when coldboot_lock is unlocked in its
>>> original location), but that won't fix anything for you if the issue is
>>> acquiring the lock in the first place in wake_coldboot_harts.
>>> 
>>> So, ok, your problem is not deadlock but livelock. As Atish has
>>> suggested, please try clearing MIP at some point during boot before
>>> wait_for_coldboot, as it really should not be repeatedly trying to
>>> acquire the lock.
>> 
>> A long as we have a loop in wait_for coldboot with spin_lock() inside
>> the loop we will always be acquiring that lock repeatedly. This is
>> independent of any other status.
> 
> That's why the !(cmip & MIP_MSIP) check is there; if no IPI has been
> sent yet, it just goes round the *inner* loop without even thinking
> about acquiring the spin lock. That's why Atish and others have
> mentioned clearing MIP, so that you never break out of that outer loop
> until an IPI has actually been sent. If you had followed their
> suggestions then we believe you would no longer see the starvation.
> 
>> Why do we need that field coldboot_done at all? There is anyway only one
>> thread entering the cold boot path. So we can start with the lock closed
>> and simply unlock it in wake_coldboot_harts():
> 
> Because there's global state to set up. You can't have all the other
> harts rampaging through memory reading and writing whatever they like
> until they can guarantee that the primary hart has performed all the
> necessary initialisation for them to be able to roam free. I understand
> you are trying to help and offer solutions, but it is getting rather
> tedious to deal with what is now the third fundamentally broken patch
> based on a lack of understanding, so please try to listen to us and
> work with us to fix the problem you are facing rather than continuing
> to play doctor and concoct your own broken "fixes".

Apologies, on closer inspection this does "fix" the problem as I had
neglected the change to coldboot_lock's initialisation state. Yeah, it
works, but, no, initialising a lock to be locked on boot is not good.
All you've done is replace coldboot_done with !coldboot_lock (and made
the latter play double-duty). This is hard to follow and just asking
for mistakes to happen because it's not a normal thing to do.

Also, by doing this, you've now made all the harts busy-wait the entire
time rather than be able to execute WFI until the primary hart is done,
as they will be spinning for ages on the lock. This also renders the
WFI you still have in there completely redundant, as to reach that
point the lock must already have been acquired and thus is guaranteed
to have been sent (though not necessarily received). So, no again.

Jess

>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
>> index a7fb848..5645b18 100644
>> --- a/lib/sbi/sbi_init.c
>> +++ b/lib/sbi/sbi_init.c
>> @@ -84,8 +84,7 @@ static void sbi_boot_prints(struct sbi_scratch
>> *scratch, u32 hartid)
>>       sbi_hart_pmp_dump(scratch);
>> }
>> 
>> -static spinlock_t coldboot_lock = SPIN_LOCK_INITIALIZER;
>> -static unsigned long coldboot_done = 0;
>> +static spinlock_t coldboot_lock = { .lock = ~__RISCV_SPIN_UNLOCKED };
>> static struct sbi_hartmask coldboot_wait_hmask = { 0 };
>> 
>> static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
>> @@ -106,14 +105,10 @@ static void wait_for_coldboot(struct sbi_scratch
>> *scratch, u32 hartid)
>>       sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
>> 
>>       /* Wait for coldboot to finish using WFI */
>> -       while (!coldboot_done) {
>> -               spin_unlock(&coldboot_lock);
>> -               do {
>> -                       wfi();
>> -                       cmip = csr_read(CSR_MIP);
>> -                } while (!(cmip & MIP_MSIP));
>> -               spin_lock(&coldboot_lock);
>> -       };
>> +       do {
>> +               wfi();
>> +               cmip = csr_read(CSR_MIP);
>> +       } while (!(cmip & MIP_MSIP));
>> 
>>       /* Unmark current HART as waiting */
>>       sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
>> @@ -132,12 +127,6 @@ static void wake_coldboot_harts(struct sbi_scratch
>> *scratch, u32 hartid)
>> {
>>       const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>> 
>> -       /* Acquire coldboot lock */
>> -       spin_lock(&coldboot_lock);
>> -
>> -       /* Mark coldboot done */
>> -       coldboot_done = 1;
>> -
>>       /* Send an IPI to all HARTs waiting for coldboot */
>>       for (int i = 0; i <= sbi_scratch_last_hartid(); i++) {
>>               if ((i != hartid) &&
>> 
>> Best regards
>> 
>> Heinrich


