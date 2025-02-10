From: Raj Vishwanathan <rvishwanathan@mips.com>
Date: Mon, 10 Feb 2025 22:54:51 +0000
Subject: [EXTERNAL]Re: [PATCH v2] Align SBI trap registers to a nice
 boundary for performance reasons.
In-Reply-To: <29707207-aaf6-4a06-81c4-97b2e9faf3fb@sifive.com>
References: <20250109235219.2568-1-cfu@mips.com>
 <20250206192240.142107-1-Raj.Vishwanathan@gmail.com>
 <29707207-aaf6-4a06-81c4-97b2e9faf3fb@sifive.com>
Message-ID: <MW2PR22MB239425C6A898926D206E0229CEF22@MW2PR22MB2394.namprd22.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Samuel

Thanks for your review.
1. did look at the BIT_ALIGN macro. The sbi_bitops.h seems to be available for 'C' files  and not for assembly files. The alignment I needed is used fw_base.S 
2 &3 . I have added the space and deleted the unnecessary line

I have sent an updated patch. 

Raj

-----Original Message-----
From: Samuel Holland <samuel.holland@sifive.com> 
Sent: Friday, February 7, 2025 9:34 PM
To: Raj Vishwanathan <raj.vishwanathan@gmail.com>; opensbi at lists.infradead.org
Cc: Raj Vishwanathan <rvishwanathan@mips.com>
Subject: [EXTERNAL]Re: [PATCH v2] Align SBI trap registers to a nice boundary for performance reasons.

[You don't often get email from samuel.holland at sifive.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]

Hi Raj,

This looks like the right approach. A few comments below on the mechanics of the patch.

On 2025-02-06 1:22 PM, Raj Vishwanathan wrote:
> Align SBI_TRAP_CONTEXT_SIZE to a multiple of 16 bytes. If it is not 
> aligned to 16 bytes for RV64, it can create performance problems.
> Aligning it correctly can fix the performance issues.
>
> Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
> --
> Test: Performance issues seen and fix Verified on FPGA.
> Other methods.
>    Run qemu with monitor to check the SP during cpu_in
>    and cpu_out.
>    Add sbi_printf to the function sbi_trap_handler to check
>    the alignment of sbi_trap_context
> ---
>  include/sbi/sbi_trap.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h index 
> d5182bf..82e9c08 100644
> --- a/include/sbi/sbi_trap.h
> +++ b/include/sbi/sbi_trap.h
> @@ -112,13 +112,16 @@
>  /** Size (in bytes) of sbi_trap_info */  #define SBI_TRAP_INFO_SIZE 
> SBI_TRAP_INFO_OFFSET(last)
>
> +/** Stack pointer is aligned to 16 bytes */
> +#define STACK_BOUNDARY            16
> +#define ALIGN_TO_BOUNDARY(x,a) (((x) + (a) - 1) & ~((a) - 1))

This is the same as the BIT_ALIGN macro that already exists in sbi_bitops.h.

> +
>  /** Size (in bytes) of sbi_trap_context */ -#define 
> SBI_TRAP_CONTEXT_SIZE (SBI_TRAP_REGS_SIZE + \
> -                            SBI_TRAP_INFO_SIZE + \
> -                            __SIZEOF_POINTER__)
> +#define SBI_TRAP_CONTEXT_SIZE ALIGN_TO_BOUNDARY((SBI_TRAP_REGS_SIZE + \
> +                               SBI_TRAP_INFO_SIZE + \
> +                               __SIZEOF_POINTER__),STACK_BOUNDARY)

Please follow the existing style (spaces between arguments).

>
>  #ifndef __ASSEMBLER__
> -

Please don't include unrelated changes in the patch.

Regards,
Samuel

>  #include <sbi/sbi_types.h>
>  #include <sbi/sbi_scratch.h>
>

