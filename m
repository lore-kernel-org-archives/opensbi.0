From: Dong Du <dd_nirvana@sjtu.edu.cn>
Date: Tue, 9 Nov 2021 13:33:30 +0800 (CST)
Subject: [PATCH v5 12/12] lib: sbi: Fix initial value mask while
 updating the counters
In-Reply-To: <20211108185307.389145-13-atish.patra@wdc.com>
References: <20211108185307.389145-1-atish.patra@wdc.com>
 <20211108185307.389145-13-atish.patra@wdc.com>
Message-ID: <224347036.5731359.1636436010533.JavaMail.zimbra@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Nov 9, 2021, at 2:53 AM, atish patra atish.patra at wdc.com wrote:

> The first 32 bits of the initial value for the counter should be
> preserved while updating the mhpmcounter for 32bit.
> 
> Fixes: 13d40f21d588e ("lib: sbi: Add PMU support")
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---

Looks good to me.

Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>

> lib/sbi/sbi_pmu.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index e0303a7b19e6..a0eb3592967d 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -270,7 +270,7 @@ static void pmu_ctr_write_hw(uint32_t cidx, uint64_t ival)
> {
> #if __riscv_xlen == 32
> 	csr_write_num(CSR_MCYCLE + cidx, 0);
> -	csr_write_num(CSR_MCYCLE + cidx, ival & 0xFFFF);
> +	csr_write_num(CSR_MCYCLE + cidx, ival & 0xFFFFFFFF);
> 	csr_write_num(CSR_MCYCLEH + cidx, ival >> BITS_PER_LONG);
> #else
> 	csr_write_num(CSR_MCYCLE + cidx, ival);
> --
> 2.31.1
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

