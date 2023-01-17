From: Anup Patel <anup@brainfault.org>
Date: Tue, 17 Jan 2023 09:21:31 +0530
Subject: [RFC PATCH 10/11] docs: Correct opensbi-domain property name
In-Reply-To: <20230106112209.441825-11-ajones@ventanamicro.com>
References: <20230106112209.441825-1-ajones@ventanamicro.com> <20230106112209.441825-11-ajones@ventanamicro.com>
Message-ID: <CAAhSdy2=Okc6w0mnv+xYGMKeEucWymrgm1jdyvWWSf7WX6r5Sg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 6, 2023 at 4:52 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Replace the commas with dashes to correct the name.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  docs/domain_support.md | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/domain_support.md b/docs/domain_support.md
> index ac8c73d40b3e..b2c1023008cc 100644
> --- a/docs/domain_support.md
> +++ b/docs/domain_support.md
> @@ -199,9 +199,9 @@ platform support can provide the HART to domain instance assignment using
>  platform specific callback.
>
>  The HART to domain instance assignment can be parsed from the device tree
> -using optional DT property **opensbi,domain** in each CPU DT node. The
> -value of DT property **opensbi,domain** is the DT phandle of the domain
> -instance DT node. If **opensbi,domain** DT property is not specified then
> +using optional DT property **opensbi-domain** in each CPU DT node. The
> +value of DT property **opensbi-domain** is the DT phandle of the domain
> +instance DT node. If **opensbi-domain** DT property is not specified then
>  corresponding HART is assigned to **the ROOT domain**.
>
>  ### Domain Configuration Only Accessible to OpenSBI
> --
> 2.39.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

