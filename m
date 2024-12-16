From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 16 Dec 2024 15:16:46 +0100
Subject: [PATCH v3 3/5] lib: sbi: sse: rework event availability
In-Reply-To: <CAAhSdy1jpsc8tyy7L-mOh6JArZoG-DyBz7=YAaqaZbknpL9kWQ@mail.gmail.com>
References: <20241212203422.1887665-1-cleger@rivosinc.com>
 <20241212203422.1887665-4-cleger@rivosinc.com>
 <CAAhSdy3OQkAXbfkOggP6tXG8ghLcGWgntc12Hb3hBQZqSWVHLQ@mail.gmail.com>
 <c1cfc50c-c3cb-457f-b3ab-22be266e7b22@rivosinc.com>
 <CAAhSdy1jpsc8tyy7L-mOh6JArZoG-DyBz7=YAaqaZbknpL9kWQ@mail.gmail.com>
Message-ID: <5ace2cce-29e5-41fe-8f4f-baed589eb467@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 16/12/2024 13:11, Anup Patel wrote:
> On Mon, Dec 16, 2024 at 2:55?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>
>>
>>
>> On 15/12/2024 14:11, Anup Patel wrote:
>>> On Fri, Dec 13, 2024 at 2:04?AM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>>>
>>>> In order to detect events that are available and supported, add a new
>>>> is_supported_cb() callback and move cb_ops in event_info.
>>>>
>>>> The cb_ops are now global for a specific event_id and can be filled by
>>>> drivers before calling sse init. sse_init() will then the callback to
>>>> determine which events are available. Global events are checked only
>>>> once and local_events are checked per hart. Thanks to that, we can now
>>>> allocate only the supported global and local events and defer sse
>>>> probing. All events are assigned a default callback operations that
>>>> reports true for the is_supported_cb() to keep the existing behavior.
>>>> Since the callback operations can now be registered once for all
>>>> harts, move the pmu sse_set_cb_ops() callback to the cold_boot 'if'.
>>>>
>>>> Checking the new additional is_supported_cb() is only done when we
>>>> fail from getting an event so that there is no performance cost.
>>>>
>>>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>>>>
>>>> lib: sbi: sse: add a is_supported_cb() callback
>>>>
>>>> This callback will be used to expose the availability of events based on
>>>> the presence of the dependencies (PMU Overflow IRQ for the PMU Overflow
>>>> SSE event for instance). Drivers that want to handle an SSE event will
>>>> need to register callbacks for the SSE event with at least the
>>>> is_supported_cb() callback implemented. Now that this callback is
>>>> implemented, set all non software events as not supported by default.
>>>>
>>>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>>>> ---
>>>>  include/sbi/sbi_sse.h |   5 ++
>>>>  lib/sbi/sbi_init.c    |  21 ++---
>>>>  lib/sbi/sbi_pmu.c     |   4 +-
>>>>  lib/sbi/sbi_sse.c     | 182 ++++++++++++++++++++++++++++++++----------
>>>>  4 files changed, 157 insertions(+), 55 deletions(-)
>>>>
>>>> diff --git a/include/sbi/sbi_sse.h b/include/sbi/sbi_sse.h
>>>> index 7419698a..1eab4f8b 100644
>>>> --- a/include/sbi/sbi_sse.h
>>>> +++ b/include/sbi/sbi_sse.h
>>>> @@ -52,6 +52,11 @@ struct sbi_sse_cb_ops {
>>>>          * Called when the SBI_EXT_SSE_DISABLE is invoked on the event.
>>>>          */
>>>>         void (*disable_cb)(uint32_t event_id);
>>>> +
>>>> +       /**
>>>> +        * Called at init to check if an event is supported.
>>>> +        */
>>>> +       bool (*is_supported_cb)(uint32_t event_id);
>>>>  };
>>>>
>>>>  /* Set the callback operations for an event
>>>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
>>>> index 0736345d..b2627e60 100644
>>>> --- a/lib/sbi/sbi_init.c
>>>> +++ b/lib/sbi/sbi_init.c
>>>> @@ -262,12 +262,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>>>>         if (rc)
>>>>                 sbi_hart_hang();
>>>>
>>>> -       rc = sbi_sse_init(scratch, true);
>>>> -       if (rc) {
>>>> -               sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
>>>> -               sbi_hart_hang();
>>>> -       }
>>>> -
>>>>         rc = sbi_pmu_init(scratch, true);
>>>>         if (rc) {
>>>>                 sbi_printf("%s: pmu init failed (error %d)\n",
>>>> @@ -317,6 +311,13 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>>>>                 sbi_printf("%s: mpxy init failed (error %d)\n", __func__, rc);
>>>>                 sbi_hart_hang();
>>>>         }
>>>> +
>>>> +       rc = sbi_sse_init(scratch, true);
>>>> +       if (rc) {
>>>> +               sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
>>>> +               sbi_hart_hang();
>>>> +       }
>>>> +
>>>>         /*
>>>>          * Note: Finalize domains after HSM initialization so that we
>>>>          * can startup non-root domains.
>>>> @@ -404,10 +405,6 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
>>>>         if (rc)
>>>>                 sbi_hart_hang();
>>>>
>>>> -       rc = sbi_sse_init(scratch, false);
>>>> -       if (rc)
>>>> -               sbi_hart_hang();
>>>> -
>>>>         rc = sbi_pmu_init(scratch, false);
>>>>         if (rc)
>>>>                 sbi_hart_hang();
>>>> @@ -440,6 +437,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
>>>>         if (rc)
>>>>                 sbi_hart_hang();
>>>>
>>>> +       rc = sbi_sse_init(scratch, false);
>>>> +       if (rc)
>>>> +               sbi_hart_hang();
>>>> +
>>>
>>> This re-ordering of sbi_sse_init() is not going to fly because
>>> in the future we might have SSE events being registered by
>>> drivers from sbi_platform_final_init().
>>>
>>>>         /*
>>>>          * Configure PMP at last because if SMEPMP is detected,
>>>>          * M-mode access to the S/U space will be rescinded.
>>>> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
>>>> index 1eab0629..182d8db9 100644
>>>> --- a/lib/sbi/sbi_pmu.c
>>>> +++ b/lib/sbi/sbi_pmu.c
>>>> @@ -1165,9 +1165,9 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
>>>>                         return SBI_EINVAL;
>>>>
>>>>                 total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
>>>> -       }
>>>>
>>>> -       sbi_sse_set_cb_ops(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
>>>> +               sbi_sse_set_cb_ops(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
>>>> +       }
>>>>
>>>>         phs = pmu_get_hart_state_ptr(scratch);
>>>>         if (!phs) {
>>>> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
>>>> index f710338e..f2a9d791 100644
>>>> --- a/lib/sbi/sbi_sse.c
>>>> +++ b/lib/sbi/sbi_sse.c
>>>> @@ -39,21 +39,33 @@
>>>>
>>>>  #define EVENT_IS_GLOBAL(__event_id) ((__event_id) & SBI_SSE_EVENT_GLOBAL_BIT)
>>>>
>>>> -static const uint32_t supported_events[] = {
>>>> -       SBI_SSE_EVENT_LOCAL_RAS,
>>>> -       SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP,
>>>> -       SBI_SSE_EVENT_GLOBAL_RAS,
>>>> -       SBI_SSE_EVENT_LOCAL_PMU,
>>>> -       SBI_SSE_EVENT_LOCAL_SOFTWARE,
>>>> -       SBI_SSE_EVENT_GLOBAL_SOFTWARE,
>>>> +struct sse_event_info {
>>>> +       uint32_t event_id;
>>>> +       const struct sbi_sse_cb_ops *cb_ops;
>>>>  };
>>>>
>>>> -#define EVENT_COUNT array_size(supported_events)
>>>> +static bool event_supported_true(uint32_t event_id);
>>>> +
>>>> +static const struct sbi_sse_cb_ops supported_event_ops = {
>>>> +       .is_supported_cb = &event_supported_true
>>>> +};
>>>> +
>>>> +static struct sse_event_info valid_events[] = {
>>>> +       {.event_id = SBI_SSE_EVENT_LOCAL_RAS, .cb_ops = &supported_event_ops},
>>>> +       {.event_id = SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, .cb_ops = &supported_event_ops},
>>>> +       {.event_id = SBI_SSE_EVENT_GLOBAL_RAS, .cb_ops = &supported_event_ops},
>>>> +       {.event_id = SBI_SSE_EVENT_LOCAL_PMU, .cb_ops = &supported_event_ops},
>>>> +       {.event_id = SBI_SSE_EVENT_LOCAL_SOFTWARE, .cb_ops = &supported_event_ops},
>>>> +       {.event_id = SBI_SSE_EVENT_GLOBAL_SOFTWARE, .cb_ops = &supported_event_ops},
>>>> +};
>>>> +
>>>
>>> This static table approach is not scalable and does not allow
>>> platform specific SSE events to be registered from drivers.
>>
>> Agreed.
>>
>>>
>>> Initially you can start with a global linked list of supported SSE
>>> events which any one can register in the cold boot path.
>>>
>>> The sbi_sse_init() should be simplified to not depend on
>>> supported SSE events to be pre-populated.
>>
>> IMHO, all the events that will be handled by drivers should be available
>> by the time sbi_sse_init() is called or the complexity will be deferred
>> to some other functions as well. This call can even be moved after
>> sbi_platform_final_init(). Except if you have another reason not to do
>> so but that would be the best way to go.
> 
> Yes, its fine to move sbi_sse_init() after sbi_platform_final_init()
> but please add comments about why it has to be after
> sbi_platform_final_init(). We have already added similar
> comments for sbi_ecall_init().

Yes sure.

> 
>>
>> To clarify, I'll modify the current patch to use a linked list of events
>> populated only with the GLOBAL_SOFTWARE_EVENT and LOCAL_SOFTWARE_EVENT
>> at compile time. This list can be extended at boot time by registering
>> cb_ops for events with sbi_sse_set_cb_ops() from drivers. sbi_sse_init()
>> will now allocate space for all events that are in the linked list of
>> events (no matter if they are supported or not). Event availability will
>> be then tested using the is_supported() callback and stored in the event
>> struct itself. Finally, sbi_sse_init() will be moved after all other
>> driver init (ie after sbi_platform_final_init()). If you envision
>> something else, please detail it.
> 
> I think this should be fine.

Ok I'll give it a try.

Thanks,

Cl?ment

> 
> Regards,
> Anup
> 
>>
>> Thanks,
>>
>> Cl?ment
>>
>>>
>>>> +#define EVENT_COUNT array_size(valid_events)
>>>>
>>>>  #define sse_event_invoke_cb(_event, _cb, ...)                                 \
>>>>         {                                                                     \
>>>> -               if (_event->cb_ops && _event->cb_ops->_cb)                    \
>>>> -                       _event->cb_ops->_cb(_event->event_id, ##__VA_ARGS__); \
>>>> +               const struct sbi_sse_cb_ops *__ops = _event->info->cb_ops;    \
>>>> +               if (__ops && __ops->_cb)                                          \
>>>> +                       __ops->_cb(_event->event_id, ##__VA_ARGS__);            \
>>>>         }
>>>>
>>>>  struct sse_entry_state {
>>>> @@ -110,7 +122,7 @@ struct sbi_sse_event {
>>>>         struct sbi_sse_event_attrs attrs;
>>>>         uint32_t event_id;
>>>>         u32 hartindex;
>>>> -       const struct sbi_sse_cb_ops *cb_ops;
>>>> +       struct sse_event_info *info;
>>>>         struct sbi_dlist node;
>>>>  };
>>>>
>>>> @@ -144,6 +156,11 @@ struct sse_hart_state {
>>>>          */
>>>>         struct sbi_sse_event *local_events;
>>>>
>>>> +       /**
>>>> +        * Number of events in the local_events array.
>>>> +        */
>>>> +       unsigned int local_event_count;
>>>> +
>>>>         /**
>>>>          * State to track if the hart is ready to take sse events.
>>>>          * One hart cannot modify this state of another hart.
>>>> @@ -167,7 +184,6 @@ struct sse_global_event {
>>>>         spinlock_t lock;
>>>>  };
>>>>
>>>> -static unsigned int local_event_count;
>>>>  static unsigned int global_event_count;
>>>>  static struct sse_global_event *global_events;
>>>>
>>>> @@ -180,6 +196,11 @@ static u32 sse_ipi_inject_event = SBI_IPI_EVENT_MAX;
>>>>
>>>>  static int sse_ipi_inject_send(unsigned long hartid, uint32_t event_id);
>>>>
>>>> +static bool event_supported_true(uint32_t event_id)
>>>> +{
>>>> +       return true;
>>>> +}
>>>> +
>>>>  static unsigned long sse_event_state(struct sbi_sse_event *e)
>>>>  {
>>>>         return e->attrs.status & SBI_SSE_ATTR_STATUS_STATE_MASK;
>>>> @@ -244,8 +265,42 @@ static void sse_event_set_state(struct sbi_sse_event *e,
>>>>         e->attrs.status |= new_state;
>>>>  }
>>>>
>>>> +static struct sse_event_info *sse_event_info_get(uint32_t event_id)
>>>> +{
>>>> +       struct sse_event_info *info;
>>>> +       int i;
>>>> +
>>>> +       for (i = 0; i < EVENT_COUNT; i++) {
>>>> +               info = &valid_events[i];
>>>> +               if (info->event_id == event_id)
>>>> +                       return info;
>>>> +       }
>>>> +
>>>> +       return NULL;
>>>> +}
>>>> +
>>>> +static int sse_event_info_is_supported(struct sse_event_info *info)
>>>> +{
>>>> +       if (!info)
>>>> +               return SBI_EINVAL;
>>>> +
>>>> +       if (!info->cb_ops || !info->cb_ops->is_supported_cb)
>>>> +               return SBI_ENOTSUPP;
>>>> +
>>>> +       return info->cb_ops->is_supported_cb(info->event_id) ? SBI_SUCCESS :
>>>> +                                                              SBI_ENOTSUPP;
>>>> +}
>>>> +
>>>> +static int sse_event_is_supported(uint32_t event_id)
>>>> +{
>>>> +       struct sse_event_info *info = sse_event_info_get(event_id);
>>>> +
>>>> +       return sse_event_info_is_supported(info);
>>>> +}
>>>> +
>>>>  static int sse_event_get(uint32_t event_id, struct sbi_sse_event **eret)
>>>>  {
>>>> +       int ret;
>>>>         unsigned int i;
>>>>         struct sbi_sse_event *e;
>>>>         struct sse_hart_state *shs;
>>>> @@ -264,7 +319,7 @@ static int sse_event_get(uint32_t event_id, struct sbi_sse_event **eret)
>>>>                 }
>>>>         } else {
>>>>                 shs = sse_thishart_state_ptr();
>>>> -               for (i = 0; i < local_event_count; i++) {
>>>> +               for (i = 0; i < shs->local_event_count; i++) {
>>>>                         e = &shs->local_events[i];
>>>>                         if (e->event_id == event_id) {
>>>>                                 *eret = e;
>>>> @@ -273,7 +328,16 @@ static int sse_event_get(uint32_t event_id, struct sbi_sse_event **eret)
>>>>                 }
>>>>         }
>>>>
>>>> -       return SBI_EINVAL;
>>>> +       ret = sse_event_is_supported(event_id);
>>>> +       /*
>>>> +        * This should never happen since if an event is supported it should
>>>> +        * have been handled by the previous chunk of code. But better be safe
>>>> +        * than sorry and return EFAIL.
>>>> +        */
>>>> +       if (ret == SBI_SUCCESS)
>>>> +               return SBI_EFAIL;
>>>> +
>>>> +       return ret;
>>>>  }
>>>>
>>>>  static void sse_event_put(struct sbi_sse_event *e)
>>>> @@ -869,18 +933,16 @@ int sbi_sse_inject_event(uint32_t event_id)
>>>>
>>>>  int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
>>>>  {
>>>> -       int ret;
>>>> -       struct sbi_sse_event *e;
>>>> +       struct sse_event_info *info;
>>>>
>>>> -       if (cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
>>>> +       info = sse_event_info_get(event_id);
>>>> +       if (!info)
>>>>                 return SBI_EINVAL;
>>>>
>>>> -       ret = sse_event_get(event_id, &e);
>>>> -       if (ret)
>>>> -               return ret;
>>>> +       if (cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
>>>> +               return SBI_EINVAL;
>>>>
>>>> -       e->cb_ops = cb_ops;
>>>> -       sse_event_put(e);
>>>> +       info->cb_ops = cb_ops;
>>>>
>>>>         return SBI_OK;
>>>>  }
>>>> @@ -1063,42 +1125,47 @@ int sbi_sse_unregister(uint32_t event_id)
>>>>         return ret;
>>>>  }
>>>>
>>>> -static void sse_event_init(struct sbi_sse_event *e, uint32_t event_id)
>>>> +static void sse_event_init(struct sbi_sse_event *e, struct sse_event_info *info)
>>>>  {
>>>> -       e->event_id = event_id;
>>>> +       e->event_id = info->event_id;
>>>> +       e->info = info;
>>>>         e->hartindex = current_hartindex();
>>>>         e->attrs.hartid = current_hartid();
>>>>         /* Declare all events as injectable */
>>>>         e->attrs.status |= BIT(SBI_SSE_ATTR_STATUS_INJECT_OFFSET);
>>>>  }
>>>>
>>>> -static void sse_event_count_init()
>>>> +static int sse_global_init(void)
>>>>  {
>>>> -       unsigned int i;
>>>> +       struct sse_event_info *info;
>>>> +       struct sbi_sse_event *e;
>>>> +       unsigned int i, ev = 0;
>>>>
>>>>         for (i = 0; i < EVENT_COUNT; i++) {
>>>> -               if (EVENT_IS_GLOBAL(supported_events[i]))
>>>> -                       global_event_count++;
>>>> -               else
>>>> -                       local_event_count++;
>>>> +               info = &valid_events[i];
>>>> +
>>>> +               if (!EVENT_IS_GLOBAL(info->event_id) ||
>>>> +                   sse_event_is_supported(info->event_id) != SBI_SUCCESS)
>>>> +                       continue;
>>>> +
>>>> +               global_event_count++;
>>>>         }
>>>> -}
>>>>
>>>> -static int sse_global_init()
>>>> -{
>>>> -       struct sbi_sse_event *e;
>>>> -       unsigned int i, ev = 0;
>>>> +       if (!global_event_count)
>>>> +               return 0;
>>>>
>>>>         global_events = sbi_zalloc(sizeof(*global_events) * global_event_count);
>>>>         if (!global_events)
>>>>                 return SBI_ENOMEM;
>>>>
>>>>         for (i = 0; i < EVENT_COUNT; i++) {
>>>> -               if (!EVENT_IS_GLOBAL(supported_events[i]))
>>>> +               info = &valid_events[i];
>>>> +               if (!EVENT_IS_GLOBAL(info->event_id) ||
>>>> +                   sse_event_is_supported(info->event_id) != SBI_SUCCESS)
>>>>                         continue;
>>>>
>>>>                 e = &global_events[ev].event;
>>>> -               sse_event_init(e, supported_events[i]);
>>>> +               sse_event_init(e, info);
>>>>                 SPIN_LOCK_INIT(global_events[ev].lock);
>>>>
>>>>                 ev++;
>>>> @@ -1107,18 +1174,40 @@ static int sse_global_init()
>>>>         return 0;
>>>>  }
>>>>
>>>> +static unsigned int sse_get_local_event_count(void)
>>>> +{
>>>> +       int i;
>>>> +       struct sse_event_info *info;
>>>> +       unsigned int local_event_count = 0;
>>>> +
>>>> +       for (i = 0; i < EVENT_COUNT; i++) {
>>>> +               info = &valid_events[i];
>>>> +
>>>> +               if (EVENT_IS_GLOBAL(info->event_id) ||
>>>> +                   sse_event_is_supported(info->event_id) != SBI_SUCCESS)
>>>> +                       continue;
>>>> +
>>>> +               local_event_count++;
>>>> +       }
>>>> +
>>>> +       return local_event_count;
>>>> +}
>>>> +
>>>>  static void sse_local_init(struct sse_hart_state *shs)
>>>>  {
>>>> +       struct sse_event_info *info;
>>>>         unsigned int i, ev = 0;
>>>>
>>>>         SBI_INIT_LIST_HEAD(&shs->enabled_event_list);
>>>>         SPIN_LOCK_INIT(shs->enabled_event_lock);
>>>>
>>>>         for (i = 0; i < EVENT_COUNT; i++) {
>>>> -               if (EVENT_IS_GLOBAL(supported_events[i]))
>>>> +               info = &valid_events[i];
>>>> +               if (EVENT_IS_GLOBAL(info->event_id) ||
>>>> +                   sse_event_is_supported(info->event_id) != SBI_SUCCESS)
>>>>                         continue;
>>>>
>>>> -               sse_event_init(&shs->local_events[ev++], supported_events[i]);
>>>> +               sse_event_init(&shs->local_events[ev++], info);
>>>>         }
>>>>  }
>>>>
>>>> @@ -1128,10 +1217,9 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
>>>>         void *sse_inject_mem;
>>>>         struct sse_hart_state *shs;
>>>>         struct sbi_fifo *sse_inject_q;
>>>> +       unsigned int local_event_count = 0;
>>>>
>>>>         if (cold_boot) {
>>>> -               sse_event_count_init();
>>>> -
>>>>                 ret = sse_global_init();
>>>>                 if (ret)
>>>>                         return ret;
>>>> @@ -1165,13 +1253,16 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
>>>>
>>>>         shs = sse_get_hart_state_ptr(scratch);
>>>>         if (!shs) {
>>>> +               local_event_count = sse_get_local_event_count();
>>>>                 /* Allocate per hart state and local events at once */
>>>>                 shs = sbi_zalloc(sizeof(*shs) + sizeof(struct sbi_sse_event) *
>>>>                                                         local_event_count);
>>>>                 if (!shs)
>>>>                         return SBI_ENOMEM;
>>>>
>>>> -               shs->local_events = (struct sbi_sse_event *)(shs + 1);
>>>> +               shs->local_event_count = local_event_count;
>>>> +               if (local_event_count)
>>>> +                       shs->local_events = (struct sbi_sse_event *)(shs + 1);
>>>>
>>>>                 /* SSE events are masked until hart unmasks them */
>>>>                 shs->masked = true;
>>>> @@ -1195,9 +1286,14 @@ void sbi_sse_exit(struct sbi_scratch *scratch)
>>>>  {
>>>>         int i;
>>>>         struct sbi_sse_event *e;
>>>> +       struct sse_event_info *info;
>>>>
>>>>         for (i = 0; i < EVENT_COUNT; i++) {
>>>> -               if (sse_event_get(supported_events[i], &e))
>>>> +               info = &valid_events[i];
>>>> +               if (sse_event_info_is_supported(info) != SBI_SUCCESS)
>>>> +                       continue;
>>>> +
>>>> +               if (sse_event_get(info->event_id, &e))
>>>>                         continue;
>>>>
>>>>                 if (e->attrs.hartid != current_hartid())
>>>> --
>>>> 2.45.2
>>>>
>>>>
>>>> --
>>>> opensbi mailing list
>>>> opensbi at lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/opensbi
>>>
>>> This patch needs to be heavily re-worked.
>>>
>>> Regards,
>>> Anup
>>


