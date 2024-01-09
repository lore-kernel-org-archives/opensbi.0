From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Jan 2024 16:03:17 +0530
Subject: [PATCH v2 5/7] include: sbi: Add SBI debug trigger extension
 related defines
In-Reply-To: <20240108065525.208172-6-hchauhan@ventanamicro.com>
References: <20240108065525.208172-1-hchauhan@ventanamicro.com> <20240108065525.208172-6-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy3aVeL-Xjvb6V1Oj5VHKCF01NpPFSJqzU_aWwH5a35kQQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 8, 2024 at 12:25?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> This patch adds defines for SBI debug trigger extension and
> function IDs to access the extension.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Already reviewed previously.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/sbi_ecall_interface.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index d8c646d..690c31b 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -32,6 +32,7 @@
>  #define SBI_EXT_DBCN                           0x4442434E
>  #define SBI_EXT_SUSP                           0x53555350
>  #define SBI_EXT_CPPC                           0x43505043
> +#define SBI_EXT_DBTR                           0x44425452
>
>  /* SBI function IDs for BASE extension*/
>  #define SBI_EXT_BASE_GET_SPEC_VERSION          0x0
> @@ -105,6 +106,16 @@
>  #define SBI_EXT_PMU_COUNTER_FW_READ_HI 0x6
>  #define SBI_EXT_PMU_SNAPSHOT_SET_SHMEM 0x7
>
> +/* SBI function IDs for DBTR extension */
> +#define SBI_EXT_DBTR_NUM_TRIGGERS      0x0
> +#define SBI_EXT_DBTR_SETUP_SHMEM       0x1
> +#define SBI_EXT_DBTR_TRIGGER_READ      0x2
> +#define SBI_EXT_DBTR_TRIGGER_INSTALL   0x3
> +#define SBI_EXT_DBTR_TRIGGER_UPDATE    0x4
> +#define SBI_EXT_DBTR_TRIGGER_UNINSTALL 0x5
> +#define SBI_EXT_DBTR_TRIGGER_ENABLE    0x6
> +#define SBI_EXT_DBTR_TRIGGER_DISABLE   0x7
> +
>  /** General pmu event codes specified in SBI PMU extension */
>  enum sbi_pmu_hw_generic_events_t {
>         SBI_PMU_HW_NO_EVENT                     = 0,
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

