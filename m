From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Jul 2021 23:07:01 +0800
Subject: undefined reference to `__dyn_sym_start' since commit
 bf3ef53bb7f5 ("firmware: Enable FW_PIC by default")
In-Reply-To: <056b2e37-0806-216d-18e7-6f7807ad90e9@gmx.de>
References: <056b2e37-0806-216d-18e7-6f7807ad90e9@gmx.de>
Message-ID: <CAEUhbmUeAQ3M5zOeZWn_7G3MXBWT6c_V+sWCUuCPFzQn0ogteg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 3, 2021 at 7:37 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> make \
>          PLATFORM=kendryte/k210 \
>          FW_PAYLOAD=y \
>          FW_PAYLOAD_OFFSET=0x20000 \
>          FW_PAYLOAD_PATH=u-boot-dtb.bin
>
> fails with

I don't see any problem with building it with current opensbi/master.
I am using GCC 10.2.0.

>
> /usr/riscv64-linux-gnu/bin/ld:
> opensbi/build/platform/kendryte/k210/firmware/fw_payload.o:
> in function `.L0 ':
> opensbi/firmware/fw_base.S:77: undefined reference to `__rel_dyn_start'
> /usr/riscv64-linux-gnu/bin/ld: opensbi/firmware/fw_base.S:78:
> undefined reference to `__rel_dyn_end'
> /usr/riscv64-linux-gnu/bin/ld: opensbi/firmware/fw_base.S:89:
> undefined reference to `__dyn_sym_start'
> collect2: error: ld returned 1 exit status
> make: *** [Makefile:351:
> opensbi/build/platform/kendryte/k210/firmware/fw_payload.elf] Error 1
>
> Bisecting point to:
> commit bf3ef53bb7f5 ("firmware: Enable FW_PIC by default")
>
> Please, re-enable building the K210 platform.
>
> Please, provide a continuous integration test to void similar problems
> in future.

This was on my todo list for some time, but did not have time to implement it.

Regards,
Bin

