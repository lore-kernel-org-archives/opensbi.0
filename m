From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Dec 2021 11:37:42 +0530
Subject: [PATCH v3] lib: pmu: support the event ID encoded by a bitmap.
In-Reply-To: <20211130223751.359747-1-atishp@rivosinc.com>
References: <20211130223751.359747-1-atishp@rivosinc.com>
Message-ID: <CAAhSdy3PMCbDtsKgOsQRUGFZ9NMMzVMQ0FckLu4Hq9W1zRFeCA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 1, 2021 at 4:10 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> From: Vincent Chen <vincent.chen@sifive.com>
>
> RISC-V privilege specification does not specify how to encode the event ID.
> Therefore, each platform is allowed to customize its own encoding rule.
> The common encoding methods are as follow, directly assigning a number to an
> event, or every bit in the mphmevent CSR controls one specified event or
> mixes the above two methods.
>
> To enable OpenSBI to support the above three encoding methods simultaneously,
> this patch modifies the content of "pmu,raw-event-to-mhpmcounters". The

Replace "pmu,raw-event-to-mhpmcounters" with "riscv,raw-event-to-mhpmcounters"

> "riscv,raw-event-to-mhpmcounters" still describes the one or multiple raw
> events that could be counted by which mhpmcounters. But, the column number
> of "pmu,raw-event-to-mhpmcounters" is extended from 2 to 3. The 1st column

Replace "pmu,raw-event-to-mhpmcounters" with "riscv,raw-event-to-mhpmcounters"

> (64bit) is the ID of the raw events. The 2nd column (64bit) is select_mask.
> It indicates which bits in the 1st column are encoded by a number. If a
> platform directly encodes each PMU event as a different number, in this
> case, the value of select_mask will be 0xffffffff_ffffffff. For the other
> extreme case, if a platform specified the 64 bits of mhpmevent to control
> 64 different monitor event, in this case, the value of select_mask will be
> zero. The 3rd column(32bit) is the counter map used to describe which
> mhpmcounters support the raw events. All the modifications in this patch
> are all based on the above change in "pmu,raw-event-to-mhpmcounters".

Replace "pmu,raw-event-to-mhpmcounters" with "riscv,raw-event-to-mhpmcounters"

>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Atish Patra<atishp@rivosinc.com>
> ---
> Changes from v2->v3:
> 1. Rebased on top of the master which changed the dt property prefix to riscv.
> 2. Fixed typos.
> ---
> ---
>  docs/pmu_support.md     | 22 ++++++++++++++--------
>  include/sbi/sbi_pmu.h   |  2 +-
>  lib/sbi/sbi_pmu.c       | 35 +++++++++++++++++++++++++----------
>  lib/utils/fdt/fdt_pmu.c | 16 +++++++++-------
>  4 files changed, 49 insertions(+), 26 deletions(-)
>
> diff --git a/docs/pmu_support.md b/docs/pmu_support.md
> index a60b75cf9efa..fdd1e05e3e5c 100644
> --- a/docs/pmu_support.md
> +++ b/docs/pmu_support.md
> @@ -50,12 +50,18 @@ event-to-mhpmevent is present. Otherwise, it can be omitted. This property
>  shouldn't encode any raw event.
>
>  * **riscv,raw-event-to-mhpmcounters**(Optional) - It represents an ONE-to-MANY
> -mapping between a raw event and all the MHPMCOUNTERx in a bitmap format that can
> -be used to monitor that raw event. The information is encoded in a table format
> -where each raw represent a specific raw event. The first column stores the
> -expected event selector value that should be encoded in the expected value to be
> -written in MHPMEVENTx. The second column stores a bitmap of all the MHPMCOUNTERx
> -that can be used for monitoring the specified event.
> +or MANY-to-MANY mapping between the raw event(s) and all the MHPMCOUNTERx in
> +a bitmap format that can be used to monitor that raw event, which depends on
> +how the platform encodes the monitor events. Currently, only the following three
> +encoding methods are supported, encoding each event as a number, using a bitmap
> +to encode monitor events, and mixing the previous two methods. The information
> +is encoded in a table format where each row represent the specific raw event(s).
> +The first and second column represents a selector value, which probably means a

