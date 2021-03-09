From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 9 Mar 2021 11:22:39 -0800
Subject: [PATCH 1/1] include: sbi: SBI function IDs for RFENCE extension
In-Reply-To: <20210309113122.63148-1-xypron.glpk@gmx.de>
References: <20210309113122.63148-1-xypron.glpk@gmx.de>
Message-ID: <CAOnJCUL9-wO2j9_hcm_fh5PxMYoaCne222Y7qMCOx9+u+aVbUg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 9, 2021 at 3:31 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> The SBI function IDs for RFENCE extension must match the SBI specification.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> The same bug exists in the Linux kernel:
> https://lore.kernel.org/linux-riscv/20210306054801.18263-1-xypron.glpk at gmx.de/
> ---
>  include/sbi/sbi_ecall_interface.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index 7fcb373..559a33e 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -48,10 +48,10 @@
>  #define SBI_EXT_RFENCE_REMOTE_FENCE_I          0x0
>  #define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA       0x1
>  #define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID  0x2
> -#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA      0x3
> -#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID 0x4
> -#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA      0x5
> -#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID 0x6
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID 0x3
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA      0x4
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID 0x5
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA      0x6
>
>  /* SBI function IDs for HSM extension */
>  #define SBI_EXT_HSM_HART_START                 0x0
> --
> 2.30.1
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

