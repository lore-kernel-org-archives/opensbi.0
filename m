From: Anup Patel <anup@brainfault.org>
Date: Sat, 2 Mar 2024 19:00:11 +0530
Subject: [PATCH v5 8/8] firmware: Use C if possible
In-Reply-To: <20240302074235.12643-9-wxjstz@126.com>
References: <20240302074235.12643-1-wxjstz@126.com> <20240302074235.12643-9-wxjstz@126.com>
Message-ID: <CAAhSdy1p9_BquNX6R0UJk_rx=THNv4WsxsxEgLRqUaceiSG5TQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 2, 2024 at 1:13?PM Xiang W <wxjstz@126.com> wrote:
>
> Use C as soon as possible after setting up the stack.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

I don't see any improvement being achieved by moving small
sbi_scratch init code to C code so NACK from my side.

Regards,
Anup

> ---
>  Makefile                |  10 +-
>  firmware/fw.c           | 101 +++++++++++++++++++
>  firmware/fw_base.S      | 209 +---------------------------------------
>  firmware/fw_dynamic.S   |  25 ++---
>  firmware/fw_jump.S      |  25 ++---
>  firmware/fw_payload.S   |  25 ++---
>  firmware/objects.mk     |   2 +
>  include/sbi/sbi_types.h |   1 +
>  8 files changed, 142 insertions(+), 256 deletions(-)
>  create mode 100644 firmware/fw.c
>
> diff --git a/Makefile b/Makefile
> index d8cffa6..dfd2554 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -257,13 +257,14 @@ platform-objs-path-y=$(foreach obj,$(platform-objs-y),$(platform_build_dir)/$(ob
>  firmware-bins-path-y=$(foreach bin,$(firmware-bins-y),$(platform_build_dir)/firmware/$(bin))
>  endif
>  firmware-elfs-path-y=$(firmware-bins-path-y:.bin=.elf)
> -firmware-objs-path-y=$(firmware-bins-path-y:.bin=.o)
> +firmware-objs-path-y=$(foreach obj,$(firmware-objs-y),$(platform_build_dir)/firmware/$(obj))
>
>  # Setup list of deps files for objects
>  deps-y=$(platform-objs-path-y:.o=.dep)
>  deps-y+=$(libsbi-objs-path-y:.o=.dep)
>  deps-y+=$(libsbiutils-objs-path-y:.o=.dep)
>  deps-y+=$(firmware-objs-path-y:.o=.dep)
> +deps-y+=$(firmware-bins-path-y:.bin=.dep)
>  deps-y+=$(firmware-elfs-path-y:=.dep)
>
>  # Setup platform ABI, ISA and Code Model
> @@ -510,6 +511,9 @@ $(build_dir)/lib/libsbi.a: $(libsbi-objs-path-y)
>  $(platform_build_dir)/lib/libplatsbi.a: $(libsbi-objs-path-y) $(libsbiutils-objs-path-y) $(platform-objs-path-y)
>         $(call compile_ar,$@,$^)
>
> +$(platform_build_dir)/firmware/libfw.a: $(firmware-objs-path-y)
> +       $(call compile_ar,$@,$^)
> +
>  $(build_dir)/%.dep: $(src_dir)/%.carray $(KCONFIG_CONFIG)
>         $(call compile_gen_dep,$@,.c,$< $(KCONFIG_CONFIG))
>         $(call compile_gen_dep,$@,.o,$(@:.dep=.c))
> @@ -572,8 +576,8 @@ $(platform_build_dir)/%.dtb: $(platform_src_dir)/%.dts
>  $(platform_build_dir)/%.bin: $(platform_build_dir)/%.elf
>         $(call compile_objcopy,$@,$<)
>
> -$(platform_build_dir)/%.elf: $(platform_build_dir)/%.o $(platform_build_dir)/%.elf.ld $(platform_build_dir)/lib/libplatsbi.a
> -       $(call compile_elf,$@,$@.ld,$< $(platform_build_dir)/lib/libplatsbi.a)
> +$(platform_build_dir)/%.elf: $(platform_build_dir)/%.o $(platform_build_dir)/%.elf.ld $(platform_build_dir)/lib/libplatsbi.a $(platform_build_dir)/firmware/libfw.a
> +       $(call compile_elf,$@,$@.ld,$< $(platform_build_dir)/lib/libplatsbi.a) $(platform_build_dir)/firmware/libfw.a
>
>  $(platform_build_dir)/%.dep: $(src_dir)/%.ldS $(KCONFIG_CONFIG)
>         $(call compile_cpp_dep,$@,.ld,$<)
> diff --git a/firmware/fw.c b/firmware/fw.c
> new file mode 100644
> index 0000000..5f5ce30
> --- /dev/null
> +++ b/firmware/fw.c
> @@ -0,0 +1,101 @@
> +#include <libfdt.h>
> +#include <sbi/riscv_asm.h>
> +#include <sbi/sbi_types.h>
> +#include <sbi/sbi_scratch.h>
> +#include <sbi/sbi_platform.h>
> +
> +extern struct sbi_platform platform;
> +
> +extern char _fw_start[];
> +extern char _fw_end[];
> +extern char _fw_rw_start[];
> +extern char _start_warm[];
> +extern char fw_fdt_bin[];
> +extern char _hartid_to_scratch[];
> +
> +extern void fw_save_info(unsigned long arg0,
> +                        unsigned long arg1,unsigned long arg2);
> +extern unsigned long fw_next_arg1(void);
> +extern unsigned long fw_next_addr(void);
> +extern unsigned long fw_next_mode(void);
> +extern unsigned long fw_options(void);
> +
> +__weak unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
> +               unsigned long arg2, unsigned long arg3, unsigned long arg4)
> +{
> +       return arg1;
> +}
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
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index df5f769..0e4d4df 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -17,21 +17,6 @@
>  #define BOOT_STATUS_LOTTERY_DONE       1
>  #define BOOT_STATUS_BOOT_HART_DONE     2
>
> -.macro MOV_3R __d0, __s0, __d1, __s1, __d2, __s2
> -       add     \__d0, \__s0, zero
> -       add     \__d1, \__s1, zero
> -       add     \__d2, \__s2, zero
> -.endm
> -
> -.macro MOV_5R __d0, __s0, __d1, __s1, __d2, __s2, __d3, __s3, __d4, __s4
> -       add     \__d0, \__s0, zero
> -       add     \__d1, \__s1, zero
> -       add     \__d2, \__s2, zero
> -       add     \__d3, \__s3, zero
> -       add     \__d4, \__s4, zero
> -.endm
> -
> -
>         .section .entry, "ax", %progbits
>         .align 3
>         .globl _start
> @@ -95,192 +80,7 @@ _bss_zero:
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
> @@ -415,13 +215,6 @@ _start_hang:
>         wfi
>         j       _start_hang
>
> -       .section .entry, "ax", %progbits
> -       .align 3
> -       .weak fw_platform_init
> -fw_platform_init:
> -       add     a0, a1, zero
> -       ret
> -
>         /* Map implicit memcpy() added by compiler to sbi_memcpy() */
>         .section .text
>         .align 3
> diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
> index 52ef320..f8cb3d1 100644
> --- a/firmware/fw_dynamic.S
> +++ b/firmware/fw_dynamic.S
> @@ -41,10 +41,8 @@ fw_boot_hart:
>         .align 3
>         .global fw_save_info
>         /*
> -        * We can only use a0, a1, a2, a3, and a4 registers here.
> -        * The a0, a1, and a2 registers will be same as passed by
> -        * previous booting stage.
> -        * Nothing to be returned here.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_save_info:
>         /* Save next arg1 in 'a1' */
> @@ -76,10 +74,8 @@ fw_save_info:
>         .align 3
>         .global fw_next_arg1
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The a0, a1, and a2 registers will be same as passed by
> -        * previous booting stage.
> -        * The next arg1 should be returned in 'a0'.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_next_arg1:
>         lla     a0, _dynamic_next_arg1
> @@ -90,8 +86,8 @@ fw_next_arg1:
>         .align 3
>         .global fw_next_addr
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The next address should be returned in 'a0'.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_next_addr:
>         lla     a0, _dynamic_next_addr
> @@ -102,8 +98,8 @@ fw_next_addr:
>         .align 3
>         .global fw_next_mode
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The next address should be returned in 'a0'
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_next_mode:
>         lla     a0, _dynamic_next_mode
> @@ -114,9 +110,8 @@ fw_next_mode:
>         .align 3
>         .global fw_options
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The 'a4' register will have default options.
> -        * The next address should be returned in 'a0'.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_options:
>         lla     a0, _dynamic_options
> diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
> index ba46697..144cd92 100644
> --- a/firmware/fw_jump.S
> +++ b/firmware/fw_jump.S
> @@ -26,10 +26,8 @@ fw_boot_hart:
>         .align 3
>         .global fw_save_info
>         /*
> -        * We can only use a0, a1, a2, a3, and a4 registers here.
> -        * The a0, a1, and a2 registers will be same as passed by
> -        * previous booting stage.
> -        * Nothing to be returned here.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_save_info:
>         ret
> @@ -38,10 +36,8 @@ fw_save_info:
>         .align 3
>         .global fw_next_arg1
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The a0, a1, and a2 registers will be same as passed by
> -        * previous booting stage.
> -        * The next arg1 should be returned in 'a0'.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_next_arg1:
>  #ifdef FW_JUMP_FDT_ADDR
> @@ -59,8 +55,8 @@ fw_next_arg1:
>         .align 3
>         .global fw_next_addr
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The next address should be returned in 'a0'.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_next_addr:
>  #ifdef FW_JUMP_ADDR
> @@ -79,8 +75,8 @@ fw_next_addr:
>         .align 3
>         .global fw_next_mode
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The next address should be returned in 'a0'
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_next_mode:
>         li      a0, PRV_S
> @@ -90,9 +86,8 @@ fw_next_mode:
>         .align 3
>         .global fw_options
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The 'a4' register will have default options.
> -        * The next address should be returned in 'a0'.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_options:
>         add     a0, zero, zero
> diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S
> index 02fd172..9ea9830 100644
> --- a/firmware/fw_payload.S
> +++ b/firmware/fw_payload.S
> @@ -26,10 +26,8 @@ fw_boot_hart:
>         .align 3
>         .global fw_save_info
>         /*
> -        * We can only use a0, a1, a2, a3, and a4 registers here.
> -        * The a0, a1, and a2 registers will be same as passed by
> -        * previous booting stage.
> -        * Nothing to be returned here.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_save_info:
>         ret
> @@ -38,10 +36,8 @@ fw_save_info:
>         .align 3
>         .global fw_next_arg1
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The a0, a1, and a2 registers will be same as passed by
> -        * previous booting stage.
> -        * The next arg1 should be returned in 'a0'.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_next_arg1:
>  #ifdef FW_PAYLOAD_FDT_ADDR
> @@ -59,8 +55,8 @@ fw_next_arg1:
>         .align 3
>         .global fw_next_addr
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The next address should be returned in 'a0'.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_next_addr:
>         lla     a0, payload_bin
> @@ -70,8 +66,8 @@ fw_next_addr:
>         .align 3
>         .global fw_next_mode
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The next address should be returned in 'a0'.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_next_mode:
>         li      a0, PRV_S
> @@ -81,9 +77,8 @@ fw_next_mode:
>         .align 3
>         .global fw_options
>         /*
> -        * We can only use a0, a1, and a2 registers here.
> -        * The 'a4' register will have default options.
> -        * The next address should be returned in 'a0'.
> +        * This function will be called in a C function, and the implementation
> +        * needs to meet the calling constraints of RISC-V
>          */
>  fw_options:
>         add     a0, zero, zero
> diff --git a/firmware/objects.mk b/firmware/objects.mk
> index e6b364b..b854121 100644
> --- a/firmware/objects.mk
> +++ b/firmware/objects.mk
> @@ -64,3 +64,5 @@ endif
>  ifdef FW_OPTIONS
>  firmware-genflags-y += -DFW_OPTIONS=$(FW_OPTIONS)
>  endif
> +
> +firmware-objs-y += fw.o
> diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
> index def88bb..76f86f4 100644
> --- a/include/sbi/sbi_types.h
> +++ b/include/sbi/sbi_types.h
> @@ -66,6 +66,7 @@ typedef uint64_t              be64_t;
>
>  #define NULL                   ((void *)0)
>
> +#define __weak                 __attribute__((weak))
>  #define __packed               __attribute__((packed))
>  #define __noreturn             __attribute__((noreturn))
>  #define __aligned(x)           __attribute__((aligned(x)))
> --
> 2.43.0
>

