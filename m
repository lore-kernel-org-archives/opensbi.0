From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 20 Dec 2024 10:42:42 +0100
Subject: [PATCH v4 3/5] lib: sbi: sse: allow adding new events
In-Reply-To: <CAK9=C2UCeWfDAWYvp8U6otSrwdRu6jjdOr_p0ftQ8oZCCLTb+g@mail.gmail.com>
References: <20241216212144.3379890-1-cleger@rivosinc.com>
 <20241216212144.3379890-4-cleger@rivosinc.com>
 <CAK9=C2UCeWfDAWYvp8U6otSrwdRu6jjdOr_p0ftQ8oZCCLTb+g@mail.gmail.com>
Message-ID: <4f385bfa-343b-41e3-8d9d-37c92823b6c6@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 19/12/2024 18:12, Anup Patel wrote:
> On Tue, Dec 17, 2024 at 2:52?AM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>
>> In order to allow events to be dynamically added, remove the existing
>> static array of events and use a simply linked list of supported events.
>> This allows us to move the cb_ops into this list and associated it with
>> an event_id. Drivers can now register cb_ops before bringing up the sse
>> core to handle additional events (platform ones for instance).
>>
>> sbi_sse_init() now allocates as many events as present in the linked
>> list. Events can now be added with sbi_sse_add_event() which allows to
>> add new supported events with some callback operations if any. If an
>> event is not to be supported, then sbi_sse_add_event() should not be
>> called. This approach currently consider that local events are to be
>> supported on all harts (ie, they all support the same ISA or
>> dependencies). If per-hart event availability needs to be supported,
>> then, an is_supported() callback could be added later and called for
>> each hart.
>>
>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>> ---
>>  include/sbi/sbi_sse.h |   8 +--
>>  lib/sbi/sbi_init.c    |  24 +++++----
>>  lib/sbi/sbi_pmu.c     |   2 +-
>>  lib/sbi/sbi_sse.c     | 121 +++++++++++++++++++++++++++---------------
>>  4 files changed, 97 insertions(+), 58 deletions(-)
>>
>> diff --git a/include/sbi/sbi_sse.h b/include/sbi/sbi_sse.h
>> index 7419698a..fb796545 100644
>> --- a/include/sbi/sbi_sse.h
>> +++ b/include/sbi/sbi_sse.h
>> @@ -54,12 +54,12 @@ struct sbi_sse_cb_ops {
>>         void (*disable_cb)(uint32_t event_id);
>>  };
>>
>> -/* Set the callback operations for an event
>> - * @param event_id Event identifier (SBI_SSE_EVENT_*)
>> - * @param cb_ops Callback operations
>> +/* Add a supported event with associated callback operations
>> + * @param event_id Event identifier (SBI_SSE_EVENT_* or a custom platform one)
>> + * @param cb_ops Callback operations (Can be NULL if any)
>>   * @return 0 on success, error otherwise
>>   */
>> -int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops);
>> +int sbi_sse_add_event(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops);
>>
>>  /* Inject an event to the current hard
>>   * @param event_id Event identifier (SBI_SSE_EVENT_*)
>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
>> index 0736345d..505767ed 100644
>> --- a/lib/sbi/sbi_init.c
>> +++ b/lib/sbi/sbi_init.c
>> @@ -262,12 +262,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>>         if (rc)
>>                 sbi_hart_hang();
>>
>> -       rc = sbi_sse_init(scratch, true);
>> -       if (rc) {
>> -               sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
>> -               sbi_hart_hang();
>> -       }
>> -
>>         rc = sbi_pmu_init(scratch, true);
>>         if (rc) {
>>                 sbi_printf("%s: pmu init failed (error %d)\n",
>> @@ -342,6 +336,16 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>>                 sbi_hart_hang();
>>         }
>>
>> +       /*
>> +        * Note: SSE events callbacks can be registered by other drivers so
>> +        * sbi_sse_init() needs to be called after all drivers have been probed.
>> +        */
>> +       rc = sbi_sse_init(scratch, true);
>> +       if (rc) {
>> +               sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
>> +               sbi_hart_hang();
>> +       }
>> +
>>         /*
>>          * Note: Ecall initialization should be after platform final
>>          * initialization so that all available platform devices are
>> @@ -404,10 +408,6 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
>>         if (rc)
>>                 sbi_hart_hang();
>>
>> -       rc = sbi_sse_init(scratch, false);
>> -       if (rc)
>> -               sbi_hart_hang();
>> -
>>         rc = sbi_pmu_init(scratch, false);
>>         if (rc)
>>                 sbi_hart_hang();
>> @@ -440,6 +440,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
>>         if (rc)
>>                 sbi_hart_hang();
>>
>> +       rc = sbi_sse_init(scratch, false);
>> +       if (rc)
>> +               sbi_hart_hang();
>> +
>>         /*
>>          * Configure PMP at last because if SMEPMP is detected,
>>          * M-mode access to the S/U space will be rescinded.
>> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
>> index c6df45a7..eb31f3e9 100644
>> --- a/lib/sbi/sbi_pmu.c
>> +++ b/lib/sbi/sbi_pmu.c
>> @@ -1166,7 +1166,7 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
>>                 total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
>>         }
>>
>> -       sbi_sse_set_cb_ops(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
>> +       sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
>>
>>         phs = pmu_get_hart_state_ptr(scratch);
>>         if (!phs) {
>> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
>> index f710338e..665dc693 100644
>> --- a/lib/sbi/sbi_sse.c
>> +++ b/lib/sbi/sbi_sse.c
>> @@ -39,21 +39,11 @@
>>
>>  #define EVENT_IS_GLOBAL(__event_id) ((__event_id) & SBI_SSE_EVENT_GLOBAL_BIT)
>>
>> -static const uint32_t supported_events[] = {
>> -       SBI_SSE_EVENT_LOCAL_RAS,
>> -       SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP,
>> -       SBI_SSE_EVENT_GLOBAL_RAS,
>> -       SBI_SSE_EVENT_LOCAL_PMU,
>> -       SBI_SSE_EVENT_LOCAL_SOFTWARE,
>> -       SBI_SSE_EVENT_GLOBAL_SOFTWARE,
>> -};
>> -
>> -#define EVENT_COUNT array_size(supported_events)
>> -
>>  #define sse_event_invoke_cb(_event, _cb, ...)                                 \
>>         {                                                                     \
>> -               if (_event->cb_ops && _event->cb_ops->_cb)                    \
>> -                       _event->cb_ops->_cb(_event->event_id, ##__VA_ARGS__); \
>> +               const struct sbi_sse_cb_ops *__ops = _event->info->cb_ops;    \
>> +               if (__ops && __ops->_cb)                                      \
>> +                       __ops->_cb(_event->event_id, ##__VA_ARGS__);          \
>>         }
>>
>>  struct sse_entry_state {
>> @@ -110,7 +100,7 @@ struct sbi_sse_event {
>>         struct sbi_sse_event_attrs attrs;
>>         uint32_t event_id;
>>         u32 hartindex;
>> -       const struct sbi_sse_cb_ops *cb_ops;
>> +       struct sse_event_info *info;
>>         struct sbi_dlist node;
>>  };
>>
>> @@ -166,6 +156,11 @@ struct sse_global_event {
>>          */
>>         spinlock_t lock;
>>  };
>> +struct sse_event_info {
>> +       uint32_t event_id;
>> +       const struct sbi_sse_cb_ops *cb_ops;
>> +       struct sse_event_info *next;
> 
> Why not use sbi_dlist here ?

Hi Anup,

Two reasons:

1 - We don't need double linked list at all
2 - Static initialization is simpler using a simple linked list.

But I can add a sbi_slist implementation as well if you prefer, that
would make it more reusable.

Thanks,

Cl?ment

> 
> Regards,
> Anup
> 
>> +};
>>
>>  static unsigned int local_event_count;
>>  static unsigned int global_event_count;
>> @@ -180,6 +175,30 @@ static u32 sse_ipi_inject_event = SBI_IPI_EVENT_MAX;
>>
>>  static int sse_ipi_inject_send(unsigned long hartid, uint32_t event_id);
>>
>> +struct sse_event_info global_software_event = {
>> +       .event_id = SBI_SSE_EVENT_GLOBAL_SOFTWARE,
>> +       .next = NULL,
>> +};
>> +
>> +struct sse_event_info local_software_event = {
>> +       .event_id = SBI_SSE_EVENT_LOCAL_SOFTWARE,
>> +       .next = &global_software_event,
>> +};
>> +
>> +static struct sse_event_info *supported_events = &local_software_event;
>> +
>> +static struct sse_event_info *sse_event_info_get(uint32_t event_id)
>> +{
>> +       struct sse_event_info *info;
>> +
>> +       for (info = supported_events; info; info = info->next) {
>> +               if (info->event_id == event_id)
>> +                       return info;
>> +       }
>> +
>> +       return NULL;
>> +}
>> +
>>  static unsigned long sse_event_state(struct sbi_sse_event *e)
>>  {
>>         return e->attrs.status & SBI_SSE_ATTR_STATUS_STATE_MASK;
>> @@ -867,20 +886,31 @@ int sbi_sse_inject_event(uint32_t event_id)
>>         return sse_inject_event(event_id, current_hartid());
>>  }
>>
>> -int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
>> +int sbi_sse_add_event(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
>>  {
>> -       int ret;
>> -       struct sbi_sse_event *e;
>> +       struct sse_event_info *info;
>>
>> -       if (cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
>> +       /* Do not allow adding an event twice */
>> +       info = sse_event_info_get(event_id);
>> +       if (info)
>>                 return SBI_EINVAL;
>>
>> -       ret = sse_event_get(event_id, &e);
>> -       if (ret)
>> -               return ret;
>> +       if (cb_ops && cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
>> +               return SBI_EINVAL;
>>
>> -       e->cb_ops = cb_ops;
>> -       sse_event_put(e);
>> +       info = sbi_zalloc(sizeof(*info));
>> +       if (!info)
>> +               return SBI_ENOMEM;
>> +
>> +       info->cb_ops = cb_ops;
>> +       info->event_id = event_id;
>> +
>> +       /*
>> +        * Add the new event at the head of the linked list of supported
>> +        * events.
>> +        */
>> +       info->next = supported_events;
>> +       supported_events =  info;
>>
>>         return SBI_OK;
>>  }
>> @@ -1063,9 +1093,10 @@ int sbi_sse_unregister(uint32_t event_id)
>>         return ret;
>>  }
>>
>> -static void sse_event_init(struct sbi_sse_event *e, uint32_t event_id)
>> +static void sse_event_init(struct sbi_sse_event *e, struct sse_event_info *info)
>>  {
>> -       e->event_id = event_id;
>> +       e->event_id = info->event_id;
>> +       e->info = info;
>>         e->hartindex = current_hartindex();
>>         e->attrs.hartid = current_hartid();
>>         /* Declare all events as injectable */
>> @@ -1074,10 +1105,10 @@ static void sse_event_init(struct sbi_sse_event *e, uint32_t event_id)
>>
>>  static void sse_event_count_init()
>>  {
>> -       unsigned int i;
>> +       struct sse_event_info *info;
>>
>> -       for (i = 0; i < EVENT_COUNT; i++) {
>> -               if (EVENT_IS_GLOBAL(supported_events[i]))
>> +       for (info = supported_events; info; info = info->next) {
>> +               if (EVENT_IS_GLOBAL(info->event_id))
>>                         global_event_count++;
>>                 else
>>                         local_event_count++;
>> @@ -1087,18 +1118,19 @@ static void sse_event_count_init()
>>  static int sse_global_init()
>>  {
>>         struct sbi_sse_event *e;
>> -       unsigned int i, ev = 0;
>> +       unsigned int ev = 0;
>> +       struct sse_event_info *info;
>>
>>         global_events = sbi_zalloc(sizeof(*global_events) * global_event_count);
>>         if (!global_events)
>>                 return SBI_ENOMEM;
>>
>> -       for (i = 0; i < EVENT_COUNT; i++) {
>> -               if (!EVENT_IS_GLOBAL(supported_events[i]))
>> +       for (info = supported_events; info; info = info->next) {
>> +               if (!EVENT_IS_GLOBAL(info->event_id))
>>                         continue;
>>
>>                 e = &global_events[ev].event;
>> -               sse_event_init(e, supported_events[i]);
>> +               sse_event_init(e, info);
>>                 SPIN_LOCK_INIT(global_events[ev].lock);
>>
>>                 ev++;
>> @@ -1109,16 +1141,16 @@ static int sse_global_init()
>>
>>  static void sse_local_init(struct sse_hart_state *shs)
>>  {
>> -       unsigned int i, ev = 0;
>> +       unsigned int ev = 0;
>> +       struct sse_event_info *info;
>>
>>         SBI_INIT_LIST_HEAD(&shs->enabled_event_list);
>>         SPIN_LOCK_INIT(shs->enabled_event_lock);
>>
>> -       for (i = 0; i < EVENT_COUNT; i++) {
>> -               if (EVENT_IS_GLOBAL(supported_events[i]))
>> +       for (info = supported_events; info; info = info->next) {
>> +               if (EVENT_IS_GLOBAL(info->event_id))
>>                         continue;
>> -
>> -               sse_event_init(&shs->local_events[ev++], supported_events[i]);
>> +               sse_event_init(&shs->local_events[ev++], info);
>>         }
>>  }
>>
>> @@ -1148,7 +1180,8 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
>>                 }
>>
>>                 sse_inject_fifo_mem_off = sbi_scratch_alloc_offset(
>> -                       EVENT_COUNT * sizeof(struct sse_ipi_inject_data));
>> +                       (global_event_count + local_event_count) *
>> +                       sizeof(struct sse_ipi_inject_data));
>>                 if (!sse_inject_fifo_mem_off) {
>>                         sbi_scratch_free_offset(sse_inject_fifo_off);
>>                         sbi_scratch_free_offset(shs_ptr_off);
>> @@ -1185,7 +1218,8 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
>>         sse_inject_mem =
>>                 sbi_scratch_offset_ptr(scratch, sse_inject_fifo_mem_off);
>>
>> -       sbi_fifo_init(sse_inject_q, sse_inject_mem, EVENT_COUNT,
>> +       sbi_fifo_init(sse_inject_q, sse_inject_mem,
>> +                     (global_event_count + local_event_count),
>>                       sizeof(struct sse_ipi_inject_data));
>>
>>         return 0;
>> @@ -1193,18 +1227,19 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
>>
>>  void sbi_sse_exit(struct sbi_scratch *scratch)
>>  {
>> -       int i;
>>         struct sbi_sse_event *e;
>> +       struct sse_event_info *info;
>>
>> -       for (i = 0; i < EVENT_COUNT; i++) {
>> -               if (sse_event_get(supported_events[i], &e))
>> +       for (info = supported_events; info; info = info->next) {
>> +               if (sse_event_get(info->event_id, &e))
>>                         continue;
>>
>>                 if (e->attrs.hartid != current_hartid())
>>                         goto skip;
>>
>>                 if (sse_event_state(e) > SBI_SSE_STATE_REGISTERED) {
>> -                       sbi_printf("Event %d in invalid state at exit", i);
>> +                       sbi_printf("Event %d in invalid state at exit",
>> +                                  info->event_id);
>>                         sse_event_set_state(e, SBI_SSE_STATE_UNUSED);
>>                 }
>>
>> --
>> 2.45.2
>>


