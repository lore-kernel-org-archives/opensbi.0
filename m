From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 11 Jan 2023 19:35:09 +0000
Subject: [PATCH] platform: generic: renesas: rzfive: Configure the Local
 memory regions as part of root domain
In-Reply-To: <mhng-4379345f-9cb9-49fa-8285-c07af3f443bb@palmer-ri-x1c9a>
References: <mhng-4379345f-9cb9-49fa-8285-c07af3f443bb@palmer-ri-x1c9a>
Message-ID: <36252D29-9FCD-4062-9618-21EC8C0F8BBF@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11 Jan 2023, at 19:18, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> 
> On Wed, 11 Jan 2023 02:15:11 PST (-0800), prabhakar.mahadev-lad.rj at bp.renesas.com wrote:
>> Renesas RZ/Five RISC-V SoC has Instruction local memory and Data local
>> memory (ILM & DLM) mapped between region 0x30000 - 0x4FFFF. When a
>> virtual address falls within this range, the MMU doesn't trigger a page
>> fault; it assumes the virtual address is a physical address which can
>> cause undesired behaviours for statically linked applications/libraries.
>> 
>> To avoid this, add the ILM/DLM memory regions to the root domain region
>> of the PMPU with permissions set to 0x0 so that any access to these
>> regions gets blocked.
>> 
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> ---
>> platform/generic/renesas/rzfive/rzfive.c | 18 ++++++++++++++++++
>> 1 file changed, 18 insertions(+)
>> 
>> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
>> index ca182e3..76f2d3a 100644
>> --- a/platform/generic/renesas/rzfive/rzfive.c
>> +++ b/platform/generic/renesas/rzfive/rzfive.c
>> @@ -5,8 +5,25 @@
>>  */
>> 
>> #include <platform_override.h>
>> +#include <sbi/sbi_domain.h>
> 
> I can't find sbi_domain, do you have pointer to whatever this depends on?
> 
>> #include <sbi_utils/fdt/fdt_helper.h>
>> 
>> +int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
>> +{
>> +	/*
>> +	 * Renesas RZ/Five RISC-V SoC has Instruction local memory and
>> +	 * Data local memory (ILM & DLM) mapped between region 0x30000
>> +	 * to 0x4FFFF. When a virtual address falls within this range,
>> +	 * the MMU doesn't trigger a page fault; it assumes the virtual
>> +	 * address is a physical address which can cause undesired
>> +	 * behaviours for statically linked applications/libraries. To
>> +	 * avoid this, add the ILM/DLM memory regions to the root domain
>> +	 * region of the PMPU with permissions set to 0x0 so that any
>> +	 * access to these regions gets blocked.
> 
> "blocked" means it traps with an invalid access exception?  If so we just need to make sure that somehow gets plumbed back in to userspace.
> 
>> +	 */
>> +	return sbi_domain_root_add_memrange(0x30000, 0x20000, 0x1000, 0x0);
> 
> Since I couldn't find the code, does this also hook into something (maybe memblock?) to prevent allocating this region?  Nothing we can do if userspace asks for the VAs specifically via mmap(), but we should at least avoid allocating them when we can do so.

sbi_domain_root_add_memrange is for reserving regions of the physical
address space and uses the PMP to enforce it (and adds the ranges to
/reserved-memory in the FDT). So this does nothing to affect anything
using virtual memory from mapping things with a VA in that range, and I
do wonder what happens with all the local memory stuff if you have a
virtual address outside the magic range that maps to a physical address
in the magic range (does that map to DRAM or also go to the local
memory)? Though I guess even if that does go to DRAM it?s worth
stopping anything that has translation turned off from inadvertently
using the local memory regions, even if it would waste a small amount
of DRAM. It?s going to be a fragile, buggy mess whatever gets done.

Jess

>> +}
>> +
>> static const struct fdt_match renesas_rzfive_match[] = {
>> 	{ .compatible = "renesas,r9a07g043f01" },
>> 	{ /* sentinel */ }
>> @@ -14,4 +31,5 @@ static const struct fdt_match renesas_rzfive_match[] = {
>> 
>> const struct platform_override renesas_rzfive = {
>> 	.match_table = renesas_rzfive_match,
>> +	.early_init = renesas_rzfive_early_init,
>> };
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


