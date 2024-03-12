From: Bo Gan <ganboing@gmail.com>
Date: Mon, 11 Mar 2024 21:33:23 -0700
Subject: [PATCH 0/9] Improve trap handling for nested traps
In-Reply-To: <CAAhSdy1GhzLu-tgTfsGkvVcMGKioF23zZ-n+vMaM2QJRnGR0kg@mail.gmail.com>
References: <20240311160944.1233523-1-apatel@ventanamicro.com>
 <32748c25-1331-8324-0a15-0000d763caee@gmail.com>
 <CAAhSdy1GhzLu-tgTfsGkvVcMGKioF23zZ-n+vMaM2QJRnGR0kg@mail.gmail.com>
Message-ID: <8d651bf3-eb4d-f37e-fa1f-07576afdc32c@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/11/24 8:43 PM, Anup Patel wrote:
> On Tue, Mar 12, 2024 at 6:31?AM Bo Gan <ganboing@gmail.com> wrote:
>>
>> On 3/11/24 9:09 AM, Anup Patel wrote:
>>> Nested traps will be a common when dealing with RAS error traps so
>>> this series improves trap handling for nested traps by introducing
>>> a linked-list based trap context chain.
>>>
>>> These patches can also be found the trap_handling_imp_v1 branch at
>>> https://github.com/avpatel/opensbi.git
>>>
>>> Anup Patel (9):
>>>     lib: sbi: Remove sbi_trap_exit() and related code
>>>     include: sbi: Add trap_context pointer in struct sbi_scratch
>>>     lib: sbi: Introduce trap context
>>>     lib: sbi: Simplify parameters of misaligned and access fault handlers
>>>     lib: sbi: Simplify parameters of sbi_illegal_insn_handler()
>>>     lib: sbi: Remove regs paramter of sbi_irqchip_process()
>>>     lib: sbi: Remove regs parameter from trap irq handling functions
>>>     lib: sbi: Pass trap context pointer to sbi_ecall_handler()
>>>     lib: sbi: Extend sbi_trap_error() to dump state in a nested trap
>>>
>>>    firmware/fw_base.S             |  14 +--
>>>    include/sbi/sbi_ecall.h        |   4 +-
>>>    include/sbi/sbi_illegal_insn.h |   4 +-
>>>    include/sbi/sbi_irqchip.h      |   5 +-
>>>    include/sbi/sbi_scratch.h      |  14 +--
>>>    include/sbi/sbi_trap.h         |  24 ++++-
>>>    include/sbi/sbi_trap_ldst.h    |  12 +--
>>>    lib/sbi/sbi_ecall.c            |   3 +-
>>>    lib/sbi/sbi_illegal_insn.c     |  14 +--
>>>    lib/sbi/sbi_irqchip.c          |  10 +-
>>>    lib/sbi/sbi_trap.c             | 186 +++++++++++++++++----------------
>>>    lib/sbi/sbi_trap_ldst.c        |  67 ++++++------
>>>    lib/utils/irqchip/imsic.c      |   2 +-
>>>    13 files changed, 185 insertions(+), 174 deletions(-)
>>>
>>
>> Hi Anup,
>>
>> Can you help providing an example for nested traps and the RAS extension?
>> The closest spec I can find (https://github.com/riscv/riscv-ssrastraps) is
>> still empty. I'm wondering where I can find the related documentation.
> 
> Refer, "3.1.15. Machine Cause Register" of the draft Priv v1.13 specification.
> https://github.com/riscv/riscv-isa-manual/releases/download/riscv-isa-release-157641b-2024-03-12/priv-isa-asciidoc.pdf
> 
> Regards,
> Anup
> 


Hi Anup, Thanks for the pointer. I know what nested trap is. My concern is when do
we expect such trap to happen? Does it mean for every memory access in M mode, it
might trigger a RAS fault, causing a nested trap? Or even the fault can be delivered
asynchronously? If that's the case, how can we even safely handle nested traps? E.g.,
The entry of _trap_handler doesn't look like reentrant-safe to me. Perhaps you plan
to enhance it in later patches?

Bo

