From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Fri, 14 Aug 2020 06:19:09 +0000
Subject: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
References: <20200813162415.124469-1-xypron.glpk@gmx.de>
 <B98172B0-5CAA-48D2-A2F3-B4DB6B66FB16@jrtc27.com>
 <e3f6b789-0fa6-51f1-4cc4-f5eaa625b8df@gmx.de>
 <B63355E7-4A46-4492-A97F-DE576FB0DDA0@jrtc27.com>
 <CAOnJCUJ8aD8momBWbKuQMv6Apta=LM-Sddoh0VhAVPQhBN-ZAw@mail.gmail.com>
 <e63dc1a5-fb1d-7488-5f59-c2f1165b34dc@gmx.de>
 <823E7031-FADE-4445-8DD6-E4775182712E@jrtc27.com>
 <45937abd-a5b9-5c4d-4520-58c6c0505921@gmx.de>
 <CAOnJCU+qSHMq0pvEPBE0bu4cgVq2_9pNfOWxd8ZRPhe+vj9Hbg@mail.gmail.com>
 <e87d2a6e-5ecd-d47b-2d0f-76429772ab15@gmx.de>
 <CAOnJCUK_pyanTOsTZafEOgJEprgvVcy7zYuiOTHvKxJqhaxeAQ@mail.gmail.com>
 <407d4b67-b4c7-0d50-68a4-2de077a8b696@gmx.de>
 <CAOnJCU+8SKLvaoscCUvWsYxNmoYr8Muy06ta9Xf2gJ=Gtss9MA@mail.gmail.com>
 <f492bbba-bec3-4615-0652-fed340e97654@gmail.com>
 <7e050b0e57e6fdfa9cfe7a0a17d2f2501a4a67f9.camel@wdc.com>
 <DM6PR04MB62013F6069B11A60140B86A08D400@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <CY4PR04MB37513D1610F4F6381B8793B5E7400@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/08/14 15:08, Anup Patel wrote:
>> The following works for me. However, the sbi_ecall_console_puts() call in
>> test_main() for the test FW_PAYLOAD does not work. Individual calls to
>> sbi_ecall_console_putc() do work, but not the full string. It looks like the
>> string is broken, so the data section may be broken... Digging into that.
>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c index a7fb848..9692cd9 100644
>> --- a/lib/sbi/sbi_init.c
>> +++ b/lib/sbi/sbi_init.c
>> @@ -84,69 +84,18 @@ static void sbi_boot_prints(struct sbi_scratch
>> *scratch, u32 hartid)
>>         sbi_hart_pmp_dump(scratch);
>>  }
>>
>> -static spinlock_t coldboot_lock = SPIN_LOCK_INITIALIZER; -static unsigned
>> long coldboot_done = 0; -static struct sbi_hartmask coldboot_wait_hmask = {
>> 0 };
>> +static atomic_t coldboot_done = ATOMIC_INITIALIZER(0);
>>
>> -static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
>> +static inline void wait_for_coldboot(struct sbi_scratch *scratch, u32
>> hartid)
>>  {
>> -       unsigned long saved_mie, cmip;
>> -       const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>> -
>> -       /* Save MIE CSR */
>> -       saved_mie = csr_read(CSR_MIE);
>> -
>> -       /* Set MSIE bit to receive IPI */
>> -       csr_set(CSR_MIE, MIP_MSIP);
>> -
>> -       /* Acquire coldboot lock */
>> -       spin_lock(&coldboot_lock);
>> -
>> -       /* Mark current HART as waiting */
>> -       sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
>> -
>> -       /* Wait for coldboot to finish using WFI */
>> -       while (!coldboot_done) {
>> -               spin_unlock(&coldboot_lock);
>> -               do {
>> -                       wfi();
>> -                       cmip = csr_read(CSR_MIP);
>> -                } while (!(cmip & MIP_MSIP));
>> -               spin_lock(&coldboot_lock);
>> -       };
>> -
>> -       /* Unmark current HART as waiting */
>> -       sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
>> -
>> -       /* Release coldboot lock */
>> -       spin_unlock(&coldboot_lock);
>> -
>> -       /* Restore MIE CSR */
>> -       csr_write(CSR_MIE, saved_mie);
>> -
>> -       /* Clear current HART IPI */
>> -       sbi_platform_ipi_clear(plat, hartid);
>> +       /* Wait for coldboot to finish */
>> +       while (!atomic_read(&coldboot_done)) {};
> 
> This is over-simplified and will slow down the booting in cold boot path.
> 
> Imagine, boot CPU in cold boot path and all secondary CPUs bombarding
> the interconnect with atomic operations.

That was just a quick test. With this, the kendryte goes to S mode and start
running the fw payload, which does not execute correctly still. So there is
another problem somewhere with kendryte platform. Not sure what.

> 
> It has to be a combination of atomic coldboot_done and WFI to
> avoid unnecessary traffic in interconnect. 
> 
> We just need to make coldboot_done atomic and don't use coldboot_lock
> for coldboot_done. Rest of the things should stay as-is.

Without the spinlock, there will be problems with coldboot_wait_hmask if it is
used as is. But I do not think that one is necessary. The boot hart can just
send an IPI to all waiting harts. The waiting harts do not need to clear that mask.


-- 
Damien Le Moal
Western Digital Research

