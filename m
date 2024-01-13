From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 12 Jan 2024 16:38:40 -0800
Subject: [RFC PATCH v2 2/4] lib: sbi: add support for Supervisor Software
 Events extension
In-Reply-To: <20240109104500.2080121-3-cleger@rivosinc.com>
References: <20240109104500.2080121-1-cleger@rivosinc.com> <20240109104500.2080121-3-cleger@rivosinc.com>
Message-ID: <CAKC1njQNDun0PjK8Ct9=bva9NGh0qH4gaEx8fgBpzkqQhGkigg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> +int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
> +                      uint32_t attr_count, unsigned long output_phys_lo,
> +                      unsigned long output_phys_hi)
> +{
> +       int ret;
> +       unsigned long *e_attrs;
> +       struct sbi_sse_event *e;
> +       unsigned long *attrs;
> +
> +       ret = sbi_sse_attr_check(base_attr_id, attr_count, output_phys_lo,
> +                                output_phys_hi, SBI_DOMAIN_WRITE);
> +       if (ret)
> +               return ret;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +
> +       sbi_hart_map_saddr(output_phys_lo, sizeof(unsigned long) * attr_count);
> +
> +       /*
> +        * Copy all attributes at once since struct sse_event_attrs is matching
> +        * the SBI_SSE_ATTR_* attributes. While WRITE_ATTR attribute is not used
> +        * in s-mode sse handling path, READ_ATTR is used to retrieve the value
> +        * of registers when interrupted. rather than doing multiple SBI calls,
> +        * a single one is done allowing to retrieve them all at once.
> +        */
> +       e_attrs = (unsigned long *)&e->attrs;
> +       attrs = (unsigned long *)output_phys_lo;
> +       copy_attrs(attrs, &e_attrs[base_attr_id], attr_count);

I don't know how sbi_domain memory regions work. It looks like it's a
recent addition.
Skimming through sources it look's like SBI own management of which
physical regions are readable and writable.

Question:
Exposing get/set  on physical memory region doesn't allow kernel to
read/write arbitrary firmware regions too?

> +
> +       sbi_hart_unmap_saddr();
> +
> +       sse_global_event_unlock(e);
> +
> +       return SBI_OK;
> +}
> +
> +int sbi_sse_write_attrs(uint32_t event_id, uint32_t base_attr_id,
> +                       uint32_t attr_count, unsigned long input_phys_lo,
> +                       unsigned long input_phys_hi)
> +{
> +       int ret;
> +       struct sbi_sse_event *e;
> +       unsigned long attr = 0, val;
> +       uint32_t id, end_id = base_attr_id + attr_count;
> +       unsigned long *attrs = (unsigned long *)input_phys_lo;
> +
> +       ret = sbi_sse_attr_check(base_attr_id, attr_count, input_phys_lo,
> +                                input_phys_hi, SBI_DOMAIN_READ);
> +       if (ret)
> +               return ret;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +
> +       sbi_hart_map_saddr(input_phys_lo, sizeof(unsigned long) * attr_count);
> +
> +       for (id = base_attr_id; id < end_id; id++) {
> +               val = attrs[attr++];
> +               ret = sse_event_set_attr_check(e, id, val);
> +               if (ret)
> +                       goto out;
> +       }
> +
> +       attr = 0;
> +       for (id = base_attr_id; id < end_id; id++) {
> +               val = attrs[attr++];
> +               sse_event_set_attr(e, id, val);
> +       }
> +out:
> +       sbi_hart_unmap_saddr();
> +
> +       sse_global_event_unlock(e);
> +
> +       return SBI_OK;
> +}
> +
> +int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
> +                    unsigned long handler_entry_a0,
> +                    unsigned long handler_entry_a6,
> +                    unsigned long handler_entry_a7)
> +{
> +       int ret;
> +       struct sbi_sse_event *e;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +       ret = sse_event_register(e, handler_entry_pc, handler_entry_a0,
> +                                handler_entry_a6, handler_entry_a7);
> +       sse_global_event_unlock(e);
> +
> +       return ret;
> +}
> +
> +int sbi_sse_unregister(uint32_t event_id)
> +{
> +       int ret;
> +       struct sbi_sse_event *e;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +       ret = sse_event_unregister(e);
> +       sse_global_event_unlock(e);
> +
> +       return ret;
> +}
> +
> +static void sse_event_init(struct sbi_sse_event *e, uint32_t event_id)
> +{
> +       e->event_id = event_id;
> +       SSE_EVENT_HARTID(e) = current_hartid();
> +       /* Declare all events as injectable */
> +       SSE_EVENT_CAN_INJECT(e) = 1;
> +}
> +
> +static int sse_global_init()
> +{
> +       struct sbi_sse_event *e;
> +       unsigned int i, ev = 0;
> +
> +       for (i = 0; i < EVENT_COUNT; i++) {
> +               if (EVENT_IS_GLOBAL(supported_events[i]))
> +                       global_event_count++;
> +               else
> +                       local_event_count++;
> +       }
> +
> +       global_events = sbi_zalloc(sizeof(*global_events) * global_event_count);
> +       if (!global_events)
> +               return SBI_ENOMEM;
> +
> +       for (i = 0; i < EVENT_COUNT; i++) {
> +               if (!EVENT_IS_GLOBAL(supported_events[i]))
> +                       continue;
> +
> +               e = &global_events[ev];
> +               sse_event_init(e, supported_events[i]);
> +               SPIN_LOCK_INIT(e->lock);
> +
> +               ev++;
> +       }
> +
> +       return 0;
> +}
> +
> +static void sse_local_init(struct sse_hart_state *shs)
> +{
> +       unsigned int i, ev = 0;
> +
> +       SBI_INIT_LIST_HEAD(&shs->event_list);
> +       SPIN_LOCK_INIT(shs->list_lock);
> +
> +       for (i = 0; i < EVENT_COUNT; i++) {
> +               if (EVENT_IS_GLOBAL(supported_events[i]))
> +                       continue;
> +
> +               sse_event_init(&shs->local_events[ev++], supported_events[i]);
> +       }
> +}
> +
> +int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
> +{
> +       int ret;
> +       void *sse_inject_mem;
> +       struct sse_hart_state *shs;
> +       struct sbi_fifo *sse_inject_q;
> +
> +       if (cold_boot) {
> +               ret = sse_global_init();
> +               if (ret)
> +                       return ret;
> +
> +               shs_ptr_off = sbi_scratch_alloc_offset(sizeof(void *));
> +               if (!shs_ptr_off)
> +                       return SBI_ENOMEM;
> +
> +               sse_inject_fifo_off = sbi_scratch_alloc_offset(
> +                                                       sizeof(*sse_inject_q));
> +               if (!sse_inject_fifo_off) {
> +                       sbi_scratch_free_offset(shs_ptr_off);
> +                       return SBI_ENOMEM;
> +               }
> +
> +               sse_inject_fifo_mem_off = sbi_scratch_alloc_offset(
> +                       EVENT_COUNT * sizeof(struct sse_ipi_inject_data));
> +               if (!sse_inject_fifo_mem_off) {
> +                       sbi_scratch_free_offset(sse_inject_fifo_off);
> +                       sbi_scratch_free_offset(shs_ptr_off);
> +                       return SBI_ENOMEM;
> +               }
> +
> +               ret = sbi_ipi_event_create(&sse_ipi_inject_ops);
> +               if (ret < 0) {
> +                       sbi_scratch_free_offset(shs_ptr_off);
> +                       return ret;
> +               }
> +               sse_ipi_inject_event = ret;
> +       }
> +
> +       shs = sse_get_hart_state_ptr(scratch);
> +       if (!shs) {
> +               /* Allocate per hart state and local events at once */
> +               shs = sbi_zalloc(sizeof(*shs) +
> +                       sizeof(struct sbi_sse_event) * local_event_count);
> +               if (!shs)
> +                       return SBI_ENOMEM;
> +
> +               shs->local_events = (struct sbi_sse_event *)(shs + 1);
> +
> +               sse_set_hart_state_ptr(scratch, shs);
> +       }
> +
> +       sse_local_init(shs);
> +
> +       sse_inject_q = sbi_scratch_offset_ptr(scratch, sse_inject_fifo_off);
> +       sse_inject_mem = sbi_scratch_offset_ptr(scratch,
> +                                               sse_inject_fifo_mem_off);
> +
> +       sbi_fifo_init(sse_inject_q, sse_inject_mem, EVENT_COUNT,
> +                     sizeof(struct sse_ipi_inject_data));
> +
> +       return 0;
> +}
> +
> +void sbi_sse_exit(struct sbi_scratch *scratch)
> +{
> +       int i;
> +       struct sbi_sse_event *e;
> +
> +       for (i = 0; i < EVENT_COUNT; i++) {
> +               e = sse_event_get(supported_events[i]);
> +
> +               if (SSE_EVENT_HARTID(e) != current_hartid())
> +                       continue;
> +
> +               if (SSE_EVENT_STATE(e) > SSE_STATE_REGISTERED)
> +                       sbi_printf("Event %d in invalid state at exit", i);
> +       }
> +}
> --
> 2.43.0
>

