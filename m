From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 May 2022 09:46:16 +0530
Subject: [PATCH v3 3/3] platform: generic: check if CPU node is enabled
In-Reply-To: <20220512175539.83942-4-jan.remes@codasip.com>
References: <20220512175539.83942-1-jan.remes@codasip.com>
 <20220512175539.83942-4-jan.remes@codasip.com>
Message-ID: <CAAhSdy3NPbQ=Qj=aqC-HP+0wt+V_CObuFa9OS9YrzJdZJSLunQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 12, 2022 at 11:26 PM Jan Remes <jan.remes@codasip.com> wrote:
>
> Ignore CPU nodes in FDT which are not enabled.
>
> Signed-off-by: Jan Remes <jan.remes@codasip.com>

This was already reviewed in your v2 series.

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
> @@ -107,6 +107,9 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
>                 if (SBI_HARTMASK_MAX_BITS <= hartid)
>                         continue;
>
> +               if (!fdt_node_is_enabled(fdt, cpu_offset))
> +                       continue;
> +
>                 generic_hart_index2id[hart_count++] = hartid;
>         }
>
> --
> 2.36.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

