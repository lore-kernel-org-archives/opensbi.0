From: Anup Patel <anup@brainfault.org>
Date: Tue, 11 Feb 2025 17:11:04 +0530
Subject: [PATCH] lib: utils/fdt: update fdt_parse_aplic_node()
In-Reply-To: <20250103023828.26925-1-huangborong@bosc.ac.cn>
References: <20250103023828.26925-1-huangborong@bosc.ac.cn>
Message-ID: <CAAhSdy0RmtpPW2w-wKTub-ws9jdU1V96UuyrxkzceO_yVcu3Gg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 3, 2025 at 8:09?AM Huang Borong <huangborong@bosc.ac.cn> wrote:
>
> 1. Initialize struct imsic_data imsic to 0 at definition to prevent the
>    use of uninitialized memory, ensuring the variable starts with known
>    values.
>
> 2. Remove the redundant memset call on the "aplic" parameter since the
>    memory for aplic is allocated using sbi_zalloc() by the caller
>    irqchip_aplic_cold_init(), which guarantees it is already set to 0.
>
> Signed-off-by: Huang Borong <huangborong@bosc.ac.cn>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/fdt/fdt_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index cb350e5..e92484c 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -630,14 +630,13 @@ int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
>         bool child_found;
>         const fdt32_t *val;
>         const fdt32_t *del;
> -       struct imsic_data imsic;
> +       struct imsic_data imsic = { 0 };
>         int i, j, d, dcnt, len, noff, rc;
>         uint64_t reg_addr, reg_size;
>         struct aplic_delegate_data *deleg;
>
>         if (nodeoff < 0 || !aplic || !fdt)
>                 return SBI_ENODEV;
> -       memset(aplic, 0, sizeof(*aplic));
>
>         rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, &reg_size);
>         if (rc < 0 || !reg_addr || !reg_size)
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

