From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Jun 2024 08:35:56 +0530
Subject: [PATCH] docs: Fix wrong filename
In-Reply-To: <20240627032136.35802-1-lovetaeyeon507@gmail.com>
References: <20240627032136.35802-1-lovetaeyeon507@gmail.com>
Message-ID: <CAAhSdy18TyQLS6QHNes=ERzKi5W6k4LUQaB++arj7MbPkKKa-g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 27, 2024 at 8:52?AM Jacob Lin <lovetaeyeon507@gmail.com> wrote:
>
> Correct the compiled FW_PAYLOAD firmware ELF filename.
>
> Signed-off-by: Jacob Lin <lovetaeyeon507@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  docs/firmware/fw_payload.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/firmware/fw_payload.md b/docs/firmware/fw_payload.md
> index d25be60..9b00e32 100644
> --- a/docs/firmware/fw_payload.md
> +++ b/docs/firmware/fw_payload.md
> @@ -23,7 +23,7 @@ The *FW_PAYLOAD* firmware can be enabled by any of the following methods:
>  2. Specifying `FW_PAYLOAD=y` in the target platform *objects.mk* configuration
>     file.
>
> -The compiled *FW_PAYLOAD* firmware ELF file is named *fw_jump.elf*. Its
> +The compiled *FW_PAYLOAD* firmware ELF file is named *fw_payload.elf*. Its
>  expanded image file is *fw_payload.bin*. Both files are created in the
>  platform-specific build directory under the
>  *build/platform/<platform_subdir>/firmware* directory.
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

