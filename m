From: Samuel Holland <samuel@sholland.org>
Date: Thu, 16 Jun 2022 23:28:41 -0500
Subject: [PATCH] lib: sbi: Fix version dependency for Sscofpmf
In-Reply-To: <CAAhSdy0Y49egjSeOfTC0OkSEmTf03EK1cHECi-ARjZj3oNtWaA@mail.gmail.com>
References: <20220613003838.13028-1-samuel@sholland.org>
 <CAAhSdy0Y49egjSeOfTC0OkSEmTf03EK1cHECi-ARjZj3oNtWaA@mail.gmail.com>
Message-ID: <97c665fe-7e52-cd56-c198-84e796fa8263@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On 6/16/22 11:12 PM, Anup Patel wrote:
> On Mon, Jun 13, 2022 at 6:08 AM Samuel Holland <samuel@sholland.org> wrote:
>>
>> mcounteren was added in the privileged spec v1.10 and mcountinhibit was
>> added in v1.11. Sscofpmf does not depend on anything in v1.12, so the
>> minimum privileged spec version should have been v1.11.
>>
>> Fixes: d4b563c881d6 ("lib: sbi: Remove MCOUNTEREN and SCOUNTEREN hart features")
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> I think there is some confusion here.
> 
> The mcounteren and mcountinhibit are not part of the Sscofpmf extension and
> OpenSBI PMU implementation does support platforms without Sscofpmf.

I am aware of that. I am referencing the comment on the previous line, and the
code that was changed by the referenced commit. The code, as originally written,
attempted to optimize out the Sscofpmf check based on the presence of those two
CSRs.

When the hart features were refactored, the CSR feature was replaced by the
wrong version, i.e. the behavior was accidentally changed by the refactoring.

This patch only attempts to restore the behavior from before the refactoring. If
that behavior was wrong to start with, that is a different matter.

Regards,
Samuel

> Regards,
> Anup
> 
>> ---
>>
>>  lib/sbi/sbi_hart.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
>> index de86fee..5bc6d52 100644
>> --- a/lib/sbi/sbi_hart.c
>> +++ b/lib/sbi/sbi_hart.c
>> @@ -645,7 +645,7 @@ __mhpm_skip:
>>                 hfeatures->priv_version = SBI_HART_PRIV_VER_1_12;
>>
>>         /* Counter overflow/filtering is not useful without mcounter/inhibit */
>> -       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
>> +       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_11) {
>>                 /* Detect if hart supports sscofpmf */
>>                 csr_read_allowed(CSR_SCOUNTOVF, (unsigned long)&trap);
>>                 if (!trap.cause)
>> --
>> 2.35.1
>>
>>
>> --
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi


