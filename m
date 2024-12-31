From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Tue, 31 Dec 2024 11:01:20 +0000
Subject: [PATCH] lib: utils/irqchip: Optimize `fdt_parse_aplic_node`
 function
In-Reply-To: <20241231081223.111470-1-huangborong@bosc.ac.cn>
References: <20241231081223.111470-1-huangborong@bosc.ac.cn>
Message-ID: <F7E10112-FD6D-44F8-92D1-32EBAB97286B@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 31 Dec 2024, at 08:12, Huang Borong <huangborong@bosc.ac.cn> wrote:
> 
> - Remove redundant memset for the "aplic" parameter
> - Initialize "imsic" with zero

This is the ?what? but not the ?why?.

Jess

> Signed-off-by: Huang Borong <huangborong@bosc.ac.cn>
> ---
> lib/utils/fdt/fdt_helper.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index cb350e5..e92484c 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -630,14 +630,13 @@ int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
> bool child_found;
> const fdt32_t *val;
> const fdt32_t *del;
> - struct imsic_data imsic;
> + struct imsic_data imsic = { 0 };
> int i, j, d, dcnt, len, noff, rc;
> uint64_t reg_addr, reg_size;
> struct aplic_delegate_data *deleg;
> 
> if (nodeoff < 0 || !aplic || !fdt)
> return SBI_ENODEV;
> - memset(aplic, 0, sizeof(*aplic));
> 
> rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, &reg_size);
> if (rc < 0 || !reg_addr || !reg_size)
> -- 
> 2.34.1
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


