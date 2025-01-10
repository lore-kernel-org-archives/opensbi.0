From: Bo Gan <ganboing@gmail.com>
Date: Thu, 9 Jan 2025 17:20:26 -0800
Subject: [PATCH] Add a counter and debug printf to change the latency
 inside tlb_sync
In-Reply-To: <35430B00-3D3C-4922-B425-F4C08A1A4802@jrtc27.com>
References: <20250110000301.2620-1-cfu@mips.com>
 <35430B00-3D3C-4922-B425-F4C08A1A4802@jrtc27.com>
Message-ID: <38b6bf1b-37b4-4cd8-bcab-a3c5537546a1@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Chaoying,

I don't think this patch does anything at all. Using printf to delay is naive.
Can you give concrete example of how the livelock happened and when it happens
some precise number on the performance impact?


On 1/9/25 16:52, Jessica Clarke wrote:
> On 10 Jan 2025, at 00:03, Chao-ying Fu <icebergfu@gmail.com> wrote:
>>
>> The tlb_sync loop is slowed down by variable latency to avoid
>> livelock on some platforms.
> 
> I don?t understand ?by variable latency?. It doesn?t do anything but
> print.
> 
>> ---
>> lib/sbi/sbi_tlb.c | 6 ++++++
>> 1 file changed, 6 insertions(+)
>>
>> diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
>> index 01b31f4..d46b95c 100644
>> --- a/lib/sbi/sbi_tlb.c
>> +++ b/lib/sbi/sbi_tlb.c
>> @@ -247,6 +247,7 @@ static void tlb_process(struct sbi_scratch *scratch)
>>
>> static void tlb_sync(struct sbi_scratch *scratch)
>> {
>> + int count = 0;
>> atomic_t *tlb_sync =
>> sbi_scratch_offset_ptr(scratch, tlb_sync_off);
>>
>> @@ -256,6 +257,11 @@ static void tlb_sync(struct sbi_scratch *scratch)
>> * consume fifo requests to avoid deadlock.
>> */
>> tlb_process_once(scratch);
>> + count++;
> 
> Technically this could overflow, and count is signed, so UB...
> 
>> + if ((count % 20) == 0) {
>> + sbi_dprintf("tlb_sync loop count = %d value = %ld\n",
>> +    count, atomic_read(tlb_sync));
> 
> What value does this add? 20 isn?t that big...
> 
> If your goal is to avoid spinning and hammering memory, use pause?
> 
> Jess
> 
>> + }
>> }
>>
>> return;
>> -- 
>> 2.47.1
>>
>>
>> -- 
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi
> 
> 

Bo

