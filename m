From: Xiang W <wxjstz@126.com>
Date: Fri, 03 Dec 2021 21:08:28 +0800
Subject: [PATCH v4 1/2] Makefile: Fix -msave-restore compile warning
 with CLANG-10 (or lower)
In-Reply-To: <20211203050334.729392-2-anup.patel@wdc.com>
References: <20211203050334.729392-1-anup.patel@wdc.com>
 <20211203050334.729392-2-anup.patel@wdc.com>
Message-ID: <f37a60738d6b0e482d8555c8f65678764cfd0e52.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-12-03???? 10:33 +0530?Anup Patel???
> The riscv target of CLANG-10 (or lower) does not support the
> -m(no-)save-restore option so we get compile warnings. This patch
> fixes compile warning by using -m(no-)save-restore option only
> for GCC.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
> ---
> ?Makefile | 14 ++++++++++----
> ?1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 8623c1c..d89a0c5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -275,8 +275,11 @@ GENFLAGS???+=??????$(platform-genflags-y)
> ?GENFLAGS???????+=??????$(firmware-genflags-y)
> ?
> ?CFLAGS?????????=???????-g -Wall -Werror -ffreestanding -nostdlib -
> fno-stack-protector -fno-strict-aliasing -O2
> -CFLAGS?????????+=??????-fno-omit-frame-pointer -fno-optimize-
> sibling-calls
> -CFLAGS?????????+=??????-mno-save-restore -mstrict-align
> +CFLAGS?????????+=??????-fno-omit-frame-pointer -fno-optimize-
> sibling-calls -mstrict-align
> +# CLANG-10 (or lower) does not support -m(no-)save-restore option
> +ifneq ($(CC_IS_CLANG),y)
> +CFLAGS?????????+=??????-mno-save-restore
> +endif
> ?CFLAGS?????????+=??????-mabi=$(PLATFORM_RISCV_ABI) -
> march=$(PLATFORM_RISCV_ISA)
> ?CFLAGS?????????+=??????-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> ?CFLAGS?????????+=??????$(RELAX_FLAG)
> @@ -290,8 +293,11 @@ CPPFLAGS???+=??????$(platform-cppflags-y)
> ?CPPFLAGS???????+=??????$(firmware-cppflags-y)
> ?
> ?ASFLAGS????????????????=???????-g -Wall -nostdlib
> -ASFLAGS????????????????+=??????-fno-omit-frame-pointer -fno-
> optimize-sibling-calls
> -ASFLAGS????????????????+=??????-mno-save-restore -mstrict-align
> +ASFLAGS????????????????+=??????-fno-omit-frame-pointer -fno-
> optimize-sibling-calls -mstrict-align
> +# CLANG-10 (or lower) does not support -m(no-)save-restore option
> +ifneq ($(CC_IS_CLANG),y)
> +ASFLAGS????????????????+=??????-mno-save-restore
> +endif
> ?ASFLAGS????????????????+=??????-mabi=$(PLATFORM_RISCV_ABI) -
> march=$(PLATFORM_RISCV_ISA)
> ?ASFLAGS????????????????+=??????-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> ?ASFLAGS????????????????+=??????$(RELAX_FLAG)
> -- 
> 2.25.1
> 
> 

Maybe we can dynamically detect whether the toolchain supports
-m(no-)save-restore, just like we did before to detect whether ld
supports PIE

diff --git a/Makefile b/Makefile
index 8623c1c..4b866ac 100644
--- a/Makefile
+++ b/Makefile
@@ -149,7 +149,7 @@ endif
 
 # Check whether the linker supports creating PIEs
 OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG)
$(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null
>/dev/null 2>&1 && echo y || echo n)
-
+CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG)
$(USE_LD_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null
>/dev/null 2>&1 && echo y || echo n)
 # Build Info:
 # OPENSBI_BUILD_TIME_STAMP -- the compilation time stamp
 # OPENSBI_BUILD_COMPILER_VERSION -- the compiler version info
@@ -275,8 +275,10 @@ GENFLAGS   +=      $(platform-genflags-y)
 GENFLAGS       +=      $(firmware-genflags-y)
 
 CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-
stack-protector -fno-strict-aliasing -O2
-CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-
calls
-CFLAGS         +=      -mno-save-restore -mstrict-align
+CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-
calls -mstrict-align
+ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
+CFLAGS         +=      -mno-save-restore
+endif
 CFLAGS         +=      -mabi=$(PLATFORM_RISCV_ABI) -
march=$(PLATFORM_RISCV_ISA)
 CFLAGS         +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
 CFLAGS         +=      $(RELAX_FLAG)
@@ -290,8 +292,10 @@ CPPFLAGS   +=      $(platform-cppflags-y)
 CPPFLAGS       +=      $(firmware-cppflags-y)
 
 ASFLAGS                =       -g -Wall -nostdlib
-ASFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-
sibling-calls
-ASFLAGS                +=      -mno-save-restore -mstrict-align
+ASFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-
sibling-calls -mstrict-align
+ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
+ASFLAGS                +=      -mno-save-restore
+endif
 ASFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -
march=$(PLATFORM_RISCV_ISA)
 ASFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
 ASFLAGS                +=      $(RELAX_FLAG)

Regards,
Xiang W


