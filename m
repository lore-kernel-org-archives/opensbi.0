From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 15 Aug 2020 12:44:12 -0700
Subject: [PATCH 2/2] lib: sbi: Handle the case were MTVAL has illegal
 instruction address
In-Reply-To: <20200815170055.286732-2-anup.patel@wdc.com>
References: <20200815170055.286732-1-anup.patel@wdc.com>
 <20200815170055.286732-2-anup.patel@wdc.com>
Message-ID: <CAOnJCUJ1mXY=6CxuP6cmw1AQix0k1A9iy_WQSktBQm2Cx-B_OA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 15, 2020 at 10:01 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The Kendryte K210 follows RISC-V v1.9 spec so MTVAL has instruction
> address (instead of instruction encoding) on illegal instruction trap.
>
> To handle above case, we fix sbi_illegal_insn_handler() without any
> impact on RISC-V v1.10 (or higher) systems. This achieved by exploiting
> the fact that program counter (and instruction address) is always 2-byte
> aligned in RISC-V world.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/sbi/sbi_illegal_insn.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> index 0e5523f..779a727 100644
> --- a/lib/sbi/sbi_illegal_insn.c
> +++ b/lib/sbi/sbi_illegal_insn.c
> @@ -118,13 +118,22 @@ int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
>  {
>         struct sbi_trap_info uptrap;
>
> +       /*
> +        * We only deal with 32bit (or longer) illegal instructions. If we
> +        * see instruction is zero OR instruction is 16bit then we fetch and
> +        * check the instruction encoding using unprivilege access.
> +        *
> +        * The program counter (PC) in RISC-V world is always 2-byte aligned
> +        * so handling only 32bit (or longer) illegal instructions also help
> +        * the case where MTVAL CSR contains instruction address for illegal
> +        * instruction trap.
> +        */
> +
>         if (unlikely((insn & 3) != 3)) {
> -               if (insn == 0) {
> -                       insn = sbi_get_insn(regs->mepc, &uptrap);
> -                       if (uptrap.cause) {
> -                               uptrap.epc = regs->mepc;
> -                               return sbi_trap_redirect(regs, &uptrap);
> -                       }
> +               insn = sbi_get_insn(regs->mepc, &uptrap);
> +               if (uptrap.cause) {
> +                       uptrap.epc = regs->mepc;
> +                       return sbi_trap_redirect(regs, &uptrap);
>                 }
>                 if ((insn & 3) != 3)
>                         return truly_illegal_insn(insn, regs);
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

