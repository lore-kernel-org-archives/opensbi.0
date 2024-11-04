From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 4 Nov 2024 11:06:28 +0100
Subject: [PATCH v4 2/7] lib: sbi: factorize previous mode computation
In-Reply-To: <3ca793bd-dd1e-44ff-9c0c-8f9960ea19ce@sifive.com>
References: <20241018084010.406285-1-cleger@rivosinc.com>
 <20241018084010.406285-3-cleger@rivosinc.com>
 <3ca793bd-dd1e-44ff-9c0c-8f9960ea19ce@sifive.com>
Message-ID: <d8c8f97f-294f-439a-83c7-2bea1fa617df@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 22/10/2024 04:32, Samuel Holland wrote:
> On 2024-10-18 3:40 AM, Cl?ment L?ger wrote:
>> Previous privilege mode retrieval from mstatus is done at different
>> places, factorize it rather than copy/pasting it again.
>>
>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>> ---
>>  include/sbi/sbi_trap.h     | 5 +++++
>>  lib/sbi/sbi_emulate_csr.c  | 4 ++--
>>  lib/sbi/sbi_illegal_insn.c | 2 +-
>>  lib/sbi/sbi_system.c       | 2 +-
>>  lib/sbi/sbi_trap.c         | 4 ++--
>>  lib/sbi/sbi_trap_ldst.c    | 4 ++--
>>  6 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
>> index b0c47ce..d5182bf 100644
>> --- a/include/sbi/sbi_trap.h
>> +++ b/include/sbi/sbi_trap.h
>> @@ -245,6 +245,11 @@ static inline bool sbi_regs_from_virt(const struct sbi_trap_regs *regs)
>>  #endif
>>  }
>>  
>> +static inline int sbi_mstatus_prev_mode(unsigned long mstatus)
>> +{
>> +	return (mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
>> +}
>> +
>>  int sbi_trap_redirect(struct sbi_trap_regs *regs,
>>  		      const struct sbi_trap_info *trap);
>>  
>> diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
>> index a5a04cd..c2253c8 100644
>> --- a/lib/sbi/sbi_emulate_csr.c
>> +++ b/lib/sbi/sbi_emulate_csr.c
>> @@ -46,7 +46,7 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
>>  {
>>  	int ret = 0;
>>  	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>> -	ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
>> +	ulong prev_mode = sbi_mstatus_prev_mode(regs->mstatus);
>>  	bool virt = sbi_regs_from_virt(regs);
>>  
>>  	switch (csr_num) {
>> @@ -152,7 +152,7 @@ int sbi_emulate_csr_write(int csr_num, struct sbi_trap_regs *regs,
>>  			  ulong csr_val)
>>  {
>>  	int ret = 0;
>> -	ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
>> +	ulong prev_mode = sbi_mstatus_prev_mode(regs->mstatus);
>>  	bool virt = sbi_regs_from_virt(regs);
>>  
>>  	switch (csr_num) {
>> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
>> index e1d2cd3..784bc4c 100644
>> --- a/lib/sbi/sbi_illegal_insn.c
>> +++ b/lib/sbi/sbi_illegal_insn.c
>> @@ -52,7 +52,7 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
>>  	int rs1_num	= GET_RS1_NUM(insn);
>>  	ulong rs1_val	= GET_RS1(insn, regs);
>>  	int csr_num	= GET_CSR_NUM((u32)insn);
>> -	ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
>> +	ulong prev_mode = sbi_mstatus_prev_mode(regs->mstatus);
>>  	ulong csr_val, new_csr_val;
>>  
>>  	if (prev_mode == PRV_M) {
>> diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
>> index 8e624fd..cd0f4ba 100644
>> --- a/lib/sbi/sbi_system.c
>> +++ b/lib/sbi/sbi_system.c
>> @@ -158,7 +158,7 @@ int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
>>  	if (ret != SBI_OK)
>>  		return ret;
>>  
>> -	prev_mode = (csr_read(CSR_MSTATUS) & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
>> +	prev_mode = sbi_mstatus_prev_mode(csr_read(CSR_MSTATUS));
> 
> I think this is a bug, since this field will get clobbered by a nested trap
> while in M-mode. But this is not your bug, so:

Hi Samuel,

Nice catch, I can take care of it if you don't already have a fix.

Thanks,

Cl?ment

> 
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> 
>>  	if (prev_mode != PRV_S && prev_mode != PRV_U)
>>  		return SBI_EFAIL;
>>  
>> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
>> index ff0668e..fd70e67 100644
>> --- a/lib/sbi/sbi_trap.c
>> +++ b/lib/sbi/sbi_trap.c
>> @@ -109,7 +109,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>>  	bool next_virt = false;
>>  
>>  	/* Sanity check on previous mode */
>> -	prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
>> +	prev_mode = sbi_mstatus_prev_mode(regs->mstatus);
>>  	if (prev_mode != PRV_S && prev_mode != PRV_U)
>>  		return SBI_ENOTSUPP;
>>  
>> @@ -361,7 +361,7 @@ trap_done:
>>  	if (rc)
>>  		sbi_trap_error(msg, rc, tcntx);
>>  
>> -	if (((regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT) != PRV_M)
>> +	if (sbi_mstatus_prev_mode(regs->mstatus) != PRV_M)
>>  		sbi_sse_process_pending_events(regs);
>>  
>>  	sbi_trap_set_context(scratch, tcntx->prev_context);
>> diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
>> index f9c0241..ebc4a92 100644
>> --- a/lib/sbi/sbi_trap_ldst.c
>> +++ b/lib/sbi/sbi_trap_ldst.c
>> @@ -318,7 +318,7 @@ static int sbi_ld_access_emulator(int rlen, union sbi_ldst_data *out_val,
>>  	struct sbi_trap_regs *regs = &tcntx->regs;
>>  
>>  	/* If fault came from M mode, just fail */
>> -	if (((regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT) == PRV_M)
>> +	if (sbi_mstatus_prev_mode(regs->mstatus) == PRV_M)
>>  		return SBI_EINVAL;
>>  
>>  	/* If platform emulator failed, we redirect instead of fail */
>> @@ -341,7 +341,7 @@ static int sbi_st_access_emulator(int wlen, union sbi_ldst_data in_val,
>>  	struct sbi_trap_regs *regs = &tcntx->regs;
>>  
>>  	/* If fault came from M mode, just fail */
>> -	if (((regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT) == PRV_M)
>> +	if (sbi_mstatus_prev_mode(regs->mstatus) == PRV_M)
>>  		return SBI_EINVAL;
>>  
>>  	/* If platform emulator failed, we redirect instead of fail */
> 


