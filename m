From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 13 Sep 2024 08:35:12 +0200
Subject: [PATCH 4/5] lib: sbi: implement firmware feature
 SBI_FWFT_DOUBLE_TRAP
In-Reply-To: <a7ac32e7-aa71-4e27-b0b3-6ec360cae432@sifive.com>
References: <20240912121052.2959596-1-cleger@rivosinc.com>
 <20240912121052.2959596-5-cleger@rivosinc.com>
 <a7ac32e7-aa71-4e27-b0b3-6ec360cae432@sifive.com>
Message-ID: <38a3fb8a-70ae-411e-b075-95334badb36c@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 13/09/2024 01:41, Samuel Holland wrote:
> Hi Cl?ment,
> 
> On 2024-09-12 7:10 AM, Cl?ment L?ger wrote:
>> Add support for double trap firmware feature.
>>
>> NOTE: this commit depends on the ratification of the new SSE event
>> id for double trap [1].
>>
>> Link: https://lists.riscv.org/g/tech-prs/message/985 [1]
>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>> ---
>>  include/sbi/riscv_encoding.h |  3 ++-
>>  lib/sbi/sbi_fwft.c           | 25 +++++++++++++++++++++++++
>>  2 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
>> index 5b3bbc5..1d83434 100644
>> --- a/include/sbi/riscv_encoding.h
>> +++ b/include/sbi/riscv_encoding.h
>> @@ -214,7 +214,8 @@
>>  #define ENVCFG_ADUE_SHIFT		61
>>  #define ENVCFG_ADUE			(_ULL(1) << ENVCFG_ADUE_SHIFT)
>>  #define ENVCFG_CDE			(_ULL(1) << 60)
>> -#define ENVCFG_DTE			(_ULL(1) << 59)
>> +#define ENVCFG_DTE_SHIFT		59
>> +#define ENVCFG_DTE			(_ULL(1) << ENVCFG_DTE_SHIFT)
>>  #define ENVCFG_CBZE			(_UL(1) << 7)
>>  #define ENVCFG_CBCFE			(_UL(1) << 6)
>>  #define ENVCFG_CBIE_SHIFT		4
>> diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
>> index bc9cfd1..227ce83 100644
>> --- a/lib/sbi/sbi_fwft.c
>> +++ b/lib/sbi/sbi_fwft.c
>> @@ -155,6 +155,25 @@ static int fwft_get_adue(struct fwft_config *conf, unsigned long *value)
>>  	return fwft_menvcfg_read_bit(value, ENVCFG_ADUE_SHIFT);
>>  }
>>  
>> +static int fwft_double_trap_supported(struct fwft_config *conf)
>> +{
>> +	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
>> +				    SBI_HART_EXT_SSDBLTRP))
>> +		return SBI_ENOTSUPP;
>> +
>> +	return SBI_OK;
>> +}
>> +
>> +static int fwft_set_double_trap(struct fwft_config *conf, unsigned long value)
>> +{
>> +	return fwft_menvcfg_set_bit(value, ENVCFG_DTE_SHIFT);
>> +}
>> +
>> +static int fwft_get_double_trap(struct fwft_config *conf, unsigned long *value)
>> +{
>> +	return fwft_menvcfg_read_bit(value, ENVCFG_DTE_SHIFT);
>> +}
>> +
>>  static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
>>  {
>>  	int i;
>> @@ -246,6 +265,12 @@ static const struct fwft_feature features[] =
>>  		.set = fwft_set_adue,
>>  		.get = fwft_get_adue,
>>  	},
>> +	{
>> +		.id = SBI_FWFT_DOUBLE_TRAP,
>> +		.supported = fwft_double_trap_supported,
>> +		.set = fwft_set_double_trap,
>> +		.get = fwft_get_double_trap,
>> +	},
> 
> I would suggest sorting this entry and the above functions by feature ID.

Will do !

Thanks,

Cl?ment

> 
> Regards,
> Samuel
> 
>>  };
>>  
>>  int sbi_fwft_init(struct sbi_scratch *scratch, bool cold_boot)
> 


