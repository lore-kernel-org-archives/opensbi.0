From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 24 Mar 2025 17:41:10 +0100
Subject: [PATCH 2/6] lib: sbi: sse: Fix format string for event invalid
 state
In-Reply-To: <20250324-1d656e6ccf6562b1980794ae@orel>
References: <20250317105426.631243-1-cleger@rivosinc.com>
 <20250317105426.631243-3-cleger@rivosinc.com>
 <20250324-1d656e6ccf6562b1980794ae@orel>
Message-ID: <22e571b3-6553-4dbe-8808-8ee130e39a8c@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 24/03/2025 17:39, Andrew Jones wrote:
> On Mon, Mar 17, 2025 at 11:54:20AM +0100, Cl?ment L?ger wrote:
>> Add a missing newline and modify the display value of the event id to
>> use hex representation.
>>
>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>> ---
>>  lib/sbi/sbi_sse.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
>> index 4722ddc4..a30fad54 100644
>> --- a/lib/sbi/sbi_sse.c
>> +++ b/lib/sbi/sbi_sse.c
>> @@ -1268,7 +1268,7 @@ void sbi_sse_exit(struct sbi_scratch *scratch)
>>  			goto skip;
>>  
>>  		if (sse_event_state(e) > SBI_SSE_STATE_REGISTERED) {
>> -			sbi_printf("Event %d in invalid state at exit",
>> +			sbi_printf("Event 0x%x in invalid state at exit\n",
>>  				   info->event_id);
>>  			sse_event_set_state(e, SBI_SSE_STATE_UNUSED);
>>  		}
>> -- 
>> 2.47.2
>>
> 
> I'm not sure we want the print statement, but if we do, then

Agreed, that's actually debug so that should probably be removed and
handled gracefully.

Thanks,

Cl?ment

> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


