From: Samuel Holland <samuel@sholland.org>
Date: Mon, 12 Dec 2022 00:45:24 -0600
Subject: [PATCH v3 2/5] lib: utils/irqchip: plic: Ensure no out-of-bound
 access in priority save/restore helpers
In-Reply-To: <87tu22qgvq.fsf@igel.home>
References: <20221211065424.806478-1-bmeng@tinylab.org>
 <20221211065424.806478-2-bmeng@tinylab.org> <87tu22qgvq.fsf@igel.home>
Message-ID: <ed95c5e0-b3cd-5c0e-6708-415edfc50bbd@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/11/22 06:11, Andreas Schwab wrote:
> On Dez 11 2022, Bin Meng wrote:
> 
>> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
>> index 18d330d..1f27575 100644
>> --- a/platform/generic/allwinner/sun20i-d1.c
>> +++ b/platform/generic/allwinner/sun20i-d1.c
>> @@ -79,13 +79,13 @@ static u32 plic_threshold;
>>  static void sun20i_d1_plic_save(void)
>>  {
>>  	fdt_plic_context_save(true, plic_sie, &plic_threshold);
>> -	fdt_plic_priority_save(plic_priority);
>> +	fdt_plic_priority_save(plic_priority, PLIC_SOURCES);
>>  }
>>  
>>  static void sun20i_d1_plic_restore(void)
>>  {
>>  	thead_plic_restore();
>> -	fdt_plic_priority_restore(plic_priority);
>> +	fdt_plic_priority_restore(plic_priority, PLIC_SOURCES);
>>  	fdt_plic_context_restore(true, plic_sie, plic_threshold);
>>  }
> 
> That fails to update the size of the plic_priority array.

PLIC_SOURCES is 176, and I later corrected riscv,ndev in the DT to 175,
so technically this does not create a bug.

Regards,
Samuel


