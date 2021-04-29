From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 29 Apr 2021 03:03:30 +0100
Subject: [PATCH RFC] platform: generic: How to add custom extensions for
 sbi_call?
In-Reply-To: <CAJF2gTTrcfR5iNXNOxooTe6q2oB=PQhr6yKNU+C+8iaPbcj1KQ@mail.gmail.com>
References: <1619618066-11406-1-git-send-email-guoren@kernel.org>
 <CAJF2gTTrcfR5iNXNOxooTe6q2oB=PQhr6yKNU+C+8iaPbcj1KQ@mail.gmail.com>
Message-ID: <8E302D03-4E72-46A4-BE59-0A33D8016001@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29 Apr 2021, at 02:54, Guo Ren <guoren@kernel.org> wrote:
> 
> @Anup Patel @Atish Patra @Alistair Francis
> 
> Could we add a fdt_vendor_ext_provider for generic? How do you think?

IMO we should be very reluctant to allow vendors to add extensions to OpenSBI,
as the whole point of SBI is to abstract away the platform, not expose
platform-specific details. But on a technical level, yes, you could have
extensions be conditional on the FDT.

In this particular case, you don?t want a vendor extension. Configuring the
M-mode-only HPM CSRs is a problem shared by all implementations of the current
privileged architecture that include performance counters, as the current
privileged ISA is woefully deficient. This should be solved in a standardised
way, not with some random vendor extension.

Jess

