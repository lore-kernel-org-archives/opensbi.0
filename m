From: Björn Töpel <bjorn@kernel.org>
Date: Thu, 9 Nov 2023 15:48:47 +0100
Subject: [PATCH] lib: sbi_illegal_insn: Emulate c.li
In-Reply-To: <20231109082540.52144-1-wxjstz@126.com>
References: <20231109082540.52144-1-wxjstz@126.com>
Message-ID: <CAJ+HfNj3s+jkBdVC=9H8W7NZwvUiROL0Miyj5xXumLam861VbA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 9 Nov 2023 at 09:26, Xiang W <wxjstz@126.com> wrote:
>
> The Linux kernel RISC-V image format allows that UEFI Images can also
> be booted by non-UEFI firmware. However for that to work, the PE/Image
> combo requires that 'MZ' is a valid instruction. On RISC-V, 'MZ' is
> only a valid instruction if the hardware is C capable [1]. So add
> Emulate c.li
>
> Signed-off-by: Bj?rn T?pel <bjorn@rivosinc.com>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_illegal_insn.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> index 2be4757..4ab10f4 100644
> --- a/lib/sbi/sbi_illegal_insn.c
> +++ b/lib/sbi/sbi_illegal_insn.c
> @@ -102,6 +102,22 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
>         return 0;
>  }
>
> +static int compressed_insn(ulong insn, struct sbi_trap_regs *regs) {
> +       unsigned long imm, rd;
> +       unsigned long *regs_p = (unsigned long *)regs;
> +
> +       if ((insn & 0xe003) == 0x4001) { /* c.li */
> +               imm = (insn >> 2) & 0x1f;
> +               imm |= ((insn >> 12) & 1) ? -32 : 0;
> +               rd = (insn >> 7) & 0x1f;
> +               if (rd)
> +                       regs_p[rd] = imm;
> +               return 0;
> +       }

The mepc update is missing, so this patch will not work.

That aside, what Jess pointed out is that on a machine *NOT*
supporting C, we're not emulating anything. The 16b instruction
parcels do not exist here, so we cannot really emulate that. Instead,
what the firmware gets is a 32b bogus/nonexisting instruction.
Emulating that is... weird. A valid concern! ;-)

The Linux Image spec says that code0 can be 'MZ' (and will be for UEFI
images). One correct fix (I think) is changing the non-UEFI loader,
fixing up code0 if it's MZ, making sure not to execute that (well, you
could on C capable machines).  That, or changing specs.


Bj?rn

