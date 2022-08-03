From: dramforever <dramforever@live.com>
Date: Wed, 3 Aug 2022 22:31:34 +0800
Subject: [RFC PATCH 3/3] lib: sbi_trap: Set hstatus.GVA when redirecting
In-Reply-To: <20220803131622.xap63zrtrjayyl7i@kamzik>
References: <TYYP286MB143914043D5A77C568CDDE57C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB143966B6CB24922A0888661FC69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <20220803131622.xap63zrtrjayyl7i@kamzik>
Message-ID: <TYYP286MB143901BADEC5083308197741C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/3/22 21:16, Andrew Jones wrote:
> On Wed, Aug 03, 2022 at 01:16:52PM +0800, dramforever wrote:
>> ---
>>  lib/sbi/sbi_trap.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
>> index ee3e4e9..1669577 100644
>> --- a/lib/sbi/sbi_trap.c
>> +++ b/lib/sbi/sbi_trap.c
>> @@ -118,12 +118,15 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>>  	regs->mstatus |= (next_virt) ? MSTATUS_MPV : 0UL;
>>  #endif
>>  
>> -	/* Update HSTATUS for VS/VU-mode to HS-mode transition */
>> -	if (misa_extension('H') && prev_virt && !next_virt) {
>> -		/* Update HSTATUS SPVP and SPV bits */
>> +	/* Update HSTATUS if going to HS-mode */
>> +	if (misa_extension('H') && !next_virt) {
>>  		hstatus = csr_read(CSR_HSTATUS);
>> -		hstatus &= ~HSTATUS_SPVP;
>> -		hstatus |= (prev_mode == PRV_S) ? HSTATUS_SPVP : 0;
>> +		if (prev_virt) {
>> +			hstatus &= ~HSTATUS_SPVP;
>> +			hstatus |= (prev_mode == PRV_S) ? HSTATUS_SPVP : 0;
>> +		}
>> +		hstatus &= ~HSTATUS_GVA;
>> +		hstatus |= (trap->gva) ? HSTATUS_GVA : 0;
> trap->gva may be garbage at the point of this check since
> sbi_trap_redirect() is called from:
>
>   lib/sbi/sbi_illegal_insn.c:34
>   lib/sbi/sbi_misaligned_ldst.c:132
>   lib/sbi/sbi_misaligned_ldst.c:247
>   lib/sbi/sbi_trap.c:314
>
> with an uninitialized, stack-allocated sbi_trap_info structure,
> where all the members are explicitly initialized before the call.
> We need to also initialize gva at those points.
Thanks for the catch. I did not realize that sbi_trap_redirect() was
also used this way. I'll take a look and fix in next version.
>>  		hstatus &= ~HSTATUS_SPV;
>>  		hstatus |= (prev_virt) ? HSTATUS_SPV : 0;
>>  		csr_write(CSR_HSTATUS, hstatus);
> The patch is doing more than the summary says. We're now setting
> hstatus, htval, and htinst anytime we transition to HS-mode, whereas
> before we only set those registers when transitioning to HS-mode
> from VS/VU-mode. If I understand the spec properly, then that's a
> bug fix, but it should be in a separate patch.
When rearranging the code to fit the HS-to-HS case here, I actually
didn't realize this was a logical change for the rest of the CSRs and
other bits in hstatus, but you're right. I'll split up the changes
affecting existing logic into a separate patch in the next version.
> Please write commit messages. Even simply adding adding new bit
> masks and shifts should have a sentence expressing the motivation
> for adding them.
Thanks. I'll add detailed commit descriptions in the next version.

Regards,
dram
> Thanks,
> drew

