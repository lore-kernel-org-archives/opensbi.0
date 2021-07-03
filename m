From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Sat, 3 Jul 2021 13:31:19 +0200
Subject: undefined reference to `__dyn_sym_start' since commit bf3ef53bb7f5
 ("firmware: Enable FW_PIC by default")
Message-ID: <056b2e37-0806-216d-18e7-6f7807ad90e9@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

make \
         PLATFORM=kendryte/k210 \
         FW_PAYLOAD=y \
         FW_PAYLOAD_OFFSET=0x20000 \
         FW_PAYLOAD_PATH=u-boot-dtb.bin

fails with

/usr/riscv64-linux-gnu/bin/ld:
opensbi/build/platform/kendryte/k210/firmware/fw_payload.o:
in function `.L0 ':
opensbi/firmware/fw_base.S:77: undefined reference to `__rel_dyn_start'
/usr/riscv64-linux-gnu/bin/ld: opensbi/firmware/fw_base.S:78:
undefined reference to `__rel_dyn_end'
/usr/riscv64-linux-gnu/bin/ld: opensbi/firmware/fw_base.S:89:
undefined reference to `__dyn_sym_start'
collect2: error: ld returned 1 exit status
make: *** [Makefile:351:
opensbi/build/platform/kendryte/k210/firmware/fw_payload.elf] Error 1

Bisecting point to:
commit bf3ef53bb7f5 ("firmware: Enable FW_PIC by default")

Please, re-enable building the K210 platform.

Please, provide a continuous integration test to void similar problems
in future.

Best regards

Heinrich

