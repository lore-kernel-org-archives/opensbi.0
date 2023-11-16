From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 16 Nov 2023 16:32:33 +0800
Subject: [PATCH v2 1/3] lib: utils/timer: Allow ACLINT MTIMER driver to setup quirks
In-Reply-To: <CAAhSdy15pM9S95joEberBR7jOuJ2pTWcns2Pb0vn0WXS8GeiPw@mail.gmail.com>
References: <CAAhSdy15pM9S95joEberBR7jOuJ2pTWcns2Pb0vn0WXS8GeiPw@mail.gmail.com>
Message-ID: <IA1PR20MB49532FE3429208601E4ADF45BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>On Fri, Oct 13, 2023 at 12:17?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>>
>> The quirks checking will cause ACLINT step into a CLINT code path, this
>> is not expected when ACLINT needs a quirks.
>>
>> Add more check to ensure the timer is CLINT before applying quirks.
>> And now apply the general quirks after applying CLINT specific quirks.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> ---
>>  lib/utils/timer/fdt_timer_mtimer.c | 17 ++++++++++++++---
>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
>> index 9eaa11d..fb5917f 100644
>> --- a/lib/utils/timer/fdt_timer_mtimer.c
>> +++ b/lib/utils/timer/fdt_timer_mtimer.c
>> @@ -29,6 +29,12 @@ static SBI_LIST_HEAD(mtn_list);
>>
>>  static struct aclint_mtimer_data *mt_reference = NULL;
>>
>> +static int clint_contains_timer(const void *data)
>> +{
>> +       const struct timer_mtimer_quirks *quirks = data;
>> +       return quirks && quirks->mtime_offset;
>
>This is already broken because you are not allowing mtime_offset
>to be zero in quirks.
>
>Drop clint_contains_timer() function.
>

Drop this is OK for me, since it does break things.

>> +}
>> +
>>  static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>>                                   const struct fdt_match *match)
>>  {
>> @@ -58,7 +64,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>>                 return rc;
>>         }
>>
>> -       if (match->data) { /* SiFive CLINT */
>> +       if (clint_contains_timer(match->data)) {
>>                 const struct timer_mtimer_quirks *quirks = match->data;
>>
>>                 /* Set CLINT addresses */
>> @@ -74,8 +80,6 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>>                         mt->mtime_addr = mt->mtime_size = 0;
>>                 }
>>                 mt->mtimecmp_addr += quirks->mtime_offset;
>> -               /* Apply additional CLINT quirks */
>> -               mt->has_64bit_mmio = quirks->has_64bit_mmio;
>>         } else { /* RISC-V ACLINT MTIMER */
>>                 /* Set ACLINT MTIMER addresses */
>>                 mt->mtime_addr = addr[0];
>> @@ -84,6 +88,13 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>>                 mt->mtimecmp_size = size[1];
>>         }
>>
>> +       /* Apply additional quirks for CLINT and ACLINT */
>> +       if (match->data) {
>> +               const struct timer_mtimer_quirks *quirks = match->data;
>> +
>> +               mt->has_64bit_mmio = quirks->has_64bit_mmio;
>> +       }
>> +
>>         /* Check if MTIMER device has shared MTIME address */
>>         if (mt->mtime_size) {
>>                 mt->has_shared_mtime = false;
>> --
>> 2.42.0
>>
>>
>> --
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi
>
>Instead of above, I suggest to do as follows:
>
>diff --git a/lib/utils/timer/fdt_timer_mtimer.c
>b/lib/utils/timer/fdt_timer_mtimer.c
>index 9eaa11d..0187272 100644
>--- a/lib/utils/timer/fdt_timer_mtimer.c
>+++ b/lib/utils/timer/fdt_timer_mtimer.c
>@@ -16,6 +16,7 @@
> #include <sbi_utils/timer/aclint_mtimer.h>
>
> struct timer_mtimer_quirks {
>+    bool        custom_aclint;
>     unsigned int    mtime_offset;
>     bool        has_64bit_mmio;
>     bool        without_mtime;
>@@ -36,6 +37,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>     unsigned long addr[2], size[2];
>     struct timer_mtimer_node *mtn, *n;
>     struct aclint_mtimer_data *mt;
>+    const struct timer_mtimer_quirks *quirks = match->data;
>
>     mtn = sbi_zalloc(sizeof(*mtn));
>     if (!mtn)
>@@ -58,9 +60,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>         return rc;
>     }
>
>-    if (match->data) { /* SiFive CLINT */
>-        const struct timer_mtimer_quirks *quirks = match->data;
>-
>+    if (quirks && !quirks->custom_aclint) { /* SiFive CLINT */
>         /* Set CLINT addresses */
>         mt->mtimecmp_addr = addr[0] + ACLINT_DEFAULT_MTIMECMP_OFFSET;
>         mt->mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE;
>@@ -74,8 +74,6 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>             mt->mtime_addr = mt->mtime_size = 0;
>         }
>         mt->mtimecmp_addr += quirks->mtime_offset;
>-        /* Apply additional CLINT quirks */
>-        mt->has_64bit_mmio = quirks->has_64bit_mmio;
>     } else { /* RISC-V ACLINT MTIMER */
>         /* Set ACLINT MTIMER addresses */
>         mt->mtime_addr = addr[0];
>@@ -84,6 +82,11 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>         mt->mtimecmp_size = size[1];
>     }
>
>+    if (quirks) {
>+        /* Apply additional quirks */
>+        mt->has_64bit_mmio = quirks->has_64bit_mmio;
>+    }
>+
>     /* Check if MTIMER device has shared MTIME address */
>     if (mt->mtime_size) {
>         mt->has_shared_mtime = false;
>
>Regards,
>Anup
>
>

Yes, this is my alternative options, I will take this advice and rebase
these patches. Thanks for your advice.

