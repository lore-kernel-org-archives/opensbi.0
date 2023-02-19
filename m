From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 19 Feb 2023 22:41:32 +0000
Subject: [PATCH 1/2] lib: sbi: Actually wait for an IPI in
 sbi_hsm_hart_wait()
In-Reply-To: <19015380-F8C5-4DF3-AA0A-E4C2EDAC350F@jrtc27.com>
References: <20230219222031.3053255-1-e.shatokhin@yadro.com>
 <20230219222031.3053255-2-e.shatokhin@yadro.com>
 <19015380-F8C5-4DF3-AA0A-E4C2EDAC350F@jrtc27.com>
Message-ID: <FEDB1517-A300-4E33-B8F5-D68D2CCA5A20@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 19 Feb 2023, at 22:38, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> 
> On 19 Feb 2023, at 22:20, Evgenii Shatokhin <e.shatokhin@yadro.com> wrote:
>> 
>> "wfi" instruction is not guaranteed to wait for an interrupt to be received
>> by the hart, it is just a hint for the CPU. According to RISC-V Privileged
>> Architectures spec. v20211203, even an implementation of "wfi" as "nop" is
>> legal.
>> 
>> As a result, a secondary (non-boot) hart waiting in the while loop in
>> sbi_hsm_hart_wait() might leave the loop and continue even if it got no
>> IPI. This could lead to the following race condition when booting Linux,
>> for example:
>> 
>> Boot hart (#0)                        Secondary hart (#1)
>> runs Linux startup code               waits in sbi_hsm_hart_wait()
>> 
>> sbi_ecall(SBI_EXT_HSM,
>>           SBI_EXT_HSM_HART_START,
>>           ...)
>> enters sbi_hsm_hart_start()
>> sets state of hart #1 to START_PENDING
>>                                       leaves sbi_hsm_hart_wait()
>>                                       runs to the end of init_warmboot()
>>                                       returns to scratch->next_addr
>>                                       (next_addr can be garbage here)
>> 
>> sets next_addr, etc. for hart #1
>> (no good: hart #1 has already left)
>> 
>> sends IPI to hart #1
>> (no good either)
>> 
>> If this happens, the secondary hart jumps to a wrong next_addr at the end
>> of init_warmboot(), which leads to a system hang or crash.
>> 
>> To reproduce the issue more reliably, one could add a delay in
>> sbi_hsm_hart_start(): after setting the hart's state but before sending
>> IPI to that hart:
>> 
>>   hstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STOPPED,
>>                           SBI_HSM_STATE_START_PENDING);
>>   ...
>> + sbi_timer_mdelay(10);
>>   init_count = sbi_init_count(hartid);
>>   rscratch->next_arg1 = arg1;
>>   rscratch->next_addr = saddr;
>> 
>> The issue can be reproduced, for example, in a QEMU VM with '-machine virt'
>> and 2 or more CPUs, with Linux as the guest OS.
>> 
>> Let us actually check in sbi_hsm_hart_wait(), if the waiting hart has
>> received an IPI.
> 
> Using the IPI itself as the synchronisation barrier seems awfully
> brittle. Better to split SBI_HSM_STATE_START_PENDING into two states so
> there?s an additional atomic_write that the atomic_read here can
> synchronise with.

Of course, care is needed to not expose this outside OpenSBI as these
states are part of the SBI. That is, from the outside world, both
states should appear as START_PENDING.

Jess

>> Signed-off-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
>> ---
>> lib/sbi/sbi_hsm.c | 8 ++++++--
>> 1 file changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
>> index 8499bb1..0e5ff3d 100644
>> --- a/lib/sbi/sbi_hsm.c
>> +++ b/lib/sbi/sbi_hsm.c
>> @@ -108,6 +108,8 @@ void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid)
>> static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
>> {
>> 	unsigned long saved_mie;
>> +	unsigned long ipi_received;
>> +	unsigned int hstate;
>> 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
>> 							    hart_data_offset);
>> 	/* Save MIE CSR */
>> @@ -117,9 +119,11 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
>> 	csr_set(CSR_MIE, MIP_MSIP | MIP_MEIP);
>> 
>> 	/* Wait for state transition requested by sbi_hsm_hart_start() */
>> -	while (atomic_read(&hdata->state) != SBI_HSM_STATE_START_PENDING) {
>> +	do {
>> 		wfi();
>> -	};
>> +		ipi_received = csr_read(CSR_MIP) & (MIP_MSIP | MIP_MEIP);
>> +		hstate = atomic_read(&hdata->state);
>> +	} while (hstate != SBI_HSM_STATE_START_PENDING || !ipi_received);
>> 
>> 	/* Restore MIE CSR */
>> 	csr_write(CSR_MIE, saved_mie);
>> -- 
>> 2.34.1
>> 
>> 
>> 
>> -- 
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi


