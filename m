From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 10 Dec 2024 10:12:20 +0100
Subject: [PATCH 3/3] lib: sbi: pmu: Set a SSE register_cb() for event
 availability
In-Reply-To: <b35d0465-6968-41c6-ab6f-a03b98b31307@sifive.com>
References: <20241206205958.1055770-1-cleger@rivosinc.com>
 <20241206205958.1055770-4-cleger@rivosinc.com>
 <b35d0465-6968-41c6-ab6f-a03b98b31307@sifive.com>
Message-ID: <e1378f38-d8e0-4009-a6f1-de28574e1b4c@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 09/12/2024 21:07, Samuel Holland wrote:
> On 2024-12-06 2:59 PM, Cl?ment L?ger wrote:
>> Since the SSE event can work only when the LCOFIP interrupt is available,
>> check for the Sscofpmf extension to be available in the SSE register
>> callback.
> 
> Is this a hard limitation, or could the driver be made to work whenever
> sbi_pmu_irq_bit() returns a valid bit?

Hi Samuel,

I guess you are right since that should also work for the ANDES platform
that have a PMU IRQ but does not support SSCOFPMF. So it would be better
to actually use sbi_pmu_irq_bit().

Thanks !

Cl?ment

> 
> Since this accurately reflects the current implementation:
> 
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> 
>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>> ---
>>  lib/sbi/sbi_pmu.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
>> index 0696ab5e..0851abad 100644
>> --- a/lib/sbi/sbi_pmu.c
>> +++ b/lib/sbi/sbi_pmu.c
>> @@ -1110,7 +1110,18 @@ static void pmu_sse_complete(uint32_t event_id)
>>  	csr_set(CSR_MIE, MIP_LCOFIP);
>>  }
>>  
>> +static int pmu_sse_register(uint32_t event_id)
>> +{
>> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>> +
>> +	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
>> +		return SBI_ERR_FAILED;
>> +
>> +	return SBI_SUCCESS;
>> +}
>> +
>>  static const struct sbi_sse_cb_ops pmu_sse_cb_ops = {
>> +	.register_cb = pmu_sse_register,
>>  	.enable_cb = pmu_sse_enable,
>>  	.disable_cb = pmu_sse_disable,
>>  	.complete_cb = pmu_sse_complete,
> 


