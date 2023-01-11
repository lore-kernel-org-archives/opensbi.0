From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Wed, 11 Jan 2023 12:02:26 -0800 (PST)
Subject: [PATCH] platform: generic: renesas: rzfive: Configure the Local memory regions as part of root domain
In-Reply-To: <CA+V-a8sgefMCinB0KuZDvxHA-aQLSH0jbq0bzySi5jOBCWCVOA@mail.gmail.com>
Message-ID: <mhng-55f36122-0534-4311-a6da-4a46bf82e55d@palmer-ri-x1c9a>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 11 Jan 2023 11:49:08 PST (-0800), prabhakar.csengg at gmail.com wrote:
> Hi Palmer,
>
> Just to give a brief, as there wasn't any way the ILM/DLM be disabled
> so the only thing we came across is the Physical Memory Protection
> Unit Configuration & Address Registers block on the Andes Core (and I
> believe all the RISC-V cores have it)
>
> The PMP Configuration Registers (pmpcfg0 and pmpcfg2 0x3A0 and 0x3A2)
> allow regions to be configured with permissions, hence this approach
> is being currently used to disallow any sort of access (M/S/U modes)
> to the local memory regions.
>
> Is there a better approach which I am not aware of?

Nothing I can think of, but I don't know a lot about the processor -- I 
hadn't even thought to check that the PMPs can trigger when the VA 
checks aren't ;)

> On Wed, Jan 11, 2023 at 7:18 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 11 Jan 2023 02:15:11 PST (-0800), prabhakar.mahadev-lad.rj at bp.renesas.com wrote:
>> > Renesas RZ/Five RISC-V SoC has Instruction local memory and Data local
>> > memory (ILM & DLM) mapped between region 0x30000 - 0x4FFFF. When a
>> > virtual address falls within this range, the MMU doesn't trigger a page
>> > fault; it assumes the virtual address is a physical address which can
>> > cause undesired behaviours for statically linked applications/libraries.
>> >
>> > To avoid this, add the ILM/DLM memory regions to the root domain region
>> > of the PMPU with permissions set to 0x0 so that any access to these
>> > regions gets blocked.
>> >
>> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> > ---
>> >  platform/generic/renesas/rzfive/rzfive.c | 18 ++++++++++++++++++
>> >  1 file changed, 18 insertions(+)
>> >
>> > diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
>> > index ca182e3..76f2d3a 100644
>> > --- a/platform/generic/renesas/rzfive/rzfive.c
>> > +++ b/platform/generic/renesas/rzfive/rzfive.c
>> > @@ -5,8 +5,25 @@
>> >   */
>> >
>> >  #include <platform_override.h>
>> > +#include <sbi/sbi_domain.h>
>>
>> I can't find sbi_domain, do you have pointer to whatever this depends
>> on?
>>
> https://github.com/riscv-software-src/opensbi/blob/master/docs/domain_support.md#root-domain
> https://github.com/riscv-software-src/opensbi/blob/master/include/sbi/sbi_domain.h#L236

Thanks, I hadn't been looking closely enough and thought this was Linux 
code... oops!

>> >  #include <sbi_utils/fdt/fdt_helper.h>
>> >
>> > +int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
>> > +{
>> > +     /*
>> > +      * Renesas RZ/Five RISC-V SoC has Instruction local memory and
>> > +      * Data local memory (ILM & DLM) mapped between region 0x30000
>> > +      * to 0x4FFFF. When a virtual address falls within this range,
>> > +      * the MMU doesn't trigger a page fault; it assumes the virtual
>> > +      * address is a physical address which can cause undesired
>> > +      * behaviours for statically linked applications/libraries. To
>> > +      * avoid this, add the ILM/DLM memory regions to the root domain
>> > +      * region of the PMPU with permissions set to 0x0 so that any
>> > +      * access to these regions gets blocked.
>>
>> "blocked" means it traps with an invalid access exception?  If so we
>> just need to make sure that somehow gets plumbed back in to userspace.
>>
> Yes it traps with invalid exception something like below:
>
> [   30.269199] do_trap: 3 callbacks suppressed
> [   30.269223] security[160]: unhandled signal 11 code 0x2 at
> 0x00000000000105bc in security[10000+1000]
> [   30.282791] CPU: 0 PID: 160 Comm: security Not tainted
> 6.2.0-rc1-00124-g11313d81178f-dirty #286
> [   30.291498] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> [   30.298111] epc : 00000000000105bc ra : 000000000001076e sp :
> 0000003fc5c40a00
> [   30.305328]  gp : 0000000000012800 tp : 0000003f9265f200 t0 :
> 0000000000000844
> [   30.312543]  t1 : 0000003f92574f5a t2 : 00000000000124a0 s0 :
> 0000003fc5c40a30
> [   30.319757]  s1 : 00000000000107ee a0 : 0000000000000000 a1 :
> 0000003fc5c40bb8
> [   30.326972]  a2 : 0000003fc5c40bd0 a3 : 0000000000000000 a4 :
> 0000000000000000
> [   30.334186]  a5 : 0000000000030000 a6 : 0000003f92659d18 a7 :
> 0000000000000000
> [   30.341400]  s2 : 0000002ac4b1ef60 s3 : 0000003fb1cde918 s4 :
> 0000000000000000
> [   30.348615]  s5 : 0000002ac4b1ed90 s6 : 0000002ac4b1eac0 s7 :
> 0000002ac4b1eea0
> [   30.355829]  s8 : 0000002ac4b1eee0 s9 : 0000000000000000 s10:
> 0000002ac4adb584
> [   30.363043]  s11: 0000000000000000 t3 : 000000000001ff5a t4 :
> 0000000000000002
> [   30.370266]  t5 : 0000000000000002 t6 : 0000000000000040
> [   30.375579] status: 8000000200006020 badaddr: 0000000000030000
> cause: 0000000000000007
> [   30.393931] audit: type=1701 audit(1673013990.143:11):
> auid=4294967295 uid=0 gid=0 ses=4294967295 pid=160 comm="security"
> exe="/home/root/security" sig=11 res=1
> Segmentation fault
>
> Even statically compiled applications will now fail with signal trap 11.

Awesome!  That should go a long way towards making this thing actually 
usable.

>> > +      */
>> > +     return sbi_domain_root_add_memrange(0x30000, 0x20000, 0x1000, 0x0);
>>
>> Since I couldn't find the code, does this also hook into something
>> (maybe memblock?) to prevent allocating this region?  Nothing we can do
>> if userspace asks for the VAs specifically via mmap(), but we should at
>> least avoid allocating them when we can do so.
>>
> It just creates nodes on reserved-memory something like below:
>
> => fdt list /reserved-memory/mmode_resv0
> mmode_resv0 at 30000 {
>         reg = <0x00000000 0x00030000 0x00000000 0x00010000>;
> };
> => fdt list /reserved-memory/mmode_resv1
> mmode_resv1 at 40000 {
>         reg = <0x00000000 0x00040000 0x00000000 0x00010000>;
> };
>
> We could add a no-map property to hint the kernel to carveout the
> local memory regions maybe?
>
> As we have no use case for ILM/DLM in Linux even mmap() access will be
> blocked to this region with this patch.

Having the no-map seems reasonable to me.  If someone figures out a use 
case for these we can always do something to make it work later, but 
that'll keep userspace from ending up with these regions mapped.

>
> Cheers,
> Prabhakar

