From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Jan 2025 11:17:04 +0530
Subject: [PATCH 1/1] fdt: fdt_helper: fix typo har't'id
In-Reply-To: <20241230094413.885968-1-ycliang@andestech.com>
References: <20241230094413.885968-1-ycliang@andestech.com>
Message-ID: <CAAhSdy2i=-qibmmcevYVZa053UDs+tW7eMrTEHPqeyhX9=9ZGw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 30, 2024 at 3:14?PM Leo Yu-Chi Liang <ycliang@andestech.com> wrote:
>
> s/hard_id/hartid/
>
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


> ---
>  include/sbi_utils/fdt/fdt_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 7329b84c..6a37d971 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -59,7 +59,7 @@ int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid);
>
>  int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
>
> -int fdt_parse_isa_extensions(const void *fdt, unsigned int hard_id,
> +int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
>                              unsigned long *extensions);
>
>  int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

