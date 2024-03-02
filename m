From: Bo Gan <ganboing@gmail.com>
Date: Sat, 2 Mar 2024 06:05:37 -0800
Subject: [PATCH v3 5/6] include: sbi: add emulate_load/store handler to
 platform ops
In-Reply-To: <CAAhSdy1sA==MaLNHtgma4fwcQB99hT+CaB1hEmFO+qFo+Tq-bQ@mail.gmail.com>
References: <1709378725-56656-1-git-send-email-ganboing@gmail.com>
 <1709378725-56656-6-git-send-email-ganboing@gmail.com>
 <CAAhSdy1sA==MaLNHtgma4fwcQB99hT+CaB1hEmFO+qFo+Tq-bQ@mail.gmail.com>
Message-ID: <6565f51c-1d98-a914-2b13-469fe32e32c9@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/2/24 5:12 AM, Anup Patel wrote:
> On Sat, Mar 2, 2024 at 4:55?PM Bo Gan <ganboing@gmail.com> wrote:
>>
>> This patch allows the platform to define load/store emulators. This
>> enables a platform to trap-and-emulate special devices or filter
>> access to existing physical devices.
>>
>> Signed-off-by: Bo Gan <ganboing@gmail.com>
>> ---
>>   include/sbi/sbi_platform.h | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
>> index 2fb33e1..06247dc 100644
>> --- a/include/sbi/sbi_platform.h
>> +++ b/include/sbi/sbi_platform.h
>> @@ -53,6 +53,8 @@ struct sbi_domain_memregion;
>>   struct sbi_ecall_return;
>>   struct sbi_trap_regs;
>>   struct sbi_hart_features;
>> +struct sbi_trap_info;
>> +union sbi_reg_data;
>>
>>   /** Possible feature flags of a platform */
>>   enum sbi_platform_features {
>> @@ -139,6 +141,15 @@ struct sbi_platform_operations {
>>          int (*vendor_ext_provider)(long funcid,
>>                                     struct sbi_trap_regs *regs,
>>                                     struct sbi_ecall_return *out);
>> +
>> +       /** platform specific handler to fixup load fault */
>> +       int (*emulate_load)(int rlen, union sbi_reg_data *out_val,
>> +                           struct sbi_trap_regs *regs,
>> +                           const struct sbi_trap_info *orig_trap);
>> +       /** platform specific handler to fixup store fault */
>> +       int (*emulate_store)(int wlen, union sbi_reg_data in_val,
>> +                            struct sbi_trap_regs *regs,
>> +                            const struct sbi_trap_info *orig_trap);
> 
> This callback prototype is totally wrong. The platform code need
> not be aware of sbi_trap_regs and sbi_trap_info. The generic
> sbi_ldst_trap.c should not expose how load/store is emulated
> to other parts of OpenSBI.
> 
> These callback prototypes should be:
>         /** platform specific handler to fixup load fault */
>         int (*emulate_load)(int rlen, union sbi_reg_data *out_val);
>         /** platform specific handler to fixup store fault */
>         int (*emulate_store)(int wlen, union sbi_reg_data in_val);
> 
Look like the major issue with this patchset is this.
I understand your concern. The only reason I need the platform code to receive these
two pointers is for it to call `sbi_trap_redirect` for *real* faults.
Platform code will treat these two as opaque pointers and never access struct members.

I can do without these two, then it will basically change the semantic of the return
code of the platform handler like this:

plat->ops->emulate_load/store returns:

  r/wlen => successful, do mepc/rd update
  0      => unhandled, do sbi_trap_redirect
  -errno => failed, do sbi_trap_err

With this, whenever platform code decide to redirect trap, it must redirect the original
trap (by returning 0). Also platform handler will never see any register state.

I'm good with this. If this is acceptable behavior to you, please let me know.

>>   };
>>
>>   /** Platform default per-HART stack size for exception/interrupt handling */
>> --
>> 2.7.4
>>
> 
> Regards,
> Anup
> 


