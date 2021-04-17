From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sat, 17 Apr 2021 12:41:10 +0100
Subject: [PATCH 1/2] lib: utils: Implement "64bit-mmio" property parsing
In-Reply-To: <1618285442-84580-1-git-send-email-guoren@kernel.org>
References: <1618285442-84580-1-git-send-email-guoren@kernel.org>
Message-ID: <B636699C-B856-43E6-9FEC-44A62284E0B6@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 13 Apr 2021, at 04:44, guoren at kernel.org wrote:
> 
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Figure out CLINT has_64bit_mmio from DT node and using antonym for
> compatibility.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Xiang W <wxjstz@126.com>
> ---
> lib/utils/fdt/fdt_helper.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index bf19ff9..909de01 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -442,8 +442,9 @@ int fdt_parse_clint_node(void *fdt, int nodeoffset, bool for_timer,
> 	if (clint->hart_count < count)
> 		clint->hart_count = count;
> 
> -	/* TODO: We should figure-out CLINT has_64bit_mmio from DT node */
> 	clint->has_64bit_mmio = TRUE;
> +	if (fdt_getprop(fdt, nodeoffset, "clint,has-no-64bit-mmio", &count))

I do not see this specified in clint.yaml.

Jess


