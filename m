From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 10 May 2021 18:12:54 -0700
Subject: [RFC 11/14] utils: fdt: Add fdt helper functions to parse PMU DT
 nodes
In-Reply-To: <DM6PR04MB62011586F78E97B189D608198D499@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20210319221305.2138412-1-atish.patra@wdc.com>
 <20210319221305.2138412-12-atish.patra@wdc.com>
 <DM6PR04MB62011586F78E97B189D608198D499@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <CAOnJCUKgV6Tm4Fn=vCd_vQNSC4143tufnzR3UNXJFYirCyMAiA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 19, 2021 at 5:19 AM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Atish Patra <atish.patra@wdc.com>
> > Sent: 20 March 2021 03:43
> > To: opensbi at lists.infradead.org
> > Cc: Atish Patra <Atish.Patra@wdc.com>; Anup Patel <Anup.Patel@wdc.com>
> > Subject: [RFC 11/14] utils: fdt: Add fdt helper functions to parse PMU DT
> > nodes
> >
> > The PMU DT node bindings are defined in docs/pmu_support.md Add few
> > fdt helper functions to parse the DT node and update the event-counter
> > mapping tables.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  include/sbi_utils/fdt/fdt_pmu.h |  46 +++++++++++++
> >  lib/utils/fdt/fdt_fixup.c       |   2 +
> >  lib/utils/fdt/fdt_pmu.c         | 110 ++++++++++++++++++++++++++++++++
> >  lib/utils/fdt/objects.mk        |   1 +
> >  4 files changed, 159 insertions(+)
> >  create mode 100644 include/sbi_utils/fdt/fdt_pmu.h  create mode 100644
> > lib/utils/fdt/fdt_pmu.c
> >
> > diff --git a/include/sbi_utils/fdt/fdt_pmu.h
> > b/include/sbi_utils/fdt/fdt_pmu.h new file mode 100644 index
> > 000000000000..2fa01edc0743
> > --- /dev/null
> > +++ b/include/sbi_utils/fdt/fdt_pmu.h
> > @@ -0,0 +1,46 @@
> > +// SPDX-License-Identifier: BSD-2-Clause
> > +/*
> > + * fdt_pmu.c - Flat Device Tree PMU helper routines
> > + *
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + *
> > + * Authors:
> > + *   Atish Patra <atish.patra@wdc.com>
> > + */
> > +
> > +#ifndef __FDT_PMU_H__
> > +#define __FDT_PMU_H__
> > +
> > +#include <sbi/sbi_types.h>
> > +
> > +/**
> > + * Fix up the PMU node in the device tree
> > + *
> > + * This routine:
> > + * 1. Disables opensbi specific properties from the DT
> > + *
> > + * It is recommended that platform support call this function in
> > + * their final_init() platform operation.
> > + *
> > + * @param fdt device tree blob
> > + */
> > +void fdt_pmu_fixup(void *fdt);
> > +
> > +/**
> > + * Setup PMU data from device tree
> > + *
> > + * @param fdt device tree blob
> > + *
> > + * @return 0 on success and negative error code on failure  */ int
> > +fdt_pmu_setup(void *fdt);
> > +
> > +/**
> > + * Get the mhpmevent select value read from DT for a given event
> > + * @param event_idx Event ID of the given event
> > + *
> > + * @return The select value read from DT or 0 if given index was not
> > +found  */ uint64_t fdt_pmu_get_select_value(uint32_t event_idx);
> > +
> > +#endif
> > diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c index
> > eea450d80492..ab351e408c86 100644
> > --- a/lib/utils/fdt/fdt_fixup.c
> > +++ b/lib/utils/fdt/fdt_fixup.c
> > @@ -15,6 +15,7 @@
> >  #include <sbi/sbi_scratch.h>
> >  #include <sbi/sbi_string.h>
> >  #include <sbi_utils/fdt/fdt_fixup.h>
> > +#include <sbi_utils/fdt/fdt_pmu.h>
> >  #include <sbi_utils/fdt/fdt_helper.h>
> >
> >  void fdt_cpu_fixup(void *fdt)
> > @@ -260,6 +261,7 @@ void fdt_fixups(void *fdt)
> >       fdt_plic_fixup(fdt, "riscv,plic0");
> >
> >       fdt_reserved_memory_fixup(fdt);
> > +     fdt_pmu_fixup(fdt);
> >  }
> >
> >
> > diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c new file mode
> > 100644 index 000000000000..5053ab7568d8
> > --- /dev/null
> > +++ b/lib/utils/fdt/fdt_pmu.c
> > @@ -0,0 +1,110 @@
> > +// SPDX-License-Identifier: BSD-2-Clause
> > +/*
> > + * fdt_pmu.c - Flat Device Tree PMU helper routines
> > + *
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + *
> > + * Authors:
> > + *   Atish Patra <atish.patra@wdc.com>
> > + */
> > +
> > +#include <libfdt.h>
> > +#include <sbi/sbi_error.h>
> > +#include <sbi/sbi_pmu.h>
> > +#include <sbi_utils/fdt/fdt_helper.h>
> > +
> > +struct sbi_pmu_hw_event_select {
>
> Rename this to "fdt_pmu_hw_event_select"
>

Done.

> > +     uint32_t eidx;
> > +     uint64_t select;
> > +};
> > +
> > +static struct sbi_pmu_hw_event_select
> > +fdt_pmu_evt_select[SBI_PMU_HW_EVENT_MAX] = {0}; static uint32_t
> > +hw_event_count;
>
> You can have array size more than SBI_PMU_HW_EVENT_MAX
> because unlike generic code here it is mapping each event_idx
> to it's event selector.
>
> Maybe have separate define FDT_PMU_HW_EVENT_MAX ??
>

