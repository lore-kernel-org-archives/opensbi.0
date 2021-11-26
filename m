From: Dong Du <dd_nirvana@sjtu.edu.cn>
Date: Fri, 26 Nov 2021 14:38:02 +0800 (CST)
Subject: [PATCH] lib: sbi: Resolve the uninitialized complaint in sbi_pmu
In-Reply-To: <b556ea59f5ddbd64bc6590f18bdfd867f099bf26.camel@126.com>
References: <20211125103817.6018-1-Dd_nirvana@sjtu.edu.cn>
 <b556ea59f5ddbd64bc6590f18bdfd867f099bf26.camel@126.com>
Message-ID: <1736779625.2042898.1637908682778.JavaMail.zimbra@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Nov 25, 2021, at 11:35 PM, Xiang wxjstz at 126.com wrote:

> ? 2021-11-25???? 18:38 +0800?Dong Du???
>> A recent commit (b28f0700) turns to read from CSR_MCOUNTINHIBIT after
>> checking the SBI_HART_HAS_MCOUNTINHIBIT HART feature, which leaves
>> the
>> mctr_inhbt uninitialized in pmu_ctr_find_hw().
>> As a result, compiler will complain:
>> error: 'mctr_inhbt' may be used uninitialized in this function.
>> 
>> This commit resolves the issue by assigning an initial value to
>> mctr_inhbt.
>> 
>> Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
> SBI_HART_HAS_MCOUNTINHIBIT has been tested before accessing mctr_inhbt,

Hi Xiang,

  It's true. It's not a bug (as I said, it's a compiler complaint).
  But the compiler (gcc) can not know (and ensure) that the used variable is always initialized.

  The reported issue will lead to a compiling error now in my environment because of 'Werror=maybe-uninitialized'.

Regards,
Dong

> so there is no need to initialize
> 
> Regards,
> Xiang W
>> ---
>> ?lib/sbi/sbi_pmu.c | 2 +-
>> ?1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
>> index a0eb359..5950a20 100644
>> --- a/lib/sbi/sbi_pmu.c
>> +++ b/lib/sbi/sbi_pmu.c
>> @@ -489,7 +489,7 @@ static int pmu_ctr_find_hw(unsigned long cbase,
>> unsigned long cmask, unsigned lo
>> ????????unsigned long ctr_mask;
>> ????????int i, ret = 0, fixed_ctr, ctr_idx = SBI_ENOTSUPP;
>> ????????struct sbi_pmu_hw_event *temp;
>> -???????unsigned long mctr_inhbt;
>> +???????unsigned long mctr_inhbt = 0;
>> ????????u32 hartid = current_hartid();
>> ????????struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>> ?
>> --
>> 2.33.1
>> 

