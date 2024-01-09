From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 9 Jan 2024 21:01:24 +0530
Subject: [PATCH v2 4/7] lib: sbi: Introduce the SBI debug triggers
 extension support
In-Reply-To: <CAAhSdy1-iNWgrGJsUsikXTv+U-534+RUkrouv69phXu2bg4H5Q@mail.gmail.com>
References: <20240108065525.208172-1-hchauhan@ventanamicro.com>
 <20240108065525.208172-5-hchauhan@ventanamicro.com>
 <CAAhSdy1-iNWgrGJsUsikXTv+U-534+RUkrouv69phXu2bg4H5Q@mail.gmail.com>
Message-ID: <657E65B9-95F6-45F2-B982-2D93535BA7CE@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

> On 09-Jan-2024, at 4:02?PM, Anup Patel <anup@brainfault.org> wrote:
> 
>> 

<snip>

>> +int sbi_dbtr_install_trig(const struct sbi_domain *dom, unsigned long smode,
>> +                         unsigned long trig_count, unsigned long *out)
>> +{
>> +       u32 hartid = current_hartid();
>> +       void *shmem_base = NULL;
>> +       struct sbi_dbtr_shmem_entry *entry;
>> +       struct sbi_dbtr_data_msg *recv;
>> +       struct sbi_dbtr_id_msg *xmit;
>> +       unsigned long ctrl;
>> +       struct sbi_dbtr_trigger *trig;
>> +       struct sbi_dbtr_hart_triggers_state *hs = NULL;
>> +
>> +       if (smode != PRV_S)
>> +               return SBI_ERR_DENIED;
> 
> Same as above, drop the smode check and parameter.

We cannot completely drop the smode parameter here because it is used for domain address access validation. The check of S_PRV can be dropped.

Regards
Himanshu

> 
>> +       if (dom && !sbi_domain_is_assigned_hart(dom, hartid))
>> +               return SBI_ERR_DENIED;
>> +
>> +       if (sbi_dbtr_shmem_disabled())
>> +               return SBI_ERR_NO_SHMEM;
>> +
>> +       shmem_base = hart_shmem_base();
>> +       hs = dbtr_thishart_state_ptr();
>> +
>> +       /* Check requested triggers configuration */
>> +       for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
>> +               sbi_hart_map_saddr((unsigned long)entry, sizeof(*entry));
>> +               recv = (struct sbi_dbtr_data_msg *)(&entry->data);
>> +               ctrl = recv->tdata1;
>> +
>> +               if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
>> +                       *out = _idx;
>> +                       sbi_hart_unmap_saddr();
>> +                       return SBI_ERR_FAILED;
>> +               }
>> +
>> +               if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
>> +                       *out = _idx;
>> +                       sbi_hart_unmap_saddr();
>> +                       return SBI_ERR_FAILED;
>> +               }
>> +               sbi_hart_unmap_saddr();
>> +       }
>> +
>> +       if (hs->available_trigs < trig_count) {
>> +               *out = hs->available_trigs;
>> +               return SBI_ERR_FAILED;
>> +       }
>> +
>> +       /* Install triggers */
>> +       for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
>> +               /*
>> +                * Since we have already checked if enough triggers are
>> +                * available, trigger allocation must succeed.
>> +                */
>> +               trig = sbi_alloc_trigger();
>> +
>> +               sbi_hart_map_saddr((unsigned long)entry, sizeof(*entry));
>> +
>> +               recv = (struct sbi_dbtr_data_msg *)(&entry->data);
>> +               xmit = (struct sbi_dbtr_id_msg *)(&entry->id);
>> +
>> +               dbtr_trigger_setup(trig,  recv);
>> +               dbtr_trigger_enable(trig);
>> +               xmit->idx = cpu_to_lle(trig->index);
>> +               sbi_hart_unmap_saddr();
>> +       }
>> +
>> +       return SBI_SUCCESS;
>> +}
>> +
>> +int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
>> +                           unsigned long trig_idx_mask)
>> +{
>> +       unsigned long trig_mask = trig_idx_mask << trig_idx_base;
>> +       unsigned long idx = trig_idx_base;
>> +       struct sbi_dbtr_trigger *trig;
>> +       struct sbi_dbtr_hart_triggers_state *hs;
>> +
>> +       hs = dbtr_thishart_state_ptr();
>> +       if (!hs)
>> +               return SBI_ERR_FAILED;
>> +
>> +       for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
>> +               trig = INDEX_TO_TRIGGER(idx);
>> +               if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
>> +                       return SBI_ERR_INVALID_PARAM;
>> +
>> +               dbtr_trigger_clear(trig);
>> +
>> +               sbi_free_trigger(trig);
>> +       }
>> +
>> +       return SBI_SUCCESS;
>> +}
>> +
>> +int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>> +                        unsigned long trig_idx_mask)
>> +{
>> +       unsigned long trig_mask = trig_idx_mask << trig_idx_base;
>> +       unsigned long idx = trig_idx_base;
>> +       struct sbi_dbtr_trigger *trig;
>> +       struct sbi_dbtr_hart_triggers_state *hs;
>> +
>> +       hs = dbtr_thishart_state_ptr();
>> +       if (!hs)
>> +               return SBI_ERR_FAILED;
>> +
>> +       for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
>> +               trig = INDEX_TO_TRIGGER(idx);
>> +               sbi_dprintf("%s: enable trigger %lu\n", __func__, idx);
>> +               dbtr_trigger_enable(trig);
>> +       }
>> +
>> +       return SBI_SUCCESS;
>> +}
>> +
>> +int sbi_dbtr_update_trig(const struct sbi_domain *dom,
>> +                        unsigned long smode,
>> +                        unsigned long trig_idx_base,
>> +                        unsigned long trig_idx_mask)
>> +{
>> +       unsigned long trig_mask = trig_idx_mask << trig_idx_base;
>> +       unsigned long idx = trig_idx_base;
>> +       u32 hartid = current_hartid();
>> +       struct sbi_dbtr_data_msg *recv;
>> +       unsigned long uidx = 0;
>> +       struct sbi_dbtr_trigger *trig;
>> +       struct sbi_dbtr_shmem_entry *entry;
>> +       void *shmem_base = NULL;
>> +       struct sbi_dbtr_hart_triggers_state *hs = NULL;
>> +
>> +       if (smode != PRV_S)
>> +               return SBI_ERR_DENIED;
> 
> Same as above, drop the smode check and parameter.
> 
>> +       if (dom && !sbi_domain_is_assigned_hart(dom, hartid))
>> +               return SBI_ERR_DENIED;
>> +
>> +       if (sbi_dbtr_shmem_disabled())
>> +               return SBI_ERR_NO_SHMEM;
>> +
>> +       shmem_base = hart_shmem_base();
>> +       hs = dbtr_thishart_state_ptr();
>> +       if (!hs)
>> +               return SBI_ERR_FAILED;
>> +
>> +       for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
>> +               trig = INDEX_TO_TRIGGER(idx);
>> +
>> +               if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
>> +                       return SBI_ERR_INVALID_PARAM;
>> +
>> +               entry = (shmem_base + uidx * sizeof(*entry));
>> +               recv = &entry->data;
>> +
>> +               trig->tdata2 = lle_to_cpu(recv->tdata2);
>> +               dbtr_trigger_enable(trig);
>> +               uidx++;
>> +       }
>> +
>> +       return SBI_SUCCESS;
>> +}
>> +
>> +int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
>> +                         unsigned long trig_idx_mask)
>> +{
>> +       unsigned long trig_mask = trig_idx_mask << trig_idx_base;
>> +       unsigned long idx = trig_idx_base;
>> +       struct sbi_dbtr_trigger *trig;
>> +       struct sbi_dbtr_hart_triggers_state *hs;
>> +
>> +       hs = dbtr_thishart_state_ptr();
>> +       if (!hs)
>> +               return SBI_ERR_FAILED;
>> +
>> +       for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
>> +               trig = INDEX_TO_TRIGGER(idx);
>> +               dbtr_trigger_disable(trig);
>> +       }
>> +
>> +       return SBI_SUCCESS;
>> +}
>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
>> index 6a98e13..0dcde27 100644
>> --- a/lib/sbi/sbi_init.c
>> +++ b/lib/sbi/sbi_init.c
>> @@ -23,6 +23,7 @@
>> #include <sbi/sbi_irqchip.h>
>> #include <sbi/sbi_platform.h>
>> #include <sbi/sbi_pmu.h>
>> +#include <sbi/sbi_dbtr.h>
>> #include <sbi/sbi_system.h>
>> #include <sbi/sbi_string.h>
>> #include <sbi/sbi_timer.h>
>> @@ -322,6 +323,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>>                sbi_hart_hang();
>>        }
>> 
>> +       rc = sbi_dbtr_init(scratch, true);
>> +       if (rc)
>> +               sbi_hart_hang();
>> +
>>        sbi_boot_print_banner(scratch);
>> 
>>        rc = sbi_irqchip_init(scratch, true);
>> @@ -439,6 +444,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
>>        if (rc)
>>                sbi_hart_hang();
>> 
>> +       rc = sbi_dbtr_init(scratch, false);
>> +       if (rc)
>> +               sbi_hart_hang();
>> +
>>        rc = sbi_irqchip_init(scratch, false);
>>        if (rc)
>>                sbi_hart_hang();
>> --
>> 2.34.1
>> 
>> 
>> --
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi
> 
> Regards,
> Anup



