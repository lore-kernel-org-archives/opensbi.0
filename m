From: Bo Gan <ganboing@gmail.com>
Date: Tue, 21 Nov 2023 16:56:05 -0800
Subject: [PATCH 2/2] lib: sbi: Make ipi send/clear and access ipi_type
 non-reentrant
In-Reply-To: <3f1751b2c8b0437e72543e2d25f8ef6ae40512fe.camel@126.com>
References: <20231120095301.105772-1-wxjstz@126.com>
 <20231120095301.105772-2-wxjstz@126.com>
 <3f1751b2c8b0437e72543e2d25f8ef6ae40512fe.camel@126.com>
Message-ID: <06a9c1b4-43d9-4fea-3001-047d55ec3c75@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>> @@ -220,8 +224,12 @@ void sbi_ipi_process(void)
>>  ?	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
>>   
>>  ?	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
>> +
>> +	spin_lock(&ipi_data->lock);
>>  ?	sbi_ipi_raw_clear(hartindex);
>>  ?	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
>> +	spin_unlock(&ipi_data->lock);
>> +
>>  ?	ipi_event = 0;
>>  ?	while (ipi_type) {
>>  ?		if (ipi_type & 1UL) {

Hi Xiang,

I think we should drop this, and use Anup's new patch instead. I don't
think the spinlock here is helping to ensure the ordering between

sbi_ipi_raw_clear and xchg(). Furthermore, spinlock in OpenSBI doesn't
order IO, so ipi_raw_clear can leak below spin_unlock. Thus, it won't
address the race condition in previous discussions.

With Anip's new patch that uses wmb() in both sender and receiver, it
fixes the correctness issue, and hopefully has negligible performance
impact: See the discussion here:

http://lists.infradead.org/pipermail/opensbi/2023-November/005937.html

Bo

