From: Evgenii Shatokhin <e.shatokhin@yadro.com>
Date: Thu, 9 Mar 2023 22:40:12 +0300
Subject: [PATCH v3 3/3] lib: sbi: Clear IPIs before init_warm_startup in
 non-boot harts
In-Reply-To: <CAAhSdy2yk+dgGBFXQsjGNXHg6Y+WjFndBF9qJ8fNz1q=9Psm2A@mail.gmail.com>
References: <20230305212247.494912-1-e.shatokhin@yadro.com>
 <20230305212247.494912-4-e.shatokhin@yadro.com>
 <CAAhSdy3ghazwrRxgDuZ1qAcxMdQ4Mtcc4yPLvft6TZE6t7F8BQ@mail.gmail.com>
 <d3039c2a-25e4-ba90-5a5f-d3d24e2ffaf4@yadro.com>
 <CAAhSdy2yk+dgGBFXQsjGNXHg6Y+WjFndBF9qJ8fNz1q=9Psm2A@mail.gmail.com>
Message-ID: <5ccf718d-f576-55f6-0704-0c930f3f40f8@yadro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09.03.2023 21:03, Anup Patel wrote:
> 
> On Thu, Mar 9, 2023 at 11:23?PM Evgenii Shatokhin <e.shatokhin@yadro.com> wrote:
>>
>> On 09.03.2023 19:30, Anup Patel wrote:
>>> On Mon, Mar 6, 2023 at 2:54?AM Evgenii Shatokhin <e.shatokhin@yadro.com> wrote:
>>>>
>>>> Since commit 50d4fde1c5a4 ("lib: Remove redundant sbi_platform_ipi_clear()
>>>> calls"), the IPI sent from the boot hart in wake_coldboot_harts() is not
>>>> cleared in the secondary harts until they reach sbi_ipi_init(). However,
>>>> sbi_hsm_init() and sbi_hsm_hart_wait() are called earlier, so a secondary
>>>> hart might enter sbi_hsm_hart_wait() with an already pending IPI.
>>>>
>>>> sbi_hsm_hart_wait() makes sure the hart leaves the loop only when it is
>>>> actually ready, so a pending unrelated IPI should not cause safety issues.
>>>> However, it might be inefficient on certain hardware, because it prevents
>>>> "wfi" from stalling the hart even if the hardware supports this, making the
>>>> hart needlessly spin in a "busy-wait" loop.
>>>>
>>>> This behaviour can be observed, for example, in a QEMU VM (QEMU 7.2.0) with
>>>> "-machine virt" running a Linux guest. Inserting delays in
>>>> sbi_hsm_hart_start() allows reproducing the issue more reliably.
>>>>
>>>> The comment in wait_for_coldboot() suggests that the initial IPI is needed
>>>> in the warm resume path, so let us clear it before init_warm_startup()
>>>> only.
>>>>
>>>> To do this, sbi_ipi_raw_clear() was created similar to sbi_ipi_raw_send().
>>>
>>> As noted before, the sbi_ipi_raw_clear() will not work since secondary
>>> HARTs might call sbi_ipi_raw_clear() even before platform code has a
>>> chance to register IPI device ops.
>>
>> How so? If I understand it correctly, the platform code registers IPI
>> device ops and sets the IPI device structures when the boot hart calls
>> sbi_platform_ipi_init() with cold_boot=true from sbi_ipi_init().
> 
> sbi_ipi_raw_clear() added by this patch is called from secondary HART
> whereas platform code registers IPI device ops from sbi_ipi_init().

Yes.

> 
>>
>> So, by the time the secondary harts exit wait_for_coldboot(), IPI device
>> and ops are already in place and can be used.
>>
>> sbi_platform_ipi_init() called from those harts with cold_boot == false
>> only clears pending IPIs and disables certain interrupts, it looks like.
> 
> The sbi_platform_ipi_init() is called via init_warm_startup() only after
> cold boot sequence is completed by primary hart but over here you
> are calling sbi_ipi_raw_clear() before init_warm_startup().

Yes. But the IPI device is common for all harts, as far as I can see. It 
has already been set up by that point by the coldboot path and is 
operational. Why not use it then?

When sbi_platform_ipi_init() is called later in init_warm_startup(), it 
only clears IPIs and, on certain platforms, disables some interrupts. I 
do not think that clearing IPIs with sbi_ipi_raw_clear() before 
init_warm_startup() would break that.

Or, perhaps, I am missing something?

I could not check it on all platforms in runtime, of course, but 
debugging shows that, at least, "generic" platform with fdt behaves the 
way I described. Clearing IPIs before init_warm_startup() works OK there.

The platforms which use aclint_mswi_cold_init() and 
aclint_mswi_warm_init(), that is, most of them, should be fine too: 
aclint_mswi_cold_init() prepares the IPI device and the related 
structures (mswi_hartid2data, etc.) while aclint_mswi_warm_init() just 
clears IPI for the current hart.


> 
> Regards,
> Anup
> 
>>
>>>
>>> I also recollected why we have this WFI and IPI based coldboot wait logic.
>>> The rationale of using WFI and IPI based coldboot wait logic was to reduce
>>> bus traffic from secondary HARTs while the primary HART completes the
>>> coldboot sequence (i.e. init_coldboot()). Clearly, this WFI and IPI based
>>> coldboot wait logic will do the intended thing if WFI is a NOP.
>>>
>>> I think we can do the following:
>>> 1) Remove coldboot_lock and coldboot_wait_hmask
>>> 2) Simplify the loop in wait_for_coldboot() to use
>>>       cpu_relax_loop(100) (or more) to reduce bus traffic
>>>       from secondary HARTs
>>> 3) Simplify wake_coldboot_harts() to only do
>>>       "__smp_store_release(&coldboot_done, 1);"
>>>
>>> Regards,
>>> Anup
>>>
>>> diff --git a/include/sbi/riscv_barrier.h b/include/sbi/riscv_barrier.h
>>> index 1fba8b8..dd8aa79 100644
>>> --- a/include/sbi/riscv_barrier.h
>>> +++ b/include/sbi/riscv_barrier.h
>>> @@ -40,7 +40,19 @@
>>>    #define smp_wmb()        RISCV_FENCE(w,w)
>>>
>>>    /* CPU relax for busy loop */
>>> -#define cpu_relax()        asm volatile ("" : : : "memory")
>>> +#define cpu_relax()        \
>>> +do {                \
>>> +    long dummy = 0x1;    \
>>> +    asm volatile ("div %0, %0, zero" : "=r" (dummy) : : "memory");\
>>> +} while (0)
>>> +
>>> +/* CPU relax loop */
>>> +#define cpu_relax_loop(__loop_count)    \
>>> +do {                    \
>>> +    long i;                \
>>> +    for (i = 0; i < (__loop_count); i++) \
>>> +        cpu_relax();        \
>>> +} while (0)
>>>
>>>    /* clang-format on */
>>>
>>
>> Regards,
>> Evgenii
>>
> 



