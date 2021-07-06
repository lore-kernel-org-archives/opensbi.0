From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jul 2021 11:00:37 +0530
Subject: [PATCH] docs/platform: thead-c9xx: Remove FW_PIC=y
In-Reply-To: <20210703150929.19154-1-bmeng.cn@gmail.com>
References: <20210703150929.19154-1-bmeng.cn@gmail.com>
Message-ID: <CAAhSdy2VCr7E83EWCrivsLqLa4C_YkG4_jp2-fqt26+2+nQW_A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 3, 2021 at 8:39 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> FW_PIC is on by default. Hence no need to explicitly require it.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>
>  docs/platform/thead-c9xx.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/platform/thead-c9xx.md b/docs/platform/thead-c9xx.md
> index 8f1021a..c0daeb7 100644
> --- a/docs/platform/thead-c9xx.md
> +++ b/docs/platform/thead-c9xx.md
> @@ -16,7 +16,7 @@ The *T-HEAD C9xx* does not have any platform-specific compile options
>  because it use generic platform.
>
>  ```
> -CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic FW_PIC=y /usr/bin/make
> +CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic /usr/bin/make
>  ```
>
>  The *T-HEAD C9xx* DTB provided to OpenSBI generic firmwares will usually have
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

