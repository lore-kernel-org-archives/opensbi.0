From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Wed, 11 Jan 2023 23:53:14 +0000
Subject: [PATCH] platform: generic: renesas: rzfive: Configure the Local
 memory regions as part of root domain
In-Reply-To: <36252D29-9FCD-4062-9618-21EC8C0F8BBF@jrtc27.com>
References: <mhng-4379345f-9cb9-49fa-8285-c07af3f443bb@palmer-ri-x1c9a> <36252D29-9FCD-4062-9618-21EC8C0F8BBF@jrtc27.com>
Message-ID: <CA+V-a8sZ45_gXvDUk7AFN6ZdHMOs71hi+rKf5pRRdK0HOw-CSA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 11, 2023 at 7:35 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 11 Jan 2023, at 19:18, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Wed, 11 Jan 2023 02:15:11 PST (-0800), prabhakar.mahadev-lad.rj at bp.renesas.com wrote:
> >> Renesas RZ/Five RISC-V SoC has Instruction local memory and Data local
> >> memory (ILM & DLM) mapped between region 0x30000 - 0x4FFFF. When a
> >> virtual address falls within this range, the MMU doesn't trigger a page
> >> fault; it assumes the virtual address is a physical address which can
> >> cause undesired behaviours for statically linked applications/libraries.
> >>
> >> To avoid this, add the ILM/DLM memory regions to the root domain region
> >> of the PMPU with permissions set to 0x0 so that any access to these
> >> regions gets blocked.
> >>
> >> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> ---
> >> platform/generic/renesas/rzfive/rzfive.c | 18 ++++++++++++++++++
> >> 1 file changed, 18 insertions(+)
> >>
> >> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> >> index ca182e3..76f2d3a 100644
> >> --- a/platform/generic/renesas/rzfive/rzfive.c
> >> +++ b/platform/generic/renesas/rzfive/rzfive.c
> >> @@ -5,8 +5,25 @@
> >>  */
> >>
> >> #include <platform_override.h>
> >> +#include <sbi/sbi_domain.h>
> >
> > I can't find sbi_domain, do you have pointer to whatever this depends on?
> >
> >> #include <sbi_utils/fdt/fdt_helper.h>
> >>
> >> +int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
> >> +{
> >> +    /*
> >> +     * Renesas RZ/Five RISC-V SoC has Instruction local memory and
> >> +     * Data local memory (ILM & DLM) mapped between region 0x30000
> >> +     * to 0x4FFFF. When a virtual address falls within this range,
> >> +     * the MMU doesn't trigger a page fault; it assumes the virtual
> >> +     * address is a physical address which can cause undesired
> >> +     * behaviours for statically linked applications/libraries. To
> >> +     * avoid this, add the ILM/DLM memory regions to the root domain
> >> +     * region of the PMPU with permissions set to 0x0 so that any
> >> +     * access to these regions gets blocked.
> >
> > "blocked" means it traps with an invalid access exception?  If so we just need to make sure that somehow gets plumbed back in to userspace.
> >
> >> +     */
> >> +    return sbi_domain_root_add_memrange(0x30000, 0x20000, 0x1000, 0x0);
> >
> > Since I couldn't find the code, does this also hook into something (maybe memblock?) to prevent allocating this region?  Nothing we can do if userspace asks for the VAs specifically via mmap(), but we should at least avoid allocating them when we can do so.
>
> sbi_domain_root_add_memrange is for reserving regions of the physical
> address space and uses the PMP to enforce it (and adds the ranges to
> /reserved-memory in the FDT). So this does nothing to affect anything
> using virtual memory from mapping things with a VA in that range,
So If the userspace tries to map virtual memory in that range and
tries to access this region it still falls in the signal trap (11). Ie
for example consider a statical compiled application where the virtual
memory region falls in the range of this local memory when it tries do
a va-> pa conversion of say va = 0x30000 the pa will be 0x30000 and
that is where the PMP kicks is in and causes a signal trap:

See for example below where the statically compiled app fails:
[11242.998276] do_trap: 3 callbacks suppressed
[11242.998298] security-static[191]: unhandled signal 11 code 0x2 at
0x0000000000040be8 in security-static[40000+6c000]
[11243.013085] CPU: 0 PID: 191 Comm: security-static Not tainted
6.2.0-rc1-00124-g11313d81178f-dirty #286
[11243.022379] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
[11243.028988] epc : 0000000000040be8 ra : 0000000000040954 sp :
0000003ffb8be9d0
[11243.036205]  gp : 00000000000af0d0 tp : 0000003fbf412720 t0 :
0000000000000000
[11243.043428]  t1 : 0000002ab2e60bbc t2 : 00000000000003ff s0 :
0000000000040d66
[11243.050644]  s1 : 0000000000040df6 a0 : 00000000000acff0 a1 :
000000000000004d
[11243.057869]  a2 : 0000000000000007 a3 : 00000000000401c8 a4 :
0000000000000007
[11243.065086]  a5 : 0000000000040040 a6 : 0000000000000000 a7 :
0000003ffb8bee09
[11243.072299]  s2 : 00000000000403b0 s3 : 00000000000ade60 s4 :
00000000000403b0
[11243.079513]  s5 : 0000002ab2f54e70 s6 : 0000002ab2f54b60 s7 :
0000002ab2f54880
[11243.086727]  s8 : 0000002ab2f54b00 s9 : 0000000000000000 s10:
0000002ab2f11584
[11243.093941]  s11: 0000000000000000 t3 : 0000003fbf495e18 t4 :
000000000000000f
[11243.101156]  t5 : 000000000000000f t6 : 0000000000000000
[11243.106467] status: 0000000200004020 badaddr: 0000000000040040
cause: 0000000000000005
[11243.125035] audit: type=1701 audit(1673025202.983:11):
auid=4294967295 uid=0 gid=0 ses=4294967295 pid=191
comm="security-static" exe="/home/root/security-static" sig=11 res=1
Segmentation fault

badaddr: 0000000000040040 falls in local memory region.
^^^

> and I do wonder what happens with all the local memory stuff if you have a
> virtual address outside the magic range that maps to a physical address
> in the magic range (does that map to DRAM or also go to the local
> memory)?
That's basically devmem2. So if you try to mmap the local memory
region without this patch the va should be the same as pa only then
you do a read/write.

With this patch being applied PMP kicks in and we cannot mmap local
memory regions.

Cheers,
Prabhakar

