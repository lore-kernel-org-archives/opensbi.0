From: Tsukasa OI <research_trasio@irq.a4lg.com>
Date: Sat, 26 Nov 2022 08:52:19 +0000
Subject: [PATCH 0/3] Query Compiler Features for Better Disassembling
Message-ID: <cover.1669452733.git.research_trasio@irq.a4lg.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

This patchset makes the resulting ELF files (e.g. fw_dynamic.elf)
disassembled correctly (as possible) on the latest toolchain, when compiled
and assembled with the latest GNU toolchain (especially on Binutils master
[going to be 2.40?] but some changes are also effective on 2.39).

In this letter, I will call master commit of GNU Binutils as 2.40.



[BEFORE THE PATCHSET: GNU Binutils 2.39 and 2.40]

Note that some annotations are added.

000000008000a0d0 <__sbi_hfence_gvma_gpa>:
    8000a0d0:   62050073            .word   0x62050073
                                    ^^^^^^^^^^^^^^^^^^
                                    Printed as data
    8000a0d4:   8082                ret
    8000a0d6:   0001                nop

# (quote from csr_read_num)
    800047b6:   3c002573            csrr    a0,0x3c0
                                               ^^^^^
                                               Raw CSR number (pmpaddr16)
    800047ba:   8082                ret



[PATCH 1/3]
** partially effective on GNU Binutils 2.39 and 2.40 **

It optionally replaces ".word" (which emits a 32-bit "data" word) in
lib/sbi/sbi_hfence.S with ".insn" with raw value (which emits an
"instruction" word) when supported by the assembler.

Before this commit and on GNU Binutils, an ELF mapping symbol "$d" (from
here, data follows) is inserted before ".word".  Even if the hfence.*
instruction itself is recognized, ".word"s are recognized as data, not
instructions (due to the existence of mapping symbol).
e
Instead, ".insn" emits (possibly variable length) instruction word and
inserts "$x" (from here, instruction follows) mapping symbol where
necessary.  Note that, not all assemblers support ".insn" with raw
instruction value.  This commit checks ".insn" with raw value support.

After that, objdump of __sbi_hfence_gvma_gpa will look like this
(for PATCH 2-3/3, GNU Binutils 2.39 output will be the same):

000000008000a0d0 <__sbi_hfence_gvma_gpa>:
    8000a0d0:   62050073            .4byte  0x62050073
                                    ^^^^^^^^^^^^^^^^^^
                                    Printed as an instruction
                                    (but not recognized as hfence.gvma yet)
    8000a0d4:   8082                ret
    8000a0d6:   0001                nop



[PATCH 2/3]
** effective on GNU Binutils 2.40 **

".option arch,+h" assembler directive enables 'H' extension support in the
section (may be the file scope depending on the Binutils version).

It will be reflected to the ELF mapping symbols "$x[arch]" (where [arch]
is an ISA string) on GNU Binutils 2.40 and 'H' extension can be partially
enabled (only on lib/sbi/sbi_hfence.o).

At first, I intended this to be fully effective on GNU Binutils 2.39 (where
section-level architecture change will be reflected to file scope and 'H'
extension dependency is merged into final ELF files).
However, due to a bug in the linker (to be specific, riscv_merge_std_ext
function in BFD), it did not happen on 2.39.

After that, objdump of __sbi_hfence_gvma_gpa in GNU Binutils 2.40 will be:

000000008000a0d0 <__sbi_hfence_gvma_gpa>:
    8000a0d0:   62050073            hfence.gvma     a0
                                    ^^^^^^^^^^^^^^^^^^
                                    Printed as a hfence.gvma instruction
    8000a0d4:   8082                ret
    8000a0d6:   0001                nop



[PATCH 3/3]
** effective on GNU Binutils 2.39 or later **

OpenSBI uses some privileged architecture version 1.12 CSRs and this commit
reflects this version to the final ELF file.  As a result, 1.12 CSRs are
correctly named (instead of raw numbers).

After that, objdump of csr_read_num will look like this
(both on GNU Binutils 2.39 and 2.40):

# (quote from csr_read_num)
    800047b6:   3c002573            csrr    a0,pmpaddr16
                                               ^^^^^^^^^
                                               CSR name new in v1.12
    800047ba:   8082                ret



Thanks,
Tsukasa




Tsukasa OI (3):
  lib: sbi: Optionally use ".insn" instead of ".word"
  lib: sbi: Optionally use ".option arch,+h"
  Makefile: Optionally specify latest privileged specification

 Makefile             | 26 ++++++++++++++++++++++++++
 lib/sbi/sbi_hfence.S | 20 ++++++++++++--------
 2 files changed, 38 insertions(+), 8 deletions(-)


base-commit: 1b0d71bb9ff9180c4ae0026de5f4a92a88f1884e
-- 
2.38.1


