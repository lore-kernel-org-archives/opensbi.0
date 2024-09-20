From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Sep 2024 11:01:13 +0530
Subject: [PATCH 0/8] Prepare memregion handling for future isolation primitives
In-Reply-To: <CAMqWt3qi+ZXRGNH=u4rR0X9Tqv8wt+5zUpoCfvjFkP1n8Rj5zA@mail.gmail.com>
References: <20240731181629.269898-1-gregorhaas1997@gmail.com>
 <CAAhSdy2c3Dorw+09Tf+BxPG-sQN=TEHCDOm7oMigVWnDn_8Fyg@mail.gmail.com> <CAMqWt3qi+ZXRGNH=u4rR0X9Tqv8wt+5zUpoCfvjFkP1n8Rj5zA@mail.gmail.com>
Message-ID: <CAAhSdy3FmKhOzSz+fE2w+HG0Hpb0B29zLdQ24RaCZOq2CFaA8g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 20, 2024 at 1:32?AM Gregor Haas <gregorhaas1997@gmail.com> wrote:
>
> Hi Anup,
>
> Thanks for your comments!
>
> On Wed, Sep 18, 2024 at 11:16?PM Anup Patel <anup@brainfault.org> wrote:
>>
>> On Wed, Jul 31, 2024 at 11:46?PM Gregor Haas <gregorhaas1997@gmail.com> wrote:
>> >
>> > The existing memregion handling code deeply embeds the assumption that we will
>> > be isolating domains using PMP/SMEPMP rather than another isolation primitive.
>> > I am currently working on a series of patches that will enable SMMTT [1] support
>> > in both OpenSBI and QEMU. SMMTT is a much more granular, table-based isolation
>> > primitive which does not have the same alignment/sizing requirements as PMP.
>> >
>> > This patch series lays some of the groundwork for landing SMMTT support in
>> > OpenSBI. Perhaps the most significant change here is that memregions now keep
>> > track of their raw sizes (rather than power-of-two rounded orders) throughout
>> > most of their lifetime. Then, when OpenSBI is about to apply its isolation
>> > configuration at the end of the coldboot/warmboot paths, the memregions for
>> > each domain are "sanitized" according to isolation primitive-specific rules.
>> >
>> > The first two patches in this series are optional to apply, although I've found
>> > them useful when developing SMMTT. The first moves the memregion-related
>> > functionality out of sbi_domain.c into a new sbi_memregion.c. The second renames
>> > struct sbi_domain_memregion to struct sbi_memregion, while also renaming all of
>> > the memregion permission macros similarly. This makes the code somewhat more
>> > readable, especially since domain-handling and memregion-handling become more
>> > decoupled throughout this patch series.
>> >
>> > [1] https://github.com/riscv/riscv-smmtt
>> >
>> > Gregor Haas (8):
>> >   lib: sbi: Separate domain-handling code from memregion-handling code
>> >   lib: sbi: Create sbi_domain_dump_memregions()
>> >   lib: sbi: Rename domain_memregion -> memregion
>>
>> I think it's better to keep the sbi_domain_ prefix for memregion in the filename
>> as well as functions/structures for consistency. The sbi_domain_context also
>> preserves the sbi_domain_ prefix
>
>
> Sounds good, I'll drop this change from my next revision. To clarify, are you
> okay with the first optional patch in this series
> (Separate domain-handling code from memregion-handling code)?

Yes, factoring-out sbi_domain_memregion to separate sources is fine.

>
>>
>> >   lib: sbi: memregion: Introduce memregion_start/end macros
>> >   lib: sbi: memregion: Make memregions keep track of raw size rather
>> >     than order
>>
>> We will be using multiple HW isolation mechanisms in the long run.
>> Please see more comments below.
>>
>> Converting range based memregions (start, end) into order-of-2
>> overlapping memregions on-the-fly for PMP and ePMP will be
>> painful for domain context switching.
>
>
> In my current patches, this conversion takes place in sbi_memregion_sanitize()
> which is called both in sbi_domain_sanitize() (although no conversion takes
> place here) and in sbi_hart_{sme}pmp_configure(), where conversion does happen
> since we now know which isolation primitive will be used. Currently, memregions
> are converted in-place. I can add some functionality here to detect whether the
> memregions have already been converted, and to return early if so. This would
> keep conversion out of the domain context-switching path, except for the first
> switch.

Instead of memregion conversion business, it's better to keep both the
NAPOT order and actual range in the memregion. Both these attributes
can be populated at the time of memregion registration. The HW isolation
mechanism can either pick the NAPOT order of the memregion or actual
range.

I would also insist that we preserve the merging business in
sbi_domain_sanitize() because the number of PMP regions on a
CPU are generally limited.

>
>>
>> It's better to stay with order-of-2 overlapping memregions and translate these
>>
>> to Smmtt table mappings.
>
>
> My main concern with this approach is that this conversion process is lossy --
> when we round into NAPOT, we often end up not only modifying the base address
> but also increasing the region's size. In SMMTT, this can have the effect of
> significantly increasing table memory utilization. Storing the region's full
> base+bounds information leads to more efficient resource utilization down the
> line.

On the contrary, I think it will benefit Smmtt without much impact on table
memory utilization because it is easy to map NAPOT regions to higher
order mappings in the Smmtt table.

Probably, there is no right answer here and it is better to keep both
information at the time of registering the memregions.

