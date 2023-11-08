From: Andreas Schwab <schwab@linux-m68k.org>
Date: Wed, 08 Nov 2023 22:55:18 +0100
Subject: [PATCH] lib: sbi_illegal_insn: Emulate 'MZ'/c.li s4,-13
 instruction
In-Reply-To: <20231108191310.49950-1-bjorn@kernel.org> (=?utf-8?Q?=22Bj?=
 =?utf-8?Q?=C3=B6rn_T=C3=B6pel=22's?=
	message of "Wed, 8 Nov 2023 20:13:10 +0100")
References: <20231108191310.49950-1-bjorn@kernel.org>
Message-ID: <874jhvc3ll.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Nov 08 2023, Bj?rn T?pel wrote:

> +static int compressed_insn(ulong insn, struct sbi_trap_regs *regs)
> +{
> +	/* Only handle 'MZ'/c.li s4,-13/0x5a3d */
> +	if (!misa_extension('C') && (insn & 0xffff) == 0x5a4d) {
> +		regs->s4 = -13;
> +		regs->mepc += 4;

By skipping 4 bytes execution will resume in the middle of the next insn
(the jump around the header).

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

