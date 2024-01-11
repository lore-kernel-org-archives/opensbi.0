From: Anup Patel <anup@brainfault.org>
Date: Thu, 11 Jan 2024 16:39:57 +0530
Subject: [RFC PATCH v2 2/4] lib: sbi: add support for Supervisor Software
 Events extension
In-Reply-To: <20240109104500.2080121-3-cleger@rivosinc.com>
References: <20240109104500.2080121-1-cleger@rivosinc.com> <20240109104500.2080121-3-cleger@rivosinc.com>
Message-ID: <CAAhSdy1PxzdVKvm5HuhaP5cr-_txL7FkX8NVi5vLZKX5OzXWww@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 9, 2024 at 4:15?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> This extension [1] allows to deliver events from SBI to supervisor via a
> software mecanism. This extensions defines events (either local or

s/mecanism/mechanism/

> global) which are signaled by the SBI on specific signal sources (IRQ,
> traps, etc) and are injected to be executed in supervisor mode.
>
> [1] https://lists.riscv.org/g/tech-prs/message/744
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

Please split this patch into two parts:
1) Add generic SSE framework
2) Add SBI SSE implementation

Regards,
Anup

> ---
>  include/sbi/sbi_ecall_interface.h |   48 +-
>  include/sbi/sbi_error.h           |    4 +-
>  include/sbi/sbi_sse.h             |   93 +++
>  lib/sbi/Kconfig                   |    4 +
>  lib/sbi/objects.mk                |    4 +
>  lib/sbi/sbi_ecall_sse.c           |   58 ++
>  lib/sbi/sbi_init.c                |   13 +
>  lib/sbi/sbi_ipi.c                 |    2 +-
>  lib/sbi/sbi_sse.c                 | 1078 +++++++++++++++++++++++++++++
>  9 files changed, 1301 insertions(+), 3 deletions(-)
>  create mode 100644 include/sbi/sbi_sse.h
>  create mode 100644 lib/sbi/sbi_ecall_sse.c
>  create mode 100644 lib/sbi/sbi_sse.c
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index d8c646d..a5f3edf 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -32,6 +32,7 @@
>  #define SBI_EXT_DBCN                           0x4442434E
>  #define SBI_EXT_SUSP                           0x53555350
>  #define SBI_EXT_CPPC                           0x43505043
> +#define SBI_EXT_SSE                            0x535345
>
>  /* SBI function IDs for BASE extension*/
>  #define SBI_EXT_BASE_GET_SPEC_VERSION          0x0
> @@ -293,6 +294,48 @@ enum sbi_cppc_reg_id {
>         SBI_CPPC_NON_ACPI_LAST          = SBI_CPPC_TRANSITION_LATENCY,
>  };
>
> +/* SBI Function IDs for SSE extension */
> +#define SBI_EXT_SSE_READ_ATTR          0x00000000
> +#define SBI_EXT_SSE_WRITE_ATTR         0x00000001
> +#define SBI_EXT_SSE_REGISTER           0x00000002
> +#define SBI_EXT_SSE_UNREGISTER         0x00000003
> +#define SBI_EXT_SSE_ENABLE             0x00000004
> +#define SBI_EXT_SSE_DISABLE            0x00000005
> +#define SBI_EXT_SSE_COMPLETE           0x00000006
> +#define SBI_EXT_SSE_INJECT             0x00000007
> +
> +/* SBI SSE Event Attributes. */
> +#define SBI_SSE_ATTR_STATUS            0x00000000
> +#define SBI_SSE_ATTR_PRIO              0x00000001
> +#define SBI_SSE_ATTR_CONFIG            0x00000002
> +#define SBI_SSE_ATTR_PREFERRED_HART    0x00000003
> +#define SBI_SSE_ATTR_ENTRY_PC          0x00000004
> +#define SBI_SSE_ATTR_ENTRY_A0          0x00000005
> +#define SBI_SSE_ATTR_ENTRY_A6          0x00000006
> +#define SBI_SSE_ATTR_ENTRY_A7          0x00000007
> +#define SBI_SSE_ATTR_INTERRUPTED_MODE  0x00000008
> +#define SBI_SSE_ATTR_INTERRUPTED_PC    0x00000009
> +#define SBI_SSE_ATTR_INTERRUPTED_A0    0x0000000A
> +#define SBI_SSE_ATTR_INTERRUPTED_A6    0x0000000B
> +#define SBI_SSE_ATTR_INTERRUPTED_A7    0x0000000C
> +
> +#define SBI_SSE_ATTR_STATUS_STATE_OFFSET       0
> +#define SBI_SSE_ATTR_STATUS_STATE_MASK         0x3
> +#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET     2
> +#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET      3
> +
> +#define SBI_SSE_ATTR_CONFIG_ONESHOT    (1 << 0)
> +
> +/* SBI SSE Event IDs. */
> +#define SBI_SSE_EVENT_LOCAL_RAS                0x00000000
> +#define SBI_SSE_EVENT_GLOBAL_RAS       0x00008000
> +#define SBI_SSE_EVENT_LOCAL_PMU                0x00010000
> +#define SBI_SSE_EVENT_LOCAL_SOFTWARE           0xffff0000
> +#define SBI_SSE_EVENT_GLOBAL_SOFTWARE  0xffff8000
> +
> +#define SBI_SSE_EVENT_GLOBAL           (1 << 15)
> +#define SBI_SSE_EVENT_PLATFORM         (1 << 14)
> +
>  /* SBI base specification related macros */
>  #define SBI_SPEC_VERSION_MAJOR_OFFSET          24
>  #define SBI_SPEC_VERSION_MAJOR_MASK            0x7f
> @@ -313,8 +356,11 @@ enum sbi_cppc_reg_id {
>  #define SBI_ERR_ALREADY_STARTED                        -7
>  #define SBI_ERR_ALREADY_STOPPED                        -8
>  #define SBI_ERR_NO_SHMEM                       -9
> +#define SBI_ERR_INVALID_STATE                  -10
> +#define SBI_ERR_BAD_RANGE                      -11
> +#define SBI_ERR_BUSY                           -12
>
> -#define SBI_LAST_ERR                           SBI_ERR_NO_SHMEM
> +#define SBI_LAST_ERR                           SBI_ERR_BUSY
>
>  /* clang-format on */
>
> diff --git a/include/sbi/sbi_error.h b/include/sbi/sbi_error.h
> index a77e3f8..5efb3b9 100644
> --- a/include/sbi/sbi_error.h
> +++ b/include/sbi/sbi_error.h
> @@ -24,6 +24,9 @@
>  #define SBI_EALREADY_STARTED   SBI_ERR_ALREADY_STARTED
>  #define SBI_EALREADY_STOPPED   SBI_ERR_ALREADY_STOPPED
>  #define SBI_ENO_SHMEM          SBI_ERR_NO_SHMEM
> +#define SBI_EINVALID_STATE     SBI_ERR_INVALID_STATE
> +#define SBI_EBAD_RANGE         SBI_ERR_BAD_RANGE
> +#define SBI_EBUSY              SBI_ERR_BUSY
>
>  #define SBI_ENODEV             -1000
>  #define SBI_ENOSYS             -1001
> @@ -34,7 +37,6 @@
>  #define SBI_ENOMEM             -1006
>  #define SBI_EUNKNOWN           -1007
>  #define SBI_ENOENT             -1008
> -
>  /* clang-format on */
>
>  #endif
> diff --git a/include/sbi/sbi_sse.h b/include/sbi/sbi_sse.h
> new file mode 100644
> index 0000000..ed1b138
> --- /dev/null
> +++ b/include/sbi/sbi_sse.h
> @@ -0,0 +1,93 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2023 Rivos Systems.
> + */
> +
> +#ifndef __SBI_SSE_H__
> +#define __SBI_SSE_H__
> +
> +#include <sbi/sbi_types.h>
> +#include <sbi/sbi_list.h>
> +#include <sbi/riscv_locks.h>
> +
> +struct sbi_scratch;
> +
> +#define EXC_MODE_PP_SHIFT              0
> +#define EXC_MODE_PP                    BIT(EXC_MODE_PP_SHIFT)
> +#define EXC_MODE_PV_SHIFT              1
> +#define EXC_MODE_PV                    BIT(EXC_MODE_PV_SHIFT)
> +#define EXC_MODE_SSTATUS_SPIE_SHIFT    2
> +#define EXC_MODE_SSTATUS_SPIE          BIT(EXC_MODE_SSTATUS_SPIE_SHIFT)
> +
> +
> +struct sbi_sse_cb_ops {
> +       /**
> +        * Called when hart_id is changed on the event.
> +        */
> +       void (*set_hartid_cb)(uint32_t event_id, unsigned long hart_id);
> +
> +       /**
> +        * Called when the SBI_EXT_SSE_COMPLETE is invoked on the event.
> +        */
> +       void (*complete_cb)(uint32_t event_id);
> +
> +       /**
> +        * Called when the SBI_EXT_SSE_REGISTER is invoked on the event.
> +        */
> +       void (*register_cb)(uint32_t event_id);
> +
> +       /**
> +        * Called when the SBI_EXT_SSE_UNREGISTER is invoked on the event.
> +        */
> +       void (*unregister_cb)(uint32_t event_id);
> +
> +       /**
> +        * Called when the SBI_EXT_SSE_ENABLE is invoked on the event.
> +        */
> +       void (*enable_cb)(uint32_t event_id);
> +
> +       /**
> +        * Called when the SBI_EXT_SSE_DISABLE is invoked on the event.
> +        */
> +       void (*disable_cb)(uint32_t event_id);
> +};
> +
> +/* Set the callback operations for an event
> + * @param event_id Event identifier (SBI_SSE_EVENT_*)
> + * @param cb_ops Callback operations
> + * @return 0 on success, error otherwise
> + */
> +int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops);
> +
> +/* Inject an event to the current hard
> + * @param event_id Event identifier (SBI_SSE_EVENT_*)
> + * @param regs Registers that were used on SBI entry
> + * @return 0 on success, error otherwise
> + */
> +int sbi_sse_inject_event(uint32_t event_id, struct sbi_trap_regs *regs);
> +
> +int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot);
> +void sbi_sse_exit(struct sbi_scratch *scratch);
> +
> +/* Interface called from sbi_ecall_sse.c */
> +int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
> +                    unsigned long handler_entry_a0,
> +                    unsigned long handler_entry_a6,
> +                    unsigned long handler_entry_a7);
> +int sbi_sse_unregister(uint32_t event_id);
> +int sbi_sse_enable(uint32_t event_id);
> +int sbi_sse_disable(uint32_t event_id);
> +int sbi_sse_complete(uint32_t event_id, struct sbi_trap_regs *regs,
> +                    struct sbi_ecall_return *out);
> +int sbi_sse_inject_from_ecall(uint32_t event_id, unsigned long hart_id,
> +                             struct sbi_trap_regs *regs,
> +                             struct sbi_ecall_return *out);
> +int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
> +                      uint32_t attr_count, unsigned long output_phys_lo,
> +                      unsigned long output_phys_hi);
> +int sbi_sse_write_attrs(uint32_t event_id, uint32_t base_attr_id,
> +                       uint32_t attr_count, unsigned long input_phys_lo,
> +                       unsigned long input_phys_hi);
> +
> +#endif
> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
> index 477775e..1b713e9 100644
> --- a/lib/sbi/Kconfig
> +++ b/lib/sbi/Kconfig
> @@ -46,4 +46,8 @@ config SBI_ECALL_VENDOR
>         bool "Platform-defined vendor extensions"
>         default y
>
> +config SBI_ECALL_SSE
> +       bool "SSE extension"
> +       default y
> +
>  endmenu
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index c699187..011c824 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -52,6 +52,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_LEGACY) += sbi_ecall_legacy.o
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_VENDOR) += ecall_vendor
>  libsbi-objs-$(CONFIG_SBI_ECALL_VENDOR) += sbi_ecall_vendor.o
>
> +carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_SSE) += ecall_sse
> +libsbi-objs-$(CONFIG_SBI_ECALL_SSE) += sbi_ecall_sse.o
> +
>  libsbi-objs-y += sbi_bitmap.o
>  libsbi-objs-y += sbi_bitops.o
>  libsbi-objs-y += sbi_console.o
> @@ -71,6 +74,7 @@ libsbi-objs-y += sbi_misaligned_ldst.o
>  libsbi-objs-y += sbi_platform.o
>  libsbi-objs-y += sbi_pmu.o
>  libsbi-objs-y += sbi_scratch.o
> +libsbi-objs-y += sbi_sse.o
>  libsbi-objs-y += sbi_string.o
>  libsbi-objs-y += sbi_system.o
>  libsbi-objs-y += sbi_timer.o
> diff --git a/lib/sbi/sbi_ecall_sse.c b/lib/sbi/sbi_ecall_sse.c
> new file mode 100644
> index 0000000..15c1a65
> --- /dev/null
> +++ b/lib/sbi/sbi_ecall_sse.c
> @@ -0,0 +1,58 @@
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_ecall.h>
> +#include <sbi/sbi_trap.h>
> +#include <sbi/sbi_sse.h>
> +
> +static int sbi_ecall_sse_handler(unsigned long extid, unsigned long funcid,
> +                                 struct sbi_trap_regs *regs,
> +                                 struct sbi_ecall_return *out)
> +{
> +       int ret;
> +
> +       switch (funcid) {
> +       case SBI_EXT_SSE_READ_ATTR:
> +               ret = sbi_sse_read_attrs(regs->a0, regs->a1, regs->a2, regs->a3,
> +                                        regs->a4);
> +               break;
> +       case SBI_EXT_SSE_WRITE_ATTR:
> +               ret = sbi_sse_write_attrs(regs->a0, regs->a1, regs->a2,
> +                                        regs->a3, regs->a4);
> +               break;
> +       case SBI_EXT_SSE_REGISTER:
> +               ret = sbi_sse_register(regs->a0, regs->a1, regs->a2, regs->a3,
> +                                      regs->a2);
> +               break;
> +       case SBI_EXT_SSE_UNREGISTER:
> +               ret = sbi_sse_unregister(regs->a0);
> +               break;
> +       case SBI_EXT_SSE_ENABLE:
> +               ret = sbi_sse_enable(regs->a0);
> +               break;
> +       case SBI_EXT_SSE_DISABLE:
> +               ret = sbi_sse_disable(regs->a0);
> +               break;
> +       case SBI_EXT_SSE_COMPLETE:
> +               ret = sbi_sse_complete(regs->a0, regs, out);
> +               break;
> +       case SBI_EXT_SSE_INJECT:
> +               ret = sbi_sse_inject_from_ecall(regs->a0, regs->a1, regs, out);
> +               break;
> +       default:
> +               ret = SBI_ENOTSUPP;
> +       }
> +       return ret;
> +}
> +
> +struct sbi_ecall_extension ecall_sse;
> +
> +static int sbi_ecall_sse_register_extensions(void)
> +{
> +       return sbi_ecall_register_extension(&ecall_sse);
> +}
> +
> +struct sbi_ecall_extension ecall_sse = {
> +       .extid_start            = SBI_EXT_SSE,
> +       .extid_end              = SBI_EXT_SSE,
> +       .register_extensions    = sbi_ecall_sse_register_extensions,
> +       .handle                 = sbi_ecall_sse_handler,
> +};
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 6a98e13..f9e6bb9 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -23,6 +23,7 @@
>  #include <sbi/sbi_irqchip.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_pmu.h>
> +#include <sbi/sbi_sse.h>
>  #include <sbi/sbi_system.h>
>  #include <sbi/sbi_string.h>
>  #include <sbi/sbi_timer.h>
> @@ -315,6 +316,12 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>         if (rc)
>                 sbi_hart_hang();
>
> +        rc = sbi_sse_init(scratch, true);
> +        if (rc) {
> +                sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
> +                sbi_hart_hang();
> +        }
> +
>         rc = sbi_pmu_init(scratch, true);
>         if (rc) {
>                 sbi_printf("%s: pmu init failed (error %d)\n",
> @@ -435,6 +442,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
>         if (rc)
>                 sbi_hart_hang();
>
> +       rc = sbi_sse_init(scratch, false);
> +       if (rc)
> +               sbi_hart_hang();
> +
>         rc = sbi_pmu_init(scratch, false);
>         if (rc)
>                 sbi_hart_hang();
> @@ -639,6 +650,8 @@ void __noreturn sbi_exit(struct sbi_scratch *scratch)
>
>         sbi_platform_early_exit(plat);
>
> +       sbi_sse_exit(scratch);
> +
>         sbi_pmu_exit(scratch);
>
>         sbi_timer_exit(scratch);
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index 269d48a..9967016 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -66,7 +66,7 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
>                  * SBI_IPI_UPDATE_BREAK for self-IPIs. For other events, check
>                  * for self-IPI and execute the callback directly here.
>                  */
> -               ipi_ops->process(scratch);
> +               ipi_ops->process(scratch, NULL);
>                 return 0;
>         }
>
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> new file mode 100644
> index 0000000..7dc7881
> --- /dev/null
> +++ b/lib/sbi/sbi_sse.c
> @@ -0,0 +1,1078 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2023 Rivos Systems Inc.
> + *
> + */
> +
> +#include <sbi/riscv_asm.h>
> +#include <sbi/riscv_barrier.h>
> +#include <sbi/riscv_encoding.h>
> +#include <sbi/riscv_locks.h>
> +#include <sbi/sbi_domain.h>
> +#include <sbi/sbi_ecall.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_fifo.h>
> +#include <sbi/sbi_hart.h>
> +#include <sbi/sbi_heap.h>
> +#include <sbi/sbi_hsm.h>
> +#include <sbi/sbi_ipi.h>
> +#include <sbi/sbi_list.h>
> +#include <sbi/sbi_platform.h>
> +#include <sbi/sbi_pmu.h>
> +#include <sbi/sbi_sse.h>
> +#include <sbi/sbi_scratch.h>
> +#include <sbi/sbi_string.h>
> +#include <sbi/sbi_trap.h>
> +
> +#include <sbi/sbi_console.h>
> +
> +#define sse_get_hart_state_ptr(__scratch)      \
> +       sbi_scratch_read_type((__scratch), void *, shs_ptr_off)
> +
> +#define sse_thishart_state_ptr()               \
> +       sse_get_hart_state_ptr(sbi_scratch_thishart_ptr())
> +
> +#define sse_set_hart_state_ptr(__scratch, __sse_state) \
> +       sbi_scratch_write_type((__scratch), void *, shs_ptr_off, (__sse_state))
> +
> +/*
> + * Rather than using memcpy to copy the context (which does it byte-per-byte),
> + * copy each field which generates ld/lw.
> + */
> +#define sse_regs_copy(dst, src) \
> +       (dst)->a0 = (src)->a0; \
> +       (dst)->a6 = (src)->a6; \
> +       (dst)->a7 = (src)->a7
> +
> +#define EVENT_IS_GLOBAL(__event_id)    ((__event_id) & SBI_SSE_EVENT_GLOBAL)
> +
> +static const uint32_t supported_events[] =
> +{
> +       SBI_SSE_EVENT_LOCAL_RAS,
> +       SBI_SSE_EVENT_GLOBAL_RAS,
> +       SBI_SSE_EVENT_LOCAL_PMU,
> +       SBI_SSE_EVENT_LOCAL_SOFTWARE,
> +       SBI_SSE_EVENT_GLOBAL_SOFTWARE,
> +};
> +
> +#define EVENT_COUNT    array_size(supported_events)
> +
> +#define sse_event_invoke_cb(_event, _cb, ...) \
> +{ \
> +       if (_event->cb_ops && _event->cb_ops->_cb) \
> +               _event->cb_ops->_cb(_event->event_id, ##__VA_ARGS__); \
> +}
> +
> +#define SSE_EVENT_STATE(__e) __e->attrs.status.state
> +#define SSE_EVENT_PENDING(__e) __e->attrs.status.pending
> +#define SSE_EVENT_CAN_INJECT(__e) __e->attrs.status.inject
> +#define SSE_EVENT_HARTID(__e) __e->attrs.hartid
> +#define SSE_EVENT_PRIO(__e) __e->attrs.prio
> +#define SSE_EVENT_CONFIG(__e) __e->attrs.config
> +#define SSE_EVENT_ENTRY(__e) __e->attrs.entry
> +#define SSE_EVENT_INTERRUPTED(__e) __e->attrs.interrupted
> +
> +struct sse_entry_state {
> +       /** Entry program counter */
> +       unsigned long pc;
> +       /** a0 register state */
> +       unsigned long a0;
> +       /** a6 register state */
> +       unsigned long a6;
> +       /** a7 register state */
> +       unsigned long a7;
> +};
> +
> +struct sse_interrupted_state {
> +       /** Exception mode */
> +       unsigned long exc_mode;
> +       /** Interrupted program counter */
> +       unsigned long pc;
> +       /** a0 register state */
> +       unsigned long a0;
> +       /** a6 register state */
> +       unsigned long a6;
> +       /** a7 register state */
> +       unsigned long a7;
> +};
> +
> +enum sbi_sse_state {
> +       SSE_STATE_UNUSED = 0,
> +       SSE_STATE_REGISTERED = 1,
> +       SSE_STATE_ENABLED = 2,
> +       SSE_STATE_RUNNING = 3,
> +};
> +
> +struct sse_ipi_inject_data {
> +       uint32_t event_id;
> +};
> +
> +struct sbi_sse_event_status {
> +       unsigned long state:2;
> +       unsigned long pending:1;
> +       unsigned long inject:1;
> +} __packed;
> +
> +struct sbi_sse_event_attrs {
> +       struct sbi_sse_event_status status;
> +       unsigned long prio;
> +       unsigned long config;
> +       unsigned long hartid;
> +       struct sse_entry_state entry;
> +       struct sse_interrupted_state interrupted;
> +};
> +
> +/* Make sure all attributes are packed for direct memcpy in ATTR_READ */
> +#define assert_field_offset(field, attr_offset) \
> +       _Static_assert( \
> +               ((offsetof(struct sbi_sse_event_attrs, field)) / sizeof(unsigned long)) == attr_offset,  \
> +               "field "#field " from struct sbi_sse_event_attrs invalid offset, expected "#attr_offset \
> +               )
> +
> +assert_field_offset(status, SBI_SSE_ATTR_STATUS);
> +assert_field_offset(prio, SBI_SSE_ATTR_PRIO);
> +assert_field_offset(config, SBI_SSE_ATTR_CONFIG);
> +assert_field_offset(hartid, SBI_SSE_ATTR_PREFERRED_HART);
> +assert_field_offset(entry.pc, SBI_SSE_ATTR_ENTRY_PC);
> +assert_field_offset(entry.a0, SBI_SSE_ATTR_ENTRY_A0);
> +assert_field_offset(entry.a6, SBI_SSE_ATTR_ENTRY_A6);
> +assert_field_offset(entry.a7, SBI_SSE_ATTR_ENTRY_A7);
> +assert_field_offset(interrupted.exc_mode, SBI_SSE_ATTR_INTERRUPTED_MODE);
> +assert_field_offset(interrupted.pc, SBI_SSE_ATTR_INTERRUPTED_PC);
> +assert_field_offset(interrupted.a0, SBI_SSE_ATTR_INTERRUPTED_A0);
> +assert_field_offset(interrupted.a6, SBI_SSE_ATTR_INTERRUPTED_A6);
> +assert_field_offset(interrupted.a7, SBI_SSE_ATTR_INTERRUPTED_A7);
> +
> +struct sbi_sse_event {
> +       struct sbi_sse_event_attrs attrs;
> +       uint32_t event_id;
> +       const struct sbi_sse_cb_ops *cb_ops;
> +       struct sbi_dlist node;
> +       /* Only global events are using the lock, local ones don't need it */
> +       spinlock_t lock;
> +};
> +
> +struct sse_hart_state {
> +       struct sbi_dlist event_list;
> +       spinlock_t list_lock;
> +       struct sbi_sse_event *local_events;
> +};
> +
> +static unsigned int local_event_count;
> +static unsigned int global_event_count;
> +static struct sbi_sse_event *global_events;
> +
> +static unsigned long sse_inject_fifo_off;
> +static unsigned long sse_inject_fifo_mem_off;
> +/* Offset of pointer to SSE HART state in scratch space */
> +static unsigned long shs_ptr_off;
> +
> +static u32 sse_ipi_inject_event = SBI_IPI_EVENT_MAX;
> +
> +static int sse_ipi_inject_send(unsigned long hartid, uint32_t event_id);
> +
> +static bool sse_event_is_global(struct sbi_sse_event *e)
> +{
> +       return EVENT_IS_GLOBAL(e->event_id);
> +}
> +
> +static void sse_global_event_lock(struct sbi_sse_event *e)
> +{
> +       if (sse_event_is_global(e))
> +               spin_lock(&e->lock);
> +}
> +
> +static void sse_global_event_unlock(struct sbi_sse_event *e)
> +{
> +       if (sse_event_is_global(e))
> +               spin_unlock(&e->lock);
> +}
> +
> +static void sse_event_set_state(struct sbi_sse_event *e,
> +                               enum sbi_sse_state new_state)
> +{
> +       enum sbi_sse_state prev_state = SSE_EVENT_STATE(e);
> +
> +       if ((new_state - prev_state == 1) || (prev_state - new_state == 1)) {
> +               SSE_EVENT_STATE(e) = new_state;
> +               return;
> +       }
> +
> +       sbi_panic("Invalid SSE state transition: %d -> %d\n", prev_state,
> +                 new_state);
> +}
> +
> +static struct sbi_sse_event *sse_event_get(uint32_t event)
> +{
> +       unsigned int i;
> +       struct sbi_sse_event *events, *e;
> +       unsigned int count;
> +       struct sse_hart_state *shs;
> +
> +       if (EVENT_IS_GLOBAL(event)) {
> +               count = global_event_count;
> +               events = global_events;
> +       } else {
> +               count = local_event_count;
> +               shs = sse_thishart_state_ptr();
> +               events = shs->local_events;
> +       }
> +
> +       for (i = 0; i < count; i++) {
> +               e = &events[i];
> +               if (e->event_id == event)
> +                       return e;
> +       }
> +
> +       return NULL;
> +}
> +
> +static struct sse_hart_state *sse_event_get_hart_state(struct sbi_sse_event *e)
> +{
> +       struct sbi_scratch *s = sbi_hartid_to_scratch(SSE_EVENT_HARTID(e));
> +
> +       return sse_get_hart_state_ptr(s);
> +}
> +
> +static void sse_event_remove_from_list(struct sbi_sse_event *e)
> +{
> +       struct sse_hart_state *state = sse_event_get_hart_state(e);
> +
> +       spin_lock(&state->list_lock);
> +       sbi_list_del(&e->node);
> +       spin_unlock(&state->list_lock);
> +}
> +
> +static void sse_event_add_to_list(struct sbi_sse_event *e)
> +{
> +       struct sse_hart_state *state = sse_event_get_hart_state(e);
> +       struct sbi_sse_event *tmp;
> +
> +       spin_lock(&state->list_lock);
> +       sbi_list_for_each_entry(tmp, &state->event_list, node) {
> +               if (SSE_EVENT_PRIO(e) < SSE_EVENT_PRIO(tmp))
> +                       break;
> +               if (SSE_EVENT_PRIO(e) == SSE_EVENT_PRIO(tmp) &&
> +                   e->event_id < tmp->event_id)
> +                       break;
> +       }
> +       sbi_list_add_tail(&e->node, &tmp->node);
> +
> +       spin_unlock(&state->list_lock);
> +}
> +
> +static int sse_event_disable(struct sbi_sse_event *e)
> +{
> +       if (SSE_EVENT_STATE(e) != SSE_STATE_ENABLED)
> +               return SBI_EINVALID_STATE;
> +
> +       sse_event_invoke_cb(e, disable_cb);
> +
> +       sse_event_remove_from_list(e);
> +       sse_event_set_state(e, SSE_STATE_REGISTERED);
> +
> +       return SBI_OK;
> +}
> +
> +static int sse_event_set_hart_id_check(struct sbi_sse_event *e,
> +                                      unsigned long new_hartid)
> +{
> +       int hstate;
> +       unsigned int hartid = (uint32_t) new_hartid;
> +       struct sbi_domain * hd = sbi_domain_thishart_ptr();
> +
> +       if (!sse_event_is_global(e))
> +               return SBI_EDENIED;
> +
> +       if (SSE_EVENT_STATE(e) >= SSE_STATE_ENABLED)
> +               return SBI_EBUSY;
> +
> +       if (!sbi_domain_is_assigned_hart(hd, new_hartid))
> +               return SBI_EINVAL;
> +
> +       hstate = sbi_hsm_hart_get_state(hd, hartid);
> +       if (hstate != SBI_HSM_STATE_STARTED)
> +               return SBI_EINVAL;
> +
> +       return SBI_OK;
> +}
> +
> +static int sse_event_set_attr_check(struct sbi_sse_event *e, uint32_t attr_id,
> +                                   unsigned long val)
> +{
> +       int ret = SBI_OK;
> +
> +       switch (attr_id) {
> +       case SBI_SSE_ATTR_CONFIG:
> +               if (val & ~SBI_SSE_ATTR_CONFIG_ONESHOT)
> +                       ret = SBI_ERR_INVALID_PARAM;
> +               break;
> +       case SBI_SSE_ATTR_PRIO:
> +               if (SSE_EVENT_STATE(e) >= SSE_STATE_ENABLED)
> +                       ret = SBI_EINVALID_STATE;
> +               break;
> +       case SBI_SSE_ATTR_PREFERRED_HART:
> +               ret = sse_event_set_hart_id_check(e, val);
> +               break;
> +       default:
> +               ret = SBI_EBAD_RANGE;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +static void sse_event_set_attr(struct sbi_sse_event *e, uint32_t attr_id,
> +                              unsigned long val)
> +{
> +       switch (attr_id) {
> +       case SBI_SSE_ATTR_CONFIG:
> +               SSE_EVENT_CONFIG(e) = val;
> +               break;
> +       case SBI_SSE_ATTR_PRIO:
> +               SSE_EVENT_PRIO(e) = (uint32_t)val;
> +               break;
> +       case SBI_SSE_ATTR_PREFERRED_HART:
> +               SSE_EVENT_HARTID(e) = val;
> +               sse_event_invoke_cb(e, set_hartid_cb, val);
> +               break;
> +       }
> +}
> +
> +static int sse_event_register(struct sbi_sse_event *e,
> +                             unsigned long handler_entry_pc,
> +                             unsigned long handler_entry_a0,
> +                             unsigned long handler_entry_a6,
> +                             unsigned long handler_entry_a7)
> +{
> +       if (sse_event_is_global(e) && SSE_EVENT_HARTID(e) != current_hartid())
> +               return SBI_EINVAL;
> +
> +       if (SSE_EVENT_STATE(e) != SSE_STATE_UNUSED)
> +               return SBI_EINVALID_STATE;
> +
> +       SSE_EVENT_ENTRY(e).a0 = handler_entry_a0;
> +       SSE_EVENT_ENTRY(e).a6 = handler_entry_a6;
> +       SSE_EVENT_ENTRY(e).a7 = handler_entry_a7;
> +       SSE_EVENT_ENTRY(e).pc = handler_entry_pc;
> +
> +       sse_event_set_state(e, SSE_STATE_REGISTERED);
> +
> +       sse_event_invoke_cb(e, register_cb);
> +
> +       return 0;
> +}
> +
> +static int sse_event_unregister(struct sbi_sse_event *e)
> +{
> +       if (SSE_EVENT_STATE(e) != SSE_STATE_REGISTERED)
> +               return SBI_EINVALID_STATE;
> +
> +       sse_event_invoke_cb(e, unregister_cb);
> +
> +       sse_event_set_state(e, SSE_STATE_UNUSED);
> +
> +       return 0;
> +}
> +
> +static void sse_event_inject(struct sbi_sse_event *e,
> +                            struct sbi_sse_event *prev_e,
> +                            struct sbi_trap_regs *regs)
> +{
> +       ulong prev_smode, prev_virt;
> +       struct sse_interrupted_state *i_ctx = &SSE_EVENT_INTERRUPTED(e);
> +       struct sse_interrupted_state *prev_i_ctx;
> +       struct sse_entry_state *e_ctx = &SSE_EVENT_ENTRY(e);
> +
> +       sse_event_set_state(e, SSE_STATE_RUNNING);
> +       SSE_EVENT_PENDING(e) = false;
> +
> +       if (prev_e) {
> +               /* back-to-back injection after another event, copy previous
> +                * event context for correct restoration
> +                */
> +               prev_i_ctx = &SSE_EVENT_INTERRUPTED(prev_e);
> +
> +               sse_regs_copy(i_ctx, prev_i_ctx);
> +               i_ctx->exc_mode = prev_i_ctx->exc_mode;
> +               i_ctx->pc = prev_i_ctx->pc;
> +       } else {
> +               sse_regs_copy(i_ctx, regs);
> +
> +               prev_smode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
> +       #if __riscv_xlen == 32
> +               prev_virt = (regs->mstatusH & MSTATUSH_MPV) ? 1 : 0;
> +       #else
> +               prev_virt = (regs->mstatus & MSTATUS_MPV) ? 1 : 0;
> +       #endif
> +
> +               i_ctx->exc_mode = prev_smode << EXC_MODE_PP_SHIFT;
> +               i_ctx->exc_mode |= prev_virt << EXC_MODE_PV_SHIFT;
> +               if (regs->mstatus & MSTATUS_SPIE)
> +                       i_ctx->exc_mode |= EXC_MODE_SSTATUS_SPIE;
> +               i_ctx->pc = regs->mepc;
> +
> +               /* We only want to set SPIE for the first event injected after
> +                * entering M-Mode. For the event injected right after another
> +                * event (after calling sse_event_complete(), we will keep the
> +                * saved SPIE).
> +                */
> +               regs->mstatus &= ~MSTATUS_SPIE;
> +               if (regs->mstatus & MSTATUS_SIE)
> +                       regs->mstatus |= MSTATUS_SPIE;
> +       }
> +
> +       sse_regs_copy(regs, e_ctx);
> +       regs->mepc = e_ctx->pc;
> +
> +       regs->mstatus &= ~MSTATUS_MPP;
> +       regs->mstatus |= (PRV_S << MSTATUS_MPP_SHIFT);
> +
> +       #if __riscv_xlen == 32
> +               regs->mstatusH &= ~MSTATUSH_MPV;
> +       #else
> +               regs->mstatus &= ~MSTATUS_MPV;
> +       #endif
> +
> +       regs->mstatus &= ~MSTATUS_SIE;
> +}
> +
> +static void sse_event_resume(struct sbi_sse_event *e, struct sbi_trap_regs *regs)
> +{
> +       struct sse_interrupted_state *i_ctx = &SSE_EVENT_INTERRUPTED(e);
> +
> +       sse_regs_copy(regs, i_ctx);
> +
> +       /* Restore previous virtualization state */
> +#if __riscv_xlen == 32
> +       regs->mstatusH &= ~MSTATUSH_MPV;
> +       if (i_ctx->exc_mode & EXC_MODE_PV)
> +               regs->mstatusH |= MSTATUSH_MPV;
> +#else
> +       regs->mstatus &= ~MSTATUS_MPV;
> +       if (i_ctx->exc_mode & EXC_MODE_PV)
> +               regs->mstatus |= MSTATUS_MPV;
> +#endif
> +
> +       regs->mstatus &= ~MSTATUS_MPP;
> +       if (i_ctx->exc_mode & EXC_MODE_PP)
> +               regs->mstatus |= (PRV_S << MSTATUS_MPP_SHIFT);
> +
> +       regs->mstatus &= ~MSTATUS_SIE;
> +       if (regs->mstatus & MSTATUS_SPIE)
> +               regs->mstatus |= MSTATUS_SIE;
> +
> +       regs->mstatus &= ~MSTATUS_SPIE;
> +       if (i_ctx->exc_mode & EXC_MODE_SSTATUS_SPIE)
> +               regs->mstatus |= MSTATUS_SPIE;
> +
> +       regs->mepc = i_ctx->pc;
> +}
> +
> +static bool sse_event_is_ready(struct sbi_sse_event *e)
> +{
> +       if (!SSE_EVENT_PENDING(e) || SSE_EVENT_STATE(e) != SSE_STATE_ENABLED ||
> +           SSE_EVENT_HARTID(e) != current_hartid()) {
> +               return false;
> +       }
> +
> +       return true;
> +}
> +
> +/* Return true if an event has been injected, false otherwise */
> +static bool sse_process_pending_events(struct sbi_sse_event *prev_e,
> +                                     struct sbi_trap_regs *regs)
> +{
> +       struct sbi_sse_event *e, *to_run = NULL;
> +       struct sse_hart_state *state = sse_thishart_state_ptr();
> +
> +retry:
> +       spin_lock(&state->list_lock);
> +
> +       if (sbi_list_empty(&state->event_list)) {
> +               spin_unlock(&state->list_lock);
> +               return false;
> +       }
> +
> +       sbi_list_for_each_entry(e, &state->event_list, node) {
> +               /*
> +                * List of event is ordered by priority, stop at first running
> +                * event since all other events after this one are of lower
> +                * priority.
> +                */
> +               if (SSE_EVENT_STATE(e) == SSE_STATE_RUNNING)
> +                       break;
> +
> +               if (sse_event_is_ready(e)) {
> +                       to_run = e;
> +                       break;
> +               }
> +       }
> +
> +       spin_unlock(&state->list_lock);
> +
> +       if (!to_run)
> +               return false;
> +
> +       sse_global_event_lock(e);
> +       /*
> +        * If the event is global, the event might have been moved to another
> +        * hart or disabled, evaluate readiness again.
> +        */
> +       if (sse_event_is_global(e) && !sse_event_is_ready(e)) {
> +               sse_global_event_unlock(e);
> +               goto retry;
> +       }
> +
> +       sse_event_inject(e, prev_e, regs);
> +       sse_global_event_unlock(e);
> +
> +       return true;
> +}
> +
> +static int sse_event_set_pending(struct sbi_sse_event *e)
> +{
> +       if (SSE_EVENT_STATE(e) != SSE_STATE_RUNNING &&
> +           SSE_EVENT_STATE(e) != SSE_STATE_ENABLED)
> +               return SBI_ERR_INVALID_STATE;
> +
> +       SSE_EVENT_PENDING(e) = true;
> +
> +       return SBI_OK;
> +}
> +
> +static void sse_ipi_inject_process(struct sbi_scratch *scratch,
> +                                  struct sbi_trap_regs *regs)
> +{
> +       struct sbi_sse_event *e;
> +       struct sse_ipi_inject_data evt;
> +       struct sbi_fifo *sse_inject_fifo_r =
> +                       sbi_scratch_offset_ptr(scratch, sse_inject_fifo_off);
> +
> +       /* This can be the case when sbi_exit() is called */
> +       if (!regs)
> +               return;
> +
> +       /* Mark all queued events as pending */
> +       while(!sbi_fifo_dequeue(sse_inject_fifo_r, &evt)) {
> +               e = sse_event_get(evt.event_id);
> +               if (!e)
> +                       continue;
> +
> +               sse_global_event_lock(e);
> +               sse_event_set_pending(e);
> +               sse_global_event_unlock(e);
> +       }
> +
> +       sse_process_pending_events(NULL, regs);
> +}
> +
> +static struct sbi_ipi_event_ops sse_ipi_inject_ops = {
> +       .name = "IPI_SSE_INJECT",
> +       .process = sse_ipi_inject_process,
> +};
> +
> +static int sse_ipi_inject_send(unsigned long hartid, uint32_t event_id)
> +{
> +       int ret;
> +       struct sbi_scratch *remote_scratch = NULL;
> +       struct sse_ipi_inject_data evt = {event_id};
> +       struct sbi_fifo *sse_inject_fifo_r;
> +
> +       remote_scratch = sbi_hartid_to_scratch(hartid);
> +       if (!remote_scratch)
> +               return SBI_EINVAL;
> +       sse_inject_fifo_r = sbi_scratch_offset_ptr(remote_scratch,
> +                                                  sse_inject_fifo_off);
> +
> +       ret = sbi_fifo_enqueue(sse_inject_fifo_r, &evt);
> +       if (ret)
> +               return SBI_EFAIL;
> +
> +       ret = sbi_ipi_send_many(1, hartid, sse_ipi_inject_event, NULL);
> +       if (ret)
> +               return SBI_EFAIL;
> +
> +       return SBI_OK;
> +}
> +
> +static int sse_inject_event(uint32_t event_id, unsigned long hartid,
> +                           struct sbi_trap_regs *regs,
> +                           struct sbi_ecall_return *out, bool from_ecall)
> +{
> +       int ret;
> +       struct sbi_sse_event *e;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +
> +       /* In case of global event, provided hart_id is ignored */
> +       if (sse_event_is_global(e))
> +               hartid = SSE_EVENT_HARTID(e);
> +
> +       /* Event is for another hart, send it through IPI */
> +       if (hartid != current_hartid()) {
> +               sse_global_event_unlock(e);
> +               return sse_ipi_inject_send(hartid, event_id);
> +       }
> +
> +       ret = sse_event_set_pending(e);
> +       sse_global_event_unlock(e);
> +       if (ret)
> +               return ret;
> +
> +       if (from_ecall) {
> +               /* Due to skip_regs_update = true being set if injection
> +                * succeed an the fact that we need to modify regs here before
> +                * injecting the event (regs are copied by the event), we need
> +                * to set out->skip_regs_update to true to avoid. Moreover
> +                * injection might not be done right now if another event of
> +                * higher priority is already running so always set
> +                * out->skip_regs_update to true there.
> +                */
> +               regs->mepc += 4;
> +               regs->a0 = SBI_OK;
> +               out->skip_regs_update = true;
> +       }
> +
> +       if (sse_process_pending_events(NULL, regs))
> +               out->skip_regs_update = true;
> +
> +       return SBI_OK;
> +}
> +
> +static int sse_event_enable(struct sbi_sse_event *e)
> +{
> +       if (SSE_EVENT_STATE(e) != SSE_STATE_REGISTERED)
> +               return SBI_EINVALID_STATE;
> +
> +       sse_event_set_state(e, SSE_STATE_ENABLED);
> +       sse_event_add_to_list(e);
> +
> +       if (SSE_EVENT_PENDING(e))
> +               sbi_ipi_send_many(1, SSE_EVENT_HARTID(e), sse_ipi_inject_event,
> +                                 NULL);
> +
> +       sse_event_invoke_cb(e, enable_cb);
> +
> +       return SBI_OK;
> +}
> +
> +static int sse_event_complete(struct sbi_sse_event *e,
> +                             struct sbi_trap_regs *regs,
> +                             struct sbi_ecall_return *out)
> +{
> +       bool inject;
> +
> +       if (SSE_EVENT_STATE(e) != SSE_STATE_RUNNING)
> +               return SBI_EINVALID_STATE;
> +
> +       if (SSE_EVENT_HARTID(e) != current_hartid())
> +               return SBI_EDENIED;
> +
> +       if (SSE_EVENT_CONFIG(e) & SBI_SSE_ATTR_CONFIG_ONESHOT)
> +               sse_event_disable(e);
> +       else
> +               sse_event_set_state(e, SSE_STATE_ENABLED);
> +
> +       sse_event_invoke_cb(e, complete_cb);
> +
> +       inject = sse_process_pending_events(e, regs);
> +       if (!inject)
> +               sse_event_resume(e, regs);
> +
> +       out->skip_regs_update = true;
> +
> +       return SBI_OK;
> +}
> +
> +int sbi_sse_complete(uint32_t event_id, struct sbi_trap_regs *regs,
> +                    struct sbi_ecall_return *out)
> +{
> +       int ret;
> +       struct sbi_sse_event *e;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +       ret = sse_event_complete(e, regs, out);
> +       sse_global_event_unlock(e);
> +
> +       return ret;
> +}
> +
> +int sbi_sse_enable(uint32_t event_id)
> +{
> +       int ret;
> +       struct sbi_sse_event *e;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +       ret = sse_event_enable(e);
> +       sse_global_event_unlock(e);
> +
> +       return ret;
> +}
> +
> +int sbi_sse_disable(uint32_t event_id)
> +{
> +       int ret;
> +       struct sbi_sse_event *e;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +       ret = sse_event_disable(e);
> +       sse_global_event_unlock(e);
> +
> +       return ret;
> +}
> +
> +int sbi_sse_inject_from_ecall(uint32_t event_id, unsigned long hartid,
> +                             struct sbi_trap_regs *regs,
> +                             struct sbi_ecall_return *out)
> +{
> +       if (!sbi_domain_is_assigned_hart(sbi_domain_thishart_ptr(), hartid))
> +               return SBI_EINVAL;
> +
> +       return sse_inject_event(event_id, hartid, regs, out, true);
> +}
> +
> +int sbi_sse_inject_event(uint32_t event_id, struct sbi_trap_regs *regs)
> +{
> +       /* We don't really care about return value here */
> +       struct sbi_ecall_return out;
> +
> +       return sse_inject_event(event_id, current_hartid(), regs, &out, false);
> +}
> +
> +int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
> +{
> +       struct sbi_sse_event *e;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       if (cb_ops->set_hartid_cb && !sse_event_is_global(e))
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +       e->cb_ops = cb_ops;
> +       sse_global_event_unlock(e);
> +
> +       return SBI_OK;
> +}
> +
> +int sbi_sse_attr_check(uint32_t base_attr_id, uint32_t attr_count,
> +                      unsigned long phys_lo,
> +                      unsigned long phys_hi,
> +                      unsigned long access)
> +{
> +       const unsigned align = __riscv_xlen >> 3;
> +       /* Avoid 32 bits overflow */
> +       uint64_t end_id = (uint64_t)base_attr_id + attr_count;
> +
> +       if (end_id > SBI_SSE_ATTR_INTERRUPTED_A7)
> +               return SBI_EBAD_RANGE;
> +
> +       if (phys_lo & (align - 1))
> +               return SBI_EINVALID_ADDR;
> +
> +       /*
> +        * On RV32, the M-mode can only access the first 4GB of
> +        * the physical address space because M-mode does not have
> +        * MMU to access full 34-bit physical address space.
> +        *
> +        * Based on above, we simply fail if the upper 32bits of
> +        * the physical address (i.e. a2 register) is non-zero on
> +        * RV32.
> +        */
> +       if (phys_hi)
> +               return SBI_EINVALID_ADDR;
> +
> +       if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(), phys_lo,
> +                                        sizeof(unsigned long) * attr_count, 1,
> +                                        access))
> +               return SBI_EINVALID_ADDR;
> +
> +       return SBI_OK;
> +}
> +
> +
> +static void copy_attrs(unsigned long *out, const unsigned long *in,
> +                      unsigned int long_count)
> +{
> +       int i = 0;
> +
> +       /*
> +        * sbi_memcpy() does byte-per-byte copy, using this yields long-per-long
> +        * copy
> +        */
> +       for (i = 0; i < long_count; i++)
> +               out[i] = in[i];
> +}
> +
> +int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
> +                      uint32_t attr_count, unsigned long output_phys_lo,
> +                      unsigned long output_phys_hi)
> +{
> +       int ret;
> +       unsigned long *e_attrs;
> +       struct sbi_sse_event *e;
> +       unsigned long *attrs;
> +
> +       ret = sbi_sse_attr_check(base_attr_id, attr_count, output_phys_lo,
> +                                output_phys_hi, SBI_DOMAIN_WRITE);
> +       if (ret)
> +               return ret;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +
> +       sbi_hart_map_saddr(output_phys_lo, sizeof(unsigned long) * attr_count);
> +
> +       /*
> +        * Copy all attributes at once since struct sse_event_attrs is matching
> +        * the SBI_SSE_ATTR_* attributes. While WRITE_ATTR attribute is not used
> +        * in s-mode sse handling path, READ_ATTR is used to retrieve the value
> +        * of registers when interrupted. rather than doing multiple SBI calls,
> +        * a single one is done allowing to retrieve them all at once.
> +        */
> +       e_attrs = (unsigned long *)&e->attrs;
> +       attrs = (unsigned long *)output_phys_lo;
> +       copy_attrs(attrs, &e_attrs[base_attr_id], attr_count);
> +
> +       sbi_hart_unmap_saddr();
> +
> +       sse_global_event_unlock(e);
> +
> +       return SBI_OK;
> +}
> +
> +int sbi_sse_write_attrs(uint32_t event_id, uint32_t base_attr_id,
> +                       uint32_t attr_count, unsigned long input_phys_lo,
> +                       unsigned long input_phys_hi)
> +{
> +       int ret;
> +       struct sbi_sse_event *e;
> +       unsigned long attr = 0, val;
> +       uint32_t id, end_id = base_attr_id + attr_count;
> +       unsigned long *attrs = (unsigned long *)input_phys_lo;
> +
> +       ret = sbi_sse_attr_check(base_attr_id, attr_count, input_phys_lo,
> +                                input_phys_hi, SBI_DOMAIN_READ);
> +       if (ret)
> +               return ret;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +
> +       sbi_hart_map_saddr(input_phys_lo, sizeof(unsigned long) * attr_count);
> +
> +       for (id = base_attr_id; id < end_id; id++) {
> +               val = attrs[attr++];
> +               ret = sse_event_set_attr_check(e, id, val);
> +               if (ret)
> +                       goto out;
> +       }
> +
> +       attr = 0;
> +       for (id = base_attr_id; id < end_id; id++) {
> +               val = attrs[attr++];
> +               sse_event_set_attr(e, id, val);
> +       }
> +out:
> +       sbi_hart_unmap_saddr();
> +
> +       sse_global_event_unlock(e);
> +
> +       return SBI_OK;
> +}
> +
> +int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
> +                    unsigned long handler_entry_a0,
> +                    unsigned long handler_entry_a6,
> +                    unsigned long handler_entry_a7)
> +{
> +       int ret;
> +       struct sbi_sse_event *e;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +       ret = sse_event_register(e, handler_entry_pc, handler_entry_a0,
> +                                handler_entry_a6, handler_entry_a7);
> +       sse_global_event_unlock(e);
> +
> +       return ret;
> +}
> +
> +int sbi_sse_unregister(uint32_t event_id)
> +{
> +       int ret;
> +       struct sbi_sse_event *e;
> +
> +       e = sse_event_get(event_id);
> +       if (!e)
> +               return SBI_EINVAL;
> +
> +       sse_global_event_lock(e);
> +       ret = sse_event_unregister(e);
> +       sse_global_event_unlock(e);
> +
> +       return ret;
> +}
> +
> +static void sse_event_init(struct sbi_sse_event *e, uint32_t event_id)
> +{
> +       e->event_id = event_id;
> +       SSE_EVENT_HARTID(e) = current_hartid();
> +       /* Declare all events as injectable */
> +       SSE_EVENT_CAN_INJECT(e) = 1;
> +}
> +
> +static int sse_global_init()
> +{
> +       struct sbi_sse_event *e;
> +       unsigned int i, ev = 0;
> +
> +       for (i = 0; i < EVENT_COUNT; i++) {
> +               if (EVENT_IS_GLOBAL(supported_events[i]))
> +                       global_event_count++;
> +               else
> +                       local_event_count++;
> +       }
> +
> +       global_events = sbi_zalloc(sizeof(*global_events) * global_event_count);
> +       if (!global_events)
> +               return SBI_ENOMEM;
> +
> +       for (i = 0; i < EVENT_COUNT; i++) {
> +               if (!EVENT_IS_GLOBAL(supported_events[i]))
> +                       continue;
> +
> +               e = &global_events[ev];
> +               sse_event_init(e, supported_events[i]);
> +               SPIN_LOCK_INIT(e->lock);
> +
> +               ev++;
> +       }
> +
> +       return 0;
> +}
> +
> +static void sse_local_init(struct sse_hart_state *shs)
> +{
> +       unsigned int i, ev = 0;
> +
> +       SBI_INIT_LIST_HEAD(&shs->event_list);
> +       SPIN_LOCK_INIT(shs->list_lock);
> +
> +       for (i = 0; i < EVENT_COUNT; i++) {
> +               if (EVENT_IS_GLOBAL(supported_events[i]))
> +                       continue;
> +
> +               sse_event_init(&shs->local_events[ev++], supported_events[i]);
> +       }
> +}
> +
> +int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
> +{
> +       int ret;
> +       void *sse_inject_mem;
> +       struct sse_hart_state *shs;
> +       struct sbi_fifo *sse_inject_q;
> +
> +       if (cold_boot) {
> +               ret = sse_global_init();
> +               if (ret)
> +                       return ret;
> +
> +               shs_ptr_off = sbi_scratch_alloc_offset(sizeof(void *));
> +               if (!shs_ptr_off)
> +                       return SBI_ENOMEM;
> +
> +               sse_inject_fifo_off = sbi_scratch_alloc_offset(
> +                                                       sizeof(*sse_inject_q));
> +               if (!sse_inject_fifo_off) {
> +                       sbi_scratch_free_offset(shs_ptr_off);
> +                       return SBI_ENOMEM;
> +               }
> +
> +               sse_inject_fifo_mem_off = sbi_scratch_alloc_offset(
> +                       EVENT_COUNT * sizeof(struct sse_ipi_inject_data));
> +               if (!sse_inject_fifo_mem_off) {
> +                       sbi_scratch_free_offset(sse_inject_fifo_off);
> +                       sbi_scratch_free_offset(shs_ptr_off);
> +                       return SBI_ENOMEM;
> +               }
> +
> +               ret = sbi_ipi_event_create(&sse_ipi_inject_ops);
> +               if (ret < 0) {
> +                       sbi_scratch_free_offset(shs_ptr_off);
> +                       return ret;
> +               }
> +               sse_ipi_inject_event = ret;
> +       }
> +
> +       shs = sse_get_hart_state_ptr(scratch);
> +       if (!shs) {
> +               /* Allocate per hart state and local events at once */
> +               shs = sbi_zalloc(sizeof(*shs) +
> +                       sizeof(struct sbi_sse_event) * local_event_count);
> +               if (!shs)
> +                       return SBI_ENOMEM;
> +
> +               shs->local_events = (struct sbi_sse_event *)(shs + 1);
> +
> +               sse_set_hart_state_ptr(scratch, shs);
> +       }
> +
> +       sse_local_init(shs);
> +
> +       sse_inject_q = sbi_scratch_offset_ptr(scratch, sse_inject_fifo_off);
> +       sse_inject_mem = sbi_scratch_offset_ptr(scratch,
> +                                               sse_inject_fifo_mem_off);
> +
> +       sbi_fifo_init(sse_inject_q, sse_inject_mem, EVENT_COUNT,
> +                     sizeof(struct sse_ipi_inject_data));
> +
> +       return 0;
> +}
> +
> +void sbi_sse_exit(struct sbi_scratch *scratch)
> +{
> +       int i;
> +       struct sbi_sse_event *e;
> +
> +       for (i = 0; i < EVENT_COUNT; i++) {
> +               e = sse_event_get(supported_events[i]);
> +
> +               if (SSE_EVENT_HARTID(e) != current_hartid())
> +                       continue;
> +
> +               if (SSE_EVENT_STATE(e) > SSE_STATE_REGISTERED)
> +                       sbi_printf("Event %d in invalid state at exit", i);
> +       }
> +}
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