> On Wed, Apr 28, 2021 at 9:55 PM <guoren@kernel.org> wrote:
>> 
>> From: Guo Ren <guoren@linux.alibaba.com>
>> 
>> Here is the sample of thead PMU sbi implementation, it could work
>> with linux perf record:
>> 
>> https://github.com/c-sky/csky-linux/blob/linux-5.10.4/drivers/perf/thead_c900_pmu.c
>> 
>> It support perf record with hardware event.
>> 
>> How to support this in platform/generic?
>> 
>> Thx
>> 
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Cc: Anup Patel <anup.patel@wdc.com>
>> ---
>> platform/generic/platform.c | 159 ++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 159 insertions(+)
>> 
>> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
>> index 7581556..52084dd 100644
>> --- a/platform/generic/platform.c
>> +++ b/platform/generic/platform.c
>> @@ -206,7 +206,166 @@ static void generic_system_reset(u32 reset_type, u32 reset_reason)
>>        writew(0x5555, (void *)0x100000); // qemu poweroff
>> }
>> 
>> +#include <sbi/sbi_trap.h>
>> +#define CSR_MCOUNTERWEN  0x7c9
>> +static void sbi_thead_pmu_init(void)
>> +{
>> +       unsigned long interrupts;
>> +
>> +       interrupts = csr_read(CSR_MIDELEG) | (1 << 17);
>> +       csr_write(CSR_MIDELEG, interrupts);
>> +
>> +       /* CSR_MCOUNTEREN has already been set in mstatus_init() */
>> +       csr_write(CSR_MCOUNTERWEN, 0xffffffff);
>> +       csr_write(CSR_MHPMEVENT3, 1);
>> +       csr_write(CSR_MHPMEVENT4, 2);
>> +       csr_write(CSR_MHPMEVENT5, 3);
>> +       csr_write(CSR_MHPMEVENT6, 4);
>> +       csr_write(CSR_MHPMEVENT7, 5);
>> +       csr_write(CSR_MHPMEVENT8, 6);
>> +       csr_write(CSR_MHPMEVENT9, 7);
>> +       csr_write(CSR_MHPMEVENT10, 8);
>> +       csr_write(CSR_MHPMEVENT11, 9);
>> +       csr_write(CSR_MHPMEVENT12, 10);
>> +       csr_write(CSR_MHPMEVENT13, 11);
>> +       csr_write(CSR_MHPMEVENT14, 12);
>> +       csr_write(CSR_MHPMEVENT15, 13);
>> +       csr_write(CSR_MHPMEVENT16, 14);
>> +       csr_write(CSR_MHPMEVENT17, 15);
>> +       csr_write(CSR_MHPMEVENT18, 16);
>> +       csr_write(CSR_MHPMEVENT19, 17);
>> +       csr_write(CSR_MHPMEVENT20, 18);
>> +       csr_write(CSR_MHPMEVENT21, 19);
>> +       csr_write(CSR_MHPMEVENT22, 20);
>> +       csr_write(CSR_MHPMEVENT23, 21);
>> +       csr_write(CSR_MHPMEVENT24, 22);
>> +       csr_write(CSR_MHPMEVENT25, 23);
>> +       csr_write(CSR_MHPMEVENT26, 24);
>> +       csr_write(CSR_MHPMEVENT27, 25);
>> +       csr_write(CSR_MHPMEVENT28, 26);
>> +}
>> +
>> +static void sbi_thead_pmu_map(unsigned long idx, unsigned long event_id)
>> +{
>> +       switch (idx) {
>> +       case 3:
>> +               csr_write(CSR_MHPMEVENT3, event_id);
>> +               break;
>> +       case 4:
>> +               csr_write(CSR_MHPMEVENT4, event_id);
>> +               break;
>> +       case 5:
>> +               csr_write(CSR_MHPMEVENT5, event_id);
>> +               break;
>> +       case 6:
>> +               csr_write(CSR_MHPMEVENT6, event_id);
>> +               break;
>> +       case 7:
>> +               csr_write(CSR_MHPMEVENT7, event_id);
>> +               break;
>> +       case 8:
>> +               csr_write(CSR_MHPMEVENT8, event_id);
>> +               break;
>> +       case 9:
>> +               csr_write(CSR_MHPMEVENT9, event_id);
>> +               break;
>> +       case 10:
>> +               csr_write(CSR_MHPMEVENT10, event_id);
>> +               break;
>> +       case 11:
>> +               csr_write(CSR_MHPMEVENT11, event_id);
>> +               break;
>> +       case 12:
>> +               csr_write(CSR_MHPMEVENT12, event_id);
>> +               break;
>> +       case 13:
>> +               csr_write(CSR_MHPMEVENT13, event_id);
>> +               break;
>> +       case 14:
>> +               csr_write(CSR_MHPMEVENT14, event_id);
>> +               break;
>> +       case 15:
>> +               csr_write(CSR_MHPMEVENT15, event_id);
>> +               break;
>> +       case 16:
>> +               csr_write(CSR_MHPMEVENT16, event_id);
>> +               break;
>> +       case 17:
>> +               csr_write(CSR_MHPMEVENT17, event_id);
>> +               break;
>> +       case 18:
>> +               csr_write(CSR_MHPMEVENT18, event_id);
>> +               break;
>> +       case 19:
>> +               csr_write(CSR_MHPMEVENT19, event_id);
>> +               break;
>> +       case 20:
>> +               csr_write(CSR_MHPMEVENT20, event_id);
>> +               break;
>> +       case 21:
>> +               csr_write(CSR_MHPMEVENT21, event_id);
>> +               break;
>> +       case 22:
>> +               csr_write(CSR_MHPMEVENT22, event_id);
>> +               break;
>> +       case 23:
>> +               csr_write(CSR_MHPMEVENT23, event_id);
>> +               break;
>> +       case 24:
>> +               csr_write(CSR_MHPMEVENT24, event_id);
>> +               break;
>> +       case 25:
>> +               csr_write(CSR_MHPMEVENT25, event_id);
>> +               break;
>> +       case 26:
>> +               csr_write(CSR_MHPMEVENT26, event_id);
>> +               break;
>> +       case 27:
>> +               csr_write(CSR_MHPMEVENT27, event_id);
>> +               break;
>> +       case 28:
>> +               csr_write(CSR_MHPMEVENT28, event_id);
>> +               break;
>> +       case 29:
>> +               csr_write(CSR_MHPMEVENT29, event_id);
>> +               break;
>> +       case 30:
>> +               csr_write(CSR_MHPMEVENT30, event_id);
>> +               break;
>> +       case 31:
>> +               csr_write(CSR_MHPMEVENT31, event_id);
>> +               break;
>> +       }
>> +}
>> +
>> +static void sbi_thead_pmu_set(unsigned long type, unsigned long idx, unsigned long event_id)
>> +{
>> +       switch (type) {
>> +       case 2:
>> +               sbi_thead_pmu_map(idx, event_id);
>> +               break;
>> +       default:
>> +               sbi_thead_pmu_init();
>> +               break;
>> +       }
>> +}
>> +
>> +static int thead_vendor_ext_provider(long extid, long funcid,
>> +       const struct sbi_trap_regs *regs, unsigned long *out_value,
>> +       struct sbi_trap_info *out_trap)
>> +{
>> +       switch (extid) {
>> +       case 0x09000001:
>> +               sbi_thead_pmu_set(regs->a0, regs->a1, regs->a2);
>> +               break;
>> +       default:
>> +               sbi_hart_hang();
>> +       }
>> +       return 0;
>> +}
>> +
>> const struct sbi_platform_operations platform_ops = {
>> +       .vendor_ext_provider    = thead_vendor_ext_provider,
>>        .early_init             = generic_early_init,
>>        .final_init             = generic_final_init,
>>        .early_exit             = generic_early_exit,
>> --
>> 2.7.4
>> 
> 
> 
> -- 
> Best Regards
> Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


