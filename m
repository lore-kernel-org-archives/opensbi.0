From: Evgenii Shatokhin <e.shatokhin@yadro.com>
Date: Mon, 20 Feb 2023 11:56:31 +0300
Subject: [PATCH 1/2] lib: sbi: Actually wait for an IPI in
 sbi_hsm_hart_wait()
In-Reply-To: <508ADC60-D1F1-4F05-8321-05FDA14F224E@jrtc27.com>
References: <20230219222031.3053255-1-e.shatokhin@yadro.com>
 <20230219222031.3053255-2-e.shatokhin@yadro.com>
 <19015380-F8C5-4DF3-AA0A-E4C2EDAC350F@jrtc27.com>
 <af82fecf-776c-d1e1-544a-360783a8c002@yadro.com>
 <508ADC60-D1F1-4F05-8321-05FDA14F224E@jrtc27.com>
Message-ID: <bf12cae3-d9c9-b7e1-99f9-2d4e351fd3b1@yadro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 20.02.2023 11:37, Jessica Clarke wrote:
> ?????????! ?????? ?????? ?? ???????? ????????!?
> 
> On 20 Feb 2023, at 08:28, Evgenii Shatokhin <e.shatokhin@yadro.com> wrote:
>>
>> Hi,
>>
>> On 20.02.2023 01:38, Jessica Clarke wrote:
>>> On 19 Feb 2023, at 22:20, Evgenii Shatokhin <e.shatokhin@yadro.com> wrote:
>>>>
>>>> "wfi" instruction is not guaranteed to wait for an interrupt to be received
>>>> by the hart, it is just a hint for the CPU. According to RISC-V Privileged
>>>> Architectures spec. v20211203, even an implementation of "wfi" as "nop" is
>>>> legal.
>>>>
>>>> As a result, a secondary (non-boot) hart waiting in the while loop in
>>>> sbi_hsm_hart_wait() might leave the loop and continue even if it got no
>>>> IPI. This could lead to the following race condition when booting Linux,
>>>> for example:
>>>>
>>>>   Boot hart (#0)                        Secondary hart (#1)
>>>>   runs Linux startup code               waits in sbi_hsm_hart_wait()
>>>>
>>>>   sbi_ecall(SBI_EXT_HSM,
>>>>             SBI_EXT_HSM_HART_START,
>>>>             ...)
>>>>   enters sbi_hsm_hart_start()
>>>>   sets state of hart #1 to START_PENDING
>>>>                                         leaves sbi_hsm_hart_wait()
>>>>                                         runs to the end of init_warmboot()
>>>>                                         returns to scratch->next_addr
>>>>                                         (next_addr can be garbage here)
>>>>
>>>>   sets next_addr, etc. for hart #1
>>>>   (no good: hart #1 has already left)
>>>>
>>>>   sends IPI to hart #1
>>>>   (no good either)
>>>>
>>>> If this happens, the secondary hart jumps to a wrong next_addr at the end
>>>> of init_warmboot(), which leads to a system hang or crash.
>>>>
>>>> To reproduce the issue more reliably, one could add a delay in
>>>> sbi_hsm_hart_start(): after setting the hart's state but before sending
>>>> IPI to that hart:
>>>>
>>>>     hstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STOPPED,
>>>>                             SBI_HSM_STATE_START_PENDING);
>>>>     ...
>>>>   + sbi_timer_mdelay(10);
>>>>     init_count = sbi_init_count(hartid);
>>>>     rscratch->next_arg1 = arg1;
>>>>     rscratch->next_addr = saddr;
>>>>
>>>> The issue can be reproduced, for example, in a QEMU VM with '-machine virt'
>>>> and 2 or more CPUs, with Linux as the guest OS.
>>>>
>>>> Let us actually check in sbi_hsm_hart_wait(), if the waiting hart has
>>>> received an IPI.
>>> Using the IPI itself as the synchronisation barrier seems awfully
>>> brittle. Better to split SBI_HSM_STATE_START_PENDING into two states so
>>> there?s an additional atomic_write that the atomic_read here can
>>> synchronise with.
>>
>> Yes, using an additional state was the first idea I tried to implement to fix the issue. It turned out to be too error-prone, however: SBI_HSM_STATE_START_PENDING is used in a number of places in opensbi, and it is far from obvious how to use the new state correctly there, esp. without violation of the spec.
> 
> I only see 5, and they don?t look particularly hard...
> 
>> On the other hand, wait_for_coldboot() and wake_coldboot_harts() already use IPI and a condition variable 'coldboot_done' for synchronization, and it seems to work OK.
> 
> But coldboot_done is what those synchronise on; the IPI is merely the
> mechanism by which the waiter gets forcefully woken and made to check
> coldboot_done.
> 
>> So, I suppose, relying on IPI in sbi_hsm_hart_wait() and sbi_hsm_hart_start() too might be a way to go. Looks like, it was the intended way:
>>
>> * Set the state to START_PENDING and get exclusive access to the target hart's scratch area.
>> * Write next_addr, next_arg1, etc., for the target hart.
>> * Send IPI to the target hart to confirm that it might continue.
>>
>> WFI might or might not wait for an interrupt in the target hart, so the boot hart must send an IPI to the target anyway to wake it reliably.
> 
> But you can never truly know that the IPI you got is for the reason you
> think you got it. 

You are right, and my second patch is just about such problem.

> You *must* have additional state to indicate that the
> scratch area has been initialised; the fact you received an IPI somehow
> is not sufficient.

How about using a condition variable here too and keeping it in struct 
sbi_hsm_data? I would rather not touch the hdata->state itself as I 
explained earlier.

IPI will then be used only to wake the target hart, not to confirm that 
next_addr and other data are ready.

> 
> Jess
> 
>> Or, perhaps, I am missing some particular issue with this approach?
>>
>>> Jess
>>>> Signed-off-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
>>>> ---
>>>> lib/sbi/sbi_hsm.c | 8 ++++++--
>>>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
>>>> index 8499bb1..0e5ff3d 100644
>>>> --- a/lib/sbi/sbi_hsm.c
>>>> +++ b/lib/sbi/sbi_hsm.c
>>>> @@ -108,6 +108,8 @@ void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid)
>>>> static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
>>>> {
>>>>        unsigned long saved_mie;
>>>> +     unsigned long ipi_received;
>>>> +     unsigned int hstate;
>>>>        struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
>>>>                                                            hart_data_offset);
>>>>        /* Save MIE CSR */
>>>> @@ -117,9 +119,11 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
>>>>        csr_set(CSR_MIE, MIP_MSIP | MIP_MEIP);
>>>>
>>>>        /* Wait for state transition requested by sbi_hsm_hart_start() */
>>>> -     while (atomic_read(&hdata->state) != SBI_HSM_STATE_START_PENDING) {
>>>> +     do {
>>>>                wfi();
>>>> -     };
>>>> +             ipi_received = csr_read(CSR_MIP) & (MIP_MSIP | MIP_MEIP);
>>>> +             hstate = atomic_read(&hdata->state);
>>>> +     } while (hstate != SBI_HSM_STATE_START_PENDING || !ipi_received);
>>>>
>>>>        /* Restore MIE CSR */
>>>>        csr_write(CSR_MIE, saved_mie);
>>>> --
>>>> 2.34.1
>>
>> Regards,
>> Evgenii
> 
> 



