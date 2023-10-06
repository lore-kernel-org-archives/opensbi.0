From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Oct 2023 10:08:53 +0530
Subject: [PATCH] doc: Fix fw_payload.md
In-Reply-To: <20230924214823.2789366-1-hn@hnpl.org>
References: <20230924214823.2789366-1-hn@hnpl.org>
Message-ID: <CAAhSdy0ZaV7vDn-EA+7d+eRO8nhRteFe=UA-P+rUbQsYZ2KjPA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 25, 2023 at 3:19?AM Hoa Nguyen <hn@hnpl.org> wrote:
>
> The base of .text is defined by `FW_TEXT_START`, not `FW_TEXT_BASE`.
>
> Signed-off-by: Hoa Nguyen <hn@hnpl.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  docs/firmware/fw_payload.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/firmware/fw_payload.md b/docs/firmware/fw_payload.md
> index 3d50ddc..113604a 100644
> --- a/docs/firmware/fw_payload.md
> +++ b/docs/firmware/fw_payload.md
> @@ -36,7 +36,7 @@ options. These configuration parameters can be defined using either the top
>  level `make` command line or the target platform *objects.mk* configuration
>  file. The parameters currently defined are as follows:
>
> -* **FW_PAYLOAD_OFFSET** - Offset from *FW_TEXT_BASE* where the payload binary
> +* **FW_PAYLOAD_OFFSET** - Offset from *FW_TEXT_START* where the payload binary
>    will be linked in the final *FW_PAYLOAD* firmware binary image. This
>    configuration parameter is mandatory if *FW_PAYLOAD_ALIGN* is not defined.
>    Compilation errors will result from an incorrect definition of
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

