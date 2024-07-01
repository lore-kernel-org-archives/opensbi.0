From: zhangdongdong@eswincomputing.com <zhangdongdong@eswincomputing.com>
Date: Mon,  1 Jul 2024 10:30:05 +0800
Subject: [PATCH 0/1] lib:tests: add math test suite
Message-ID: <20240701023006.16977-1-zhangdongdong@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dongdong Zhang <zhangdongdong@eswincomputing.com>

This patch introduces a new math test suite to the SBI unit
tests.

Test report on QEMU virt machine:

OpenSBI v1.4-130-ge23526c
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name             : riscv-virtio,qemu
Platform Features         : medeleg
Platform HART Count       : 1
Platform IPI Device       : aclint-mswi
Platform Timer Device     : aclint-mtimer @ 10000000Hz
Platform Console Device   : uart8250
Platform HSM Device       : ---
Platform PMU Device       : ---
Platform Reboot Device    : syscon-reboot
Platform Shutdown Device  : syscon-poweroff
Platform Suspend Device   : ---
Platform CPPC Device      : ---
Firmware Base             : 0x80000000
Firmware Size             : 327 KB
Firmware RW Offset        : 0x40000
Firmware RW Size          : 71 KB
Firmware Heap Offset      : 0x49000
Firmware Heap Size        : 35 KB (total), 2 KB (reserved), 11 KB (used), 21 KB (free)
Firmware Scratch Size     : 4096 B (total), 416 B (used), 3680 B (free)
Runtime SBI Version       : 2.0

Domain0 Name              : root
Domain0 Boot HART         : 0
Domain0 HARTs             : 0*
Domain0 Region00          : 0x0000000000100000-0x0000000000100fff M: (I,R,W) S/U: (R,W)
Domain0 Region01          : 0x0000000010000000-0x0000000010000fff M: (I,R,W) S/U: (R,W)
Domain0 Region02          : 0x0000000002000000-0x000000000200ffff M: (I,R,W) S/U: ()
Domain0 Region03          : 0x0000000080040000-0x000000008005ffff M: (R,W) S/U: ()
Domain0 Region04          : 0x0000000080000000-0x000000008003ffff M: (R,X) S/U: ()
Domain0 Region05          : 0x000000000c400000-0x000000000c5fffff M: (I,R,W) S/U: (R,W)
Domain0 Region06          : 0x000000000c000000-0x000000000c3fffff M: (I,R,W) S/U: (R,W)
Domain0 Region07          : 0x0000000000000000-0xffffffffffffffff M: () S/U: (R,W,X)
Domain0 Next Address      : 0x0000000080200000
Domain0 Next Arg1         : 0x0000000082200000
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes
Domain0 SysSuspend        : yes

Boot HART ID              : 0
Boot HART Domain          : root
Boot HART Priv Version    : v1.12
Boot HART Base ISA        : rv64imafdch
Boot HART ISA Extensions  : sstc,zicntr,zihpm,zicboz,zicbom,sdtrig,svadu
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 2 bits
Boot HART PMP Address Bits: 54
Boot HART MHPM Info       : 16 (0x0007fff8)
Boot HART Debug Triggers  : 2 triggers
Boot HART MIDELEG         : 0x0000000000001666
Boot HART MEDELEG         : 0x0000000000f0b509

# Running SBIUNIT tests #
## Running test suite: bitmap_test_suite
[PASSED] bitmap_and_test
[PASSED] bitmap_or_test
[PASSED] bitmap_xor_test
3 PASSED / 0 FAILED / 3 TOTAL
## Running test suite: console_test_suite
[PASSED] putc_test
[PASSED] puts_test
[PASSED] printf_test
3 PASSED / 0 FAILED / 3 TOTAL
## Running test suite: atomic_test_suite
[PASSED] atomic_rw_test
[PASSED] add_return_test
[PASSED] sub_return_test
[PASSED] cmpxchg_test
[PASSED] atomic_xchg_test
[PASSED] atomic_raw_set_bit_test
[PASSED] atomic_raw_clear_bit_test
[PASSED] atomic_set_bit_test
[PASSED] atomic_clear_bit_test
9 PASSED / 0 FAILED / 9 TOTAL
## Running test suite: locks_test_suite
[PASSED] spin_lock_test
[PASSED] spin_trylock_fail
[PASSED] spin_trylock_success
3 PASSED / 0 FAILED / 3 TOTAL
## Running test suite: math_test_suite
[PASSED] log2roundup_test
1 PASSED / 0 FAILED / 1 TOTAL
## Running test suite: bitops_test_suite
[PASSED] find_first_bit_test
[PASSED] find_first_zero_bit_test
[PASSED] find_last_bit_test
[PASSED] find_next_bit_test
[PASSED] find_next_zero_bit_test
5 PASSED / 0 FAILED / 5 TOTAL

Test payload running
QEMU: Terminated

*************************************************************

Dongdong Zhang (1):
  lib:tests: add math test suite

 lib/sbi/tests/objects.mk      |  3 +++
 lib/sbi/tests/sbi_math_test.c | 46 +++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 lib/sbi/tests/sbi_math_test.c

-- 
2.17.1


