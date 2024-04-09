From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Apr 2024 13:19:48 +0530
Subject: [PATCH v3 1/3] lib: sbi: Add support for Supervisor Software
 Events extension
In-Reply-To: <e4a38c6c-b526-4d09-9694-ced7ef7d1c17@rivosinc.com>
References: <20240321155720.1966860-1-cleger@rivosinc.com> <20240321155720.1966860-2-cleger@rivosinc.com>
 <64e9135c-f6b7-4b1d-9678-6b42bfb03adb@sifive.com> <e4a38c6c-b526-4d09-9694-ced7ef7d1c17@rivosinc.com>
Message-ID: <CAAhSdy1vpCaMKcTVxm9C+D_evv=8vTZzZDppVJTCE+0dx5FHuw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 9, 2024 at 1:13?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
>
>
> >> +int sbi_sse_disable(uint32_t event_id)
> >> +{
> >> +    int ret;
> >> +    struct sbi_sse_event *e;
> >> +
> >> +    e = sse_event_get(event_id);
> >> +    if (!e)
> >> +            return SBI_EINVAL;
> >> +
> >> +    sse_enabled_event_lock(e);
> >> +    ret = sse_event_disable(e);
> >> +    sse_hart_unlock(e);
> >> +
> >> +    sse_event_put(e);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> +int sbi_sse_inject_from_ecall(uint32_t event_id, unsigned long hartid,
> >> +                          struct sbi_ecall_return *out)
> >> +{
> >> +    if (!sbi_domain_is_assigned_hart(sbi_domain_thishart_ptr(), hartid))
> >> +            return SBI_EINVAL;
> >
> > If more than one domain is assigned to a given hart, do we need to make sure the
> > event is injected to the correct domain?
>
> Good question, maybe Anup knows ?

We need to gradually move various subsystems (such as SSE, PMU,
etc) to have a per-domain context. This is a separate effort and requires
more infrastructure in sbi_domain before we can achieve this.

Regards,
Anup

>
> >
> >> +
> >> +    return sse_inject_event(event_id, hartid, out);
> >> +}
> >> +
> >> +int sbi_sse_inject_event(uint32_t event_id)
> >> +{
> >> +    /* We don't really care about return value here */
> >> +    struct sbi_ecall_return out;
> >> +
> >> +    return sse_inject_event(event_id, current_hartid(), &out);
> >> +}
> >> +
> >> +int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
> >> +{
> >> +    struct sbi_sse_event *e;
> >> +
> >> +    if (cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
> >> +            return SBI_EINVAL;
> >> +
> >> +    e = sse_event_get(event_id);
> >> +    if (!e)
> >> +            return SBI_EINVAL;
> >> +
> >> +    e->cb_ops = cb_ops;
> >> +    sse_event_put(e);
> >> +
> >> +    return SBI_OK;
> >> +}
> >> +
> >> +int sbi_sse_attr_check(uint32_t base_attr_id, uint32_t attr_count,
> >> +                   unsigned long phys_lo, unsigned long phys_hi,
> >> +                   unsigned long access)
> >> +{
> >> +    const unsigned align = __riscv_xlen >> 3;
> >> +    uint64_t end_id = (uint64_t)base_attr_id + (attr_count - 1);
> >> +
> >> +    if (attr_count == 0)
> >> +            return SBI_ERR_INVALID_PARAM;
> >> +
> >> +    if (end_id >= SBI_SSE_ATTR_MAX)
> >> +            return SBI_EBAD_RANGE;
> >> +
> >> +    if (phys_lo & (align - 1))
> >> +            return SBI_EINVALID_ADDR;
> >> +
> >> +    /*
> >> +     * On RV32, the M-mode can only access the first 4GB of
> >> +     * the physical address space because M-mode does not have
> >> +     * MMU to access full 34-bit physical address space.
> >> +     *
> >> +     * Based on above, we simply fail if the upper 32bits of
> >> +     * the physical address (i.e. a2 register) is non-zero on
> >> +     * RV32.
> >> +     */
> >> +    if (phys_hi)
> >> +            return SBI_EINVALID_ADDR;
> >> +
> >> +    if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(), phys_lo,
> >> +                                     sizeof(unsigned long) * attr_count, 1,
> >> +                                     access))
> >> +            return SBI_EINVALID_ADDR;
> >> +
> >> +    return SBI_OK;
> >> +}
> >> +
> >> +static void copy_attrs(unsigned long *out, const unsigned long *in,
> >> +                   unsigned int long_count)
> >> +{
> >> +    int i = 0;
> >> +
> >> +    /*
> >> +     * sbi_memcpy() does byte-per-byte copy, using this yields long-per-long
> >> +     * copy
> >> +     */
> >> +    for (i = 0; i < long_count; i++)
> >> +            out[i] = in[i];
> >> +}
> >> +
> >> +int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
> >> +                   uint32_t attr_count, unsigned long output_phys_lo,
> >> +                   unsigned long output_phys_hi)
> >> +{
> >> +    int ret;
> >> +    unsigned long *e_attrs;
> >> +    struct sbi_sse_event *e;
> >> +    unsigned long *attrs;
> >> +
> >> +    ret = sbi_sse_attr_check(base_attr_id, attr_count, output_phys_lo,
> >> +                             output_phys_hi, SBI_DOMAIN_WRITE);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    e = sse_event_get(event_id);
> >> +    if (!e)
> >> +            return SBI_EINVAL;
> >> +
> >> +    sbi_hart_map_saddr(output_phys_lo, sizeof(unsigned long) * attr_count);
> >> +
> >> +    /*
> >> +     * Copy all attributes at once since struct sse_event_attrs is matching
> >> +     * the SBI_SSE_ATTR_* attributes. While WRITE_ATTR attribute is not used
> >
> > This statement is not true if the handler wants to modify A6 or A7.
>
> Indeed, in the previous spec, we stated that they should not be modified
> as well as SEPC/FLAGS to avoid any potential exploit with some return to
> supervisor mode. Anup, is there any good reason to be able to modify
> these (A6, A7, SEPC, FLAGS) ? That is potential attack surface (@Deepak ?).
>
> >
> >> +     * in s-mode sse handling path, READ_ATTR is used to retrieve the value
> >> +     * of registers when interrupted. Rather than doing multiple SBI calls,
> >> +     * a single one is done allowing to retrieve them all at once.
> >> +     */
> >> +    e_attrs = (unsigned long *)&e->attrs;
> >> +    attrs = (unsigned long *)output_phys_lo;
> >> +    copy_attrs(attrs, &e_attrs[base_attr_id], attr_count);
> >> +
> >> +    sbi_hart_unmap_saddr();
> >> +
> >> +    sse_event_put(e);
> >> +
> >> +    return SBI_OK;
> >> +}
> >> +
> >> +static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
> >> +                       uint32_t attr_count, unsigned long input_phys)
> >> +{
> >> +    int ret = 0;
> >> +    unsigned long attr = 0, val;
> >> +    uint32_t id, end_id = base_attr_id + attr_count;
> >> +    unsigned long *attrs = (unsigned long *)input_phys;
> >> +
> >> +    if (sse_event_state(e) >= SBI_SSE_STATE_ENABLED)
> >> +            return SBI_EINVALID_STATE;
> >
> > This check is incorrect. Only some attributes are restricted from being written
> > while the event is enabled. In fact, INTERRUPTED_A6 and INTERRUPTED_A7 only make
> > sense to be written while the state is RUNNING
>
> Indeed, missed that from the latest spec (comment above).
>
> Thanks,
>
> Cl?ment
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

