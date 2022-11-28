From: Bin Meng <bmeng@tinylab.org>
Date: Mon, 28 Nov 2022 13:50:12 +0000
Subject: [PATCH] lib: utils/irqchip: plic: Fix the off-by-one error in priority
 save/restore helpers
In-Reply-To: <mvmpmd78alj.fsf@suse.de>
References: <20221128132129.58558-1-bmeng@tinylab.org> <mvmpmd78alj.fsf@suse.de>
Message-ID: <em4a6d0865-4451-41b3-a618-4040b4134ca2@c060526d.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/11/28 21:36:24, "Andreas Schwab" <schwab@suse.de> wrote:

>On Nov 28 2022, Bin Meng wrote:
>
>>  diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
>>  index 73d7788..4df9020 100644
>>  --- a/lib/utils/irqchip/plic.c
>>  +++ b/lib/utils/irqchip/plic.c
>>  @@ -38,13 +38,13 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
>>
>>   void plic_priority_save(const struct plic_data *plic, u8 *priority)
>>   {
>>  -	for (u32 i = 0; i < plic->num_src; i++)
>>  +	for (u32 i = 1; i <= plic->num_src; i++)
>>   		priority[i] = plic_get_priority(plic, i);
>
>That requires updating the size of the priority array.
These 2 APIs are really poorly designed. The index to the priority array 
is controlled by plic->num_src which comes from DTS, so there is 
potentially a mismatch between the DTS property value and the size of 
the priority array.

Currently the only user of these 2 APIs in OpenSBI is D1 and the size of 
the priority array is set to 176. There is no problem if DTS provides a 
less than 176 value. Otherwise it can cause out-of-bound access in 
OpenSBI.

Regards,
Bin

