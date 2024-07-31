From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 Jul 2024 09:59:41 +0200
Subject: [PATCH 16/16] lib: utils/fdt: Add fdt_get_address_rw() helper
In-Reply-To: <20240731045931.2446799-17-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
 <20240731045931.2446799-17-samuel.holland@sifive.com>
Message-ID: <20240731-3c3a4395535adf1a7bc922e2@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 30, 2024 at 09:58:57PM GMT, Samuel Holland wrote:
> Help tracking the lifecycle of the FDT blob by indicating which parts of
> the firmware modify it, and thus invalidate any previously-obtained
> offsets or pointers to data inside the blob.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  include/sbi_utils/fdt/fdt_helper.h | 7 ++++++-
>  platform/fpga/ariane/platform.c    | 2 +-
>  platform/fpga/openpiton/platform.c | 4 ++--
>  platform/generic/platform.c        | 4 ++--
>  platform/kendryte/k210/platform.c  | 2 +-
>  platform/nuclei/ux600/platform.c   | 2 +-
>  6 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 28ae7677..7329b84c 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -114,7 +114,12 @@ int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw
>  int fdt_parse_compat_addr(const void *fdt, uint64_t *addr,
>  			  const char *compatible);
>  
> -static inline void *fdt_get_address(void)
> +static inline const void *fdt_get_address(void)
> +{
> +	return (const void *)root.next_arg1;
> +}
> +
> +static inline void *fdt_get_address_rw(void)

I'm not sure this _rw variant is necessary. The addition of the 'const'
to each local pointer which doesn't intend to be used to write is probably
annotation enough, but either way.

Thanks,
drew

