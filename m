From: Andreas Schwab <schwab@linux-m68k.org>
Date: Thu, 05 Aug 2021 10:46:45 +0200
Subject: [PATCH v2] lib: sbi: Fix bug in strncmp function
In-Reply-To: <CAEUhbmVeLtGTbpbiO9we8vxmsV+HU1e-11kaS4VL_=XgOcBmvA@mail.gmail.com>
 (Bin Meng's message of "Thu, 5 Aug 2021 16:39:55 +0800")
References: <20210728161535.421-1-Dd_nirvana@sjtu.edu.cn>
 <CAEUhbmVeLtGTbpbiO9we8vxmsV+HU1e-11kaS4VL_=XgOcBmvA@mail.gmail.com>
Message-ID: <87bl6cth1m.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Aug 05 2021, Bin Meng wrote:

> Hi Dong,
>
> On Thu, Jul 29, 2021 at 12:23 AM Dong Du <Dd_nirvana@sjtu.edu.cn> wrote:
>>
>> No need to compare characters when the count turns to 0.
>> Fix the issue in sbi_strncmp.
>>
>> Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
>> ---
>>  lib/sbi/sbi_string.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
>> index 7805ba4..c87bce9 100644
>> --- a/lib/sbi/sbi_string.c
>> +++ b/lib/sbi/sbi_string.c
>> @@ -33,6 +33,10 @@ int sbi_strncmp(const char *a, const char *b, size_t count)
>>         for (; count > 0 && *a == *b && *a != '\0'; a++, b++, count--)
>>                 ;
>>
>> +       /* No difference till the end */
>> +       if (!count)
>> +               return 0;
>> +
>>         return *a - *b;
>>  }
>>
>
> Your original patch is also needed: "strncmp should return 0 when the
> count is 0"

Which this patch duly implements.

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

