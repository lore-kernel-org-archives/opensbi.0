From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Mar 2023 14:25:41 +0530
Subject: [PATCH v4 3/8] lib: sbi_pmu: Reserve space for implementation
 specific firmware events
In-Reply-To: <20230309131358.2259923-4-mchitale@ventanamicro.com>
References: <20230309131358.2259923-1-mchitale@ventanamicro.com> <20230309131358.2259923-4-mchitale@ventanamicro.com>
Message-ID: <CAAhSdy1LjRWAhD2ZhDtNQAQ9sGRxrdmyCKZEwgcCfmKpfPPvmg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 9, 2023 at 6:44?PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> We reserve space for SBI implementation specific custom firmware
> events which can be used by M-mode firmwares and HS-mode hypervisors
> for their own use. This reserved space is intentionally large to
> ensure that SBI implementation has enough space to accommodate
> platform specific firmware events as well.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_ecall_interface.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index d448212..4597358 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -185,6 +185,17 @@ enum sbi_pmu_fw_event_code_id {
>         SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
>         SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
>         SBI_PMU_FW_MAX,
> +       /*
> +        * Event codes 22 to 255 are reserved for future use.
> +        * Event codes 256 to 65534 are reserved for SBI implementation
> +        * specific custom firmware events.
> +        */
> +       SBI_PMU_FW_RESERVED_MAX = 0xFFFE,
> +       /*
> +        * Event code 0xFFFF is used for platform specific firmware
> +        * events where the event data contains any event specific information.
> +        */
> +       SBI_PMU_FW_PLATFORM = 0xFFFF,
>  };
>
>  /** SBI PMU event idx type */
> --
> 2.34.1
>

