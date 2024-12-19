From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 18 Dec 2024 23:02:56 -0600
Subject: [PATCH] lib: utils: Mark RPMI drivers as experimental
In-Reply-To: <CAAhSdy29F5Pu-tsrnwfR1GwFCUwaTUdACNxzbquMat-ZLv2FvQ@mail.gmail.com>
References: <20241215212950.3701559-1-samuel.holland@sifive.com>
 <CAAhSdy3C4GxBpxzs1+LwC8To6DFTm8c_y7kabMV6OaX3UD74Fg@mail.gmail.com>
 <5b47284c-885f-478a-a1ba-4505ba0e0916@sifive.com>
 <CAAhSdy29F5Pu-tsrnwfR1GwFCUwaTUdACNxzbquMat-ZLv2FvQ@mail.gmail.com>
Message-ID: <a0664c53-adc9-4429-8edf-ad8c9f4dec41@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On 2024-12-16 10:40 PM, Anup Patel wrote:
> On Mon, Dec 16, 2024 at 10:46?PM Samuel Holland
> <samuel.holland@sifive.com> wrote:
>> On 2024-12-16 11:01 AM, Anup Patel wrote:
>>> On Mon, Dec 16, 2024 at 2:59?AM Samuel Holland
>>> <samuel.holland@sifive.com> wrote:
>>>>
>>>> These drivers were merged on an experimental basis without the RPMI
>>>> specification being frozen. As a result, they may not be compatible with
>>>> the frozen version of the RPMI protocol. Additionally, their devicetree
>>>> bindings have not been reviewed and are subject to change. Warn the user
>>>> that these drivers make no compatibility guarantees, and that their
>>>> behavior and devicetree bindings may change incompatibly in future
>>>> versions of OpenSBI.
>>>>
>>>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>>>> ---
>>>>
>>>>  include/sbi_utils/fdt/fdt_driver.h         | 1 +
>>>>  lib/utils/cppc/fdt_cppc_rpmi.c             | 1 +
>>>>  lib/utils/fdt/fdt_driver.c                 | 4 ++++
>>>>  lib/utils/hsm/fdt_hsm_rpmi.c               | 1 +
>>>>  lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 1 +
>>>>  lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c        | 1 +
>>>>  lib/utils/reset/fdt_reset_rpmi.c           | 1 +
>>>>  lib/utils/suspend/fdt_suspend_rpmi.c       | 1 +
>>>>  8 files changed, 11 insertions(+)
>>>>
>>>> diff --git a/include/sbi_utils/fdt/fdt_driver.h b/include/sbi_utils/fdt/fdt_driver.h
>>>> index f6fd26f9..12ffe3f9 100644
>>>> --- a/include/sbi_utils/fdt/fdt_driver.h
>>>> +++ b/include/sbi_utils/fdt/fdt_driver.h
>>>> @@ -15,6 +15,7 @@ struct fdt_driver {
>>>>         const struct fdt_match *match_table;
>>>>         int (*init)(const void *fdt, int nodeoff,
>>>>                     const struct fdt_match *match);
>>>> +       bool experimental;
>>>>  };
>>>>
>>>>  /**
>>>> diff --git a/lib/utils/cppc/fdt_cppc_rpmi.c b/lib/utils/cppc/fdt_cppc_rpmi.c
>>>> index b6789901..3b7006ce 100644
>>>> --- a/lib/utils/cppc/fdt_cppc_rpmi.c
>>>> +++ b/lib/utils/cppc/fdt_cppc_rpmi.c
>>>> @@ -377,4 +377,5 @@ static const struct fdt_match rpmi_cppc_match[] = {
>>>>  struct fdt_driver fdt_cppc_rpmi = {
>>>>         .match_table = rpmi_cppc_match,
>>>>         .init = rpmi_cppc_cold_init,
>>>> +       .experimental = true,
>>>>  };
>>>> diff --git a/lib/utils/fdt/fdt_driver.c b/lib/utils/fdt/fdt_driver.c
>>>> index 586ea8aa..87bd866d 100644
>>>> --- a/lib/utils/fdt/fdt_driver.c
>>>> +++ b/lib/utils/fdt/fdt_driver.c
>>>> @@ -30,6 +30,10 @@ int fdt_driver_init_by_offset(const void *fdt, int nodeoff,
>>>>                         if (!fdt_stringlist_contains(prop, len, match->compatible))
>>>>                                 continue;
>>>>
>>>> +                       if (driver->experimental)
>>>> +                               sbi_printf("WARNING: %s is experimental and may have incompatible changes\n",
>>>> +                                          match->compatible);
>>>> +
>>>
>>> Overall this is a good change but we should shorten this message.
>>
>> Do you have a specific suggestion? If not, I'll plan to go with:
>>
>>         "WARNING: experimental driver %s is unstable\n"
> 
> I think the following is sufficient:
>      "WARNING: %s driver is experimental and may change\n"
> 
>>
>>> Also, the default CONSOLE_EARLY_BUFFER_SIZE is small at the
>>> moment.
>>
>> This could be mitigated by moving fdt_serial_init() earlier in
>> generic_early_init() (as a separate change). I don't think any of those other
>> subsystems need to be initialized before the console.
> 
> Agreed. Lets do fdt_serial_init() in generic_early_init() for coldboot path
> as the first thing.

I've made both changes for v2.

>>> Also, can you do something similar for experimental SBI extensions ?
>>
>> Where would you expect the warning (if any) to be printed? If I put it in
>> sbi_ecall_register_extension(), it would be printed for all defconfig users,
>> since FWFT/MPXY/SSE are enabled by default. Is that what you are expecting?
> 
> How about adding it in sbi_ecall_init() after the extension has been
> successfully registered ?

I could do that. I am hesitant to do so because the warning will be printed for
all users, not just those using/testing the new extensions, which could be
confusing. If you think this is the best solution, I'll send a patch for it.
Here are two possible alternatives:

1) Change the experimental SBI extensions to use the "Experimental SBI Extension
Space (EIDs #0x08000000 - #0x08FFFFFF)" until they are ratified. This seems to
be what that range was intended for.

2) Disable the experimental SBI extensions in the defconfig, so users must opt
in to the experimental functionality. (Or this change could be combined with the
warning.)

Regards,
Samuel

>>>>                         rc = driver->init(fdt, nodeoff, match);
>>>>                         if (rc < 0) {
>>>>                                 const char *name;
>>>> diff --git a/lib/utils/hsm/fdt_hsm_rpmi.c b/lib/utils/hsm/fdt_hsm_rpmi.c
>>>> index 975d3484..66fa0fe2 100644
>>>> --- a/lib/utils/hsm/fdt_hsm_rpmi.c
>>>> +++ b/lib/utils/hsm/fdt_hsm_rpmi.c
>>>> @@ -359,4 +359,5 @@ static const struct fdt_match rpmi_hsm_match[] = {
>>>>  struct fdt_driver fdt_hsm_rpmi = {
>>>>         .match_table = rpmi_hsm_match,
>>>>         .init = rpmi_hsm_cold_init,
>>>> +       .experimental = true,
>>>>  };
>>>> diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
>>>> index 91db4e96..b8bd3cd6 100644
>>>> --- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
>>>> +++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
>>>> @@ -768,6 +768,7 @@ struct fdt_mailbox fdt_mailbox_rpmi_shmem = {
>>>>         .driver = {
>>>>                 .match_table = rpmi_shmem_mbox_match,
>>>>                 .init = rpmi_shmem_mbox_init,
>>>> +               .experimental = true,
>>>>         },
>>>>         .xlate = fdt_mailbox_simple_xlate,
>>>>  };
>>>> diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
>>>> index c09a4c52..78020eae 100644
>>>> --- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
>>>> +++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
>>>> @@ -439,4 +439,5 @@ static const struct fdt_match mpxy_mbox_match[] = {
>>>>  struct fdt_driver fdt_mpxy_rpmi_mbox = {
>>>>         .match_table = mpxy_mbox_match,
>>>>         .init = mpxy_mbox_init,
>>>> +       .experimental = true,
>>>>  };
>>>> diff --git a/lib/utils/reset/fdt_reset_rpmi.c b/lib/utils/reset/fdt_reset_rpmi.c
>>>> index 1ec4396b..70826b96 100644
>>>> --- a/lib/utils/reset/fdt_reset_rpmi.c
>>>> +++ b/lib/utils/reset/fdt_reset_rpmi.c
>>>> @@ -138,4 +138,5 @@ static const struct fdt_match rpmi_reset_match[] = {
>>>>  struct fdt_driver fdt_reset_rpmi = {
>>>>         .match_table = rpmi_reset_match,
>>>>         .init = rpmi_reset_init,
>>>> +       .experimental = true,
>>>>  };
>>>> diff --git a/lib/utils/suspend/fdt_suspend_rpmi.c b/lib/utils/suspend/fdt_suspend_rpmi.c
>>>> index 11696648..07ff5198 100644
>>>> --- a/lib/utils/suspend/fdt_suspend_rpmi.c
>>>> +++ b/lib/utils/suspend/fdt_suspend_rpmi.c
>>>> @@ -135,4 +135,5 @@ static const struct fdt_match rpmi_suspend_match[] = {
>>>>  struct fdt_driver fdt_suspend_rpmi = {
>>>>         .match_table = rpmi_suspend_match,
>>>>         .init = rpmi_suspend_init,
>>>> +       .experimental = true,
>>>>  };
>>>> --
>>>> 2.45.1
>>>>
>>


