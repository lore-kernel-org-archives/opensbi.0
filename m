From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 5 Jun 2023 07:57:07 +0100
Subject: [PATCH 15/17] lib: utils/irqchip: Use scratch space to save
 per-HART PLIC pointer
In-Reply-To: <CAAhSdy3LrndeWLUy6dELUtgTVCE+Z=zHzsJb2PxhZpG2R+S5FQ@mail.gmail.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-16-apatel@ventanamicro.com>
 <C3911409-D000-4FC3-8302-4C4BAADACFE2@jrtc27.com>
 <CAAhSdy3LrndeWLUy6dELUtgTVCE+Z=zHzsJb2PxhZpG2R+S5FQ@mail.gmail.com>
Message-ID: <59E6DFC8-989C-45F1-8A95-E723E5415FDC@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5 Jun 2023, at 07:51, Anup Patel <anup@brainfault.org> wrote:
> 
> On Mon, Jun 5, 2023 at 11:13?AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> 
>> On 25 Apr 2023, at 13:32, Anup Patel <apatel@ventanamicro.com> wrote:
>>> 
>>> Instead of using a global array indexed by hartid, we should use
>>> scratch space to save per-HART PLIC pointer and PLIC context numbers.
>>> 
>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>> ---
>>> lib/utils/irqchip/fdt_irqchip_plic.c | 108 +++++++++++++++++++++------
>>> 1 file changed, 86 insertions(+), 22 deletions(-)
>>> 
>>> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
>>> index 605f44a..eb1e412 100644
>>> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
>>> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
>>> @@ -12,54 +12,97 @@
>>> #include <sbi/riscv_io.h>
>>> #include <sbi/sbi_error.h>
>>> #include <sbi/sbi_heap.h>
>>> -#include <sbi/sbi_hartmask.h>
>>> +#include <sbi/sbi_scratch.h>
>>> #include <sbi_utils/fdt/fdt_helper.h>
>>> #include <sbi_utils/irqchip/fdt_irqchip.h>
>>> #include <sbi_utils/irqchip/plic.h>
>>> 
>>> -static struct plic_data *plic_hartid2data[SBI_HARTMASK_MAX_BITS];
>>> -static int plic_hartid2context[SBI_HARTMASK_MAX_BITS][2] = { { -1 } };
>>> +static unsigned long plic_ptr_offset;
>>> +
>>> +#define plic_get_hart_data_ptr(__scratch) \
>>> +({ \
>>> + (void *)(*((ulong *)sbi_scratch_offset_ptr((__scratch), \
>>> +   plic_ptr_offset))); \
>> 
>> Why all the casting rather than just storing the pointer?
> 
> We are storing pointer value in scratch space as ulong but
> sbi_scratch_offset_ptr() returns a void pointer to a location in
> scratch space so we have to do the above casting for getting
> the pointer stored in scratch space.
> 
> Thinking about this more, it is better to have generic helper
> macros in sbi_scartch.h so that we don't have to define it
> everywhere.

Pointers are not longs. This isn?t the Linux kernel, you don?t
need to be allergic to using the correct types for things.

Jess


