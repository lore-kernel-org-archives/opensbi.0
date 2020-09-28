From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Mon, 28 Sep 2020 12:17:36 +0200
Subject: OpenSBI: Boot HART ISA display
Message-ID: <3e977253-0836-e76f-964b-49b7f2541fde@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Atish,

on the Kendryte 210 MaixDuino the OpenSBI output line

Boot HART ISA       : rv64cicacsidcacsi

looks a bit strange to me (see full output at the end of the mail).
Assuming that the characters after rv64 are related to extensions I
would expect every letter appearing only once.

I tried to add sbi_printf() statements to lib/sbi/riscv_asm.c but they
do not print out correctly.

After the following change:

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 8c54c11..a0c95a2 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -81,7 +81,7 @@ void misa_string(int xlen, char *out, unsigned int out_sz)

        for (i = 0; i < array_size(valid_isa_order) && (pos < out_sz);
i++) {
                if (misa_extension_imp(valid_isa_order[i]))
-                       out[pos++] = valid_isa_order[i];
+                       out[pos++] = '0' + i;
        }

        if (pos < out_sz)

the output becomes

Boot HART ISA       : rv6403567;<@BCDHI

I am clueless why valid_isa_order[i] is not evaluated correctly.

When my changes are:

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 8c54c11..b1bbfc4 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -12,6 +12,8 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_platform.h>

+static const char valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg";
+
 /* determine CPU extension, return non-zero support */
 int misa_extension_imp(char ext)
 {
@@ -52,7 +54,6 @@ int misa_xlen(void)
 void misa_string(int xlen, char *out, unsigned int out_sz)
 {
        unsigned int i, pos = 0;
-       const char valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg";

        if (!out)
                return;

the output is:

Boot HART ISA       : rv64imafdcsu

I disassembled build/lib/sbi/riscv_asm.o but could not find a problem.

Do you have a suggestion how to analyze this further?

Best regards

Heinrich



OpenSBI v0.8-29-g7701ea1
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name       : Kendryte K210
Platform Features   : timer
Platform HART Count : 2
Boot HART ID        : 0
Boot HART ISA       : rv64cicacsidcacsi
BOOT HART Features  : none
BOOT HART PMP Count : 0
BOOT HART MHPM Count: 0
Firmware Base       : 0x80000000
Firmware Size       : 100 KB
Runtime SBI Version : 0.2

MIDELEG : 0x0000000000000222
MEDELEG : 0x0000000000000109


