From: Anup Patel <anup@brainfault.org>
Date: Wed, 11 May 2022 09:05:18 +0530
Subject: [PATCH v2 3/3] platform: generic: check if CPU node is enabled
In-Reply-To: <CALXH3=JWGjyi9YqviXdS473cb8NCab-FLx2D=erQJcJkQ88BhQ@mail.gmail.com>
References: <CALXH3=JWGjyi9YqviXdS473cb8NCab-FLx2D=erQJcJkQ88BhQ@mail.gmail.com>
Message-ID: <CAAhSdy17xR=o-Js_jEbb=6yVRTU+k9wSvpO0Fbc19jOKq4w0_w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 9, 2022 at 7:27 PM Jan Reme? <jan.remes@codasip.com> wrote:
>
> Ignore CPU nodes in FDT which are not enabled.
>
> Signed-off-by: Jan Remes <jan.remes@codasip.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  platform/generic/platform.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 8a4fb70..86db960 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -107,6 +107,9 @@ unsigned long fw_platform_init(unsigned long arg0,
> unsigned long arg1,
>          if (SBI_HARTMASK_MAX_BITS <= hartid)
>              continue;
>
> +        if (!fdt_node_is_enabled(fdt, cpu_offset))
> +            continue;
> +
>          generic_hart_index2id[hart_count++] = hartid;
>      }
>
> --
> 2.35.1
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

