From: Xiang W <wxjstz@126.com>
Date: Thu, 06 Mar 2025 10:18:02 +0800
Subject: [PATCH] lib: sbi_trap: Add support for vectored interrupts
In-Reply-To: <20250305014729.3143535-1-samuel.holland@sifive.com>
References: <d3efe4c5-d9cc-4664-a779-40fb5cafd427@sysgo.com>
	 <20250305014729.3143535-1-samuel.holland@sifive.com>
Message-ID: <df5bafa03314aaccc4458a2aa3762f3fa680c71e.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2025-03-04?? 17:45 -0800?Samuel Holland???
> When redirecting an exception to S-mode, transform the (v)stvec CSR
> value as described in the privileged spec to derive the S-mode PC.
> Since OpenSBI never redirects interrupts, only synchronous exceptions,
> the only action needed is to mask out the (v)stvec.MODE field.
> 
> Reported-by: Jan Reinhard <jan.reinhard@sysgo.com>
> Closes: https://github.com/riscv-software-src/opensbi/issues/391
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> Hi Jan,
> 
> Thanks for your bug report and the patch!
> 
> OpenSBI requires patches to be signed off in accordance with the
> Developer Certificate of Origin (DCO)[1], and sent as complete commits
> as with git format-patch/git send-email.
> 
> Since the fix is trivial now that we are aware of the bug, I took the
> liberty of sending a more complete patch, so you don't have to deal with
> a bunch of processes just to get the bug fixed. If you'd rather resend
> your own patch per the Contribution Guidelines[1], that is fine too.
> 
> Regards,
> Samuel
> 
> [1]: https://github.com/riscv-software-src/opensbi/blob/master/docs/contributing.md
> 
> ?include/sbi/riscv_encoding.h | 2 ++
> ?lib/sbi/sbi_trap.c?????????? | 4 ++--
> ?2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 03c68a57..1846d750 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -85,6 +85,8 @@
> ?#define HSTATUS_GVA			_UL(0x00000040)
> ?#define HSTATUS_VSBE			_UL(0x00000020)
> ?
> +#define MTVEC_MODE			_UL(0x00000003)
> +
> ?#define MCAUSE_IRQ_MASK			(_UL(1) << (__riscv_xlen - 1))
> ?
> ?#define IRQ_S_SOFT			1
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index e63a563b..f41db4d1 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -169,7 +169,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
> ?		csr_write(CSR_VSCAUSE, trap->cause);
> ?
> ?		/* Set MEPC to VS-mode exception vector base */
> -		regs->mepc = csr_read(CSR_VSTVEC);
> +		regs->mepc = csr_read(CSR_VSTVEC) & ~MTVEC_MODE;
> ?
> ?		/* Set MPP to VS-mode */
> ?		regs->mstatus &= ~MSTATUS_MPP;
> @@ -204,7 +204,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
> ?		csr_write(CSR_SCAUSE, trap->cause);
> ?
> ?		/* Set MEPC to S-mode exception vector base */
> -		regs->mepc = csr_read(CSR_STVEC);
> +		regs->mepc = csr_read(CSR_STVEC) & ~MTVEC_MODE;
> ?
> ?		/* Set MPP to S-mode */
> ?		regs->mstatus &= ~MSTATUS_MPP;

We don't need to work with the low bits of xTVEC because spec requires:

-------------------------------------------------------------------------------------------------------
3.1.14. Machine Exception Program Counter (mepc)

mepc is an MXLEN-bit read/write register formatted as shown in Figure 21. The low bit of mepc
(mepc[0]) is always zero. On implementations that support only IALIGN=32, the two low bits
(mepc[1:0]) are always zero.

If an implementation allows IALIGN to be either 16 or 32 (by changing CSR misa, for example), then,
whenever IALIGN=32, bit mepc[1] is masked on reads so that it appears to be 0. This masking occurs
also for the implicit read by the MRET instruction. Though masked, mepc[1] remains writable when
IALIGN=32.

mepc is a WARL register that must be able to hold all valid virtual addresses. It need not be capable of
holding all possible invalid addresses. Prior to writing mepc, implementations may convert an invalid
address into some other invalid address that mepc is capable of holding.
-------------------------------------------------------------------------------------------------------

Regards,
Xiang W

> -- 
> 2.47.2
> 
> 


