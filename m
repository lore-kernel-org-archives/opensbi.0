From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 30 Nov 2020 23:42:41 -0800
Subject: [PATCH v3 1/5] include: sbi: Add SBI SRST extension related
 defines
In-Reply-To: <20201125051647.295472-2-anup.patel@wdc.com>
References: <20201125051647.295472-1-anup.patel@wdc.com>
 <20201125051647.295472-2-anup.patel@wdc.com>
Message-ID: <CAOnJCUKVU5cRD1KO3Yhm2x7K+NbDmLG=nDmvgwj57Y1r9ROGJg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2020 at 9:17 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We extend the SBI ecall interface header for the SBI SRST extension
> recently accepted in SBI specification v0.3-draft.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi/sbi_ecall_interface.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index af30500..002c6f9 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -27,6 +27,7 @@
>  #define SBI_EXT_IPI                            0x735049
>  #define SBI_EXT_RFENCE                         0x52464E43
>  #define SBI_EXT_HSM                            0x48534D
> +#define SBI_EXT_SRST                           0x53525354
>
>  /* SBI function IDs for BASE extension*/
>  #define SBI_EXT_BASE_GET_SPEC_VERSION          0x0
> @@ -62,6 +63,17 @@
>  #define SBI_HSM_HART_STATUS_START_PENDING      0x2
>  #define SBI_HSM_HART_STATUS_STOP_PENDING       0x3
>
> +/* SBI function IDs for SRST extension */
> +#define SBI_EXT_SRST_RESET                     0x0
> +
> +#define SBI_SRST_RESET_TYPE_SHUTDOWN           0x0
> +#define SBI_SRST_RESET_TYPE_COLD_REBOOT        0x1
> +#define SBI_SRST_RESET_TYPE_WARM_REBOOT        0x2
> +#define SBI_SRST_RESET_TYPE_LAST       SBI_SRST_RESET_TYPE_WARM_REBOOT
> +
> +#define SBI_SRST_RESET_REASON_NONE     0x0
> +#define SBI_SRST_RESET_REASON_SYSFAIL  0x1
> +
>  #define SBI_SPEC_VERSION_MAJOR_OFFSET          24
>  #define SBI_SPEC_VERSION_MAJOR_MASK            0x7f
>  #define SBI_SPEC_VERSION_MINOR_MASK            0xffffff
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

