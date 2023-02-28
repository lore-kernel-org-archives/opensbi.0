From: Evgenii Shatokhin <e.shatokhin@yadro.com>
Date: Tue, 28 Feb 2023 19:54:54 +0300
Subject: [PATCH v2 2/2] lib: sbi: Clear IPIs before init_warm_startup in
 non-boot harts
In-Reply-To: <9293d8b4-e0b7-7ce6-2df9-afaf1bb5dec9@yadro.com>
References: <20230221210851.3145840-1-e.shatokhin@yadro.com>
 <20230221210851.3145840-3-e.shatokhin@yadro.com>
 <CAAhSdy1KWF_j=uVdijefit8ZD1nqDtSNh=3gZy96E_JxUEForw@mail.gmail.com>
 <9293d8b4-e0b7-7ce6-2df9-afaf1bb5dec9@yadro.com>
Message-ID: <ff7778a5-a48a-6248-c78a-510afc0340f0@yadro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 28.02.2023 19:19, Evgenii Shatokhin wrote:
> On 28.02.2023 07:41, Anup Patel wrote:
>> On Wed, Feb 22, 2023 at 2:39 AM Evgenii Shatokhin 
>> <e.shatokhin@yadro.com> wrote:
>>>
>>> Since commit 50d4fde1c5a4 ("lib: Remove redundant 
>>> sbi_platform_ipi_clear()
>>> calls"), the IPI sent from the boot hart in wake_coldboot_harts() is not
>>> cleared in the secondary harts until they reach sbi_ipi_init(). However,
>>> sbi_hsm_init() and sbi_hsm_hart_wait() are called earlier, so a 
>>> secondary
>>> hart might enter sbi_hsm_hart_wait() with an already pending IPI.
>>>
>>> sbi_hsm_hart_wait() makes sure the hart leaves the loop only when it is
>>> actually ready, so a pending unrelated IPI should not cause safety 
>>> issues.
>>> However, it might be inefficient on certain hardware, because it 
>>> prevents
>>> "wfi" from stalling the hart even if the hardware supports this, 
>>> making the
>>> hart needlessly spin in a "busy-wait" loop.
>>>
>>> This behaviour can be observed, for example, in a QEMU VM (QEMU 
>>> 7.2.0) with
>>> "-machine virt" running a Linux guest. Inserting delays in
>>> sbi_hsm_hart_start() allows reproducing the issue more reliably.
>>>
>>> The comment in wait_for_coldboot() suggests that the initial IPI is 
>>> needed
>>> in the warm resume path, so let us clear it before init_warm_startup()
>>> only.
>>>
>>> To do this, sbi_ipi_raw_clear() was created similar to 
>>> sbi_ipi_raw_send().
>>>
>>> Signed-off-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
>>> ---
>>> ? include/sbi/sbi_ipi.h | 2 ++
>>> ? lib/sbi/sbi_init.c??? | 6 ++++--
>>> ? lib/sbi/sbi_ipi.c???? | 6 ++++++
>>> ? 3 files changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
>>> index f6ac807..f384e74 100644
>>> --- a/include/sbi/sbi_ipi.h
>>> +++ b/include/sbi/sbi_ipi.h
>>> @@ -77,6 +77,8 @@ void sbi_ipi_process(void);
>>>
>>> ? int sbi_ipi_raw_send(u32 target_hart);
>>>
>>> +void sbi_ipi_raw_clear(u32 target_hart);
>>> +
>>> ? const struct sbi_ipi_device *sbi_ipi_get_device(void);
>>>
>>> ? void sbi_ipi_set_device(const struct sbi_ipi_device *dev);
>>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
>>> index e353c33..a9a4084 100644
>>> --- a/lib/sbi/sbi_init.c
>>> +++ b/lib/sbi/sbi_init.c
>>> @@ -438,10 +438,12 @@ static void __noreturn init_warmboot(struct 
>>> sbi_scratch *scratch, u32 hartid)
>>> ???????? if (hstate < 0)
>>> ???????????????? sbi_hart_hang();
>>>
>>> -?????? if (hstate == SBI_HSM_STATE_SUSPENDED)
>>> +?????? if (hstate == SBI_HSM_STATE_SUSPENDED) {
>>> ???????????????? init_warm_resume(scratch);
>>> -?????? else
>>> +?????? } else {
>>> +?????????????? sbi_ipi_raw_clear(hartid);
>>
>> This effectively does nothing in many cases because for a lot of
>> platforms all HARTs enter OpenSBI at the same time and the HARTs
>> entering warm boot path will call sbi_ipi_raw_clear() even before
>> ipi_dev is provided by platform code.
> 
> Right, it would be a no-op then.
> 
> However, this is not the case when Linux 6.x boots, e.g. in QEMU with 
> "-machine virt" or with other platforms which provide "cold" IPI init 
> callbacks.
> 
> Here, the boot hart initializes ipi_dev early. For example, in QEMU with 
> "-machine virt", it does the following:
> init_coldboot() => sbi_ipi_init() => ... => aclint_mswi_cold_init().
> 
> Other harts are waiting in sbi_hsm_init() at the moment and will only 
> call sbi_ipi_init() after they leave sbi_hsm_hart_wait(), etc.

Correction: the secondary harts are waiting in init_warmboot() at that 
moment rather than in sbi_hsm_init(). Sorry, my bad.

Still, the boot hart only wakes them up with wake_coldboot_harts() after 
it has called sbi_ipi_init(), etc. So, by the time the secondary harts 
get to init_warm_startup(), ipi_dev should already be initialized and 
sbi_ipi_raw_clear() should work.

> 
> While they are waiting, their previous IPI remains pending. It can be 
> easily demonstrated if one checks the relevant bits of CSR_MIP in 
> sbi_hsm_hart_wait() right before the wfi loop. A delay in 
> sbi_hsm_hart_start(), same as for the first issue, also helps make it 
> visible.
> 
> csr_read(CSR_MIP) & (MIP_MSIP | MIP_MEIP) == 0x8 in my case at that 
> point. That is, MIP_MSIP bit is set even before the boot hart has send 
> an IPI to the target hart in sbi_hsm_hart_start(). Not good.
> 
> So, sbi_ipi_raw_clear(hartid) really helps in such cases, even if it is 
> a no-op in other situations.


> 
>>
>>> ???????????????? init_warm_startup(scratch, hartid);
>>> +?????? }
>>>
>>> ???????? sbi_hart_switch_mode(hartid, scratch->next_arg1,
>>> ????????????????????????????? scratch->next_addr,
>>> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
>>> index 1bcc2e4..b9f6205 100644
>>> --- a/lib/sbi/sbi_ipi.c
>>> +++ b/lib/sbi/sbi_ipi.c
>>> @@ -217,6 +217,12 @@ int sbi_ipi_raw_send(u32 target_hart)
>>> ???????? return 0;
>>> ? }
>>>
>>> +void sbi_ipi_raw_clear(u32 target_hart)
>>> +{
>>> +?????? if (ipi_dev && ipi_dev->ipi_clear)
>>> +?????????????? ipi_dev->ipi_clear(target_hart);
>>> +}
>>> +
>>> ? const struct sbi_ipi_device *sbi_ipi_get_device(void)
>>> ? {
>>> ???????? return ipi_dev;
>>> -- 
>>> 2.34.1
>>>
>>>
>>>
>>> -- 
>>> opensbi mailing list
>>> opensbi at lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/opensbi
>>
>> Regards,
>> Anup
>>

Regards,
Evgenii


