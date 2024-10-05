From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 4 Oct 2024 19:55:18 -0500
Subject: [PATCH] docs: add example of building the Linux kernel
In-Reply-To: <20241004131410.772651-1-tdhutt@gmail.com>
References: <20241004131410.772651-1-tdhutt@gmail.com>
Message-ID: <e8f00558-78d1-49ec-9fe6-dbbf46930606@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-10-04 8:14 AM, Tim Hutt wrote:
> Slightly expand the QEMU docs to explain how to build the flat Linux kernel image.

This patch also needs your signoff (Signed-off-by:).

> ---
>  docs/platform/qemu_virt.md | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/platform/qemu_virt.md b/docs/platform/qemu_virt.md
> index 0783be4..71faf42 100644
> --- a/docs/platform/qemu_virt.md
> +++ b/docs/platform/qemu_virt.md
> @@ -56,7 +56,13 @@ qemu-system-riscv64 -M virt -m 256M -nographic \
>  **Linux Kernel Payload**
>  
>  Note: We assume that the Linux kernel is compiled using
> -*arch/riscv/configs/defconfig*.
> +*arch/riscv/configs/defconfig*. The kernel must be a flattened image (a file called `Image`) rather than an ELF (`vmlinux`).

Please wrap to 80 columns to match the rest of the file.

> +
> +Example of building a Linux kernel:
> +```
> +make ARCH=riscv CROSS_COMPILE=riscv64-linux- defconfig
> +make ARCH=riscv CROSS_COMPILE=riscv64-linux- Image
> +```
>  
>  Build:
>  ```

With these fixed, you can add:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


