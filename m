From: Anup Patel <anup@brainfault.org>
Date: Wed, 9 Feb 2022 17:00:21 +0530
Subject: [PATCH 02/13] lib: sbi: Detect AIA CSRs at boot-time
In-Reply-To: <CAOnJCUJo9pT2s6dPxWAphFavLirEPJ_tqSk2Y-rzLXM2mXFMng@mail.gmail.com>
References: <20220104100952.127448-1-apatel@ventanamicro.com>
 <20220104100952.127448-3-apatel@ventanamicro.com>
 <CAOnJCUJo9pT2s6dPxWAphFavLirEPJ_tqSk2Y-rzLXM2mXFMng@mail.gmail.com>
Message-ID: <CAAhSdy3+-1KjkHC38f7-WmDUWgqpOaZxqFWdYbC7SFM0MsRJ1w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 28, 2022 at 1:17 PM Atish Patra <atishp@atishpatra.org> wrote:
>
>
>
> On Tue, Jan 4, 2022 at 2:10 AM Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> We extend HART feature detection to discover AIA CSRs at boot-time.
>>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> ---
>>  include/sbi/sbi_hart.h |  4 +++-
>>  lib/sbi/sbi_hart.c     | 23 +++++++++++++++++++++++
>>  2 files changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
>> index d2db9d6..a83b45b 100644
>> --- a/include/sbi/sbi_hart.h
>> +++ b/include/sbi/sbi_hart.h
>> @@ -24,9 +24,11 @@ enum sbi_hart_features {
>>         SBI_HART_HAS_SSCOFPMF = (1 << 3),
>>         /** HART has timer csr implementation in hardware */
>>         SBI_HART_HAS_TIME = (1 << 4),
>> +       /** HART has AIA local interrupt CSRs */
>> +       SBI_HART_HAS_AIA = (1 << 5),
>>
>>         /** Last index of Hart features*/
>> -       SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_TIME,
>> +       SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_AIA,
>>  };
>>
>>  struct sbi_scratch;
>> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
>> index d9a15d9..c16b395 100644
>> --- a/lib/sbi/sbi_hart.c
>> +++ b/lib/sbi/sbi_hart.c
>> @@ -283,6 +283,9 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
>>         case SBI_HART_HAS_TIME:
>>                 fstr = "time";
>>                 break;
>> +       case SBI_HART_HAS_AIA:
>> +               fstr = "aia";
>> +               break;
>>         default:
>>                 break;
>>         }
>> @@ -506,6 +509,26 @@ __mhpm_skip:
>>         csr_read_allowed(CSR_TIME, (unsigned long)&trap);
>>         if (!trap.cause)
>>                 hfeatures->features |= SBI_HART_HAS_TIME;
>> +
>> +       /* Detect if hart has AIA local interrupt CSRs */
>> +       csr_read_allowed(CSR_MTOPI, (unsigned long)&trap);
>> +       if (trap.cause)
>> +               goto __aia_skip;
>> +       csr_read_allowed(CSR_MISELECT, (unsigned long)&trap);
>> +       if (trap.cause)
>> +               goto __aia_skip;
>> +       csr_write_allowed(CSR_MISELECT, (unsigned long)&trap, 0x30);
>
>
> You can use __check_csr directly here as you are not using the value returned from csr_read_allowed.
> Some comment for the magic value  0x30 is necessary as well.

We don't __check_csr() here because some CSRs (such as MTOPI) are read-only.

>
> I have a slightly orthogonal question as well. AFAIK, all these CSRs are mandatory for AIA.
> Do we need to detect all the CSRs every time? Absence of 1 CSR is enough to indicate that AIA is not
> present. I guess you want all the CSR to cover the buggy hardware use case.
>
> However, that is a corner case which can be handled in a platform specific manner. I am just worried
> that this may blow up in the future which would hurt the boot time in the long run.

You are right. Checking all these CSRs for AIA presence is an overkill.

We can simply check read-only MTOPI CSR and be done with it. I will
update this in the next patch revision.

Regards,
Anup

>
>> +       if (trap.cause)
>> +               goto __aia_skip;
>> +       val = csr_read_allowed(CSR_MIREG, (unsigned long)&trap);
>> +       if (trap.cause)
>> +               goto __aia_skip;
>> +       csr_write_allowed(CSR_MIREG, (unsigned long)&trap, val);
>> +       if (trap.cause)
>> +               goto __aia_skip;
>> +       hfeatures->features |= SBI_HART_HAS_AIA;
>> +__aia_skip:
>> +       return;
>>  }
>>
>>  int sbi_hart_reinit(struct sbi_scratch *scratch)
>> --
>> 2.25.1
>>
>>
>> --
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi
>
>
>
> --
> Regards,
> Atish

