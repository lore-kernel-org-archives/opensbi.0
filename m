From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 11 Sep 2024 18:03:40 +0100
Subject: [PATCH v3 1/1] Makefile: enable --gc-sections
In-Reply-To: <272cb6e3f54b13f6a21319a9c1f0a1d7c5dd83fa.1725521174.git.zhangcola2003@gmail.com>
References: <cover.1725521174.git.zhangcola2003@gmail.com>
 <272cb6e3f54b13f6a21319a9c1f0a1d7c5dd83fa.1725521174.git.zhangcola2003@gmail.com>
Message-ID: <D4487B09-BBFF-4B51-B3C0-CD161A590836@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5 Sep 2024, at 10:31, Kele Zhang <zhangcola2003@gmail.com> wrote:
> 
> The --gc-sections option enables the linker to perform garbage
> collection of unreferenced code and data, thereby reducing the binary
> size.
> 
> The -ffunction-sections option will place each function into a separate
> section, so it is necessary to add .text.* to the linker script.
> 
> Signed-off-by: Kele Zhang <zhangcola2003@gmail.com>
> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ?
> ...
> @@ -424,6 +420,13 @@ MERGEFLAGS += -m elf$(PLATFORM_RISCV_XLEN)lriscv
> 
> DTSCPPFLAGS = $(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
> 
> +ifneq ($(DEBUG),)
> +CFLAGS += -O0
> +ELFFLAGS +=  -Wl,--print-gc-sections

This line is using spaces not tabs.

Jess