>
>>
>> >   lib: sbi: Do a merging pass on memregions whenever a domain is
>> >     sanitized
>> >   lib: sbi: Remove PMP assumptions from memregion
>> >   lib: sbi: memregion: Move memregion_sanitize_pmp() closer to its call
>> >     site
>>
>> The Smmtt only allows specifying permissions for S-mode domains
>> but we still need mechanisms (such as PMP, ePMP) to specify
>> permissions for M-mode firmware. This is for restricting M-mode
>> access to only specific parts of memory and IO. This means, we
>> will be having multiple HW insolation mechanisms which co-exists
>> in M-mode.
>
>
> I admit that I did not see this case :) it seems that we will need to, for each
> memregion, decide which isolation primitive should be used depending on the
> region's permissions and the available primitives. This is not something my
> patches currently do.
>
>>
>> My suggestion is the following:
>> 1) Introduce sbi_domain_isolation instance (or something similar) which
>> represents a HW isolation mechanism. The isolation mechanism will have
>> its own capabilities such as what kind of permission checks it can enforce.
>>
>> 2) There can be multiple sbi_domain_isolation instances (e.g. PMP, ePMP,
>> Smmtt, IOPMP, World Guard, etc). Some of these isolation mechanisms
>> are per-hart so need to be context switched when we switch domain
>> while other isolation mechanisms will be only for IOs.
>> 3) Convert existing PMP and ePMP implementation into a per-hart
>> sbi_domain_isolation instance.
>
>
> Something like:
>
> struct sbi_domain_isolation {
>     unsigned long supported_flags;
>     bool per_hart;
>     int (*sanitize)(struct sbi_domain_memregion *);
>     bool (*region_valid)(struct sbi_domain_memregion *);
> };
>
> And then use the existing carray machinery to separate out isolation
> implementations into individual source files?

The carray machinery might not be required if we initially focus only
on PMP/ePMP and Smmtt because both are ISA features which can
be detected at boot-time. For example, if PMP/ePMP is available then
sbi_hart_init() can register PMP/ePMP isolation in the coldboot init path.

I am thinking something like below ...

struct sbi_domain_isolation {
    struct sbi_dlist head; /* For adding to list of registered
isolation mech. */
    const char *name: /* For boot-time advertising registered isolation mech. */
    bool per_hart;
    unsigned long supported_flags; /* Capabilities */
    int (*setup)(struct sbi_domain *dom); /* Called once when a domain
is registered */
    void (*cleanup)(struct sbi_domain *dom); /* Called once when a
domain is unregis. */
    int (*switch)(struct sbi_domain *next, struct sbi_domain *prev);
                                  /* prev = NULL means we are
configuring at boot-time */
    int (*map_smode)(unsigned long base, unsigned long size);
    int (*unmap_smode(void);
         /* map_smode()/unmap_smode() is used for temporary mapping
some s-mode area */
};

>
>>
>> 4) Implement Smmtt as yet another per-hart sbi_domain_isolation
>> instance with different capabilities compared to PMP and ePMP. This
>> Smmtt isolation mechanism will translate order-of-2 regions to mappings
>> in the Smmtt table. Each domain will have a separate smmtt table so
>> for domain context switch, we only need to switch the Smmtt table
>> pointer.
>
>
> This makes sense to me, but again -- I think it would be worth it to carry around
> the unrounded memregion information until this point so that we can use table
> memory as efficiently as possible.

I sort of agree but see above comments.

>
>>
>> >
>> >  docs/domain_support.md                   |  45 ++-
>> >  include/sbi/sbi_domain.h                 | 192 +---------
>> >  include/sbi/sbi_hart.h                   |   2 +-
>> >  include/sbi/sbi_memregion.h              | 215 +++++++++++
>> >  include/sbi/sbi_platform.h               |   2 +-
>> >  lib/sbi/objects.mk                       |   1 +
>> >  lib/sbi/sbi_domain.c                     | 444 +++-------------------
>> >  lib/sbi/sbi_domain_context.c             |   2 +-
>> >  lib/sbi/sbi_hart.c                       |  91 +++--
>> >  lib/sbi/sbi_init.c                       |   6 +-
>> >  lib/sbi/sbi_memregion.c                  | 459 +++++++++++++++++++++++
>> >  lib/utils/fdt/fdt_domain.c               |  53 +--
>> >  lib/utils/fdt/fdt_fixup.c                |  20 +-
>> >  lib/utils/ipi/aclint_mswi.c              |  12 +-
>> >  lib/utils/ipi/andes_plicsw.c             |   6 +-
>> >  lib/utils/irqchip/aplic.c                |  12 +-
>> >  lib/utils/irqchip/imsic.c                |  13 +-
>> >  lib/utils/irqchip/plic.c                 |   4 +-
>> >  lib/utils/regmap/fdt_regmap_syscon.c     |   4 +-
>> >  lib/utils/serial/cadence-uart.c          |   4 +-
>> >  lib/utils/serial/fdt_serial_htif.c       |   4 +-
>> >  lib/utils/serial/uart8250.c              |   4 +-
>> >  lib/utils/timer/aclint_mtimer.c          |  24 +-
>> >  lib/utils/timer/andes_plmt.c             |   6 +-
>> >  platform/generic/renesas/rzfive/rzfive.c |   2 +-
>> >  platform/generic/sophgo/sg2042.c         |   6 +-
>> >  26 files changed, 910 insertions(+), 723 deletions(-)
>> >  create mode 100644 include/sbi/sbi_memregion.h
>> >  create mode 100644 lib/sbi/sbi_memregion.c
>> >
>> > --
>> > 2.45.2
>> >
>> >
>> > --
>> > opensbi mailing list
>> > opensbi at lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/opensbi
>>
>> Regards,
>> Anup
>
>
> Looking forward to your response!
>

Thinking about this more, we will also need some infrastructure in
sbi_domain to allow different parts of OpenSBI to save per-domain
data. The HW isolation mechanisms might also want to save stuff
on a per-domain basis. I will try to send this as a separate series.

Regards,
Anup