Sure. How about defining FDT_PMU_HW_EVENT_MAX as 2 * SBI_PMU_HW_EVENT_MAX.

> > +
> > +uint64_t fdt_pmu_get_select_value(uint32_t event_idx) {
> > +     int i;
> > +     struct sbi_pmu_hw_event_select *event;
> > +
> > +     for (i = 0; i < SBI_PMU_HW_EVENT_MAX; i++) {
> > +             event = &fdt_pmu_evt_select[i];
>
> In future, we can have keep the array sorted and do
> binary search instead of sequential comparison.
>

Sure.

> > +             if (event->eidx == event_idx)
> > +                     return event->select;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +int fdt_pmu_fixup(void *fdt)
> > +{
> > +     int pmu_offset;
> > +
> > +     if (!fdt)
> > +             return SBI_EINVAL;
> > +
> > +     pmu_offset = fdt_node_offset_by_compatible(fdt, -1, "riscv,pmu");
> > +     if (pmu_offset < 0)
> > +             return SBI_EFAIL;
> > +
> > +     fdt_delprop(fdt, pmu_offset, "opensbi,event-to-counters");
> > +     fdt_delprop(fdt, pmu_offset, "opensbi,event-to-mhpmevent");
> > +     fdt_delprop(fdt, pmu_offset, "opensbi,raw-event-to-counters");
> > +
> > +     return 0;
> > +}
> > +
> > +int fdt_pmu_setup(void *fdt)
> > +{
> > +     int i, pmu_offset, len, result;
> > +     const u32 *event_val;
> > +     const u32 *event_ctr_map;
> > +     struct sbi_pmu_hw_event_select *event;
> > +     u32 event_idx_start, event_idx_end, ctr_map;
> > +
> > +     if (!fdt)
> > +             return SBI_EINVAL;
> > +
> > +     pmu_offset = fdt_node_offset_by_compatible(fdt, -1, "riscv,pmu");
> > +     if (pmu_offset < 0)
> > +             return SBI_EFAIL;
> > +
> > +     event_ctr_map = fdt_getprop(fdt, pmu_offset, "opensbi,event-to-
> > counters", &len);
> > +     if (!event_ctr_map || len < 8)
> > +             return SBI_EFAIL;
> > +     len = len / (sizeof(u32) * 3);
> > +     for (i = 0; i < len; i++) {
> > +             event_idx_start = fdt32_to_cpu(event_ctr_map[3 * i]);
> > +             event_idx_end = fdt32_to_cpu(event_ctr_map[3 * i + 1]);
> > +             ctr_map = fdt32_to_cpu(event_ctr_map[3 * i + 2]);
> > +             sbi_pmu_add_hw_event_counter_map(event_idx_start,
> > event_idx_end, ctr_map);
> > +     }
> > +
> > +     event_val = fdt_getprop(fdt, pmu_offset, "opensbi,event-to-
> > mhpmevent", &len);
> > +     if (!event_val || len < 8)
> > +             return SBI_EFAIL;
> > +     len = len / (sizeof(u32) * 3);
> > +     for (i = 0; i < len; i++) {
> > +             event = &fdt_pmu_evt_select[hw_event_count];
> > +             event->eidx = fdt32_to_cpu(event_val[3 * i]);
> > +             event->select = fdt32_to_cpu(event_val[3 * i + 1]);
> > +             event->select = (event->select << 32) |
> > fdt32_to_cpu(event_val[3 * i + 2]);
> > +             hw_event_count++;
> > +     }
> > +
> > +     event_val = fdt_getprop(fdt, pmu_offset, "opensbi,raw-event-to-
> > counters", &len);
> > +     if (!event_val || len < 8)
> > +             return SBI_EFAIL;
> > +     len = len / (sizeof(u32) * 3);
> > +     for (i = 0; i < len; i++) {
> > +             event = &fdt_pmu_evt_select[hw_event_count];
>
> I think you don't need to add RAW event selectors to
> Fdt_pmu_evt_select[] array because you are already registering
> selector value with generic code.
>

Correct. I have removed it.

> > +             event->eidx = SBI_PMU_EVENT_RAW_IDX;
> > +             event->select = fdt32_to_cpu(event_val[3 * i]);
> > +             event->select = (event->select << 32) |
> > fdt32_to_cpu(event_val[3 * i + 1]);
> > +             ctr_map = fdt32_to_cpu(event_val[3 * i + 2]);
> > +             result = sbi_pmu_add_raw_event_counter_map(event-
> > >select, ctr_map);
> > +             if (!result)
> > +                     hw_event_count++;
> > +     }
> > +
> > +     return 0;
> > +}
> > diff --git a/lib/utils/fdt/objects.mk b/lib/utils/fdt/objects.mk index
> > d9f1eae19292..03800f96d74d 100644
> > --- a/lib/utils/fdt/objects.mk
> > +++ b/lib/utils/fdt/objects.mk
> > @@ -5,5 +5,6 @@
> >  #
> >
> >  libsbiutils-objs-y += fdt/fdt_domain.o
> > +libsbiutils-objs-y += fdt/fdt_pmu.o
> >  libsbiutils-objs-y += fdt/fdt_helper.o
> >  libsbiutils-objs-y += fdt/fdt_fixup.o
> > --
> > 2.25.1
>
> Regards,
> Anup
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

