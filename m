From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 21 Feb 2023 16:51:02 -0800
Subject: [PATCH v2 3/5] lib: sbi_pmu: Reserve space for implementation
 specific firmware events
In-Reply-To: <20230217144413.3720307-4-mchitale@ventanamicro.com>
References: <20230217144413.3720307-1-mchitale@ventanamicro.com> <20230217144413.3720307-4-mchitale@ventanamicro.com>
Message-ID: <CAOnJCUKFLW5P4_tM9cazuQe3ksY+_ArWZxjJ9VcykAn1a08NNw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 17, 2023 at 6:44 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> We reserve space for SBI implementation specific custom firmware
> events which can be used by M-mode firmwares and HS-mode hypervisors
> for their own use. This reserved space is intentionally large to
> ensure that SBI implementation has enough space to accommodate
> platform specific firmware events as well.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  include/sbi/sbi_ecall_interface.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index f5d6667..5732419 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -183,6 +183,17 @@ enum sbi_pmu_fw_event_code_id {
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
> +       * Event code 0xFFFF is used for platform specific firmware
> +       * events where the event data contains any event specific information.
> +       */
> +       SBI_PMU_FW_PLATFORM = 0xFFFF,
>  };
>
>  /** SBI PMU event idx type */
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

