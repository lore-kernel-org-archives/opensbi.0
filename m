From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 4 Sep 2021 21:56:48 +0800
Subject: [RFC 1/1] platform/kendryte: disable FW_PIC
In-Reply-To: <20210904094814.157823-1-xypron.glpk@gmx.de>
References: <20210904094814.157823-1-xypron.glpk@gmx.de>
Message-ID: <CAEUhbmWCFfPXTzOAenONkq3kUkuNuS4ctTPTPPvYDNrPsUK0Kw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 4, 2021 at 5:49 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> Since commit bf3ef53bb7f5 ("firmware: Enable FW_PIC by default")
> building with
>
> make \
> PLATFORM=kendryte/k210 \
> FW_PAYLOAD=y \
> FW_PAYLOAD_OFFSET=0x40000 \
> FW_PAYLOAD_PATH=u-boot-dtb.bin
>
> fails:
>
> riscv64-linux-gnu/bin/ld:
> opensbi/build/platform/kendryte/k210/firmware/fw_payload.o:
> in function `.L0 ':
> opensbi/firmware/fw_base.S:77:
> undefined reference to `__rel_dyn_start'
> riscv64-linux-gnu/bin/ld:
> opensbi/firmware/fw_base.S:78:
> undefined reference to `__rel_dyn_end'
> riscv64-linux-gnu/bin/ld:
> opensbi/firmware/fw_base.S:89:
> undefined reference to `__dyn_sym_start'
> collect2: error: ld returned 1 exit status
>

It looks like your toolchain is broken. I can build with your command
without any error. I am using buildroot 2020.08-1 toolchain.

> With FW_PIC=n building becomes possible.
>
> Fixes: bf3ef53bb7f5 ("firmware: Enable FW_PIC by default")
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> We need a description of what FW_PIC does in and
> a description of how to build for the K210 platform.
> in doc/.
> ---
>  platform/kendryte/k210/config.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/platform/kendryte/k210/config.mk b/platform/kendryte/k210/config.mk
> index 8a9b814..c664ba1 100644
> --- a/platform/kendryte/k210/config.mk
> +++ b/platform/kendryte/k210/config.mk
> @@ -17,3 +17,6 @@ platform-ldflags-y =
>  FW_TEXT_START=0x80000000
>  FW_PAYLOAD=y
>  FW_PAYLOAD_ALIGN=0x1000
> +
> +# Others
> +FW_PIC=n
>

Regards,
Bin

