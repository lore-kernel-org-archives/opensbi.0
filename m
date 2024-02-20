From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Feb 2024 16:13:52 +0530
Subject: [PATCH v3 3/4] platform: generic: Parse system suspend test from
 config node.
In-Reply-To: <tencent_BAE2CFD156362A6CF8CA52A4825B12727E06@qq.com>
References: <20240208031434.3201705-1-yangcheng.work@foxmail.com> <tencent_BAE2CFD156362A6CF8CA52A4825B12727E06@qq.com>
Message-ID: <CAAhSdy2xmb50fUU8UL4-nuuzUCWgaeYi4U0_Eu+Hrv2yD_wykw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 8, 2024 at 8:50?AM Cheng Yang <yangcheng.work@foxmail.com> wrote:
>
> This patch update generic_domains_init() so that "system-suspend-test"
> is parsed from "/chosen/opensbi-config" DT node.
>
> Signed-off-by: Cheng Yang <yangcheng.work@foxmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 5f76193..407d5b1 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -316,7 +316,7 @@ static int generic_domains_init(void)
>
>         if (offset >= 0) {
>                 offset = fdt_node_offset_by_compatible(fdt, offset,
> -                                                      "opensbi,domain,config");
> +                                                      "opensbi,config");
>                 if (offset >= 0 &&
>                     fdt_get_property(fdt, offset, "system-suspend-test", NULL))
>                         sbi_system_suspend_test_enable();
> --
> 2.34.1
>