This should be:
"... The first column represents a 64-bit selector value, which probably ..."

> +monitor event ID (encoded by a number) or an event set (encoded by a bitmap).
> +To correctly decode this selector value, each platform needs to define a
> +select_mask in the third and fourth column to indicate which bits of the

This should be:
"... 64-bit select_mask in the second column to indicate which bits ..."

> +selector value are encoded by a number. The fifth column stores a bitmap of all
> +the MHPMCOUNTERx that can be used for monitoring the specified event(s).
>
>  *Note:* A platform may choose to provide the mapping between event & counters
>  via platform hooks rather than the device tree.
> @@ -72,8 +78,8 @@ pmu {
>                                                   <0x00002 0x00002 0x00000004>,
>                                                   <0x00003 0x0000A 0x00000ff8>,
>                                                   <0x10000 0x10033 0x000ff000>,
> -       riscv,raw-event-to-mhpmcounters         = <0x0000 0x0002 0x00000f8>,
> -                                         <0x0000 0x0003 0x00000ff0>,
> +       riscv,raw-event-to-mhpmcounters = <0x0000 0x0002 0xffffffff 0xffffffff 0x00000f8>,
> +                                         <0x0000 0x0003 0xffffffff 0xffffffff 0x00000ff0>,
>  };
>
>  ```
> diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> index f0185566cd6d..6a1c62ccfbef 100644
> --- a/include/sbi/sbi_pmu.h
> +++ b/include/sbi/sbi_pmu.h
> @@ -51,7 +51,7 @@ int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap);
>   * @return 0 on success, error otherwise.
>   */
>
> -int sbi_pmu_add_raw_event_counter_map(uint64_t select, u32 cmap);
> +int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t select_mask, u32 cmap);
>
>  int sbi_pmu_ctr_read(uint32_t cidx, unsigned long *cval);
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 5950a2001637..cd5e6397fa21 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -23,6 +23,13 @@ struct sbi_pmu_hw_event {
>         uint32_t end_idx;
>         /* Event selector value used only for raw events */
>         uint64_t select;
> +       /* A event selector value may be formed by a number and
> +        * a bitmap. The select_mask is used to indicate which bits
> +        * are encoded by a number. When the value of select_mask
> +        * is zero, it means that the select value is all encoded by
> +        * a bitmap.
> +        */

This comment block is not aligned with the use of select_mask.

> +       uint64_t select_mask;
>  };
>
>  /** Representation of a firmware event */
> @@ -91,9 +98,9 @@ static bool pmu_event_range_overlap(struct sbi_pmu_hw_event *evtA,
>  }
>
>  static bool pmu_event_select_overlap(struct sbi_pmu_hw_event *evt,
> -                                    uint64_t select_val)
> +                                    uint64_t select_val, uint64_t select_mask)
>  {
> -       if (evt->select == select_val)
> +       if ((evt->select == select_val) && (evt->select_mask == select_mask))
>                 return TRUE;
>
>         return FALSE;
> @@ -168,7 +175,7 @@ int sbi_pmu_ctr_read(uint32_t cidx, unsigned long *cval)
>  }
>
>  static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
> -                               uint64_t select)
> +                               uint64_t select, uint64_t select_mask)
>  {
>         int i = 0;
>         bool is_overlap;
> @@ -191,13 +198,15 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
>         for (i = 0; i < num_hw_events; i++) {
>                 if (eidx_start == SBI_PMU_EVENT_RAW_IDX)
>                 /* All raw events have same event idx. Just do sanity check on select */
> -                       is_overlap = pmu_event_select_overlap(&hw_event_map[i], select);
> +                       is_overlap = pmu_event_select_overlap(&hw_event_map[i],
> +                                                             select, select_mask);
>                 else
>                         is_overlap = pmu_event_range_overlap(&hw_event_map[i], event);
>                 if (is_overlap)
>                         goto reset_event;
>         }
>
> +       event->select_mask = select_mask;
>         event->counters = cmap;
>         event->select = select;
>         num_hw_events++;
> @@ -221,13 +230,13 @@ int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap)
>              eidx_end == SBI_PMU_EVENT_RAW_IDX)
>                 return SBI_EINVAL;
>
> -       return pmu_add_hw_event_map(eidx_start, eidx_end, cmap, 0);
> +       return pmu_add_hw_event_map(eidx_start, eidx_end, cmap, 0, 0);
>  }
>
> -int sbi_pmu_add_raw_event_counter_map(uint64_t select, u32 cmap)
> +int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t select_mask, u32 cmap)
>  {
>         return pmu_add_hw_event_map(SBI_PMU_EVENT_RAW_IDX,
> -                                   SBI_PMU_EVENT_RAW_IDX, cmap, select);
> +                                   SBI_PMU_EVENT_RAW_IDX, cmap, select, select_mask);
>  }
>
>  static int pmu_ctr_enable_irq_hw(int ctr_idx)
> @@ -514,9 +523,16 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>                         continue;
>
>                 /* For raw events, event data is used as the select value */
> -               if ((event_idx == SBI_PMU_EVENT_RAW_IDX) && temp->select != data)
> -                       continue;
> +               if (event_idx == SBI_PMU_EVENT_RAW_IDX) {
> +                       uint64_t select_mask = temp->select_mask;
>
> +                       /* Check the bit filed encoded by a real number */
> +                       if ((temp->select & select_mask) != (data & select_mask))
> +                               continue;
> +                       /* Check the bit filed encoded by a bitmap */
> +                       else if ((temp->select & ~select_mask & data) != (~select_mask & data))
> +                               continue;
> +               }
>                 /* Fixed counters should not be part of the search */
>                 ctr_mask = temp->counters & (cmask << cbase) &
>                            (~SBI_PMU_FIXED_CTR_MASK);
> @@ -546,7 +562,6 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>                 else
>                         return SBI_EFAIL;
>         }
> -
>         ret = pmu_update_hw_mhpmevent(temp, ctr_idx, flags, event_idx, data);
>
>         if (!ret)
> diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
> index 529ee420554f..a2b048f0ab29 100644
> --- a/lib/utils/fdt/fdt_pmu.c
> +++ b/lib/utils/fdt/fdt_pmu.c
> @@ -65,7 +65,7 @@ int fdt_pmu_setup(void *fdt)
>         const u32 *event_val;
>         const u32 *event_ctr_map;
>         struct fdt_pmu_hw_event_select *event;
> -       uint64_t raw_selector;
> +       uint64_t raw_selector, select_mask;
>         u32 event_idx_start, event_idx_end, ctr_map;
>
>         if (!fdt)
> @@ -99,14 +99,16 @@ int fdt_pmu_setup(void *fdt)
>         }
>
>         event_val = fdt_getprop(fdt, pmu_offset, "riscv,raw-event-to-mhpmcounters", &len);
> -       if (!event_val || len < 8)
> +       if (!event_val || len < 20)
>                 return SBI_EFAIL;
> -       len = len / (sizeof(u32) * 3);
> +       len = len / (sizeof(u32) * 5);
>         for (i = 0; i < len; i++) {
> -               raw_selector = fdt32_to_cpu(event_val[3 * i]);
> -               raw_selector = (raw_selector << 32) | fdt32_to_cpu(event_val[3 * i + 1]);
> -               ctr_map = fdt32_to_cpu(event_val[3 * i + 2]);
> -               result = sbi_pmu_add_raw_event_counter_map(raw_selector, ctr_map);
> +               raw_selector = fdt32_to_cpu(event_val[5 * i]);
> +               raw_selector = (raw_selector << 32) | fdt32_to_cpu(event_val[5 * i + 1]);
> +               select_mask = fdt32_to_cpu(event_val[5 * i + 2]);
> +               select_mask = (select_mask  << 32) | fdt32_to_cpu(event_val[5 * i + 3]);
> +               ctr_map = fdt32_to_cpu(event_val[5 * i + 4]);
> +               result = sbi_pmu_add_raw_event_counter_map(raw_selector, select_mask, ctr_map);
>                 if (!result)
>                         hw_event_count++;
>         }
> --
> 2.33.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Apart from the above nit comments, it looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

