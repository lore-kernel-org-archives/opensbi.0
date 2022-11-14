From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Nov 2022 00:06:14 +0800
Subject: [PATCH] firmware: payloads: Remove duplicate "ALIGN"
In-Reply-To: <tencent_A5A2CFBAF1C09F3968C9EB028F1242CCD60A@qq.com>
References: <tencent_A5A2CFBAF1C09F3968C9EB028F1242CCD60A@qq.com>
Message-ID: <CAEUhbmX3fnzc5WL=Z+M4oYvGVCgYPxSOogMyKQU2Msn4sE9_4A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 8, 2022 at 6:12 PM <1220749046@qq.com> wrote:
>
> From: zhangleizheng <zhangleizheng@eswincomputing.com>

nits: please use <First Name> <Last Name> format as the git user.name

>
> ". = ALIGN(0x1000)" is used redundantly in firmware/fw_base.ldS
> and fw_base.ldS files.

and firmware/payloads/test.elf.ldS files

>
> Signed-off-by: zhangleizheng <zhangleizheng@eswincomputing.com>
> ---
>  firmware/fw_base.ldS           | 2 --
>  firmware/payloads/test.elf.ldS | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> index 220c043..382da25 100644
> --- a/firmware/fw_base.ldS
> +++ b/firmware/fw_base.ldS
> @@ -24,8 +24,6 @@
>                 PROVIDE(_text_end = .);
>         }
>
> -       . = ALIGN(0x1000); /* Ensure next section is page aligned */
> -
>         /* End of the code sections */

nits: I would put ". = ALIGN(0x1000)" here in between the comments

and fix other ". = ALIGN(0x1000)" locations in this file too.

>
>         /* Beginning of the read-only data sections */
> diff --git a/firmware/payloads/test.elf.ldS b/firmware/payloads/test.elf.ldS
> index f3f3242..763103c 100644
> --- a/firmware/payloads/test.elf.ldS
> +++ b/firmware/payloads/test.elf.ldS
> @@ -33,8 +33,6 @@ SECTIONS
>                 PROVIDE(_text_end = .);
>         }
>
> -       . = ALIGN(0x1000); /* Ensure next section is page aligned */
> -
>         /* End of the code sections */
>
>         /* Beginning of the read-only data sections */
> --

Regards,
Bin

