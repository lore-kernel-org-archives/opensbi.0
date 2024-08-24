From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Aug 2024 14:12:45 +0530
Subject: [PATCH v2 1/1] lib: utils: fdt_domain: Make opensbi-domain
 optional in CPU specification
In-Reply-To: <20240809034712.24857-2-gregorhaas1997@gmail.com>
References: <20240809034712.24857-1-gregorhaas1997@gmail.com> <20240809034712.24857-2-gregorhaas1997@gmail.com>
Message-ID: <CAAhSdy3gHyYeH=SkZVRtASY407e+WgmqDVmMScXesfmfWsHxTQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 9, 2024 at 9:17?AM Gregor Haas <gregorhaas1997@gmail.com> wrote:
>

s/CPU specification/CPU node/

> The domain_support.md documentation states that "the HART to domain instance
> assignment can be parsed from the device tree using *optional* DT property
> opensbi-domain in each CPU DT node". However, the current implementation does
> not treat this parameter as optional when determining which HARTs to assign to
> a freshly discovered domain from the device tree, causing an effect where every
> HART in the system must be explicitly assigned to a domain only if a domain is
> specified in the device tree. Instead, this patch simply ignores CPUs that do
> not specify a domain, and does not attempt to assign them into the recently
> discovered domain.
>
> Signed-off-by: Gregor Haas <gregorhaas1997@gmail.com>
> ---
>  lib/utils/fdt/fdt_domain.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index fa1c357..c6ee127 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -459,12 +459,12 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
>                 if (!fdt_node_is_enabled(fdt, cpu_offset))
>                         continue;
>
> +               /* This is an optional property */
>                 val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
> -               if (!val || len < 4) {
> -                       err = SBI_EINVAL;
> -                       goto fail_free_all;
> -               }
> +               if (!val || len < 4)
> +                       continue;
>
> +               /* However, it should be valid if specified */
>                 doffset = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
>                 if (doffset < 0) {
>                         err = doffset;
> --
> 2.45.2
>

Otherwise, this looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

I have taken care of the above comment at the time of merging this patch.
Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

