From: Xiang W <wxjstz@126.com>
Date: Mon, 22 Nov 2021 09:45:03 +0800
Subject: [PATCH] reproducible builds: strip embedded file paths
In-Reply-To: <875ysl2u59.fsf@ponder>
References: <874k89kl8o.fsf@ponder>
 <8607f8cc66989b754056f4396c16178bdc23c48a.camel@126.com>
 <875ysl2u59.fsf@ponder>
Message-ID: <be5f7d5821b498554ce426153b98e7077881a5ec.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-11-21???? 11:20 -0800?Vagrant Cascadian???
> of the directories below, I built using the same toolchain from
> the same git commit...
> 
> $ cd /home/vagrant/src/opensbi/opensbi1
> $ CROSS_COMPILE=riscv64-linux-gnu- make V=1 FW_PAYLOAD=n
> PLATFORM=generic
> ...
> $ strings build/platform/generic/firmware/fw_dynamic.bin | grep
> /home/vagrant
> /home/vagrant/src/opensbi/opensbi1/lib/sbi/riscv_asm.c
> 
> $ cd /home/vagrant/src/opensbi/opensbi2
> $ CROSS_COMPILE=riscv64-linux-gnu- make V=1 FW_PAYLOAD=n
> PLATFORM=generic
> ...
> $ strings build/platform/generic/firmware/fw_dynamic.bin | grep
> /home/vagrant
> /home/vagrant/src/opensbi/opensbi2/lib/sbi/riscv_asm.c
> 
> 
> With the patch applied:
> 
> $ cd /home/vagrant/src/opensbi/opensbi3
This is because the source file uses the absolute path when compiling,
you can use the relative path by modifying the Makefile

diff --git a/Makefile b/Makefile
index 8623c1c..d017534 100644
--- a/Makefile
+++ b/Makefile
@@ -361,7 +361,7 @@ compile_cc_dep = $(CMD_PREFIX)mkdir -p `dirname
$(1)`; \
 	       -MM $(2) >> $(1) || rm -f $(1)
 compile_cc = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " CC        $(subst $(build_dir)/,,$(1))"; \
-	     $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2)) -c $(2) -
o $(1)
+	     $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2)) -c
$(subst $(src_dir)/,,$(2)) -o $(1)
 compile_as_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
 	     echo " AS-DEP    $(subst $(build_dir)/,,$(1))"; \
 	     printf %s `dirname $(1)`/ > $(1) && \

Regards,
Xiang W


