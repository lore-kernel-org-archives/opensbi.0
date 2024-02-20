From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Feb 2024 16:14:49 +0530
Subject: [PATCH v3 4/4] docs: move documentation of system suspend test.
In-Reply-To: <tencent_828AACE84732BAD1216325B61CBD668BC00A@qq.com>
References: <20240208031434.3201705-1-yangcheng.work@foxmail.com> <tencent_828AACE84732BAD1216325B61CBD668BC00A@qq.com>
Message-ID: <CAAhSdy3FcujdQJh9UqB+VvA0DuVEBY0G4A0VhdyTM53OXgbETA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 8, 2024 at 8:50?AM Cheng Yang <yangcheng.work@foxmail.com> wrote:
>
> This patch move documentation of "system-suspend-test" from
> docs/domain_support.md to docs/opensbi_config.md
>
> Signed-off-by: Cheng Yang <yangcheng.work@foxmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  docs/domain_support.md | 4 ----
>  docs/opensbi_config.md | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/docs/domain_support.md b/docs/domain_support.md
> index b285d65..65b6142 100644
> --- a/docs/domain_support.md
> +++ b/docs/domain_support.md
> @@ -126,9 +126,6 @@ The DT properties of a domain configuration DT node are as follows:
>  * **compatible** (Mandatory) - The compatible string of the domain
>    configuration. This DT property should have value *"opensbi,domain,config"*
>
> -* **system-suspend-test** (Optional) - When present, enable a system
> -  suspend test implementation which simply waits five seconds and issues a WFI.
> -
>  ### Domain Memory Region Node
>
>  The domain memory region DT node describes details of a memory region and
> @@ -237,7 +234,6 @@ be done:
>      chosen {
>          opensbi-domains {
>              compatible = "opensbi,domain,config";
> -            system-suspend-test;
>
>              tmem: tmem {
>                  compatible = "opensbi,domain,memregion";
> diff --git a/docs/opensbi_config.md b/docs/opensbi_config.md
> index 0c42443..1b710f1 100644
> --- a/docs/opensbi_config.md
> +++ b/docs/opensbi_config.md
> @@ -23,6 +23,9 @@ The DT properties of a domain configuration DT node are as follows:
>    set of harts is permitted to perform a cold boot. Otherwise, all
>    harts are allowed to cold boot.
>
> +* **system-suspend-test** (Optional) - When present, enable a system
> +  suspend test implementation which simply waits five seconds and issues a WFI.
> +
>  The OpenSBI Configuration Node will be deleted at the end of cold boot
>  (replace the node (subtree) with nop tags).
>
> @@ -33,6 +36,7 @@ The OpenSBI Configuration Node will be deleted at the end of cold boot
>          opensbi-config {
>              compatible = "opensbi,config";
>              cold-boot-harts = <&cpu1 &cpu2 &cpu3 &cpu4>;
> +            system-suspend-test;
>          };
>      };
>
> --
> 2.34.1
>

