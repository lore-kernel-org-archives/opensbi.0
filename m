From: Alvin Che-Chia Chang(張哲嘉) <alvinga@andestech.com>
Date: Tue, 25 Mar 2025 07:18:45 +0000
Subject: [PATCH v3] lib: sbi_mpxy: Change MPXY state as per-domain data
In-Reply-To: <7f0bfd80-a6d1-47f3-941e-76e562253ecd@sifive.com>
References: <20250324063951.2834253-1-alvinga@andestech.com>
 <8ff01bb2-ff96-4223-983b-54c05f5c60fd@sifive.com>
 <SEYPR03MB6700306C62ED4EEA4ACACA39A8A72@SEYPR03MB6700.apcprd03.prod.outlook.com>
 <7f0bfd80-a6d1-47f3-941e-76e562253ecd@sifive.com>
Message-ID: <SEYPR03MB67004FE30ECE33D867B1BE57A8A72@SEYPR03MB6700.apcprd03.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Samuel,

> -----Original Message-----
> From: Samuel Holland <samuel.holland@sifive.com>
> Sent: Tuesday, March 25, 2025 11:23 AM
> To: Alvin Che-Chia Chang(???) <alvinga@andestech.com>;
> opensbi at lists.infradead.org
> Cc: anup at brainfault.org; peter.lin at sifive.com; yong.li at intel.com
> Subject: Re: [PATCH v3] lib: sbi_mpxy: Change MPXY state as per-domain data
>
> [EXTERNAL MAIL]
>
> Hi Alvin,
>
> On 2025-03-24 10:13 PM, Alvin Che-Chia Chang(???) wrote:
> > Hi Samuel,
> >
> >> -----Original Message-----
> >> From: Samuel Holland <samuel.holland@sifive.com>
> >> Sent: Tuesday, March 25, 2025 10:26 AM
> >> To: Alvin Che-Chia Chang(???) <alvinga@andestech.com>;
> >> opensbi at lists.infradead.org
> >> Cc: anup at brainfault.org; peter.lin at sifive.com; yong.li at intel.com
> >> Subject: Re: [PATCH v3] lib: sbi_mpxy: Change MPXY state as
> >> per-domain data
> >>
> >> [EXTERNAL MAIL]
> >>
> >> Hi Alvin,
> >>
> >> On 2025-03-24 1:39 AM, Alvin Chang wrote:
> >>> OpenSBI supports multiple supervisor domains run on same platform.
> >>> When these supervisor domains want to communicate with OpenSBI
> >>> through MPXY channels, they will allocate MPXY shared memory from
> >>> their own memory regions. Therefore, the MPXY state data structure
> >>> must be per-domain and per-hart data structure.
> >>>
> >>> This commit registers per-domain MPXY state data in sbi_mpxy_init().
> >>> The original MPXY state allocated in scratch region is also removed.
> >>> We also replace sbi_scratch_thishart_offset_ptr() macro as new
> >>> sbi_domain_mpxy_state_thishart_ptr() macro which gets MPXY state
> >>> from per-domain data.
> >>>
> >>> Signed-off-by: Alvin Chang <alvinga@andestech.com>
> >>> Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> >>> ---
> >>>  include/sbi/sbi_mpxy.h |  16 +++++++
> >>>  lib/sbi/sbi_mpxy.c     | 100
> >> +++++++++++++++++++++++++++++++----------
> >>>  2 files changed, 92 insertions(+), 24 deletions(-)
> >>>
> >>> diff --git a/include/sbi/sbi_mpxy.h b/include/sbi/sbi_mpxy.h index
> >>> 9da2791..169f028 100644
> >>> --- a/include/sbi/sbi_mpxy.h
> >>> +++ b/include/sbi/sbi_mpxy.h
> >>> @@ -12,6 +12,7 @@
> >>>
> >>>  #include <sbi/sbi_list.h>
> >>>
> >>> +struct sbi_domain;
> >>>  struct sbi_scratch;
> >>>
> >>>  #define SBI_MPXY_MSGPROTO_VERSION(Major, Minor) ((Major << 16) |
> >>> Minor) @@ -182,4 +183,19 @@ int sbi_mpxy_send_message(u32
> >> channel_id,
> >>> u8 msg_id,  int sbi_mpxy_get_notification_events(u32 channel_id,
> >>>                                       unsigned long
> *events_len);
> >>>
> >>> +/**
> >>> + * Get per-domain MPXY state pointer for a given domain and HART
> >>> +index
> >>> + * @param dom pointer to domain
> >>> + * @param hartindex the HART index
> >>> + *
> >>> + * @return per-domain MPXY state pointer for given HART index  */
> >>> +struct mpxy_state *sbi_domain_get_mpxy_state(struct sbi_domain
> *dom,
> >>> +                                          u32 hartindex);
> >>> +
> >>> +/** Macro to obtain the current hart's MPXY state pointer in
> >>> +current
> >> domain */
> >>> +#define sbi_domain_mpxy_state_thishart_ptr()                 \
> >>> +     sbi_domain_get_mpxy_state(sbi_domain_thishart_ptr(),    \
> >>> +                               current_hartindex())
> >>> +
> >>>  #endif
> >>> diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c index
> >>> c5d9d1b..4a14c4f 100644
> >>> --- a/lib/sbi/sbi_mpxy.c
> >>> +++ b/lib/sbi/sbi_mpxy.c
> >>> @@ -11,6 +11,7 @@
> >>>  #include <sbi/sbi_domain.h>
> >>>  #include <sbi/sbi_error.h>
> >>>  #include <sbi/sbi_hart.h>
> >>> +#include <sbi/sbi_heap.h>
> >>>  #include <sbi/sbi_platform.h>
> >>>  #include <sbi/sbi_mpxy.h>
> >>>  #include <sbi/sbi_scratch.h>
> >>> @@ -22,9 +23,6 @@
> >>>  /** Shared memory size across all harts */  static unsigned long
> >>> mpxy_shmem_size = PAGE_SIZE;
> >>>
> >>> -/** Offset of pointer to MPXY state in scratch space */ -static
> >>> unsigned long mpxy_state_offset;
> >>> -
> >>>  /** List of MPXY proxy channels */
> >>>  static SBI_LIST_HEAD(mpxy_channel_list);
> >>>
> >>> @@ -89,6 +87,12 @@ struct mpxy_state {
> >>>       struct mpxy_shmem shmem;
> >>>  };
> >>>
> >>> +/** Per domain MPXY state */
> >>> +struct domain_mpxy_state_priv {
> >>> +     /** MPXY state for possible HARTs indexed by hartindex */
> >>> +     struct mpxy_state
> >>> +*hartindex_to_mpxy_state_table[SBI_HARTMASK_MAX_BITS];
> >>
> >> Please don't hardcode SBI_HARTMASK_MAX_BITS here. You can use
> >> sbi_hart_count() to update .data_size before calling
> >> sbi_domain_register_data(). Unfortunately, a struct cannot contain a
> >> flexible array member by itself, so you'll either need to get rid of
> >> the struct or add a dummy member.
> >
> > It seems we can use zero-length array in struct here.
> >
> >         struct domain_mpxy_state_priv {
> >                 struct mpxy_state *hartindex_to_mpxy_state_table[0];
> >         };
> >
> > The value of .data_size would be:
> >
> >         dmspriv.data_size = sizeof(struct mpxy_state *) *
> > sbi_hart_count();
>
> Right, and this is the same expression you would need if there was no struct
> and the type of dmsp was `struct mpxy_state **`.

I decide to remove that structure and use `struct mpxy_state **` as you suggested.
Please check v4 patch.


Regards,
Alvin

>
> > Do you have better idea?
>
> I don't have a strong opinion. The zero-sized array is a somewhat
> deprecated/controversial GCC extension, and using `struct mpxy_state **`
> produces similarly complex code, but if you prefer the struct, it should be fine.
>
> Regards,
> Samuel
>
> >>
> >>> +};
> >>> +
> >>>  /** Disable hart shared memory */
> >>>  static inline void sbi_mpxy_shmem_disable(struct mpxy_state *ms)  {
> >>> @@ -171,7 +175,7 @@ bool sbi_mpxy_channel_available(void)
> >>>
> >>>  static void mpxy_std_attrs_init(struct sbi_mpxy_channel *channel)  {
> >>> -     struct mpxy_state *ms =
> >> sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
> >>> +     struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
> >>>       u32 capability = 0;
> >>>
> >>>       /* Reset values */
> >>> @@ -240,25 +244,73 @@ int sbi_mpxy_register_channel(struct
> >> sbi_mpxy_channel *channel)
> >>>       return SBI_OK;
> >>>  }
> >>>
> >>> -int sbi_mpxy_init(struct sbi_scratch *scratch)
> >>> +/** Setup per domain MPXY state data */ static int
> >>> +domain_mpxy_state_data_setup(struct sbi_domain *dom,
> >>> +                                     struct sbi_domain_data
> >> *data,
> >>> +                                     void *data_ptr)
> >>>  {
> >>> +     struct domain_mpxy_state_priv *dmsp = data_ptr;
> >>>       struct mpxy_state *ms;
> >>> +     u32 i;
> >>> +
> >>> +     sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
> >>> +             ms = sbi_zalloc(sizeof(*ms));
> >>> +             if (!ms)
> >>> +                     return SBI_ENOMEM;
> >>> +
> >>> +             /*
> >>> +              * TODO: Proper support for checking msi support from
> >>> +              * platform. Currently disable msi and sse and use
> >>> +              * polling
> >>> +              */
> >>> +             ms->msi_avail = false;
> >>> +             ms->sse_avail = false;
> >>>
> >>> -     mpxy_state_offset = sbi_scratch_alloc_type_offset(struct
> mpxy_state);
> >>> -     if (!mpxy_state_offset)
> >>> -             return SBI_ENOMEM;
> >>> +             sbi_mpxy_shmem_disable(ms);
> >>> +
> >>> +             dmsp->hartindex_to_mpxy_state_table[i] = ms;
> >>> +     }
> >>>
> >>> -     /**
> >>> -      * TODO: Proper support for checking msi support from platform.
> >>> -      * Currently disable msi and sse and use polling
> >>> -      */
> >>> -     ms = sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
> >>> -     ms->msi_avail = false;
> >>> -     ms->sse_avail = false;
> >>> +     return 0;
> >>> +}
> >>>
> >>> -     sbi_mpxy_shmem_disable(ms);
> >>> +/** Cleanup per domain MPXY state data */ static void
> >>> +domain_mpxy_state_data_cleanup(struct sbi_domain *dom,
> >>> +                                        struct sbi_domain_data
> >> *data,
> >>> +                                        void *data_ptr) {
> >>> +     struct domain_mpxy_state_priv *dmsp = data_ptr;
> >>> +     u32 i;
> >>> +
> >>> +     sbi_hartmask_for_each_hartindex(i, dom->possible_harts)
> >>> +             sbi_free(dmsp->hartindex_to_mpxy_state_table[i]);
> >>> +}
> >>> +
> >>> +static struct sbi_domain_data dmspriv = {
> >>> +     .data_size = sizeof(struct domain_mpxy_state_priv),
> >>> +     .data_setup = domain_mpxy_state_data_setup,
> >>> +     .data_cleanup = domain_mpxy_state_data_cleanup, };
> >>> +
> >>> +struct mpxy_state *sbi_domain_get_mpxy_state(struct sbi_domain
> *dom,
> >>> +                                          u32 hartindex) {
> >>> +     struct domain_mpxy_state_priv *dmsp =
> >>> +             sbi_domain_data_ptr(dom, &dmspriv);
> >>> +
> >>> +     return (dmsp && hartindex < SBI_HARTMASK_MAX_BITS) ?
> >>
> >> sbi_hartindex_valid() would be appropriate here.
> >
> > Will use sbi_hartindex_valid() here, thanks!
> >
> >
> > Regards,
> > Alvin
> >
> >>
> >> Regards,
> >> Samuel
> >>
> >>> +             dmsp->hartindex_to_mpxy_state_table[hartindex] :
> NULL;
> >>> + }
> >>> +
> >>> +int sbi_mpxy_init(struct sbi_scratch *scratch) {
> >>> +     int ret;
> >>> +
> >>> +     ret = sbi_platform_mpxy_init(sbi_platform_ptr(scratch));
> >>> +     if (ret)
> >>> +             return ret;
> >>>
> >>> -     return sbi_platform_mpxy_init(sbi_platform_ptr(scratch));
> >>> +     return sbi_domain_register_data(&dmspriv);
> >>>  }
> >>>
> >>>  unsigned long sbi_mpxy_get_shmem_size(void) @@ -270,7 +322,7 @@
> int
> >>> sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
> >>>                      unsigned long shmem_phys_hi,
> >>>                      unsigned long flags)  {
> >>> -     struct mpxy_state *ms =
> >> sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
> >>> +     struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
> >>>       unsigned long *ret_buf;
> >>>
> >>>       /** Disable shared memory if both hi and lo have all bit 1s */
> >>> @@ -312,7 +364,7 @@ int sbi_mpxy_set_shmem(unsigned long
> >>> shmem_phys_lo,
> >>>
> >>>  int sbi_mpxy_get_channel_ids(u32 start_index)  {
> >>> -     struct mpxy_state *ms =
> >> sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
> >>> +     struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
> >>>       u32 remaining, returned, max_channelids;
> >>>       u32 node_index = 0, node_ret = 0;
> >>>       struct sbi_mpxy_channel *channel; @@ -363,7 +415,7 @@ int
> >>> sbi_mpxy_get_channel_ids(u32 start_index)
> >>>
> >>>  int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32
> >>> attr_count)  {
> >>> -     struct mpxy_state *ms =
> >> sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
> >>> +     struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
> >>>       int ret = SBI_SUCCESS;
> >>>       u32 *attr_ptr, end_id;
> >>>       void *shmem_base;
> >>> @@ -479,7 +531,7 @@ static int mpxy_check_write_std_attr(struct
> >>> sbi_mpxy_channel *channel,  static void mpxy_write_std_attr(struct
> >> sbi_mpxy_channel *channel, u32 attr_id,
> >>>                               u32 attr_val)  {
> >>> -     struct mpxy_state *ms =
> >> sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
> >>> +     struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
> >>>       struct sbi_mpxy_channel_attrs *attrs = &channel->attrs;
> >>>
> >>>       switch(attr_id) {
> >>> @@ -513,7 +565,7 @@ static void mpxy_write_std_attr(struct
> >>> sbi_mpxy_channel *channel, u32 attr_id,
> >>>
> >>>  int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32
> >>> attr_count)  {
> >>> -     struct mpxy_state *ms =
> >> sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
> >>> +     struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
> >>>       u32 *mem_ptr, attr_id, end_id, attr_val;
> >>>       struct sbi_mpxy_channel *channel;
> >>>       int ret, mem_idx;
> >>> @@ -603,7 +655,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8
> >> msg_id,
> >>>                         unsigned long msg_data_len,
> >>>                         unsigned long *resp_data_len)  {
> >>> -     struct mpxy_state *ms =
> >> sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
> >>> +     struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
> >>>       struct sbi_mpxy_channel *channel;
> >>>       void *shmem_base, *resp_buf;
> >>>       u32 resp_bufsize;
> >>> @@ -661,7 +713,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8
> >>> msg_id,
> >>>
> >>>  int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long
> >>> *events_len)  {
> >>> -     struct mpxy_state *ms =
> >> sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
> >>> +     struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
> >>>       struct sbi_mpxy_channel *channel;
> >>>       void *eventsbuf, *shmem_base;
> >>>       int ret;
CONFIDENTIALITY NOTICE:

This e-mail (and its attachments) may contain confidential and legally privileged information or information protected from disclosure. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution, or use of the information contained herein is strictly prohibited. In this case, please immediately notify the sender by return e-mail, delete the message (and any accompanying documents) and destroy all printed hard copies. Thank you for your cooperation.

Copyright ANDES TECHNOLOGY CORPORATION - All Rights Reserved.
