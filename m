From: Xiang W <wxjstz@126.com>
Date: Wed, 26 Feb 2025 20:28:36 +0800
Subject: [PATCH] lib: sbi: Fix typo CSR_CYCLE -> CSR_TIME
In-Reply-To: <OSYPR01MB544544D142CAB27158601F80C6C22@OSYPR01MB5445.jpnprd01.prod.outlook.com>
References: <OSYPR01MB544544D142CAB27158601F80C6C22@OSYPR01MB5445.jpnprd01.prod.outlook.com>
Message-ID: <98d0bec80ef5d550125f6ebbad5f642b6fea50e4.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2025-02-26?? 17:02 +0800?dramforever???
> When emulating CSR_TIME, the hpm_allowed check should be for CSR_TIME,
> not for CSR_CYCLE.
> 
> Fixes: beef2f693785 ("lib: sbi: Respect scounteren when emulating the
> time CSR")
> Signed-off-by: Vivian Wang <dramforever@live.com>

The counter enable is controlled by the bits in MCOUNTEREN/HCOUNTEREN/SCOUNTEREN.

MCOUNTEREN/HCOUNTEREN/SCOUNTEREN as shown below
+-------+-------+-------+---------------+------+----+----+----+
| HPM31 | HPM30 | HPM29 | ...           | HPM3 | IR | TM | CY |
+-------+-------+-------+---------------+------+----+----+----+

The counters address is as follows:
0xc00	cycle
0xc01	time
0xc02	instret
0xc03	hpmcounter3
...
0xc1d	hpmcounter29
0xc1e	hpmcounter30
0xc1f	hpmcounter31

The value obtained by subtracting the address of the cycle from the address of 
the counter is the offset in xCOUNTER that corresponds to this counter enable 
bit.

NACK

Regards,
Xiang W


> ---
> ?lib/sbi/sbi_emulate_csr.c | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
> index c2253c8..73b371e 100644
> --- a/lib/sbi/sbi_emulate_csr.c
> +++ b/lib/sbi/sbi_emulate_csr.c
> @@ -62,7 +62,7 @@ int sbi_emulate_csr_read(int csr_num, struct
> sbi_trap_regs *regs,
> ?		*csr_val = csr_read(CSR_MCYCLE);
> ?		break;
> ?	case CSR_TIME:
> -		if (!hpm_allowed(csr_num - CSR_CYCLE, prev_mode, virt))
> +		if (!hpm_allowed(csr_num - CSR_TIME, prev_mode, virt))
> ?			return SBI_ENOTSUPP;
> ?		/*
> ?		 * We emulate TIME CSR for both Host (HS/U-mode) and
> -- 
> 2.47.2
> 
> 


