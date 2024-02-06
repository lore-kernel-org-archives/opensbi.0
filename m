From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Feb 2024 13:38:19 +0530
Subject: [PATCH v3 09/10] firmware: Use C if possible
In-Reply-To: <20240117104212.1055737-10-wxjstz@126.com>
References: <20240117104212.1055737-1-wxjstz@126.com> <20240117104212.1055737-10-wxjstz@126.com>
Message-ID: <CAAhSdy2rd+ANj_La_OS30_vOm7vMgp6z7Rxo66akpC=Cuhj1cQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 17, 2024 at 4:12?PM Xiang W <wxjstz@126.com> wrote:
>
> Use C as soon as possible after setting up the stack.

The generic library lib/sbi is also used external firmware so
the C code (fw_coldboot_init) is just dead code for such
external firmware.

I suggest dropping this patch.

Regards,
Anup

>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  firmware/fw_base.S     | 206 +----------------------------------------
>  include/sbi/sbi_init.h |   3 +
>  lib/sbi/sbi_init.c     | 111 +++++++++++++++++++++-
>  3 files changed, 115 insertions(+), 205 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 56bffe8..aec683b 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -183,192 +183,7 @@ _bss_zero:
>         li      s5, (SBI_SCRATCH_SIZE * 2)
>         add     sp, s4, s5
>
> -       /* Allow main firmware to save info */
> -       MOV_5R  s0, a0, s1, a1, s2, a2, s3, a3, s4, a4
> -       call    fw_save_info
> -       MOV_5R  a0, s0, a1, s1, a2, s2, a3, s3, a4, s4
> -
> -#ifdef FW_FDT_PATH
> -       /* Override previous arg1 */
> -       lla     a1, fw_fdt_bin
> -#endif
> -
> -       /*
> -        * Initialize platform
> -        * Note: The a0 to a4 registers passed to the
> -        * firmware are parameters to this function.
> -        */
> -       MOV_5R  s0, a0, s1, a1, s2, a2, s3, a3, s4, a4
> -       call    fw_platform_init
> -       add     t0, a0, zero
> -       MOV_5R  a0, s0, a1, s1, a2, s2, a3, s3, a4, s4
> -       add     a1, t0, zero
> -
> -       /* Preload HART details
> -        * s7 -> HART Count
> -        * s8 -> HART Stack Size
> -        * s9 -> Heap Size
> -        * s10 -> Heap Offset
> -        */
> -       lla     a4, platform
> -#if __riscv_xlen > 32
> -       lwu     s7, SBI_PLATFORM_HART_COUNT_OFFSET(a4)
> -       lwu     s8, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(a4)
> -       lwu     s9, SBI_PLATFORM_HEAP_SIZE_OFFSET(a4)
> -#else
> -       lw      s7, SBI_PLATFORM_HART_COUNT_OFFSET(a4)
> -       lw      s8, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(a4)
> -       lw      s9, SBI_PLATFORM_HEAP_SIZE_OFFSET(a4)
> -#endif
> -
> -       /* Setup scratch space for all the HARTs*/
> -       lla     tp, _fw_end
> -       mul     a5, s7, s8
> -       add     tp, tp, a5
> -       /* Setup heap base address */
> -       lla     s10, _fw_start
> -       sub     s10, tp, s10
> -       add     tp, tp, s9
> -       /* Keep a copy of tp */
> -       add     t3, tp, zero
> -       /* Counter */
> -       li      t2, 1
> -       /* hartid 0 is mandated by ISA */
> -       li      t1, 0
> -_scratch_init:
> -       /*
> -        * The following registers hold values that are computed before
> -        * entering this block, and should remain unchanged.
> -        *
> -        * t3 -> the firmware end address
> -        * s7 -> HART count
> -        * s8 -> HART stack size
> -        * s9 -> Heap Size
> -        * s10 -> Heap Offset
> -        */
> -       add     tp, t3, zero
> -       sub     tp, tp, s9
> -       mul     a5, s8, t1
> -       sub     tp, tp, a5
> -       li      a5, SBI_SCRATCH_SIZE
> -       sub     tp, tp, a5
> -
> -       /* Initialize scratch space */
> -       /* Store fw_start and fw_size in scratch space */
> -       lla     a4, _fw_start
> -       sub     a5, t3, a4
> -       REG_S   a4, SBI_SCRATCH_FW_START_OFFSET(tp)
> -       REG_S   a5, SBI_SCRATCH_FW_SIZE_OFFSET(tp)
> -
> -       /* Store R/W section's offset in scratch space */
> -       lla     a5, _fw_rw_start
> -       sub     a5, a5, a4
> -       REG_S   a5, SBI_SCRATCH_FW_RW_OFFSET(tp)
> -
> -       /* Store fw_heap_offset and fw_heap_size in scratch space */
> -       REG_S   s10, SBI_SCRATCH_FW_HEAP_OFFSET(tp)
> -       REG_S   s9, SBI_SCRATCH_FW_HEAP_SIZE_OFFSET(tp)
> -
> -       /* Store next arg1 in scratch space */
> -       MOV_3R  s0, a0, s1, a1, s2, a2
> -       call    fw_next_arg1
> -       REG_S   a0, SBI_SCRATCH_NEXT_ARG1_OFFSET(tp)
> -       MOV_3R  a0, s0, a1, s1, a2, s2
> -       /* Store next address in scratch space */
> -       MOV_3R  s0, a0, s1, a1, s2, a2
> -       call    fw_next_addr
> -       REG_S   a0, SBI_SCRATCH_NEXT_ADDR_OFFSET(tp)
> -       MOV_3R  a0, s0, a1, s1, a2, s2
> -       /* Store next mode in scratch space */
> -       MOV_3R  s0, a0, s1, a1, s2, a2
> -       call    fw_next_mode
> -       REG_S   a0, SBI_SCRATCH_NEXT_MODE_OFFSET(tp)
> -       MOV_3R  a0, s0, a1, s1, a2, s2
> -       /* Store warm_boot address in scratch space */
> -       lla     a4, _start_warm
> -       REG_S   a4, SBI_SCRATCH_WARMBOOT_ADDR_OFFSET(tp)
> -       /* Store platform address in scratch space */
> -       lla     a4, platform
> -       REG_S   a4, SBI_SCRATCH_PLATFORM_ADDR_OFFSET(tp)
> -       /* Store hartid-to-scratch function address in scratch space */
> -       lla     a4, _hartid_to_scratch
> -       REG_S   a4, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET(tp)
> -       /* Store trap-exit function address in scratch space */
> -       lla     a4, _trap_exit
> -       REG_S   a4, SBI_SCRATCH_TRAP_EXIT_OFFSET(tp)
> -       /* Clear tmp0 in scratch space */
> -       REG_S   zero, SBI_SCRATCH_TMP0_OFFSET(tp)
> -       /* Store firmware options in scratch space */
> -       MOV_3R  s0, a0, s1, a1, s2, a2
> -#ifdef FW_OPTIONS
> -       li      a0, FW_OPTIONS
> -#else
> -       call    fw_options
> -#endif
> -       REG_S   a0, SBI_SCRATCH_OPTIONS_OFFSET(tp)
> -       MOV_3R  a0, s0, a1, s1, a2, s2
> -       /* Move to next scratch space */
> -       add     t1, t1, t2
> -       blt     t1, s7, _scratch_init
> -
> -       /*
> -        * Relocate Flatened Device Tree (FDT)
> -        * source FDT address = previous arg1
> -        * destination FDT address = next arg1
> -        *
> -        * Note: We will preserve a0 and a1 passed by
> -        * previous booting stage.
> -        */
> -       beqz    a1, _fdt_reloc_done
> -       /* Mask values in a4 */
> -       li      a4, 0xff
> -       /* t1 = destination FDT start address */
> -       MOV_3R  s0, a0, s1, a1, s2, a2
> -       call    fw_next_arg1
> -       add     t1, a0, zero
> -       MOV_3R  a0, s0, a1, s1, a2, s2
> -       beqz    t1, _fdt_reloc_done
> -       beq     t1, a1, _fdt_reloc_done
> -       /* t0 = source FDT start address */
> -       add     t0, a1, zero
> -       /* t2 = source FDT size in big-endian */
> -#if __riscv_xlen > 32
> -       lwu     t2, 4(t0)
> -#else
> -       lw      t2, 4(t0)
> -#endif
> -       /* t3 = bit[15:8] of FDT size */
> -       add     t3, t2, zero
> -       srli    t3, t3, 16
> -       and     t3, t3, a4
> -       slli    t3, t3, 8
> -       /* t4 = bit[23:16] of FDT size */
> -       add     t4, t2, zero
> -       srli    t4, t4, 8
> -       and     t4, t4, a4
> -       slli    t4, t4, 16
> -       /* t5 = bit[31:24] of FDT size */
> -       add     t5, t2, zero
> -       and     t5, t5, a4
> -       slli    t5, t5, 24
> -       /* t2 = bit[7:0] of FDT size */
> -       srli    t2, t2, 24
> -       and     t2, t2, a4
> -       /* t2 = FDT size in little-endian */
> -       or      t2, t2, t3
> -       or      t2, t2, t4
> -       or      t2, t2, t5
> -       /* t2 = destination FDT end address */
> -       add     t2, t1, t2
> -       /* FDT copy loop */
> -       ble     t2, t1, _fdt_reloc_done
> -_fdt_reloc_again:
> -       REG_L   t3, 0(t0)
> -       REG_S   t3, 0(t1)
> -       add     t0, t0, __SIZEOF_POINTER__
> -       add     t1, t1, __SIZEOF_POINTER__
> -       blt     t1, t2, _fdt_reloc_again
> -_fdt_reloc_done:
> +       call    fw_coldboot_init
>
>         /* mark boot hart done */
>         li      t0, BOOT_STATUS_BOOT_HART_DONE
> @@ -441,24 +256,7 @@ _start_warm:
>         /* Setup stack */
>         add     sp, tp, zero
>
> -       /* Setup trap handler */
> -       lla     a4, _trap_handler
> -#if __riscv_xlen == 32
> -       csrr    a5, CSR_MISA
> -       srli    a5, a5, ('H' - 'A')
> -       andi    a5, a5, 0x1
> -       beq     a5, zero, _skip_trap_handler_rv32_hyp
> -       /* Override trap exit for H-extension */
> -       csrr    a5, CSR_MSCRATCH
> -       lla     a4, _trap_exit_rv32_hyp
> -       REG_S   a4, SBI_SCRATCH_TRAP_EXIT_OFFSET(a5)
> -       lla     a4, _trap_handler_rv32_hyp
> -_skip_trap_handler_rv32_hyp:
> -#endif
> -       csrw    CSR_MTVEC, a4
> -
> -       /* Initialize SBI runtime */
> -       csrr    a0, CSR_MSCRATCH
> +       add     a0, tp, zero
>         call    sbi_init
>
>         /* We don't expect to reach here hence just hang */
> diff --git a/include/sbi/sbi_init.h b/include/sbi/sbi_init.h
> index 9640fee..bd07403 100644
> --- a/include/sbi/sbi_init.h
> +++ b/include/sbi/sbi_init.h
> @@ -14,6 +14,9 @@
>
>  struct sbi_scratch;
>
> +void fw_coldboot_init(unsigned long arg0, unsigned long arg1,
> +                 unsigned long arg2, unsigned long arg3, unsigned long arg4);
> +
>  void __noreturn sbi_init(struct sbi_scratch *scratch);
>
>  unsigned long sbi_entry_count(u32 hartid);
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 804b01c..1f6f70c 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -6,7 +6,7 @@
>   * Authors:
>   *   Anup Patel <anup.patel@wdc.com>
>   */
> -
> +#include <libfdt.h>
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_atomic.h>
>  #include <sbi/riscv_barrier.h>
> @@ -40,6 +40,104 @@
>         "        | |\n"                                     \
>         "        |_|\n\n"
>
> +
> +extern struct sbi_platform platform;
> +
> +extern char _fw_start[];
> +extern char _fw_end[];
> +extern char _fw_rw_start[];
> +extern char _start_warm[];
> +extern char fw_fdt_bin[];
> +extern char _hartid_to_scratch[];
> +extern char _trap_handler[];
> +extern char _trap_handler_rv32_hyp[];
> +extern char _trap_exit[];
> +extern char _trap_exit_rv32_hyp[];
> +
> +
> +extern void fw_save_info(unsigned long arg0,
> +                        unsigned long arg1,unsigned long arg2);
> +extern unsigned long fw_next_arg1(void);
> +extern unsigned long fw_next_addr(void);
> +extern unsigned long fw_next_mode(void);
> +extern unsigned long fw_options(void);
> +
> +extern unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
> +                 unsigned long arg2, unsigned long arg3, unsigned long arg4);
> +
> +void fw_coldboot_init(unsigned long arg0, unsigned long arg1,
> +                 unsigned long arg2, unsigned long arg3, unsigned long arg4)
> +{
> +       unsigned long top;
> +       unsigned long fw_start;
> +       unsigned long fw_rw_offset;
> +       unsigned long fw_heap_size;
> +       unsigned long fw_heap_offset;
> +       unsigned long fw_size;
> +       unsigned long warmboot_addr;
> +       unsigned long platform_addr;
> +       unsigned long hartid_to_scratch;
> +       unsigned long next_addr;
> +       unsigned long next_arg1;
> +       unsigned long next_mode;
> +       unsigned long options;
> +
> +       const void * fdt;
> +       void *target_fdt;
> +
> +       fw_save_info(arg0, arg1, arg2);
> +#ifdef FW_FDT_PATH
> +       arg1 = (unsigned long)fw_fdt_bin;
> +#endif
> +
> +       /* initialization platform */
> +       arg1 = fw_platform_init(arg0, arg1, arg2, arg3, arg4);
> +
> +       /* relocate fdt */
> +       fdt = (const void*)arg1;
> +       target_fdt = (void*)fw_next_arg1();
> +       fdt_move(fdt, target_fdt, fdt_totalsize(fdt));
> +
> +       /* initialization scratch for all harts */
> +       next_addr = fw_next_addr();
> +       next_arg1 = fw_next_arg1();
> +       next_mode = fw_next_mode();
> +#ifdef FW_OPTIONS
> +       options = FW_OPTIONS
> +#else
> +       options = fw_options();
> +#endif
> +       top = (unsigned long)_fw_end
> +               + platform.hart_stack_size * platform.hart_count;
> +       fw_start = (unsigned long)_fw_start;
> +       fw_rw_offset = (unsigned long)_fw_rw_start - fw_start;
> +       fw_heap_size = platform.heap_size;
> +       fw_heap_offset = top - fw_start;
> +       fw_size = top + fw_heap_size - fw_start;
> +       warmboot_addr = (unsigned long)_start_warm;
> +       platform_addr = (unsigned long)&platform;
> +       hartid_to_scratch = (unsigned long)_hartid_to_scratch;
> +
> +       for (u32 i = 0; i < platform.hart_count; i++) {
> +               struct sbi_scratch *scratch = (struct sbi_scratch *)(top
> +                       - i * platform.hart_stack_size - SBI_SCRATCH_SIZE);
> +
> +               scratch->fw_start = fw_start;
> +               scratch->fw_size = fw_size;
> +               scratch->fw_rw_offset = fw_rw_offset;
> +               scratch->fw_heap_size = fw_heap_size;
> +               scratch->fw_heap_offset = fw_heap_offset;
> +               scratch->warmboot_addr = warmboot_addr;
> +               scratch->platform_addr = platform_addr;
> +               scratch->hartid_to_scratch = hartid_to_scratch;
> +               scratch->next_addr = next_addr;
> +               scratch->next_arg1 = next_arg1;
> +               scratch->next_mode = next_mode;
> +               scratch->options = options;
> +               scratch->tmp0 = 0;
> +       }
> +}
> +
>  static void sbi_boot_print_banner(struct sbi_scratch *scratch)
>  {
>         if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
> @@ -543,6 +641,17 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
>         u32 hartid                      = current_hartid();
>         const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>
> +       unsigned long trap_handler = (unsigned long)_trap_handler;
> +       unsigned long trap_exit = (unsigned long)_trap_exit;
> +#if __riscv_xlen == 32
> +       if (misa_extension('H')) {
> +               trap_handler = (unsigned long)_trap_handler_rv32_hyp;
> +               trap_exit = (unsigned long)_trap_exit_rv32_hyp;
> +       }
> +#endif
> +       csr_write(CSR_MTVEC, trap_handler);
> +       scratch->trap_exit = trap_exit;
> +
>         for (i = 0; i < plat->hart_count; i++) {
>                 h = (plat->hart_index2id) ? plat->hart_index2id[i] : i;
>                 if (h == hartid)
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

