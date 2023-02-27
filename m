From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 19:25:15 +0530
Subject: [PATCH 3/3] docs: domain_support: Update the DT example
In-Reply-To: <20230224042827.1768931-3-bmeng@tinylab.org>
References: <20230224042827.1768931-1-bmeng@tinylab.org> <20230224042827.1768931-3-bmeng@tinylab.org>
Message-ID: <CAAhSdy3uT1aEak8VA32H_Skm8BGnqXmNcfz2N2HyDJ9vSSWKBw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 10:02 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> commit 3e2f573e707e ("lib: utils: Disallow non-root domains from adding M-mode regions")
> added access permission check in __fdt_parse_region(). With the
> existing DT example in the doc OpenSBI won't boot anymore.
>
> Let's update the DT example so that it can work out of the box.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  docs/domain_support.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/domain_support.md b/docs/domain_support.md
> index 4ccbcff..2a9ca3d 100644
> --- a/docs/domain_support.md
> +++ b/docs/domain_support.md
> @@ -254,7 +254,7 @@ be done:
>              tdomain: trusted-domain {
>                  compatible = "opensbi,domain,instance";
>                  possible-harts = <&cpu0>;
> -                regions = <&tmem 0x7>, <&tuart 0x7>;
> +                regions = <&tmem 0x3f>, <&tuart 0x3f>;
>                  boot-hart = <&cpu0>;
>                  next-arg1 = <0x0 0x0>;
>                  next-addr = <0x0 0x80100000>;
> @@ -265,7 +265,7 @@ be done:
>              udomain: untrusted-domain {
>                  compatible = "opensbi,domain,instance";
>                  possible-harts = <&cpu1 &cpu2 &cpu3 &cpu4>;
> -                regions = <&tmem 0x0>, <&tuart 0x0>, <&allmem 0x7>;
> +                regions = <&tmem 0x0>, <&tuart 0x0>, <&allmem 0x3f>;
>              };
>          };
>      };
> --
> 2.25.1
>

