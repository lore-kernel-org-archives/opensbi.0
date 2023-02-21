From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 21 Feb 2023 13:44:19 +0800
Subject: [PATCH v4] lib: utils: fdt_fixup: Fix compile error
In-Reply-To: <20230221050707.825994-1-wxjstz@126.com>
References: <20230221050707.825994-1-wxjstz@126.com>
Message-ID: <CAEUhbmWK0-4bDcwRnmjbweUWkAGeXrNNqBTK67ZJeP7k27wmag@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 21, 2023 at 1:08 PM Xiang W <wxjstz@126.com> wrote:
>
> When building with GCC-10 or older versions, it throws the following
> error:
>
>  CC-DEP    platform/generic/lib/utils/fdt/fdt_fixup.dep
>  CC        platform/generic/lib/utils/fdt/fdt_fixup.o
> lib/utils/fdt/fdt_fixup.c: In function 'fdt_reserved_memory_fixup':
> lib/utils/fdt/fdt_fixup.c:376:2: error: label at end of compound statement
>   376 |  next_entry:
>       |  ^~~~~~~~~~
>
> Remove the goto statement.
>
> Resolves: https://github.com/riscv-software-src/opensbi/issues/288
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Signed-off-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
> Changes in v4:
>  - Continue to fix the comment in Changes v3
>
> Changes in v3:
> - Fix a comment issue raised by Bin Meng
> - Changed the type of "overlap" from int to bool as suggested by Bin Meng
>
> Changes in v2:
> - Fix a comment issue raised by Andreas Schwab
>  lib/utils/fdt/fdt_fixup.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
>  lib/utils/fdt/fdt_fixup.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

