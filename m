From: Anup Patel <anup@brainfault.org>
Date: Tue, 11 Feb 2025 16:11:01 +0530
Subject: [RFC 1/7] opensbi: use .insn for instrcutions to fix endian
In-Reply-To: <20241220160206.1989527-2-ben.dooks@codethink.co.uk>
References: <20241220160206.1989527-1-ben.dooks@codethink.co.uk> <20241220160206.1989527-2-ben.dooks@codethink.co.uk>
Message-ID: <CAAhSdy0joeJDjy=3M6hgMe2f87Rq5QTCQGQwwnof-NtpWvggZQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 20, 2024 at 10:40?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Using .word for creating instructions means they are written in
> the data endian, not the instruction endian. Change .word to .insn
> to tell the assembler it is creating custom instructions.
>
> Reviewed-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Reviewed-by: Roan Richmod <roan.richmond@codethink.co.uk>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_hfence.S | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/lib/sbi/sbi_hfence.S b/lib/sbi/sbi_hfence.S
> index e11e650..6f91372 100644
> --- a/lib/sbi/sbi_hfence.S
> +++ b/lib/sbi/sbi_hfence.S
> @@ -32,7 +32,7 @@ __sbi_hfence_gvma_vmid_gpa:
>          * HFENCE.GVMA a0, a1
>          * 0110001 01011 01010 000 00000 1110011
>          */
> -       .word 0x62b50073
> +       .insn 0x62b50073
>         ret
>
>         .align 3
> @@ -44,7 +44,7 @@ __sbi_hfence_gvma_vmid:
>          * HFENCE.GVMA zero, a0
>          * 0110001 01010 00000 000 00000 1110011
>          */
> -       .word 0x62a00073
> +       .insn 0x62a00073
>         ret
>
>         .align 3
> @@ -56,7 +56,7 @@ __sbi_hfence_gvma_gpa:
>          * HFENCE.GVMA a0
>          * 0110001 00000 01010 000 00000 1110011
>          */
> -       .word 0x62050073
> +       .insn 0x62050073
>         ret
>
>         .align 3
> @@ -68,7 +68,7 @@ __sbi_hfence_gvma_all:
>          * HFENCE.GVMA
>          * 0110001 00000 00000 000 00000 1110011
>          */
> -       .word 0x62000073
> +       .insn 0x62000073
>         ret
>
>         /*
> @@ -95,7 +95,7 @@ __sbi_hfence_vvma_asid_va:
>          * HFENCE.VVMA a0, a1
>          * 0010001 01011 01010 000 00000 1110011
>          */
> -       .word 0x22b50073
> +       .insn 0x22b50073
>         ret
>
>         .align 3
> @@ -107,7 +107,7 @@ __sbi_hfence_vvma_asid:
>          * HFENCE.VVMA zero, a0
>          * 0010001 01010 00000 000 00000 1110011
>          */
> -       .word 0x22a00073
> +       .insn 0x22a00073
>         ret
>
>         .align 3
> @@ -119,7 +119,7 @@ __sbi_hfence_vvma_va:
>          * HFENCE.VVMA zero, a0
>          * 0010001 00000 01010 000 00000 1110011
>          */
> -       .word 0x22050073
> +       .insn 0x22050073
>         ret
>
>         .align 3
> @@ -131,5 +131,5 @@ __sbi_hfence_vvma_all:
>          * HFENCE.VVMA
>          * 0010001 00000 00000 000 00000 1110011
>          */
> -       .word 0x22000073
> +       .insn 0x22000073
>         ret
> --
> 2.37.2.352.g3c44437643
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

