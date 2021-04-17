From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sat, 17 Apr 2021 14:17:19 +0100
Subject: [PATCH 1/2] lib: utils: Implement "64bit-mmio" property parsing
In-Reply-To: <DM6PR04MB620101DC0E10E4D6148828D88D4B9@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <1618285442-84580-1-git-send-email-guoren@kernel.org>
 <B636699C-B856-43E6-9FEC-44A62284E0B6@jrtc27.com>
 <CED1C4CB-F804-4548-8052-FD1251B7256F@jrtc27.com>
 <DM6PR04MB620101DC0E10E4D6148828D88D4B9@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <F0C72036-4A71-45F0-AF57-680693230A8E@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 17 Apr 2021, at 14:16, Anup Patel <Anup.Patel@wdc.com> wrote:
> 
> 
> 
>> -----Original Message-----
>> From: Jessica Clarke <jrtc27@jrtc27.com>
>> Sent: 17 April 2021 17:16
>> To: guoren at kernel.org
>> Cc: Alistair Francis <Alistair.Francis@wdc.com>; Anup Patel
>> <anup@brainfault.org>; OpenSBI <opensbi@lists.infradead.org>; Guo Ren
>> <guoren@linux.alibaba.com>; Anup Patel <Anup.Patel@wdc.com>; Xiang W
>> <wxjstz@126.com>
>> Subject: Re: [PATCH 1/2] lib: utils: Implement "64bit-mmio" property parsing
>> 
>> On 17 Apr 2021, at 12:41, Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>> 
>>> On 13 Apr 2021, at 04:44, guoren at kernel.org wrote:
>>>> 
>>>> From: Guo Ren <guoren@linux.alibaba.com>
>>>> 
>>>> Figure out CLINT has_64bit_mmio from DT node and using antonym for
>>>> compatibility.
>>>> 
>>>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>>>> Cc: Anup Patel <anup.patel@wdc.com>
>>>> Cc: Xiang W <wxjstz@126.com>
>>>> ---
>>>> lib/utils/fdt/fdt_helper.c | 3 ++-
>>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>> 
>>>> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
>>>> index bf19ff9..909de01 100644
>>>> --- a/lib/utils/fdt/fdt_helper.c
>>>> +++ b/lib/utils/fdt/fdt_helper.c
>>>> @@ -442,8 +442,9 @@ int fdt_parse_clint_node(void *fdt, int
>> nodeoffset, bool for_timer,
>>>> 	if (clint->hart_count < count)
>>>> 		clint->hart_count = count;
>>>> 
>>>> -	/* TODO: We should figure-out CLINT has_64bit_mmio from DT node
>> */
>>>> 	clint->has_64bit_mmio = TRUE;
>>>> +	if (fdt_getprop(fdt, nodeoffset, "clint,has-no-64bit-mmio",
>>>> +&count))
>>> 
>>> I do not see this specified in clint.yaml.
>> 
>> Also, the RISC-V privileged is very clear:
>> 
>>> For RV64, naturally aligned 64-bit memory accesses to the mtime and
>>> mtimecmp registers are atomic.
>> 
>> So I would say your CLINT violates the spec and thus should not claim to be a
>> RISC-V or SiFive-compatible CLINT.
> 
> There is no CLINT spec maintained by RISC-V international.
> 
> All implementation have SiFive compatible CLINT or some variant of it.

That was a quote from the ratified privileged spec. The memory mapping may not
be specified by RISC-V Intl, but the fact that mtime(cmp) are 64-bit registers
is very much specified.

Jess


