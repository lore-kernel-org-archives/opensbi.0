From: Dong Du <dd_nirvana@sjtu.edu.cn>
Date: Tue, 26 Oct 2021 21:59:53 +0800 (CST)
Subject: [PATCH] lib: sbi: Fix GPA passed to __sbi_hfence_gvma_xyz()
 functions
In-Reply-To: <20211026114805.2043389-1-anup.patel@wdc.com>
References: <20211026114805.2043389-1-anup.patel@wdc.com>
Message-ID: <558623613.246330.1635256793764.JavaMail.zimbra@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Oct 26, 2021, at 7:48 PM, anup patel anup.patel at wdc.com wrote:

> The parameter passed to HFENCE.GVMA instruction in rs1 register
> is guest physical address right shifted by 2 (i.e. divided by 4).
> 
> Unfortunately, we overlooked the semantics of rs1 registers for
> HFENCE.GVMA instruction and never right shifted guest physical
> address by 2. This issue did not manifest for hypervisors till
> now because all H-extension implementations (such as QEMU, Spike,
> Rocket Core FPGA, etc) we tried till now were conservatively
> flushing everything upon any HFENCE.GVMA instruction.
> 
> This patch fixes GPA passed to __sbi_hfence_gvma_vmid_gpa()
> and __sbi_hfence_gvma_gpa() functions.
> 
> Fixes: 331ff6a162c1 ("lib: Support stage1 and stage2 tlb flushing")
> Reported-by: Ian Huang <ihuang@ventanamicro.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Looks good to me.

Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>

> ---
> include/sbi/sbi_hfence.h | 5 +++--
> lib/sbi/sbi_hfence.S     | 4 ++--
> lib/sbi/sbi_tlb.c        | 4 ++--
> 3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/include/sbi/sbi_hfence.h b/include/sbi/sbi_hfence.h
> index 4420f27..d3958f1 100644
> --- a/include/sbi/sbi_hfence.h
> +++ b/include/sbi/sbi_hfence.h
> @@ -12,13 +12,14 @@
> #define __SBI_FENCE_H__
> 
> /** Invalidate Stage2 TLBs for given VMID and guest physical address */
> -void __sbi_hfence_gvma_vmid_gpa(unsigned long gpa, unsigned long vmid);
> +void __sbi_hfence_gvma_vmid_gpa(unsigned long gpa_divby_4,
> +				unsigned long vmid);
> 
> /** Invalidate Stage2 TLBs for given VMID */
> void __sbi_hfence_gvma_vmid(unsigned long vmid);
> 
> /** Invalidate Stage2 TLBs for given guest physical address */
> -void __sbi_hfence_gvma_gpa(unsigned long gpa);
> +void __sbi_hfence_gvma_gpa(unsigned long gpa_divby_4);
> 
> /** Invalidate all possible Stage2 TLBs */
> void __sbi_hfence_gvma_all(void);
> diff --git a/lib/sbi/sbi_hfence.S b/lib/sbi/sbi_hfence.S
> index d05becb..e11e650 100644
> --- a/lib/sbi/sbi_hfence.S
> +++ b/lib/sbi/sbi_hfence.S
> @@ -27,7 +27,7 @@
> 	.global __sbi_hfence_gvma_vmid_gpa
> __sbi_hfence_gvma_vmid_gpa:
> 	/*
> -	 * rs1 = a0 (GPA)
> +	 * rs1 = a0 (GPA >> 2)
> 	 * rs2 = a1 (VMID)
> 	 * HFENCE.GVMA a0, a1
> 	 * 0110001 01011 01010 000 00000 1110011
> @@ -51,7 +51,7 @@ __sbi_hfence_gvma_vmid:
> 	.global __sbi_hfence_gvma_gpa
> __sbi_hfence_gvma_gpa:
> 	/*
> -	 * rs1 = a0 (GPA)
> +	 * rs1 = a0 (GPA >> 2)
> 	 * rs2 = zero
> 	 * HFENCE.GVMA a0
> 	 * 0110001 00000 01010 000 00000 1110011
> diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
> index efa74a7..4c142ea 100644
> --- a/lib/sbi/sbi_tlb.c
> +++ b/lib/sbi/sbi_tlb.c
> @@ -72,7 +72,7 @@ void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo)
> 	}
> 
> 	for (i = 0; i < size; i += PAGE_SIZE) {
> -		__sbi_hfence_gvma_gpa(start+i);
> +		__sbi_hfence_gvma_gpa((start + i) >> 2);
> 	}
> }
> 
> @@ -148,7 +148,7 @@ void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info
> *tinfo)
> 	}
> 
> 	for (i = 0; i < size; i += PAGE_SIZE) {
> -		__sbi_hfence_gvma_vmid_gpa(start + i, vmid);
> +		__sbi_hfence_gvma_vmid_gpa((start + i) >> 2, vmid);
> 	}
> }
> 
> --
> 2.25.1
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

