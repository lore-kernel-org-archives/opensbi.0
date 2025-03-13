From: Raj Vishwanathan <raj.vishwanathan@gmail.com>
Date: Thu, 13 Mar 2025 10:53:38 -0700
Subject: [PATCH v4] Set the scratch allocation to alignment to cacheline size.
In-Reply-To: <bf38333b8b090b8988aee430728a7b28aa3d170f.camel@126.com>
References: <20250127202017.1043240-1-Raj.Vishwanathan@gmail.com>
 <20250309144417.36572-1-Raj.Vishwanathan@gmail.com> <bf38333b8b090b8988aee430728a7b28aa3d170f.camel@126.com>
Message-ID: <CA+-5cKc9Bps-=3KX5WreS9RhCDLEip9H=rJtLk-MN8=8Xv51kw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Xiang, Anup and Samuel

Please let me know if you think any other changes need to be done.
Otherwise I will make the changes suggested by Xiang and send an
updated patch.

Many thanks for all your reviews and suggestions.

Raj

On Sun, Mar 9, 2025 at 10:27?PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2025-03-09?? 07:44 -0700?Raj Vishwanathan???
> > We set the scratch allocation alignment to cacheline size,specified by
> > riscv,cbom-block-size in the dts file to avoid two atomic variables from
> > the same cache line causing livelock on some platforms. If the cacheline
> > is not specified, we set it a default value.
> >
> > Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
> > ---
> > Changes in V3:
> >     Remove platform specific references to 64 Bytes.
> > Changes in V2:
> >     Added a new configuration to get the alignment size.
> > Change in V1:
> >     Original Patch
> > ---
> >  include/sbi/sbi_platform.h         |  2 ++
> >  include/sbi_utils/fdt/fdt_helper.h |  1 +
> >  lib/sbi/sbi_scratch.c              | 34 ++++++++++++++++++++++++++++--
> >  lib/utils/fdt/fdt_helper.c         | 24 +++++++++++++++++++++
> >  platform/generic/platform.c        |  9 ++++++++
> >  5 files changed, 68 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> > index 6d5fbc7..0cea0fe 100644
> > --- a/include/sbi/sbi_platform.h
> > +++ b/include/sbi/sbi_platform.h
> > @@ -197,6 +197,8 @@ struct sbi_platform {
> >        * 2. HART id < SBI_HARTMASK_MAX_BITS
> >        */
> >       const u32 *hart_index2id;
> > +     /** Allocation alignment for Scratch */
> > +     u32 cbom_block_size;
> >  };
> >
> >  /**
> > diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> > index 7329b84..0b82159 100644
> > --- a/include/sbi_utils/fdt/fdt_helper.h
> > +++ b/include/sbi_utils/fdt/fdt_helper.h
> > @@ -55,6 +55,7 @@ bool fdt_node_is_enabled(const void *fdt, int nodeoff);
> >
> >  int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid);
> >
> > +int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, u32 *cbom_block_size);
> >  int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid);
> >
> >  int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
> > diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> > index ccbbc68..8df54cc 100644
> > --- a/lib/sbi/sbi_scratch.c
> > +++ b/lib/sbi/sbi_scratch.c
> > @@ -14,6 +14,8 @@
> >  #include <sbi/sbi_scratch.h>
> >  #include <sbi/sbi_string.h>
> >
> > +#define DEFAULT_SCRATCH_ALLOC_ALIGN __SIZEOF_POINTER__
> > +
> >  u32 last_hartindex_having_scratch = 0;
> >  u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
> >  struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
> > @@ -21,6 +23,27 @@ struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0
> >  static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
> >  static unsigned long extra_offset = SBI_SCRATCH_EXTRA_SPACE_OFFSET;
> >
> > +static u32 sbi_get_scratch_alloc_align(void)
> > +{
> > +     struct sbi_scratch *rscratch;
> > +     const struct sbi_platform *plat;
> > +     u32 hartid;
> > +     u32 hart_index;
> > +     /*
> > +      * Get the alignment size. We will return DEFAULT_SCRATCH_ALLOC_ALIGNMENT
> > +      * or riscv,cbom_block_size
> > +      */
> > +     hartid = current_hartid();
> > +     hart_index = sbi_hartid_to_hartindex(hartid);
> > +     rscratch = sbi_hartindex_to_scratch(hart_index);
> > +     if (!rscratch)
> > +             return DEFAULT_SCRATCH_ALLOC_ALIGN;
> > +     plat = sbi_platform_ptr(rscratch);
> plat can be directly obtained through sbi_platform_thishart_ptr
>
> Regards,
> Xiang W
> > +     if (!plat)
> > +             return DEFAULT_SCRATCH_ALLOC_ALIGN;
> > +     return plat->cbom_block_size ? plat->cbom_block_size : \
> > +                                                                     DEFAULT_SCRATCH_ALLOC_ALIGN;
> > +}
> >  u32 sbi_hartid_to_hartindex(u32 hartid)
> >  {
> >       u32 i;
> > @@ -57,6 +80,7 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
> >       void *ptr;
> >       unsigned long ret = 0;
> >       struct sbi_scratch *rscratch;
> > +     u32 scratch_alloc_align = 0;
> >
> >       /*
> >        * We have a simple brain-dead allocator which never expects
> > @@ -70,8 +94,14 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
> >       if (!size)
> >               return 0;
> >
> > -     size += __SIZEOF_POINTER__ - 1;
> > -     size &= ~((unsigned long)__SIZEOF_POINTER__ - 1);
> > +     scratch_alloc_align = sbi_get_scratch_alloc_align();
> > +
> > +     /*
> > +     * We let the allocation align to cacheline bytes to avoid livelock on
> > +     * certain platforms due to atomic variables from the same cache line.
> > +     */
> > +    size += scratch_alloc_align - 1;
> > +    size &= ~((unsigned long)scratch_alloc_align - 1);
> >
> >       spin_lock(&extra_lock);
> >
> > diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> > index cb350e5..bea4fdc 100644
> > --- a/lib/utils/fdt/fdt_helper.c
> > +++ b/lib/utils/fdt/fdt_helper.c
> > @@ -287,6 +287,30 @@ int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid)
> >
> >       return 0;
> >  }
> > +int fdt_parse_cbom_block_size(const void *fdt,int cpu_offset,u32 *cbom_block_size)
> > +{
> > +    int len;
> > +    const void *prop;
> > +    const fdt32_t *val;
> > +
> > +    if (!fdt || cpu_offset < 0)
> > +        return SBI_EINVAL;
> > +
> > +    prop = fdt_getprop(fdt, cpu_offset, "device_type", &len);
> > +    if (!prop || !len)
> > +        return SBI_EINVAL;
> > +    if (strncmp (prop, "cpu", strlen ("cpu")))
> > +        return SBI_EINVAL;
> > +
> > +    val = fdt_getprop(fdt, cpu_offset, "riscv,cbom-block-size", &len);
> > +    if (!val || len < sizeof(fdt32_t))
> > +        return SBI_EINVAL;
> > +
> > +    if (cbom_block_size)
> > +        *cbom_block_size = fdt32_to_cpu(*val);
> > +    return 0;
> > +
> > +}
> >
> >  int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid)
> >  {
> > diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> > index c03ed88..53abf0b 100644
> > --- a/platform/generic/platform.c
> > +++ b/platform/generic/platform.c
> > @@ -174,6 +174,9 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
> >       const void *fdt = (void *)arg1;
> >       u32 hartid, hart_count = 0;
> >       int rc, root_offset, cpus_offset, cpu_offset, len;
> > +     u32 cbom_block_size = __SIZEOF_POINTER__;
> > +     u32 tmp;
> > +
> >
> >       root_offset = fdt_path_offset(fdt, "/");
> >       if (root_offset < 0)
> > @@ -207,11 +210,17 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
> >                       continue;
> >
> >               generic_hart_index2id[hart_count++] = hartid;
> > +             rc = fdt_parse_cbom_block_size(fdt, cpu_offset,&tmp);
> > +             if (rc)
> > +                     continue;
> > +             tmp = tmp ? tmp : __SIZEOF_POINTER__;
> > +             cbom_block_size = MAX(tmp,cbom_block_size);
> >       }
> >
> >       platform.hart_count = hart_count;
> >       platform.heap_size = fw_platform_get_heap_size(fdt, hart_count);
> >       platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
> > +     platform.cbom_block_size = cbom_block_size;
> >
> >       fw_platform_coldboot_harts_init(fdt);
> >
> > --
> > 2.43.0
> >
>

